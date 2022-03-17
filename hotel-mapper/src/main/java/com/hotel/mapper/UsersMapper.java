package com.hotel.mapper;

import com.hotel.pojo.entity.Users;
import com.hotel.pojo.po.UsersPO;
import com.hotel.pojo.vo.UsersVO;
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
    boolean deleteByPrimaryKey(Integer id);

    /**
     * 新增用户
     *
     * @param record 用户实体类
     * @return 0 or 1
     */
    boolean insert(Users record);

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
    boolean updateByPrimaryKey(Users record);

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
    int selectUserCountByDeptId(@Param("deptId") Integer deptId);

    /**
     * 查询用户列表
     * @param params 用户PO
     * @return
     */
    List<Users> getUser(UsersPO params);

    /**
     * 批量删除用户
     * @param userIds 用户的id列表
     * @return
     */
    boolean removeUsers(@Param("userIds") List userIds);
}