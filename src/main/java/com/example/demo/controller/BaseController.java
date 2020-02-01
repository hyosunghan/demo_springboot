package com.example.demo.controller;

import com.example.demo.config.EmailServer;
import com.example.demo.entity.Orders;
import com.example.demo.service.EmailService;
import com.example.demo.service.OrdersService;
import com.example.demo.service.ProductService;
import com.example.demo.service.SysLogService;
import com.example.demo.service.UsersService;
import com.example.demo.service.WeatherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
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

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Autowired
    private EmailService emailService;

    @Autowired
    private WeatherService weatherService;

    /**
     * 登录
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("base-login");
    }

    /**
     * 跳转
     * @return
     */
    @RequestMapping(value = "/jump", method = RequestMethod.GET)
    public ModelAndView jump() throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) principal;

        emailService.pullMail();
//        weatherService.pullCityList();

        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.addObject("mail", EmailServer.pullMail("unread"));
        mv.addObject("loginTime", sdf.format(new Date()));
        mv.setViewName("base-jump");
        return mv;
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

    /**
     * 错误
     * @return
     */
    @RequestMapping(value = "/wrong", method = RequestMethod.GET)
    public ModelAndView wrong() {
        return new ModelAndView("content-error");
    }

    /**
     * 个人中心
     * @return
     */
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile() {
        return new ModelAndView("content-profile");
    }
}
