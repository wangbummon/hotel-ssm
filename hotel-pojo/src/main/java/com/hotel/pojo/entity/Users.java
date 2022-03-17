package com.hotel.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author az
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Users {
    /**
     * 用户编号
     */
    private Integer id;

    /**
     *
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 性别
     */
    private Integer sex;

    /**
     * 部门id
     */
    private Integer deptId;

    /**
     * 状态 1-可用 2-禁用
     */
    private Integer status;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 用户类型 1-超管 2-普通用户
     */
    private Integer userType;

    /**
     * 入职日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date hireDate;

    /**
     * 创建人
     */
    private Integer createdUser;

    /**
     * 创建时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createdDate;

    /**
     * 修改人
     */
    private Integer modifyUser;

    /**
     * 修改时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date modifyDate;

    /**
     * 备注
     */
    private String remark;

    /**
     * 用户的角色列表 一个用户对应多个角色
     */
    private List<Role> roleList;
}