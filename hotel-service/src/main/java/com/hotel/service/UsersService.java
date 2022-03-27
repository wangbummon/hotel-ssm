package com.hotel.service;

import com.hotel.pojo.po.UserRolePO;
import com.hotel.pojo.po.UsersPO;
import com.hotel.pojo.vo.ResponseVO;
import org.springframework.security.core.userdetails.UserDetailsService;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description
 * @date 2022/3/10 0010
 */
public interface UsersService extends UserDetailsService {

    /**
     * 查询用户列表
     * @param params 用户PO
     * @param request
     * @return
     */
    ResponseVO getUser(UsersPO params,HttpServletRequest request);

    /**
     * 新增用户
     * @param params 用户PO
     * @param request
     * @return
     */
    ResponseVO addUser(UsersPO params, HttpServletRequest request);

    /**
     * 根据id修改用户信息
     * @param params 用户PO
     * @param request
     * @return
     */
    ResponseVO modifyUsers(UsersPO params,HttpServletRequest request);

    /**
     * 根据id删除用户
     * @param id
     * @return
     */
    ResponseVO removeUser(Integer id);

    /**
     * 根据id重置用户密码
     * @param id
     * @param request
     * @return
     */
    ResponseVO resetPwd(Integer id, HttpServletRequest request);

    /**
     * 根据用户id分配角色
     * @param userRolePO 用户角色关系PO
     * @return
     */
    ResponseVO saveUserRoles(UserRolePO userRolePO);

    /**
     * 批量删除用户
     * @param ids 逗号拼接的用户id
     * @return
     */
    ResponseVO removeUsers(String ids);

}
