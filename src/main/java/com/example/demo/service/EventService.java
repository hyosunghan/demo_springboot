package com.example.demo.service;

import com.example.demo.entity.Event;
import com.example.demo.mapper.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventService {

    @Autowired
    private EventMapper eventMapper;

    public List<Event> findAll() {
        return eventMapper.findAll();
    }

    public Integer update(Event event) {
        return eventMapper.update(event);
    }

}
