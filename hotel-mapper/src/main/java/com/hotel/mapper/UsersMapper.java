package com.hotel.mapper;

import com.hotel.pojo.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UsersMapper {
    /**
     * 根据id删除用户
     *
     * @param id 主键
     * @return 0 or 1
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 新增用户
     *
     * @param record 用户实体类
     * @return 0 or 1
     */
    int insert(Users record);

    /**
     * 根据id查询用户详情
     *
     * @param id 主键
     * @return SysUser
     */
    Users selectByPrimaryKey(@Param("id") Integer id);

    /**
     * 查询所有用户
     *
     * @return List<SysUser>
     */
    List<Users> selectAll();

    /**
     * 根据id修改用户详情
     *
     * @param record 用户实体类
     * @return 0 or 1
     */
    int updateByPrimaryKey(Users record);

    /**
     * 根据用户名查询用户信息
     *
     * @param username 用户名
     * @return
     */
    Users selectUsersByUsername(@Param("username") String username);

    /**
     * 根据部门id查询用户数量
     *
     * @param deptId 部门id
     * @return
     */
    @Select("SELECT count(id) FROM sys_users WHERE dept_id = #{deptId}")
    int selectUserByDeptId(@Param("deptId") Integer deptId);
}