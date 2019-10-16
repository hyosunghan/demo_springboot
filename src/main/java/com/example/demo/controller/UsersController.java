package com.example.demo.controller;

import com.example.demo.entity.Role;
import com.example.demo.entity.User;
import com.example.demo.entity.Users;
import com.example.demo.service.RoleService;
import com.example.demo.service.UsersService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    /**
     * 用户列表
     * @param page
     * @param size
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllUsers(@RequestParam(defaultValue = "1") Integer page,
                                     @RequestParam(defaultValue = "10") Integer size) {
        PageInfo<Users> pageInfo = usersService.findAll(page, size);
        return new ModelAndView("content-users-list", "pageInfo", pageInfo);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addUsers() {
        return new ModelAndView("content-users-edit");
    }

    /**
     * 用户查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public ModelAndView query(String id) {
        User user = usersService.query(Integer.parseInt(id));
        return new ModelAndView("content-users-edit", "user", user);
    }

    /**
     * 用户创建，用户修改
     * @param user
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String createUsers(User user) {
        if (user.getId() == 0) {
            usersService.create(user);
        } else {
            usersService.update(user);
        }
        return "redirect:findAll";
    }

    /**
     * 用户删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(String ids) {
        usersService.delete(ids);
        return "redirect:findAll";
    }

//    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
//    public ModelAndView findUsersById(@PathVariable Integer id) {
//        Users users = usersService.findById(id);
//        return new ModelAndView("content-users-role-list", "users", users);
//    }

    @RequestMapping(value = "/findUserByIdAndAllRole", method = RequestMethod.GET)
    public ModelAndView findUserByIdAndAllRole(Integer id) {
        Users users = usersService.findById(id);
        List<Role> roleList = roleService.findOtherRole(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("users", users);
        mv.addObject("roleList", roleList);
        mv.setViewName("content-users-role-manage");
        return mv;
    }

    /**
     * 用户添加角色
     * @param userId
     * @param ids
     * @return
     */
    @RequestMapping(value = "/addRoleToUser",method = RequestMethod.POST)
    public String addRoleToUser(Integer userId, Integer[] ids){
        usersService.addRoleToUser(userId, ids);
        return "redirect:findAll";
    }
}