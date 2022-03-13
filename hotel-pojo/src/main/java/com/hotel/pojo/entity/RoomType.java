package com.hotel.pojo.entity;

import lombok.*;

import java.math.BigDecimal;

/**
 * @author az
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class RoomType {

    /**
     * 房型编号
     */
    private Integer id;

    /**
     * 房型名称
     */
    private String typeName;

    /**
     * 房型照片
     */
    private String photo;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 可入住人数
     */
    private Integer liveNum;

    /**
     * 床位数
     */
    private Integer bedNum;

    /**
     * 房间数量
     */
    private Integer roomNum;

    /**
     * 已预定数量
     */
    private Integer reservedNum;

    /**
     * 可预订数量
     */
    private Integer avilableNum;

    /**
     * 已入住数量
     */
    private Integer livedNum;

    /**
     * 状态 1-可预订 2-房型已满
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;
}