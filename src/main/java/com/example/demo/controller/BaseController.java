package com.example.demo.controller;

import com.example.demo.entity.Orders;
import com.example.demo.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping()
public class BaseController {

    @Autowired
    private OrdersService ordersService;

    @GetMapping("/")
    public ModelAndView root() {
        return new ModelAndView("base-login");
    }

    @GetMapping("/index")
    public ModelAndView index() {
        List<Orders> ordersList = ordersService.findAll();
        for (int i = 0; i < ordersList.size(); i++) {
            int id = ordersList.get(i).getId();
            Orders ordersInfo = ordersService.findById(id);
            ordersList.set(i, ordersInfo);
        }
        return new ModelAndView("content-index", "ordersList", ordersList);
    }

}
