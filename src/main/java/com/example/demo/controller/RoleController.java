package com.example.demo.controller;

import com.example.demo.entity.Permission;
import com.example.demo.entity.Rol;
import com.example.demo.entity.Role;
import com.example.demo.service.PermissionService;
import com.example.demo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/role")
@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllRole() {
        List<Role> roleList = roleService.findAll();
        return new ModelAndView("content-role-list", "roleList", roleList);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addRole() {
        return new ModelAndView("content-role-add");
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView createRole(Rol role) {
        roleService.create(role);
        return new ModelAndView("redirect:findAll");
    }

    @RequestMapping(value = "/findRoleByIdAndAllPermission/{id}", method = RequestMethod.GET)
    public ModelAndView findRoleByIdAndAllPermission(@PathVariable Integer id) {
        Role role = roleService.findById(id);
        List<Permission> permissionList = permissionService.findOtherPermission(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("role", role);
        mv.addObject("permissionList", permissionList);
        mv.setViewName("content-role-permission-add");
        return mv;
    }

    @RequestMapping(value = "/addPermissionToRole", method = RequestMethod.GET)
    public String addPermissionToRole(Integer roleId, Integer[] ids){
        roleService.addPermissionToRole(roleId, ids);
        return "redirect:findAll";
    }
}