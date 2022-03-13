package com.hotel.mapper;

import com.hotel.pojo.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {

    /**
     * 根据id删除角色
     *
     * @param id 角色id
     * @return
     */
    boolean deleteByPrimaryKey(@Param("id") Integer id);

    /**
     * 根据角色id修改角色信息
     *
     * @param role
     * @return
     */
    boolean updateByPrimaryKey(Role role);

    /**
     * 新增角色
     *
     * @param record 角色实体
     * @return
     */
    boolean insert(Role record);

    /**
     * 查询所有角色
     *
     * @param params 角色实体类
     * @return
     */
    List<Role> selectRole(Role params);

    /**
     * 根据用户id查询角色列表
     *
     * @param userId 用户id
     * @return
     */
    List<Role> selectRoleByUserId(@Param("userId") Integer userId);
}