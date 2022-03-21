package com.hotel.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hotel.pojo.entity.Dept;
import com.hotel.pojo.entity.Role;
import lombok.*;

import java.util.Date;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/14 0014
 */
@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UsersVO {

    /**
     * 用户编号
     */
    private Integer id;

    /**
     * 用户名
     */
    private String username;

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
     * 备注
     */
    private String remark;

    /**
     * 入职日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date hireDate;

    /**
     * 用户的角色列表 一个用户对应多个角色
     */
    private List<Role> roleList;

    /**
     * 部门类
     */
    private Dept dept;
}
