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

@RequestMapping("/permission")
@Controller
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    /**
     * 权限列表
     * @param page
     * @param size
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllPermission(@RequestParam(defaultValue = "1") Integer page,
                                          @RequestParam(defaultValue = "10") Integer size) {
        PageInfo<Permission> pageInfo = permissionService.findAll(page, size);
        return new ModelAndView("content-permission-list", "pageInfo", pageInfo);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addPermission() {
        return new ModelAndView("content-permission-edit");
    }

    /**
     * 权限查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public ModelAndView query(String id) {
        Permissio permission = permissionService.query(Integer.parseInt(id));
        return new ModelAndView("content-permission-edit", "permission" ,permission);
    }

    /**
     * 权限创建，权限修改
     * @param permission
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String savePermission(Permissio permission) {
        if (permission.getId() == 0) {
            permissionService.create(permission);
        } else {
            permissionService.update(permission);
        }
        return "redirect:findAll";
    }

    /**
     * 权限删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(String ids) {
        permissionService.delete(ids);
        return "redirect:findAll";
    }
}
