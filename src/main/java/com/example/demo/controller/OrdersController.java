package com.example.demo.controller;

import com.example.demo.entity.Orders;
import com.example.demo.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    @GetMapping("/findAll")
    public ModelAndView findAll() {
        List<Orders> orderss = ordersService.findAll();
        return new ModelAndView("content-orders-list", "ordersList", orderss);
    }

    @GetMapping("/findById/{id}")
    public ModelAndView findById(@PathVariable int id) {
        Orders orders = ordersService.findById(id);
        return new ModelAndView("content-orders-detail","orders", orders);
    }

}
