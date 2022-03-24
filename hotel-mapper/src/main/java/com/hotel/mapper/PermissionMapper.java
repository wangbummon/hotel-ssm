package com.hotel.mapper;

import com.hotel.pojo.entity.Account;
import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.po.PermissionPO;
import com.hotel.pojo.vo.PermissionVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PermissionMapper {

    /**
     * 查询所有菜单
     *
     * @param params 菜单PO类
     * @return
     */
    List<Permission> selectAllPermission(Permission params);

    /**
     * 根据id修改权限菜单详情
     *
     * @param permission 权限菜单实体类
     */
    boolean modifyPermissionById(Permission permission);

    /**
     * 新增权限菜单
     *
     * @param permission 权限菜单实体类
     * @return
     */
    boolean insertPermission(Permission permission);

    /**
     * 根据id删除权限菜单
     *
     * @param id 权限菜单id
     * @return
     */
    @Delete("DELETE FROM sys_permission WHERE id = #{id}")
    boolean removePermissionById(@Param("id") Integer id);

    /**
     * 根据id查询是否拥有 子菜单/权限
     *
     * @param id 菜单/权限id
     * @return
     */
    @Select("SELECT COUNT(id) FROM sys_permission WHERE parent_id = #{id}")
    Integer checkPermissionChildCount(@Param("id") Integer id);

    /**
     * 根据id查询详情
     * @param id 菜单/权限id
     * @return
     */
    @Select("SELECT id, parent_id, type, title, permission_code, icon, href, spread, target FROM sys_permission WHERE id = #{id}")
    Permission selectPermissionById(@Param("id") Integer id);

    /**
     * 根据用户id查询权限菜单
     * @param id 用户id
     * @return
     */
    List<Permission> selectPermissionByUser(@Param("userId") Integer id);

    /**
     * 根据权限id列表查询权限菜单详情
     * @param currentRolePermissionIds 权限id集合
     * @return
     */
    List<Permission> selectPermissionByPids(@Param("currentRolePermissionIds") List<Integer> currentRolePermissionIds);

}