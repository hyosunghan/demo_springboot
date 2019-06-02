package com.example.demo.mapper;

import com.example.demo.entity.User;
import com.example.demo.entity.Users;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UsersMapper {

    @Select("select * from users where email=#{email}")
    Users findUsersByEmail(@Param("email") String email);

    @Select("select * from users where id=#{id}")
    Users findById(@Param("id") int id);

    @Select("select * from users")
    List<Users> findAll();

    @Insert("insert into users(email,username,password,phoneNum,status)" +
            " values(#{users.email},#{users.username},#{users.password},#{users.phoneNum},#{users.status})")
    void create(@Param("users") User user);

    @Insert("insert into users_role(usersId,roleId) value(#{usersId},#{roleId})")
    void addRoleToUser(@Param("usersId") int usersId, @Param("roleId") int roleId);
}
