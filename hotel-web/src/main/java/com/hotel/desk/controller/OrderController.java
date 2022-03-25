package com.hotel.desk.controller;

import com.hotel.pojo.po.OrdersPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.OrdersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@Api(tags = "订单相关")
@RestController
@RequestMapping("/order")
@RequiredArgsConstructor
public class OrderController {

    private final OrdersService ordersService;

    @ApiOperation("预定房间")
    @PostMapping("/reserve")
    public ResponseVO reserveRoom(@RequestBody OrdersPO params, HttpServletRequest request){
        return ordersService.reserveRoom(params, request);
    }
}
