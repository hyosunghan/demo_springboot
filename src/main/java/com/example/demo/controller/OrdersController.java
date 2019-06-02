package com.example.demo.controller;

import com.example.demo.entity.Orders;
import com.example.demo.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllOrders() {
        List<Orders> ordersList = ordersService.findAll();
        return new ModelAndView("content-orders-list", "ordersList", ordersList);
    }

    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    public ModelAndView findOrdersById(@PathVariable Integer id) {
        Orders orders = ordersService.findById(id);
        return new ModelAndView("content-orders-detail","orders", orders);
    }

}
