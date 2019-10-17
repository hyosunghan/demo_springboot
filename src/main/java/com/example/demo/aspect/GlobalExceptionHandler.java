package com.example.demo.aspect;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author hyosunghan
 * @since 2019-10-17
 */
@ControllerAdvice
public class GlobalExceptionHandler {

//    @ResponseBody
//    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(Exception.class)
    public ModelAndView exceptionHandler(/*Exception e,
                                         HttpStatus status,
                                         HttpServletRequest request,
                                         HttpServletResponse response*/){

        return new ModelAndView("content-error");
    }
}
