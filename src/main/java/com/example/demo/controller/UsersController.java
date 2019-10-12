package com.example.demo.controller;

import com.example.demo.entity.Role;
import com.example.demo.entity.User;
import com.example.demo.entity.Users;
import com.example.demo.service.RoleService;
import com.example.demo.service.UsersService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllUsers(@RequestParam(defaultValue = "1") Integer page,
                                     @RequestParam(defaultValue = "10") Integer size) {
        PageInfo<Users> pageInfo = usersService.findAll(page, size);
        return new ModelAndView("content-users-list", "pageInfo", pageInfo);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addUsers() {
        return new ModelAndView("content-users-add");
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView createUsers(User user) {
        usersService.create(user);
        return new ModelAndView("redirect:findAll");
    }

    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    public ModelAndView findUsersById(@PathVariable Integer id) {
        Users users = usersService.findById(id);
        return new ModelAndView("content-users-role-list", "users", users);
    }

    @RequestMapping(value = "/findUserByIdAndAllRole/{id}", method = RequestMethod.GET)
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
    public String addRoleToUser(Integer userId, Integer[] ids){
        usersService.addRoleToUser(userId, ids);
        return "redirect:findAll";
    }
}