package com.hotel.service;

import com.hotel.pojo.po.PermissionPO;
import com.hotel.pojo.vo.PermissionVO;
import com.hotel.pojo.vo.ResponseVO;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description
 * @date 2022/3/12 0012
 */
public interface PermissionService {

    /**
     * 查询所有菜单
     *
     * @param params 菜单PO
     * @param request
     * @return
     */
    String selectAllPermission(PermissionPO params, HttpServletRequest request);

    /**
     * 初始化权限的菜单树
     *
     * @return
     */
    ResponseVO loadMenuTree();

    /**
     * 查询权限菜单列表
     *
     * @param params 权限PO
     * @return
     */
    ResponseVO getPermissions(PermissionPO params);

    /**
     * 根据id修改权限菜单信息
     *
     * @param params 权限菜单PO
     * @return
     */
    ResponseVO modifyPermissionById(PermissionPO params);

    /**
     * 新增权限菜单
     *
     * @param params 权限菜单PO
     * @return
     */
    ResponseVO insertPermission(PermissionPO params);

    /**
     * 根据id删除权限菜单
     *
     * @param id 权限菜单id
     * @return
     */
    ResponseVO removePermissionById(Integer id);

    /**
     * 根据id判断 菜单/权限 是否有 子菜单/权限
     *
     * @param id 菜单/权限id
     * @return
     */
    ResponseVO checkPermissionChildCount(Integer id);

    /**
     * 根据角色id获取菜单树
     * @param roleId 角色id
     * @return
     */
    ResponseVO getMenuTree(Integer roleId);
}
