package com.hotel.controller;

import com.hotel.pojo.po.RolePO;
import com.hotel.pojo.po.RolePermissionPO;
import com.hotel.pojo.po.UserRolePO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.RolePermissionService;
import com.hotel.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author az
 * @description
 * @date 2022/3/14 0014
 */
@Api(tags = "角色管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class RoleController {

    private final RoleService roleService;
    private final RolePermissionService rolePermissionService;

    @ApiOperation("查询所有角色")
    @GetMapping("/roles")
    public ResponseVO getRoles(RolePO params) {
        return roleService.getRole(params);
    }

    @ApiOperation("新增角色")
    @PostMapping("/roles")
    public ResponseVO addRole(@RequestBody RolePO params) {
        return roleService.addRole(params);
    }

    @ApiOperation("修改角色")
    @PutMapping("/roles/{id}")
    public ResponseVO modifyRole(@RequestBody RolePO params) {
        return roleService.modifyRole(params);
    }

    @ApiOperation("删除角色")
    @ApiImplicitParam(name = "id", value = "角色id", required = true)
    @DeleteMapping("/role/{id}")
    public ResponseVO removeRole(@PathVariable Integer id) {
        return roleService.removeRole(id);
    }

    @ApiOperation("批量删除角色")
    @DeleteMapping("/roles/{ids}")
    public ResponseVO removevRoles(@PathVariable String ids) {
        return roleService.removeRoles(ids);
    }

    @ApiOperation("查询所选多个角色下是否有用户在使用")
    @GetMapping("/role-user")
    public ResponseVO getRolesUserCount(@RequestParam String ids) {
        return roleService.getRolesUserCount(ids);
    }

    @ApiOperation("查询角色是否有用户在使用")
    @GetMapping("/role-user/{roleId}")
    public ResponseVO getRoleUserCount(@PathVariable Integer roleId) {
        return roleService.getRoleUserCount(roleId);
    }

    @ApiOperation("角色管理-初始化角色数据")
    @GetMapping("/roles/init/{id}")
    public ResponseVO initRoleData(@PathVariable Integer id) {
        return roleService.initRoleData(id);
    }

    @ApiOperation("初始化权限菜单")
    @PostMapping("/roles/menu")
    public ResponseVO initRoleMenu() {
        return roleService.initRoleMenu();
    }

    @ApiOperation("分配角色菜单")
    @PostMapping("role/permission/{rid}")
    public ResponseVO distributionRoleWithMenu(@RequestBody RolePermissionPO params) {
        return rolePermissionService.distributionRoleWithMenu(params);
    }
}
