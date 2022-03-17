package com.hotel.mapper;

import com.hotel.pojo.entity.UserRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserRoleMapper {

    /**
     * 新增用户角色关系
     *
     * @param record 用户角色实体类
     * @return
     */
    int insert(UserRole record);

    /**
     * 查询用户所有角色
     *
     * @param userRole 用户角色实体类
     * @return
     */
    List<UserRole> selectAll(UserRole userRole);

    /**
     * 查询此角色有多少用户在使用
     *
     * @param roleId 角色id
     * @return
     */
    @Select("SELECT count(user_id) from sys_user_role WHERE role_id = #{roleId}")
    int getRoleUserCount(@Param("roleId") Integer roleId);

    /**
     * 根据用户id删除用户角色表中间表的数据
     *
     * @param id 用户id
     * @return
     */
    @Delete("DELETE FROM sys_user_role WHERE user_id = #{userId}")
    boolean deleteUserRoleByUid(@Param("userId") Integer id);

    /**
     * 批量删除用户角色关系
     * @param userIds 用户id列表
     * @return
     */
    boolean deleteUsersRoleByUserIds(@Param("userIds") List userIds);
}