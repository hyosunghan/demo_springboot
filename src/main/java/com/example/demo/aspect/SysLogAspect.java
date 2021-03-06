package com.example.demo.aspect;

import com.example.demo.entity.SysLog;
import com.example.demo.service.SysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
@Aspect
public class SysLogAspect {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private SysLogService sysLogService;

    private Date startTime; // 访问时间
    private Class executionClass;// 访问的类
    private Method executionMethod; // 访问的方法

    // 主要获取访问时间、访问的类、访问的方法
    @Before("execution(* com.example.demo.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException, SecurityException {
        startTime = new Date(); // 访问时间
        // 获取访问的类
        executionClass = jp.getTarget().getClass();
        // 获取访问的方法
        String methodName = jp.getSignature().getName();// 获取访问的方法的名称
        Object[] args = jp.getArgs();// 获取访问的方法的参数
        if (args == null || args.length == 0) {// 无参数
            executionMethod = executionClass.getMethod(methodName); // 只能获取无参数方法
        } else {
            // 有参数，就将args中所有元素遍历，获取对应的Class,装入到一个Class[]
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                if (null == args[i]) {
                    // 参数为Null则为首页列表
                    classArgs[i] = Integer.class;
                } else {
                    classArgs[i] = args[i].getClass();
                }
            }
            executionMethod = executionClass.getMethod(methodName, classArgs);// 获取有参数方法
        }
    }

    // 主要获取日志中其它信息，时长、ip、url...
    @After("execution(* com.example.demo.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        // 获取类上的@RequestMapping对象
//        if (executionClass == BaseController.class) {
//            return;
//        }
        RequestMapping classAnnotation = (RequestMapping) executionClass.getAnnotation(RequestMapping.class);
        if (classAnnotation == null) {
            return;
        }
        // 获取方法上的@RequestMapping对象
        RequestMapping methodAnnotation = executionMethod.getAnnotation(RequestMapping.class);
        if (methodAnnotation == null) {
            return;
        }
        StringBuilder url = new StringBuilder(); // 它的值应该是类上的@RequestMapping的value+方法上的@RequestMapping的value
        if (classAnnotation.value().length != 0) {
            url.append(classAnnotation.value()[0]);
        }
        url.append(methodAnnotation.value()[0]);

        SysLog sysLog = new SysLog();
        // 获取访问时长
        Long executionTime = new Date().getTime() - startTime.getTime();
        // 将sysLog对象属性封装
        sysLog.setExecutionTime(executionTime.intValue());
        sysLog.setUrl(url.toString());
        // 获取ip
        String ip = request.getRemoteAddr();
        sysLog.setIp(ip);
        // 可以通过securityContext获取，也可以从request.getSession中获取
        SecurityContext context = SecurityContextHolder.getContext(); //request.getSession().getAttribute("SPRING_SECURITY_CONTEXT")
        Object object = context.getAuthentication().getPrincipal();
        if (object instanceof UserDetails) {
            String username = ((UserDetails) object).getUsername();
            sysLog.setUsername(username);
        } else {
            return;
        }
        sysLog.setMethod("[类名]" + executionClass.getName() + "[方法名]" + executionMethod.getName());
        sysLog.setVisitTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startTime));
        // 调用Service，调用dao将sysLog insert数据库

        // 登录记录加入
        if (executionMethod.getName().equals("jump")) {
            sysLogService.save(sysLog);
        }
    }
}