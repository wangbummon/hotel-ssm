package com.hotel.service;

import com.hotel.pojo.po.AccountPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.pojo.vo.CountVO;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @author az
 * @description
 * @date 2022/3/24 0024
 */
public interface AccountService extends UserDetailsService {
    /**
     * 前台用户注册
     *
     * @param params 前台用户PO
     * @return
     */
    ResponseVO register(AccountPO params);

    /**
     * 检查用户名是否已存在
     *
     * @param loginName 前台用户用户名
     * @return
     */
    ResponseVO checkAccountNameExist(String loginName);

    /**
     * 获取前台用户数量及增长
     *
     * @return
     */
    CountVO getUserCount();
}
