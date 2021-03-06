package com.example.demo.controller;

import com.example.demo.entity.Orders;
import com.example.demo.service.OrdersService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    /**
     * 订单列表
     * @param page
     * @param size
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllOrders(@RequestParam(defaultValue = "1") Integer page,
                                      @RequestParam(defaultValue = "10") Integer size) {
        PageInfo<Orders> pageInfo = ordersService.findAll(page, size);
        return new ModelAndView("content-orders-list", "pageInfo", pageInfo);
    }

    /**
     * 订单查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    public ModelAndView findOrdersById(@PathVariable Integer id) {
        Orders orders = ordersService.findById(id);
        return new ModelAndView("content-orders-detail","orders", orders);
    }

    /**
     * 修改状态
     * @param ids
     * @return
     */
    @RequestMapping(value = "/change", method = RequestMethod.GET)
    public String change(String ids) {
        ordersService.change(ids);
        return "redirect:findAll";
    }
}
