package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.entity.Users;
import com.example.demo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @GetMapping("/findAll")
    public ModelAndView findAll() {
        List<Users> usersList = usersService.findAll();
        return new ModelAndView("content-users-list", "usersList", usersList);
    }

    @GetMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("content-users-add");
    }

    @PostMapping("/save")
    public ModelAndView create(User user) {
        usersService.create(user);
        return new ModelAndView("redirect:findAll");
    }

    @GetMapping("/findById/{id}")
    public ModelAndView findById(@PathVariable int id) {
        Users users = usersService.findById(id);
        return new ModelAndView("content-users-role-list", "users", users);
    }
}