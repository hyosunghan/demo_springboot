package com.example.demo.controller;

import com.example.demo.entity.SysLog;
import com.example.demo.service.SysLogService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/sysLog")
@Controller
public class SysLogController {

    @Autowired
    private SysLogService sysLogService;

    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllSysLog(@RequestParam(defaultValue = "1") Integer page,
                                      @RequestParam(defaultValue = "10") Integer size) {
        PageInfo<SysLog> pageInfo = sysLogService.findAll(page, size);
        return new ModelAndView("content-syslog-list", "pageInfo", pageInfo);
    }
}
