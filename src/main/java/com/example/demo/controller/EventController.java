package com.example.demo.controller;

import com.example.demo.entity.Event;
import com.example.demo.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/event")
public class EventController {

    @Autowired
    private EventService eventService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        return new ModelAndView("content-calendar");
    }

    /**
     * 事件列表
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public List<Event> findAll() {
        return eventService.findAll();
    }

    /**
     * 事件修改
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Integer update(@RequestBody Event event) {
        return eventService.update(event);
    }

    /**
     * 事件创建
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Integer create(@RequestBody Event event) {
        eventService.create(event);
        return event.getId();
    }

    /**
     * 事件删除
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Integer delete(@RequestBody Event event) {
        return eventService.delete(event.getId());
    }
}
