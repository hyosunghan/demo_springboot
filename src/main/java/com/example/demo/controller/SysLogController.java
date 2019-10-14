package com.example.demo.controller;

import com.example.demo.entity.SysLog;
import com.example.demo.service.SysLogService;
import com.github.pagehelper.PageInfo;
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
        List<SysLog> listInfo = sysLogService.findAll();
        return new ModelAndView("content-syslog-list", "listInfo", listInfo);
    }

    @RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
    public ModelAndView saveProduct(List<Integer> idList) {
        sysLogService.delete(idList);
        return new ModelAndView("redirect:findAll");
    }
}
