package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping()
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute User user) {
        return new ModelAndView(userService.login(user));
    }

    @GetMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("login", "user", new User());
    }
}
