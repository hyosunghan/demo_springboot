package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping()
public class IndexController {

    @RequestMapping()
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("all-admin-index");
        return mv;
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("all-admin-login");
        return mv;
    }
}
