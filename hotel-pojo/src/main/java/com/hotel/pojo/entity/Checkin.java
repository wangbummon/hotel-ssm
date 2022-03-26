package com.hotel.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author az
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Checkin {

    /**
     * 入住编号（主键）
     */
    @ApiModelProperty("入住编号（id）")
    private Long id;

    /**
     * 实付金额
     */
    @ApiModelProperty("实付金额")
    private BigDecimal payPrice;

    /**
     * 房型id
     */
    @ApiModelProperty("房型id")
    private Integer roomTypeId;

    /**
     * 房间id
     */
    @ApiModelProperty("房间id")
    private Integer roomId;

    /**
     * 入住人姓名
     */
    @ApiModelProperty("入住人姓名")
    private String customerName;

    /**
     * 入住人身份证
     */
    @ApiModelProperty("入住人身份证")
    private String idCard;

    /**
     * 入住人电话
     */
    @ApiModelProperty("入住人电话")
    private String phone;

    /**
     * 入住日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty("入住日期")
    private Date arriveDate;

    /**
     * 退房日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty("退房日期")
    private Date leaveDate;

    /**
     * 订单id
     */
    @ApiModelProperty("订单id")
    private Long ordersId;

    /**
     * 状态 1-入住中 2-已退房
     */
    @ApiModelProperty("状态 1-入住中 2-已退房")
    private Integer status;

    /**
     * 创建时间
     */
    @ApiModelProperty("创建时间")
    private Date createDate;

    /**
     * 创建人
     */
    @ApiModelProperty("创建人")
    private Integer createdUser;

    /**
     * 修改时间
     */
    @ApiModelProperty("修改时间")
    private Date modifyDate;

    /**
     * 修改人
     */
    @ApiModelProperty("修改人")
    private Integer modifyUser;

    /**
     * 备注
     */
    @ApiModelProperty("备注")
    private String remark;
}