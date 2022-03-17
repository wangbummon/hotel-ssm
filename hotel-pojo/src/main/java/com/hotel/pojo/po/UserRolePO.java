package com.hotel.pojo.po;

import com.hotel.pojo.entity.UserRole;
import lombok.*;

/**
 * @author az
 * @description
 * @date 2022/3/17 0017
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserRolePO extends UserRole {

    /**
     * 用逗号分割的角色id字符串
     */
    private String roleIds;
}
