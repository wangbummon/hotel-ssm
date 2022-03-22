package com.hotel.controller.admin;

import com.hotel.pojo.po.PermissionPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.PermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author az
 * @description
 * @date 2022/3/18 0018
 */
@Api(tags = "权限管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class PermissionController {

    private final PermissionService permissionService;

    @ApiOperation("渲染权限管理的菜单树")
    @PostMapping("/permissions/menuTree")
    public ResponseVO loadMenuTree() {
        return permissionService.loadMenuTree();
    }

    @ApiOperation("渲染权限管理的菜单树")
    @RequestMapping("/permissions/menuTree/{roleId}")
    public ResponseVO getMenuTree(@PathVariable Integer roleId) {
        return permissionService.getMenuTree(roleId);
    }

    @ApiOperation("查询权限菜单列表")
    @GetMapping("/permissions")
    public ResponseVO getPermissions(PermissionPO params) {
        return permissionService.getPermissions(params);
    }

    @ApiOperation("新增权限菜单")
    @PostMapping("/permissions")
    public ResponseVO insertPermission(@RequestBody PermissionPO params) {
        return permissionService.insertPermission(params);
    }

    @ApiOperation("修改权限菜单")
    @PutMapping("/permissions/{id}")
    public ResponseVO modifyPermissionById(@RequestBody PermissionPO params) {
        return permissionService.modifyPermissionById(params);
    }

    @ApiOperation("删除权限菜单")
    @DeleteMapping("/permissions/{id}")
    public ResponseVO removePermissionById(@PathVariable Integer id){
        return permissionService.removePermissionById(id);
    }

    @ApiOperation("判断是否有子菜单/权限")
    @GetMapping("permissions/child/{id}")
    public ResponseVO checkPermissionChildCount(@PathVariable Integer id){
        return permissionService.checkPermissionChildCount(id);
    }
}
