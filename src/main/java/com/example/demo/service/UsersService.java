package com.example.demo.service;

import com.example.demo.dao.RoleMapper;
import com.example.demo.dao.UsersMapper;
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

    public void save(Users users) {
        String password = users.getPassword();
        String encodePassword = passwordEncoder.encode(password);
        users.setPassword(encodePassword);
        usersMapper.save(users);
    }

    public Users findById(int id) {
        Users users = usersMapper.findById(id);
        users.setRoleList(roleMapper.getListByUsersId(id));
        return users;
    }
}
