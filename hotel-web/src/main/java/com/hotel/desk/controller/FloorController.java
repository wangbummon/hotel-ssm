package com.hotel.desk.controller;

import com.hotel.service.FloorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@Controller
@Api(tags = "楼层相关功能")
@RequestMapping("/floor")
@RequiredArgsConstructor
public class FloorController {
    private final FloorService floorService;

    @ApiOperation("加载楼层分类")
    @GetMapping("/list")
    public String getFloorList() {
        return floorService.getAllFloors();
    }
}
