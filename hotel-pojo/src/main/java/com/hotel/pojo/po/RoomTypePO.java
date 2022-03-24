package com.hotel.pojo.po;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.hotel.pojo.entity.RoomType;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
@EqualsAndHashCode(callSuper = true)
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class RoomTypePO extends RoomType {

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
}
