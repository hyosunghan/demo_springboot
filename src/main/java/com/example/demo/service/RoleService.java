package com.example.demo.service;

import com.example.demo.dao.PermissionMapper;
import com.example.demo.dao.RoleMapper;
import com.example.demo.entity.Rol;
import com.example.demo.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    public List<Role> findAll() {
        return roleMapper.findAll();
    }

    public void create(Rol role) {
        roleMapper.create(role);
    }

    public List<Role> findOtherRole(int id) {
        return roleMapper.findOtherRole(id);
    }

    public Role findById(int id) {
        Role role = roleMapper.findById(id);
        role.setPermissionList(permissionMapper.getListByRoleId(id));
        return role;
    }

    public void addPermissionToRole(int id, int[] ids) {
        for (int i = 0; i < ids.length; i++) {
            roleMapper.addPermissionToRole(id, ids[i]);
        }
    }
}
