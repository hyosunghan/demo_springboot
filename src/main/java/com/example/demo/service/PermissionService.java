package com.example.demo.service;

import com.example.demo.mapper.PermissionMapper;
import com.example.demo.entity.Permissio;
import com.example.demo.entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionService {

    @Autowired
    private PermissionMapper PermissionMapper;

    public List<Permission> findAll() {
        return PermissionMapper.findAll();
    }

    public void create(Permissio permission) {
        PermissionMapper.create(permission);
    }

    public List<Permission> findOtherPermission(int id) {
        return PermissionMapper.findOtherPermission(id);
    }
}
