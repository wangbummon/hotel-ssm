package com.hotel.service;

import com.hotel.pojo.po.RolePermissionPO;
import com.hotel.pojo.vo.ResponseVO;

/**
 * @author az
 * @description
 * @date 2022/3/21 0021
 */
public interface RolePermissionService {
    /**
     * 根据角色id分配菜单
     * @param params 角色权限PO
     * @return
     */
    ResponseVO distributionRoleWithMenu(RolePermissionPO params);
}
