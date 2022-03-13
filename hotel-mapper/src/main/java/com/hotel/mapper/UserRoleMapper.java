package com.hotel.mapper;

import com.hotel.pojo.entity.UserRole;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserRoleMapper {

    /**
     * 新增用户角色
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
    @Select("SELECT count(uid) from sys_user_role WHERE rid = #{roleId}")
    int getRoleUserCount(Integer roleId);
}