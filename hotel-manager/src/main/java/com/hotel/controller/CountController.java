package com.hotel.controller;

import com.hotel.pojo.vo.CountVO;
import com.hotel.service.AccountService;
import com.hotel.service.CheckinService;
import com.hotel.service.RoomService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author az
 * @description 首页相关
 * @date 2022/3/27 0027
 */
@Api(tags = "首页相关信息展示")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class CountController {
    private final AccountService accountService;
    private final CheckinService checkinService;
    private final RoomService roomService;

    @ApiOperation("查询前台用户数量及增长数量")
    @GetMapping("/user/count")
    public CountVO getUserCount() {
        return accountService.getUserCount();
    }

    @ApiOperation("获取总盈利及昨日和七天盈利")
    @GetMapping("/price/count")
    public CountVO getPriceCount(){
        return checkinService.getPriceCount();
    }

    @ApiOperation("获取房间数量及房型、楼层数量")
    @GetMapping("/room/count")
    public CountVO getRoomCount(){
        return roomService.getRoomCount();
    }
}
