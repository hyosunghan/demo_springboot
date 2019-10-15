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

    /**
     * 日志列表
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllSysLog() {
        List<SysLog> listInfo = sysLogService.findAll();
        return new ModelAndView("content-syslog-list", "listInfo", listInfo);
    }

    /**
     * 日志删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(String ids) {
        sysLogService.delete(ids);
        return "redirect:findAll";
    }
}
