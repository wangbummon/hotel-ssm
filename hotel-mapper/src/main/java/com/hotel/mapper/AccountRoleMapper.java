package com.hotel.mapper;

import com.hotel.pojo.entity.AccountRole;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
public interface AccountRoleMapper {

    /**
     * 根据用户id查询角色列表
     *
     * @param accountId 前台用户id
     * @return
     */
    List<AccountRole> selectAccountRoleByAccountId(@Param("accountId") Integer accountId);

    /**
     * 添加前台用户角色关系
     *
     * @param accountId 前台用户id
     * @param roleId    前台角色id
     */
    @Insert("INSERT INTO t_account_role(account_id, role_id) VALUES (#{accountId},#{roleId})")
    void insertAccountRoleRelation(@Param("accountId") Long accountId, @Param("roleId") int roleId);
}
