package com.hotel.pojo.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hotel.pojo.entity.Dept;
import com.hotel.pojo.entity.Users;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author az
 * @description
 * @date 2022/3/14 0014
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class UsersPO extends Users {

    /**
     * 页码
     */
    @ApiModelProperty("页码")
    private Integer pageNum;

    /**
     * 每页显示数量
     */
    @ApiModelProperty("每页显示数量")
    private Integer pageSize;

    /**
     * 部门类
     */
    private Dept dept;

    /**
     * 搜索-开始日期
     */
    @ApiModelProperty("搜索-开始日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private String startDate;

    /**
     * 搜索-结束日期
     */
    @ApiModelProperty("搜索-结束日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private String endDate;


}
