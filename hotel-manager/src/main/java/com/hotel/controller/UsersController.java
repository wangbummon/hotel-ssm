package com.hotel.controller;

import com.hotel.pojo.po.UserRolePO;
import com.hotel.pojo.po.UsersPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.UsersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

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
    public ResponseVO getUsers(UsersPO params) {
        return usersService.getUser(params);
    }

    @ApiOperation("新增用户")
    @PostMapping("/users")
    public ResponseVO addUsers(@RequestBody UsersPO params) {
        return usersService.addUser(params);
    }

    @ApiOperation("修改用户")
    @PutMapping("/users/{id}")
    public ResponseVO modifyUsers(@RequestBody UsersPO params) {
        return usersService.modifyUsers(params);
    }

    @ApiOperation("删除用户")
    @DeleteMapping("/user/{id}")
    public ResponseVO removeUser(@PathVariable Integer id) {
        return usersService.removeUser(id);
    }

    @ApiOperation("批量删除用户")
    @DeleteMapping("/users/{ids}")
    public ResponseVO removeUsers(@PathVariable String ids){
        return usersService.removeUsers(ids);
    }

    @ApiOperation("重置用户密码")
    @PutMapping("/resetPwd/{id}")
    public ResponseVO resetPwd(@PathVariable Integer id) {
        return usersService.resetPwd(id);
    }

    @ApiOperation("根据id给用户分配角色")
    @PostMapping("/userRoles/{userId}")
    public ResponseVO saveUserRoles(@RequestBody UserRolePO params) {
        return usersService.saveUserRoles(params);
    }
}
