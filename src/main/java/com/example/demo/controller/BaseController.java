package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping()
public class BaseController {

    @GetMapping("/")
    public ModelAndView root() {
        return new ModelAndView("redirect:/index");
    }

    @GetMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("base-index");
    }

    @GetMapping("/load")
    public ModelAndView login() {
        return new ModelAndView("base-login");
    }
}
