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
public class Floor {
    /**
     * 楼层编号（id）
     */
    @ApiModelProperty("楼层编号（id）")
    private Integer id;

    /**
     * 楼层名称
     */
    @ApiModelProperty("楼层名称")
    private String floorName;

    /**
     * 备注
     */
    @ApiModelProperty("备注")
    private String remark;
}