package com.hotel.desk.controller;

import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.RoomTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author az
 * @description
 * @date 2022/3/24 0024
 */
@Api(tags = "首页")
@RestController
@RequestMapping("/index")
@RequiredArgsConstructor
public class RoomTypeController {
    private final RoomTypeService roomTypeService;

    @ApiOperation("加载首页房型分类")
    @GetMapping("/roomType")
    public String getRoomTypeList() {
        return roomTypeService.allRoomType();
    }
}
