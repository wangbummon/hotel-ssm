package com.hotel.pojo.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.Date;

/**
 * @author az
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Role {

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