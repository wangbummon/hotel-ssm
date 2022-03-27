package com.hotel.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotel.mapper.UserRoleMapper;
import com.hotel.mapper.UsersMapper;
import com.hotel.pojo.entity.Role;
import com.hotel.pojo.entity.UserRole;
import com.hotel.pojo.entity.Users;
import com.hotel.pojo.po.UserRolePO;
import com.hotel.pojo.po.UsersPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.pojo.vo.UsersVO;
import com.hotel.service.UsersService;
import com.hotel.util.CheckUtils;
import com.hotel.pojo.enums.DataEnums;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.PasswordUtils;
import com.hotel.util.ResponseUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
    private final UserRoleMapper userRoleMapper;

    /**
     * spring security按照用户名加载用户 此处不会传入用户的密码
     *
     * @param username 用户名
     * @return
     * @throws UsernameNotFoundException 用户名未找到
     */
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

        //判断账户是否可用 1为可用 2为禁用
        boolean enabled = users.getStatus() == 1;

        //创建spring security的user对象并返回
        User user = new User(users.getUsername(),
                users.getPassword(),
                enabled,
                true,
                true,
                true,
                authorities);
        return user;
    }

    /**
     * 查询用户列表
     *
     * @param params  用户PO
     * @param request
     * @return
     */
    @Override
    public ResponseVO getUser(UsersPO params, HttpServletRequest request) {
        //获取当前登录用户对象
        Users loginUser = usersMapper.selectUsersByUsername(request.getUserPrincipal().getName());
        //判断是否为后台普通用户 若是则只查询userType为2的数据
        if (null != loginUser && loginUser.getUserType() == 2) {
            params.setUserType(2);
        }

        if (Objects.equals(params.getStartDate(), "")) {
            params.setStartDate(null);
        }
        if (Objects.equals(params.getEndDate(), "")) {
            params.setEndDate(null);
        }
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Users> usersList = usersMapper.getUserList(params);
        PageInfo<Users> pageInfo = new PageInfo<>(usersList);
        return CheckUtils.checkEmpty(pageInfo.getTotal(), pageInfo.getList(), UsersVO.class);
    }

    /**
     * 新增用户
     *
     * @param params  用户PO
     * @param request
     * @return
     */
    @Override
    public ResponseVO addUser(UsersPO params, HttpServletRequest request) {
        Users users = new Users();
        MyBeanUtils.copyProperties(params, users);
        users.setCreatedDate(new Date());
        //通过用户名查询用户信息 并保存创建人id
        String username = request.getUserPrincipal().getName();
        Integer userId = usersMapper.getUserByUsername(username).getId();
        //设置创建人
        users.setCreatedUser(userId);
        //设置密文密码保存至数据库 这里指定所有用户初始密码均为123456
        users.setPassword(PasswordUtils.encode(DataEnums.DEFAULT_PASSWORD.getData()));
        //默认为后台的普通用户
        users.setUserType(2);
        return CheckUtils.checkSuccess(usersMapper.insert(users));
    }

    /**
     * 根据id修改用户信息
     *
     * @param params  用户PO
     * @param request
     * @return
     */

    @Override
    public ResponseVO modifyUsers(UsersPO params, HttpServletRequest request) {
        Users users = new Users();
        MyBeanUtils.copyProperties(params, users);
        users.setModifyDate(new Date());
        //通过用户名获取用户信息 并保存修改人id
        String username = request.getUserPrincipal().getName();
        Integer userId = usersMapper.getUserByUsername(username).getId();
        users.setModifyUser(userId);
        return CheckUtils.checkSuccess(usersMapper.updateByPrimaryKey(users));
    }

    /**
     * 根据用户id删除用户
     *
     * @param id
     * @return
     */
    @Override
    public ResponseVO removeUser(Integer id) {
        //根据用户id删除用户角色中间表中的数据
        userRoleMapper.deleteUserRoleByUid(id);
        return CheckUtils.checkSuccess(usersMapper.deleteByPrimaryKey(id));
    }

    /**
     * 根据id重置用户密码
     *
     * @param id      用户id
     * @param request
     * @return
     */
    @Override
    public ResponseVO resetPwd(Integer id, HttpServletRequest request) {
        String username = request.getUserPrincipal().getName();
        int userId = usersMapper.getUserByUsername(username).getId();
        //将密码重置为加密后的默认密码 123456
        Users users = Users.builder()
                .id(id)
                .password(PasswordUtils.encode(DataEnums.DEFAULT_PASSWORD.getData()))
                .modifyUser(userId)
                .modifyDate(new Date())
                .build();

        return CheckUtils.checkSuccess(usersMapper.updateByPrimaryKey(users));
    }

    /**
     * 根据用户id分配角色
     *
     * @param userRolePO 用户角色关系PO
     * @return
     */
    @Override
    public ResponseVO saveUserRoles(UserRolePO userRolePO) {
        //创建用户角色关系前先将原有数据清空
        userRoleMapper.deleteUserRoleByUid(userRolePO.getUserId());
        UserRole userRole = null;
        try {
            //根据逗号分割字符串拿到角色id
            String[] idList = userRolePO.getRoleIds().split(",");
            for (String idStr : idList) {
                Integer roleId = Integer.valueOf(idStr);
                userRole = UserRole.builder()
                        .userId(userRolePO.getUserId())
                        .roleId(roleId)
                        .build();
                //循环插入
                userRoleMapper.insert(userRole);
            }
            return ResponseUtils.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.failed();
    }

    /**
     * 批量删除用户
     *
     * @param ids 逗号拼接的用户id
     * @return
     */
    @Override
    public ResponseVO removeUsers(String ids) {
        List userIds = Arrays.asList(ids.split(","));
        //删除用户角色关系
        userRoleMapper.deleteUsersRoleByUserIds(userIds);
        boolean remove = usersMapper.removeUsers(userIds);
        return CheckUtils.checkSuccess(remove);
    }
}
