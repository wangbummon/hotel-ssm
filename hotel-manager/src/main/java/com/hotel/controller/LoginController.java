package com.hotel.controller;

import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.UsersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author az
 * @description 用户管理控制器
 * @date 2022/3/10 0010
 */
@Api(tags = "用户管理")
@Controller
@RequestMapping("/admin/user")
@RequiredArgsConstructor
public class LoginController {

    private final UsersService usersService;

    @ApiOperation("查询用户列表")
    @ApiResponses({
            @ApiResponse(code = 200,message = "操作成功"),
            @ApiResponse(code = 205,message = "操作成功，但数据为空"),
    })
    @GetMapping("/userList")
    public @ResponseBody
    ResponseVO userList() {
        return null;
    }

    @ApiOperation("登出")
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //清空session
        session.invalidate();
        return "redirect:/login.jsp";
    }
}
