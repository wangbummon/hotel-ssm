package com.hotel.controller;

import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.CheckoutService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description 退房
 * @date 2022/3/26 0026
 */
@Api(tags = "退房")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class CheckoutController {
    private final CheckoutService checkoutService;

    @ApiOperation("退房")
    @PutMapping("/checkout/{checkinId}")
    public ResponseVO checkoutHotel(@PathVariable Long checkinId, HttpServletRequest request) {
        return checkoutService.checkoutHotel(checkinId, request);
    }
}
