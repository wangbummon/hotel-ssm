package com.hotel.pojo.po;

import com.hotel.pojo.entity.RolePermission;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author az
 * @description
 * @date 2022/3/21 0021
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class RolePermissionPO extends RolePermission {

    /**
     * 逗号分割的菜单id字符串
     */
    private String menuIds;
}
