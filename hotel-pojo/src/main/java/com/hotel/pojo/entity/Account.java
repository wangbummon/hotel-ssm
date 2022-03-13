package com.hotel.pojo.entity;

import io.swagger.annotations.ApiModel;
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
@ApiModel(value = "Account对象",description = "前台用户实体类")
public class Account {
    /**
     * 用户编号（主键）
     */
    @ApiModelProperty("用户编号(id)")
    private Long id;

    /**
     * 用户名
     */
    @ApiModelProperty("用户名")
    private String loginName;

    /**
     * 密码
     */
    @ApiModelProperty("密码")
    private String password;

    /**
     * 真实姓名
     */
    @ApiModelProperty("真实姓名")
    private String realName;

    /**
     * 身份证
     */
    @ApiModelProperty("身份证")
    private String idCard;

    /**
     * 电话号
     */

    @ApiModelProperty("电话号")
    private String phone;

    /**
     * 邮箱
     */
    @ApiModelProperty("邮箱")
    private String email;

    /**
     * 状态 1-可用 2-异常
     */

    @ApiModelProperty("状态 1-可用 2-异常")
    private Integer status;

    /**
     * 注册时间
     */
    @ApiModelProperty("注册时间")
    private Date registTime;
}