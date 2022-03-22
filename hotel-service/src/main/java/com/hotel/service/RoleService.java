package com.hotel.service;

import com.hotel.pojo.po.RolePO;
import com.hotel.pojo.vo.ResponseVO;

/**
 * @author az
 * @description
 * @date 2022/3/14 0014
 */
public interface RoleService {
    /**
     * 查询角色
     *
     * @param params 角色PO
     * @return
     */
    ResponseVO getRole(RolePO params);

    /**
     * 新增角色
     *
     * @param params 角色PO
     * @return
     */
    ResponseVO addRole(RolePO params);

    /**
     * 修改角色
     *
     * @param params 角色PO
     * @return
     */
    ResponseVO modifyRole(RolePO params);

    /**
     * 删除角色
     *
     * @param id 角色id
     * @return
     */
    ResponseVO removeRole(Integer id);

    /**
     * 查询该角色是否有用户在使用
     *
     * @param roleId 角色id
     * @return
     */
    ResponseVO getRoleUserCount(Integer roleId);

    /**
     * 初始化角色数据
     *
     * @param id 用户id
     * @return
     */
    ResponseVO initRoleData(Integer id);

    /**
     * 查询多选角色是否有用户在使用
     *
     * @param ids 逗号拼接的角色id
     * @return
     */
    ResponseVO getRolesUserCount(String ids);

    /**
     * 批量删除角色
     *
     * @param ids 逗号拼接的角色id
     * @return
     */
    ResponseVO removeRoles(String ids);

    /**
     * 初始化权限菜单
     *
     * @return
     */
    ResponseVO initRoleMenu();


}
