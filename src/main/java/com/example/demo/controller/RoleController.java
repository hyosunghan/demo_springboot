package com.example.demo.controller;

import com.example.demo.entity.Permission;
import com.example.demo.entity.Rol;
import com.example.demo.entity.Role;
import com.example.demo.service.PermissionService;
import com.example.demo.service.RoleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/role")
@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    /**
     * 角色列表
     * @param page
     * @param size
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllRole(@RequestParam(defaultValue = "1") Integer page,
                                    @RequestParam(defaultValue = "10") Integer size) {
        PageInfo<Role> pageInfo = roleService.findAll(page, size);
        return new ModelAndView("content-role-list", "pageInfo", pageInfo);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addRole() {
        return new ModelAndView("content-role-edit");
    }

    /**
     * 权限查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public ModelAndView query(String id) {
        Rol role = roleService.query(Integer.parseInt(id));
        return new ModelAndView("content-role-edit", "role" ,role);
    }

    /**
     * 角色创建，角色修改
     * @param role
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String createRole(Rol role) {
        if (role.getId() == 0) {
            roleService.create(role);
        } else {
            roleService.update(role);
        }
        return "redirect:findAll";
    }

    /**
     * 角色删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(String ids) {
        roleService.delete(ids);
        return "redirect:findAll";
    }

    @RequestMapping(value = "/findRoleByIdAndAllPermission", method = RequestMethod.GET)
    public ModelAndView findRoleByIdAndAllPermission(Integer id) {
        Role role = roleService.findById(id);
        List<Permission> permissionList = permissionService.findOtherPermission(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("role", role);
        mv.addObject("permissionList", permissionList);
        mv.setViewName("content-role-permission-manage");
        return mv;
    }

    /**
     * 角色添加权限
     * @param roleId
     * @param ids
     * @return
     */
    @RequestMapping(value = "/addPermissionToRole", method = RequestMethod.GET)
    public String addPermissionToRole(Integer roleId, String ids){
        roleService.addPermissionToRole(roleId, ids);
        return "redirect:findAll";
    }
}