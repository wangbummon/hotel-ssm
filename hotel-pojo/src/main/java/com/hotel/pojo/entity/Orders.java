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
public class Orders {

    /**
     * 订单编号（id）
     */
    @ApiModelProperty("订单编号（id）")
    private Long id;

    /**
     * 订单号
     */
    @ApiModelProperty("订单号")
    private String ordersNum;

    /**
     * 入住人id
     */
    @ApiModelProperty("入住人id")
    private Long accountId;

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
    private String reservationName;

    /**
     * 入住人身份证
     */
    @ApiModelProperty("入住人身份证号")
    private String idCard;

    /**
     * 入住人电话号
     */
    @ApiModelProperty("入住人电话号")
    private String phone;

    /**
     * 状态 1-待确认 2-已确认 3-已入住
     */
    @ApiModelProperty("状态 1-待确认 2-已确认 3-已入住")
    private Integer status;

    /**
     * 创建时间（预定时间）
     */
    @ApiModelProperty("创建时间（预订时间）")
    private Date reserveDate;

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
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty("退房日期")
    private Date leaveDate;

    /**
     * 预定价格
     */
    @ApiModelProperty("预定价格")
    private BigDecimal reservePrice;

    /**
     * 备注
     */
    @ApiModelProperty("备注")
    private String remark;
}