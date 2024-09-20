package com.example.demo.utils;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.context.expression.MethodBasedEvaluationContext;
import org.springframework.core.DefaultParameterNameDiscoverer;
import org.springframework.core.ParameterNameDiscoverer;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * @author moc
 * @date 2019-03-22 11:33
 */

@Slf4j
public class AnnotationUtil {

    private static final ParameterNameDiscoverer nameDiscoverer = new DefaultParameterNameDiscoverer();

    private static final ExpressionParser parser = new SpelExpressionParser();

    /**
     * <p>
     *     获取切点处的方法
     * </p>
     * @param:
     * @return:
     * @author: moc
     * @date: 2019-03-22 13:27
     */
    private static Method getMethod(ProceedingJoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        if (method.getDeclaringClass().isInterface()) {
            try {
                method = joinPoint.getTarget().getClass().getDeclaredMethod(signature.getName(),
                        method.getParameterTypes());
            } catch (Exception e) {
                log.error("join point get method exception: ", e);
            }
        }
        return method;
    }

    /**
     * 根据spring SpEl 表达式获取key列表的实际值
     * @param:
     * @return:
     * @author: moc
     * @date: 2019-03-22 13:51
     */
    public static List<String> getSpElDefinitionKey(ProceedingJoinPoint joinPoint, String... redisLockKeys) {
        Method method = getMethod(joinPoint);
        Object[] parameterValues = joinPoint.getArgs();
        List<String> serviceKeys = new ArrayList<>();
        for (String serviceKey : redisLockKeys) {
            if (serviceKey != null && !serviceKey.isEmpty()) {
                String key = getSpElDefinitionKey(serviceKey, method, parameterValues);
                serviceKeys.add(key);
            }
        }
        return serviceKeys;
    }

    private static String getSpElDefinitionKey(String key, Method method, Object[] parameterValues) {
        EvaluationContext context = new MethodBasedEvaluationContext(null, method, parameterValues, nameDiscoverer);
        try {
            return parser.parseExpression(key).getValue(context).toString();
        } catch (Exception e) {
            return key;
        }
    }

}
