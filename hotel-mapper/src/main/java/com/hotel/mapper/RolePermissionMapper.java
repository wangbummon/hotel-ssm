package com.hotel.mapper;

import com.hotel.pojo.entity.Account;
import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.entity.RolePermission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RolePermissionMapper {

    /**
     * 分配角色权限菜单
     *
     * @param menuIds 权限菜单逗号拼接多个id的字符串
     * @param rid     角色id
     * @return
     */
    boolean distributionRoleWithMenu(@Param("menuIds") List menuIds, @Param("rid") Integer rid);

    /**
     * 根据角色id清空权限
     *
     * @param rid 角色id
     * @return
     */
    @Delete("DELETE FROM sys_role_permisson WHERE rid = #{rid}")
    boolean removePermissionByRid(@Param("rid") Integer rid);

    /**
     * 根据角色id查询权限id的列表
     * @param roleId 角色id
     * @return
     */
    @Select("SELECT pid from sys_role_permisson WHERE rid = #{rid}")
    List<Integer> selectPermissionByRoleId(@Param("rid") Integer roleId);
}