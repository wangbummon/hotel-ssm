package com.hotel.controller;

import com.hotel.service.ChartsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @author az
 * @description 用于渲染首页中的报表数据
 * @date 2022/3/27 0027
 */
@Api(tags = "报表相关")
@RestController
@RequestMapping("/admin/charts")
@RequiredArgsConstructor
public class ChartsController {

    private final ChartsService chartsService;

    @ApiOperation("获取本周入住信息")
    @GetMapping("/checkin/week")
    public Map<Object, Object> getCheckinByWeek() {
        return chartsService.getCheckinByWeek();
    }

    @ApiOperation("获取全部入住房型数量")
    @GetMapping("/checkin/roomTypeCount")
    public Map<Object, Object> getRoomTypeCountByCheckin() {
        return chartsService.getRoomTypeCountByCheckin();
    }
}
