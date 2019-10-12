package com.example.demo.service;

import com.example.demo.mapper.PermissionMapper;
import com.example.demo.entity.Permissio;
import com.example.demo.entity.Permission;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionService {

    @Autowired
    private PermissionMapper PermissionMapper;

    public PageInfo<Permission> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        List<Permission> list = PermissionMapper.findAll();
        return new PageInfo<>(list);
    }

    public void create(Permissio permission) {
        PermissionMapper.create(permission);
    }

    public List<Permission> findOtherPermission(int id) {
        return PermissionMapper.findOtherPermission(id);
    }
}
