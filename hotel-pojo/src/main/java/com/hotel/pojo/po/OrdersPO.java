package com.hotel.pojo.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.hotel.pojo.entity.Account;
import com.hotel.pojo.entity.Orders;
import com.hotel.pojo.entity.Room;
import com.hotel.pojo.entity.RoomType;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@EqualsAndHashCode(callSuper = true)
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class OrdersPO extends Orders {

    @ApiModelProperty("页码")
    private Integer pageNum;

    @ApiModelProperty("每页显示数量")
    private Integer pageSize;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty("搜索-开始日期")
    private Date startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty("搜索-结束日期")
    private Date endDate;

    @ApiModelProperty("房型对象")
    private RoomType roomType;

    @ApiModelProperty("房间对象")
    private Room room;
}
