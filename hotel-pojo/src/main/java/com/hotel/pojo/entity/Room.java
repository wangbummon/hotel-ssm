package com.hotel.pojo.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * @author az
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Room {
    /**
     * 房间编号（id）
     */
    @ApiModelProperty("房间编号")
    private Integer id;

    /**
     * 房间标题
     */
    @ApiModelProperty("房间标题")
    private String title;

    /**
     * 房间照片
     */
    @ApiModelProperty("房间照片")
    private String photo;

    /**
     * 房间号
     */
    @ApiModelProperty("房间号")
    private String roomNum;

    /**
     * 房型id
     */
    @ApiModelProperty("房型id")
    private Integer roomTypeId;

    /**
     * 楼层id
     */
    @ApiModelProperty("楼层id")
    private Integer floorId;

    /**
     * 状态 1-可预定 2-已预定 3-已入住
     */
    @ApiModelProperty("状态 1-可预订 2-已预订 3-已入住")
    private Integer status;

    /**
     * 房间要求
     */
    @ApiModelProperty("房间要求")
    private String roomRequirement;

    /**
     * 备注
     */
    @ApiModelProperty("备注")
    private String remark;

    /**
     * 房间描述
     */
    private String roomDesc;
}