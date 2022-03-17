package com.hotel.pojo.entity;

import lombok.*;

/**
 * @author az
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserRole {
    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 角色id
     */
    private Integer roleId;
}