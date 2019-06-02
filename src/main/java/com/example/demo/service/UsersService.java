package com.example.demo.service;

import com.example.demo.mapper.RoleMapper;
import com.example.demo.mapper.UsersMapper;
import com.example.demo.entity.Role;
import com.example.demo.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

        User user = new User(users.getEmail(),
                users.getPassword(),
                "已关闭".equals(users.getStatus()) ? false : true,
                true,
                true,
                true,
                authoritys);
        return user;
    }

    public List<Users> findAll() {
        return usersMapper.findAll();
    }

    public void create(com.example.demo.entity.User user) {
        String password = user.getPassword();
        String encodePassword = passwordEncoder.encode(password);
        user.setPassword(encodePassword);
        usersMapper.create(user);
    }

    public Users findById(int id) {
        Users users = usersMapper.findById(id);
        users.setRoleList(roleMapper.getListByUsersId(id));
        return users;
    }

    public void addRoleToUser(int id, int[] ids) {
        for (int i = 0; i < ids.length; i++) {
            usersMapper.addRoleToUser(id, ids[i]);
        }
    }
}
