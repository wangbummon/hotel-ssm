package com.hotel.controller;

import com.hotel.pojo.po.UserRolePO;
import com.hotel.pojo.po.UsersPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.UsersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description
 * @date 2022/3/14 0014
 */
@Api(tags = "用户管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class UsersController {

    private final UsersService usersService;

    @ApiOperation("查询用户列表")
    @GetMapping("/users")
    public ResponseVO getUsers(UsersPO params, HttpServletRequest request) {
        return usersService.getUser(params, request);
    }

    @ApiOperation("新增用户")
    @PostMapping("/users/")
    public ResponseVO addUsers(@RequestBody UsersPO params,
                               HttpServletRequest request) {
        return usersService.addUser(params, request);
    }

    @ApiOperation("修改用户")
    @PutMapping("/users/{id}")
    public ResponseVO modifyUsers(@RequestBody UsersPO params,
                                  HttpServletRequest request) {
        return usersService.modifyUsers(params, request);
    }

    @ApiOperation("修改登录账号密码")
    @PutMapping("/user/pwd")
    public ResponseVO updateLoginUserPwd(@RequestBody UsersPO params, HttpServletRequest request) {
        return usersService.updateLoginUserPwd(params, request);
    }

    @ApiOperation("删除用户")
    @DeleteMapping("/user/{id}")
    public ResponseVO removeUser(@PathVariable Integer id) {
        return usersService.removeUser(id);
    }

    @ApiOperation("批量删除用户")
    @DeleteMapping("/users/{ids}")
    public ResponseVO removeUsers(@PathVariable String ids) {
        return usersService.removeUsers(ids);
    }

    @ApiOperation("重置用户密码")
    @PutMapping("/resetPwd/{id}")
    public ResponseVO resetPwd(@PathVariable Integer id, HttpServletRequest request) {
        return usersService.resetPwd(id, request);
    }

    @ApiOperation("根据id给用户分配角色")
    @PostMapping("/userRoles/{userId}")
    public ResponseVO saveUserRoles(@RequestBody UserRolePO params) {
        return usersService.saveUserRoles(params);
    }

    @ApiOperation("查看登陆账号基本信息")
    @GetMapping("/user/detail")
    public ResponseVO getLoginUserDetail(HttpServletRequest request){
        return usersService.getLoginUserDetail(request);
    }

    @ApiOperation("修改个人信息")
    @PutMapping("/user/detail")
    public ResponseVO updateLoginUserDetail(@RequestBody UsersPO usersPO,HttpServletRequest request){
        return usersService.updateLoginUserDetail(usersPO,request);
    }
}
