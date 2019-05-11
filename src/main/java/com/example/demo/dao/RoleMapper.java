package com.example.demo.dao;

import com.example.demo.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoleMapper {

    @Select("select r.* from users_role ur,role r" +
            " where ur.usersId=#{usersId} and r.id=ur.roleId")
    List<Role> getListByUsersId(@Param("usersId") int usersId);
}
