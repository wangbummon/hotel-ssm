package com.hotel.pojo.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.hotel.pojo.entity.Checkin;
import com.hotel.pojo.entity.Room;
import com.hotel.pojo.entity.RoomType;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author az
 * @description
 * @date 2022/3/26 0026
 */
@EqualsAndHashCode(callSuper = true)
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class CheckinVO extends Checkin {

    @ApiModelProperty("房型对象")
    private RoomType roomType;

    @ApiModelProperty("房间对象")
    private Room room;
}
