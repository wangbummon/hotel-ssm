package com.hotel.service.impl;

import com.github.pagehelper.PageHelper;
import com.hotel.mapper.RoleMapper;
import com.hotel.mapper.UsersMapper;
import com.hotel.pojo.entity.Role;
import com.hotel.pojo.po.RolePO;
import com.hotel.pojo.response.RespVO;
import com.hotel.pojo.vo.RoleVO;
import com.hotel.service.RoleService;
import com.hotel.util.CheckUtils;
import com.hotel.util.MyBeanUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/14 0014
 */
@Service
@Transactional
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {

    private final RoleMapper roleMapper;
    private final UsersMapper usersMapper;

    private Role role = null;

    /**
     * 查询角色
     *
     * @param params 角色PO
     * @return
     */
    @Override
    public RespVO getRole(RolePO params) {
        role = new Role();
        MyBeanUtils.copyProperties(params, role);
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Role> roles = roleMapper.selectRole(role);
        return CheckUtils.checkEmpty(roles, RoleVO.class);
    }

    /**
     * 新增角色
     *
     * @param params 角色PO
     * @return
     */
    @Override
    public RespVO addRole(RolePO params) {
        role = new Role();
        MyBeanUtils.copyProperties(params, role);
        return CheckUtils.checkSuccess(roleMapper.insert(role));
    }

    /**
     * 修改角色
     *
     * @param params 角色PO
     * @return
     */
    @Override
    public RespVO modifyRole(RolePO params) {
        role = new Role();
        MyBeanUtils.copyProperties(params, role);
        return CheckUtils.checkSuccess(roleMapper.updateByPrimaryKey(role));
    }

    /**
     * 删除角色
     *
     * @param id 角色id
     * @return
     */
    @Override
    public RespVO removeRole(Integer id) {
        return CheckUtils.checkSuccess(roleMapper.deleteByPrimaryKey(id));
    }

    /**
     * 查询该角色是否有用户在使用
     *
     * @param roleId 角色id
     * @return
     */
    @Override
    public RespVO getRoleUserCount(Integer roleId) {
        //int count = usersMapper
        return null;
    }
}
