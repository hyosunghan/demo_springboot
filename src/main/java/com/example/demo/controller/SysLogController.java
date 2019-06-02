package com.example.demo.controller;

import com.example.demo.entity.SysLog;
import com.example.demo.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/sysLog")
@Controller
public class SysLogController {

    @Autowired
    private SysLogService sysLogService;

    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllSysLog() {
        ModelAndView mv = new ModelAndView();
        List<SysLog> sysLogList = sysLogService.findAll();
        mv.addObject("sysLogList", sysLogList);
        mv.setViewName("content-syslog-list");
        return mv;
    }
}
