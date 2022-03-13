package com.hotel.controller;

import com.hotel.pojo.po.RolePO;
import com.hotel.pojo.response.RespVO;
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

    @ApiOperation("查询所有角色")
    @GetMapping("/roles")
    public RespVO getRoles(RolePO params){
        return roleService.getRole(params);
    }

    @ApiOperation("新增角色")
    @PostMapping("/roles")
    public RespVO addRole(@RequestBody RolePO params){
        return roleService.addRole(params);
    }

    @ApiOperation("修改角色")
    @PutMapping("/roles")
    public RespVO modifyRole(@RequestBody RolePO params){
        return roleService.modifyRole(params);
    }

    @ApiOperation("删除角色")
    @ApiImplicitParam(name = "id",value = "角色id",required = true)
    @DeleteMapping("/roles/{id}")
    public RespVO removeRole(@PathVariable Integer id){
        return roleService.removeRole(id);
    }

    @ApiOperation("查询角色是否有用户在使用")
    @GetMapping("/role-user/{roleId}")
    public RespVO getRoleUserCount(@PathVariable Integer roleId){
        return roleService.getRoleUserCount(roleId);
    }
}
