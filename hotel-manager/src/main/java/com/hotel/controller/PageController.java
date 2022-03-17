package com.hotel.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author az
 * @description 页面跳转控制器
 * @date 2022/3/13 0013
 */
@Api(tags = "页面跳转控制器")
@Controller
@RequestMapping("/admin")
public class PageController {

    /**
     * 部门管理页面
     *
     * @return
     */
    @ApiOperation("跳转至部门管理页面")
    @RequestMapping("/deptManager")
    public String deptManager() {
        return "admin/deptManager";
    }

    /**
     * 角色管理页面
     *
     * @return
     */
    @ApiOperation("跳转至角色管理页面")
    @RequestMapping("/roleManager")
    public String roleManager() {
        return "admin/roleManager";
    }

    /**
     * 用户管理页面
     *
     * @return
     */
    @ApiOperation("跳转至用户管理页面")
    @RequestMapping("/usersManager")
    public String usersManager() {
        return "admin/usersManager";
    }
}
