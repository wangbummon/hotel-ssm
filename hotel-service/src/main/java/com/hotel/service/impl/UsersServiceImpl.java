package com.hotel.service.impl;

import com.hotel.mapper.UsersMapper;
import com.hotel.pojo.entity.Role;
import com.hotel.pojo.entity.Users;
import com.hotel.service.UsersService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/10 0010
 */
@Service
@Transactional
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersService {

    private final UsersMapper usersMapper;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //创建角色列表集合
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        //根据用户名查询用户信息
        Users users = usersMapper.selectUsersByUsername(username);
        //将用户拥有的角色对应的角色编码放入角色列表中
        for (Role role : users.getRoleList()) {
            authorities.add(new SimpleGrantedAuthority(role.getRoleCode()));
        }

        //创建spring security的user对象并返回
        User user = new User(users.getUsername(),
                users.getPassword(),
                users.getStatus() == 1,
                true,
                true,
                true,
                authorities);
        return user;
    }
}
