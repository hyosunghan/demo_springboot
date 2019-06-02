package com.example.demo.mapper;

import com.example.demo.entity.Permissio;
import com.example.demo.entity.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PermissionMapper {

    @Select("select * from permission")
    List<Permission> findAll();

    @Insert("insert into permission(permissionName,url)" +
            " values(#{permission.permissionName},#{permission.url})")
    void create(@Param("permission") Permissio permission);

    @Select("select p.* from role_permission rp,permission p" +
            " where rp.roleId=#{roleId} and p.id=permission.permissionId")
    List<Permission> getListByRoleId(@Param("roleId") int roleId);

    @Select("select * from permission where id not in( select permissionId from role_permission where roleId=#{id})")
    List<Permission> findOtherPermission(int id);
}
