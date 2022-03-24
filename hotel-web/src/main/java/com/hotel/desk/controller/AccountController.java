package com.hotel.desk.controller;

import com.hotel.pojo.po.AccountPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.AccountService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @author az
 * @description
 * @date 2022/3/24 0024
 */
@RestController
@Api(tags = "前台登录注册")
@RequiredArgsConstructor
public class AccountController {
    private final AccountService accountService;

    @ApiOperation("前台用户注册")
    @PostMapping("/register")
    public ResponseVO register(@RequestBody AccountPO params) {
        return accountService.register(params);
    }

    @ApiOperation("检查用户名是否已存在")
    @GetMapping("/account/name/{loginName}")
    public ResponseVO checkAccountNameExist(@PathVariable String loginName) {
        return accountService.checkAccountNameExist(loginName);
    }

}
