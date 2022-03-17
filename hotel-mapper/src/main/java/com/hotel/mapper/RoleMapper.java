package com.hotel.mapper;

import com.hotel.pojo.entity.Role;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

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

    /**
     * 获取所有角色的Map集合的List
     * @return
     */
    @Select("SELECT id,role_code,role_name,role_desc FROM sys_role")
    List<Map<String, Object>> getRoleListByMap();

    /**
     * 根据用户id查询角色id列表
     * @param id 用户id
     * @return
     */
    @Select("SELECT role_id FROM sys_user_role WHERE user_id = #{uid}")
    List<Integer> getRoleIdByUserId(@Param("uid") Integer id);

    /**
     * 批量删除角色
     * @param roleIds
     * @return
     */
    boolean removeRoles(@Param("roleIds") List roleIds);
}