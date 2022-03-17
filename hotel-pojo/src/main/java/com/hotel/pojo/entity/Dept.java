package com.hotel.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author az
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Dept {
    /**
     * 部门编号（id）
     */
    @ApiModelProperty("部门编号（id）")
    private Integer id;

    /**
     * 部门名称
     */
    @ApiModelProperty("部门名称")
    private String deptName;

    /**
     * 部门地址
     */
    @ApiModelProperty("部门地址")
    private String address;

    /**
     * 创建时间
     */
    @ApiModelProperty("创建时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createDate;

    /**
     * 备注
     */
    @ApiModelProperty("备注")
    private String remark;
}