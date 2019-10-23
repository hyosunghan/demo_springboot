package com.example.demo.mapper;

import com.example.demo.entity.Event;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
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

    @Insert("insert into event(start,end,title,allDay,borderColor,backgroundColor)" +
            " values(#{event.start},#{event.end},#{event.title},#{event.allDay},#{event.borderColor},#{event.backgroundColor})")
    @Options(useGeneratedKeys=true, keyProperty="event.id", keyColumn="id")
    Integer create(@Param("event") Event event);

    @Delete("delete from event where id=#{id}")
    Integer delete(@Param("id") int id);
}
