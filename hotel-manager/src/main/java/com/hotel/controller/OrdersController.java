package com.hotel.controller;

import com.hotel.pojo.po.OrdersPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.OrdersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author az
 * @description 订单管理
 * @date 2022/3/25 0025
 */
@Api(tags = "订单管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class OrdersController {

    private final OrdersService ordersService;

    @ApiOperation("获取订单列表")
    @GetMapping("/orders")
    public ResponseVO getOrdersList(OrdersPO params){
        return ordersService.getOrdersList(params);
    }

    @ApiOperation("确认订单")
    @PutMapping("/orders/{id}")
    public ResponseVO confirmOrder(@PathVariable @RequestParam Long id){
        return ordersService.confirmOrder(id);
    }

    @ApiOperation("批量确认订单")
    @PutMapping("/orders")
    public ResponseVO confirmOrdersByIds(@RequestParam String ids){
        return ordersService.confirmOrdersByIds(ids);
    }
}
