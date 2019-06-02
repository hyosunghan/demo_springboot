package com.example.demo.mapper;

import com.example.demo.entity.Rol;
import com.example.demo.entity.Role;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoleMapper {

    @Select("select r.* from users_role ur,role r" +
            " where ur.usersId=#{usersId} and r.id=ur.roleId")
    List<Role> getListByUsersId(@Param("usersId") int usersId);

    @Select("select * from role")
    List<Role> findAll();

    @Insert("insert into role(roleName,roleDesc)" +
            " values(#{role.roleName},#{role.roleDesc})")
    void create(@Param("role") Rol role);

    @Select("select * from role where id not in( select roleId from users_role where usersId=#{id})")
    List<Role> findOtherRole(int id);

    @Select("select * from role where id=#{id}")
    Role findById(@Param("id") int id);

    @Insert("insert into role_permission(roleId,permissionId) value(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") int roleId, @Param("permissionId") int permissionId);
}
