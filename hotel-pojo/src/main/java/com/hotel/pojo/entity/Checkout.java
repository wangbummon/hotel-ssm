package com.hotel.pojo.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

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
public class Checkout {
    /**
     * 退房编号（主键）
     */
    @ApiModelProperty("退房编号")
    private Long id;

    /**
     * 退房记录编号
     */
    @ApiModelProperty("退房记录编号")
    private String checkOutNumber;

    /**
     * 入住编号
     */
    @ApiModelProperty("入住编号")
    private Long checkinId;

    /**
     * 消费金额
     */
    @ApiModelProperty("消费金额")
    private BigDecimal consumePrice;

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
     * 备注
     */
    @ApiModelProperty("备注")
    private String remark;
}