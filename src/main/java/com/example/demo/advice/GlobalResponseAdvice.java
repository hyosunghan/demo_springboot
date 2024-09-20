package com.example.demo.advice;

import com.example.demo.dto.Result;
import com.example.demo.utils.JsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Slf4j
@ControllerAdvice
public class GlobalResponseAdvice implements ResponseBodyAdvice<Object> {

    @Autowired
    private MessageSource messageSource;

    @Override
    public boolean supports(MethodParameter methodParameter, Class aClass) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object o, MethodParameter methodParameter, MediaType mediaType, Class aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        Result<?> result;
        if (o instanceof Result) {
            result = JsonUtil.writeObjectAsObject(o, Result.class);
        } else {
            log.warn("国际化时自动统一结构");
            result = Result.success(o);
        }
        String message = result.getMessage();
        if (message != null && message.endsWith(".message")) {
            HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            Locale locale = getLocale(req);
            String i18nMessage = messageSource.getMessage(message, null, locale);
            result.setMessage(i18nMessage);
        }
        return result;
    }

    private Locale getLocale(HttpServletRequest httpServletRequest) {
        Locale locale = Locale.getDefault();
        String language = httpServletRequest.getHeader("Language");
        if(!StringUtils.isEmpty(language)){
            String[] split = language.split("_");
            locale = new Locale(split[0], split[1]);
        }
        return locale;
    }
}
