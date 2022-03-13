package com.hotel.pojo.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * @author az
 * @description
 * @date 2022/3/10 0010
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class RolePermission {
    /**
     * 角色id
     */
    @ApiModelProperty("角色id")
    private Integer rid;

    /**
     * 权限id
     */
    @ApiModelProperty("权限id")
    private Integer pid;
}
