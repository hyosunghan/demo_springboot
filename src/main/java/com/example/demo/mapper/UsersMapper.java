package com.example.demo.mapper;

import com.example.demo.entity.Rol;
import com.example.demo.entity.User;
import com.example.demo.entity.Users;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface UsersMapper {

    @Select("select * from users where email=#{email}")
    Users findUsersByEmail(@Param("email") String email);

    @Select("select * from users where id=#{id}")
    Users findById(@Param("id") int id);

    @Select("select * from users where id=#{id}")
    User query(@Param("id") int id);

    @Select("select * from users")
    List<Users> findAll();

    @Insert("insert into users(email,username,password,phoneNum,status)" +
            " values(#{users.email},#{users.username},#{users.password},#{users.phoneNum},#{users.status})")
    void create(@Param("users") User user);

    @Insert("insert into users_role(usersId,roleId) value(#{usersId},#{roleId})")
    void addRoleToUser(@Param("usersId") int usersId, @Param("roleId") int roleId);

    @Select("select count(*) from users_role where usersId=#{usersId}")
    Integer checkRoleUsed(@Param("usersId") String usersId);

    @Update("update users set email=#{user.email},username=#{user.username},password=#{user.password}," +
            "phoneNum=#{user.phoneNum},status=#{user.status} where id=#{user.id}")
    void update(@Param("user") User user);

    @Delete("<script>delete from users where id in " +
            "   <foreach collection=\"list\" item=\"id\" open=\"(\" close=\")\" separator=\",\">" +
            "       #{id}" +
            "   </foreach>" +
            "</script>")
    void delete(@Param("list") List<String> list);

    @Delete("<script>delete from users_role where usersId in " +
            "   <foreach collection=\"list\" item=\"id\" open=\"(\" close=\")\" separator=\",\">" +
            "       #{id}" +
            "   </foreach>" +
            "</script>")
    void deleteAbout(@Param("list") List<String> list);
}