package com.example.demo.dao;

import com.example.demo.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberMapper {

    @Select("select * from member where id=#{id}")
    Member findById(@Param("id") int id);
}
