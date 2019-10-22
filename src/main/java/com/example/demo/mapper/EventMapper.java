package com.example.demo.mapper;

import com.example.demo.entity.Event;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface EventMapper {

    @Select("select * from event")
    List<Event> findAll();

    @Update("update event set start=#{event.start},end=#{event.end},allDay=#{event.allDay} where id=#{event.id}")
    Integer update(@Param("event") Event event);
}
