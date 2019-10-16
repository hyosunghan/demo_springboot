package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.mapper.RoleMapper;
import com.example.demo.mapper.UsersMapper;
import com.example.demo.entity.Role;
import com.example.demo.entity.Users;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

@Service
public class UsersService implements UserDetailsService {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        // 根据登录邮箱查询用户信息
        Users users = usersMapper.findUsersByEmail(username);
        // 查询该用户相关权限
        List<Role> roleList = roleMapper.getListByUsersId(users.getId());
        users.setRoleList(roleList);
        // 基本认证权限列表获取
        List<SimpleGrantedAuthority> authoritys = new ArrayList();
        for (Role role : roleList) {
            authoritys.add(new SimpleGrantedAuthority(role.getRoleName()));
        }

        org.springframework.security.core.userdetails.User user = new org.springframework.security.core.userdetails.User(users.getEmail(),
                users.getPassword(),
                "已关闭".equals(users.getStatus()) ? false : true,
                true,
                true,
                true,
                authoritys);
        return user;
    }

    public PageInfo<Users> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        List<Users> list = usersMapper.findAll();
        return new PageInfo<>(list);
    }

    public void create(User user) {
        String password = user.getPassword();
        String encodePassword = passwordEncoder.encode(password);
        user.setPassword(encodePassword);
        usersMapper.create(user);
    }

    public User query(int id) {
        return usersMapper.query(id);
    }

    public void update(User user) {
        String password = user.getPassword();
        boolean encoded = password.startsWith("$2a$");
        if (!encoded) {
            String encodePassword = passwordEncoder.encode(password);
            user.setPassword(encodePassword);
        }
        usersMapper.update(user);
    }

    @Transactional(rollbackFor = Exception.class)
    public void delete(String idList) {
        String[] strings = idList.split(",");
        List<String> list = Arrays.asList(strings);
        usersMapper.delete(list);
        usersMapper.deleteAbout(list);
    }

    public Users findById(int id) {
        Users users = usersMapper.findById(id);
        users.setRoleList(roleMapper.getListByUsersId(id));
        return users;
    }

    @Transactional(rollbackFor = Exception.class)
    public void addRoleToUser(int id, Integer[] ids) {
        for (int i = 0; i < ids.length; i++) {
            usersMapper.addRoleToUser(id, ids[i]);
        }
    }
}
