package com.hotel.service;

import com.hotel.pojo.po.PermissionPO;
import com.hotel.pojo.vo.PermissionVO;

/**
 * @author az
 * @description
 * @date 2022/3/12 0012
 */
public interface PermissionService {

    /**
     * 查询所有菜单
     * @param params 菜单PO
     * @return
     */
    String selectAllPermission(PermissionPO params);
}
