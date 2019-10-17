package com.example.demo.aspect;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.BindException;

/**
 * @author hyosunghan
 * @since 2019-10-17
 */
@ControllerAdvice
public class GlobalExceptionHandler {

//    @ResponseBody
//    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(BindException.class)
    public ModelAndView bindExceptionHandler(/*Exception e, HttpServletRequest request, HttpServletResponse response*/){
        return new ModelAndView("content-404");
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView exceptionHandler(){
        return new ModelAndView("content-500");
    }
}
