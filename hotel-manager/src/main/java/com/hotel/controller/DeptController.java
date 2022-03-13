package com.hotel.controller;

import com.hotel.pojo.po.DeptPO;
import com.hotel.pojo.response.RespVO;
import com.hotel.service.DeptService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;

/**
 * @author az
 * @description 部门管理控制器
 * @date 2022/3/13 0013
 */
@Api(tags = "部门管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class DeptController {
    private final DeptService deptService;

    @ApiOperation("查询所有部门")
    @GetMapping("/depts")
    public RespVO selectAllDept(DeptPO params) {
        return deptService.selectAllDept(params);
    }

    @ApiOperation("新增部门")
    @PostMapping("/depts")
    public RespVO insertDept(DeptPO params) {
        return deptService.insertDept(params);
    }

    @ApiOperation("修改部门信息")
    @PutMapping("/depts")
    public RespVO modifyDept(@RequestBody DeptPO params) {
        return deptService.modifyDept(params);
    }

    @ApiOperation("删除部门")
    @DeleteMapping("/depts/{id}")
    public RespVO removeDept(@PathVariable Integer id) {
        return deptService.removeDept(id);
    }

    @ApiOperation("查询部门下用户数量")
    @GetMapping("/dept-user/{deptId}")
    public RespVO getDeptUserCount(@PathVariable Integer deptId){
        return deptService.getDeptUserCount(deptId);
    }
}
