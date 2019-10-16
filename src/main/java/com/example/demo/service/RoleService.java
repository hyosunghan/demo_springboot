package com.example.demo.service;

import com.example.demo.mapper.PermissionMapper;
import com.example.demo.mapper.RoleMapper;
import com.example.demo.entity.Rol;
import com.example.demo.entity.Role;
import com.example.demo.mapper.UsersMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

@Service
public class RoleService {

    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    public PageInfo<Role> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        List<Role> list = roleMapper.findAll();
        return new PageInfo<>(list);
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

    public Rol query(int id) {
        return roleMapper.query(id);
    }

    @Transactional(rollbackFor = Exception.class)
    public void delete(String idList) {
        String[] strings = idList.split(",");
        List<String> list = new ArrayList<>(Arrays.asList(strings));

        Iterator<String> iterator = list.iterator();
        while(iterator.hasNext()){
            if(usersMapper.checkRoleUsed(iterator.next()) > 0){
                iterator.remove();
            }
        }
        if (!list.isEmpty()) {
            roleMapper.delete(list);
            roleMapper.deleteAbout(list);
        }
    }

    public void update(Rol role) {
        roleMapper.update(role);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addPermissionToRole(int id, String ids) {
        String[] split = ids.split(",");
        List<String> strings = Arrays.asList(split);
        for (int i = 0; i < strings.size(); i++) {
            roleMapper.addPermissionToRole(id, Integer.parseInt(strings.get(i)));
        }
    }
}
