package com.hotel.controller;

import com.hotel.pojo.po.CheckinPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.CheckinService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description 入住管理
 * @date 2022/3/26 0026
 */
@Api(tags = "入住管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class CheckinController {

    private final CheckinService checkinService;

    @ApiOperation("获取入住列表")
    @GetMapping("/checkin")
    public ResponseVO getCheckinList(CheckinPO params) {
        return checkinService.getCheckinList(params);
    }

    @ApiOperation("登记入住")
    @PostMapping("/checkin")
    public ResponseVO checkinHotel(@RequestBody CheckinPO params, HttpServletRequest request) {
        return checkinService.checkinHotel(params,request);
    }


}