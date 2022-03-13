package com.hotel.mapper;

import com.hotel.pojo.entity.Account;
import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.po.PermissionPO;
import com.hotel.pojo.vo.PermissionVO;

import java.util.List;

public interface PermissionMapper {

    /**
     * 查询所有菜单
     * @return
     * @param params 菜单PO类
     */
    List<Permission> selectAllPermission(PermissionPO params);
}