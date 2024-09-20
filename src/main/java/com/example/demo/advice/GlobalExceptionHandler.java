package com.example.demo.advice;

import com.example.demo.dto.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.NoSuchMessageException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Slf4j
@ControllerAdvice
@ResponseBody
public class GlobalExceptionHandler {

    @ExceptionHandler(NullPointerException.class)
    public Result<?> handleNullPointerException(NullPointerException e) {
        log.error("空指针异常");
        return Result.failure(500, "failure.message");
    }

    @ExceptionHandler(ArithmeticException.class)
    public Result<?> handleArithmeticException(ArithmeticException e) {
        log.error("算术异常");
        return Result.failure(500, "failure.message");
    }

    @ExceptionHandler(NoSuchMessageException.class)
    public Result<?> handleNoSuchMessageException(NoSuchMessageException e) {
        log.error("无国际化异常");
        return Result.failure(500, "failure.message");
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(NoHandlerFoundException.class)
    public Result<?> handleNoHandlerFoundException(NoHandlerFoundException e) {
        log.error("404异常");
        return Result.failure(404, "notfound.message");
    }
}
