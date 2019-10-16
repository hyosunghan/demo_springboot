package com.example.demo.controller;

import com.example.demo.entity.Orders;
import com.example.demo.service.OrdersService;
import com.example.demo.service.ProductService;
import com.example.demo.service.SysLogService;
import com.example.demo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping()
public class BaseController {

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private SysLogService sysLogService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("base-login");
    }

    @RequestMapping(value = "/jump", method = RequestMethod.GET)
    public ModelAndView jump() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) principal;
        return new ModelAndView("base-jump", "user", user);
    }

    /**
     * 首页
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {

        List<Orders> ordersList = ordersService.findPending();
        for (int i = 0; i < ordersList.size(); i++) {
            int id = ordersList.get(i).getId();
            Orders ordersInfo = ordersService.findById(id);
            ordersList.set(i, ordersInfo);
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("ordersList", ordersList);
        mv.addObject("ordersCount", ordersService.findAll(1,1).getTotal());
        mv.addObject("productCount", productService.findAll(1, 1).getTotal());
        mv.addObject("usersCount", usersService.findAll(1, 1).getTotal());
        mv.addObject("syslogCount", sysLogService.findAll().size());
        mv.setViewName("content-index");
        return mv;
    }

}
