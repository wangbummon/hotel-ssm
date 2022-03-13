package com.hotel.controller;

import com.hotel.pojo.po.PermissionPO;
import com.hotel.service.PermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author az
 * @description 左侧菜单渲染控制器
 * @date 2022/3/12 0012
 */
@Api(tags = "左侧菜单树渲染")
@RestController
@RequestMapping("/admin/menu")
@RequiredArgsConstructor
public class MenuController {

    private final PermissionService permissionService;

    @ApiOperation("获取所有菜单(左侧导航栏)")
    @GetMapping("/getAllMenu")
    public String getAllMenu(PermissionPO params){
        return permissionService.selectAllPermission(params);
    }
}
