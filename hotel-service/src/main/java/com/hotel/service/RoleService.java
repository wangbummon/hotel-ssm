package com.hotel.service;

import com.hotel.pojo.po.RolePO;
import com.hotel.pojo.response.RespVO;

/**
 * @author az
 * @description
 * @date 2022/3/14 0014
 */
public interface RoleService {
    /**
     * 查询角色
     * @param params 角色PO
     * @return
     */
    RespVO getRole(RolePO params);

    /**
     * 新增角色
     * @param params 角色PO
     * @return
     */
    RespVO addRole(RolePO params);

    /**
     * 修改角色
     * @param params 角色PO
     * @return
     */
    RespVO modifyRole(RolePO params);

    /**
     * 删除角色
     * @param id 角色id
     * @return
     */
    RespVO removeRole(Integer id);

    /**
     * 查询该角色是否有用户在使用
     * @param roleId 角色id
     * @return
     */
    RespVO getRoleUserCount(Integer roleId);
}
