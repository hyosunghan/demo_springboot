package com.example.demo.controller;

import com.example.demo.entity.Role;
import com.example.demo.entity.User;
import com.example.demo.entity.Users;
import com.example.demo.service.RoleService;
import com.example.demo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private RoleService roleService;

    @RequestMapping("/findAll")
    public ModelAndView findAll() {
        List<Users> usersList = usersService.findAll();
        return new ModelAndView("content-users-list", "usersList", usersList);
    }

    @RequestMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("content-users-add");
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView create(User user) {
        usersService.create(user);
        return new ModelAndView("redirect:findAll");
    }

    @RequestMapping("/findById/{id}")
    public ModelAndView findById(@PathVariable Integer id) {
        Users users = usersService.findById(id);
        return new ModelAndView("content-users-role-list", "users", users);
    }

    @RequestMapping("/findUserByIdAndAllRole/{id}")
    public ModelAndView findUserByIdAndAllRole(@PathVariable Integer id) {
        Users users = usersService.findById(id);
        List<Role> roleList = roleService.findOtherRole(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("users", users);
        mv.addObject("roleList", roleList);
        mv.setViewName("content-users-role-add");
        return mv;
    }

    @RequestMapping(value = "/addRoleToUser",method = RequestMethod.POST)
    public String addRoleToUser(Integer userId, int[] ids){
        usersService.addRoleToUser(userId, ids);
        return "redirect:findAll";
    }
}