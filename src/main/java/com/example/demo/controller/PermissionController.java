package com.example.demo.controller;

import com.example.demo.entity.Permissio;
import com.example.demo.entity.Permission;
import com.example.demo.service.PermissionService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/permission")
@Controller
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllPermission(@RequestParam(defaultValue = "1") Integer page,
                                          @RequestParam(defaultValue = "10") Integer size) {
        PageInfo<Permission> pageInfo = permissionService.findAll(page, size);
        return new ModelAndView("content-permission-list", "pageInfo", pageInfo);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addPermission() {
        return new ModelAndView("content-permission-add");
    }

    @RequestMapping(value = "/save", method = RequestMethod.GET)
    public String savePermission(Permissio permission) {
        permissionService.create(permission);
        return "redirect:findAll";
    }
}
