package com.hotel.pojo.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AccountRole {
    /**
     * 角色编号（id）
     */
    @ApiModelProperty("角色编号（id）")
    private Integer id;

    /**
     * 角色代码
     */
    @ApiModelProperty("角色代码")
    private String roleCode;

    /**
     * 角色名称
     */
    @ApiModelProperty("角色名称")
    private String roleName;

    /**
     * 角色描述
     */
    @ApiModelProperty("角色描述")
    private String roleDesc;
}
