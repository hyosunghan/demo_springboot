package com.example.demo.service;

import com.example.demo.mapper.PermissionMapper;
import com.example.demo.entity.Permissio;
import com.example.demo.entity.Permission;
import com.example.demo.mapper.RoleMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

@Service
public class PermissionService {

    @Autowired
    private PermissionMapper PermissionMapper;

    @Autowired
    private RoleMapper roleMapper;

    public PageInfo<Permission> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        List<Permission> list = PermissionMapper.findAll();
        return new PageInfo<>(list);
    }

    public void create(Permissio permission) {
        PermissionMapper.create(permission);
    }

    public void update(Permissio permission) {
        PermissionMapper.update(permission);
    }

    public Permission query(int id) {
        return PermissionMapper.query(id);
    }

    public void delete(String idList) {
        String[] strings = idList.split(",");
        List<String> list = new ArrayList<>(Arrays.asList(strings));

        Iterator<String> iterator = list.iterator();
        while(iterator.hasNext()){
            if(roleMapper.checkPermissionUsed(iterator.next()) > 0){
                iterator.remove();
            }
        }
        if (!list.isEmpty()) {
            PermissionMapper.delete(list);
        }
    }

    public List<Permission> findOtherPermission(int id) {
        return PermissionMapper.findOtherPermission(id);
    }
}
