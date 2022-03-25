package com.hotel.pojo.vo;

import com.hotel.pojo.entity.Orders;
import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.entity.Room;
import com.hotel.pojo.entity.RoomType;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * @author az
 * @description
 * @date 2022/3/12 0012
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ToString
public class OrdersVO extends Orders {

    @ApiModelProperty("房型对象")
    private RoomType roomType;

    @ApiModelProperty("房间对象")
    private Room room;
}
