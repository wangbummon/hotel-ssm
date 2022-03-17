package com.hotel.controller;

import com.hotel.pojo.po.DeptPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.DeptService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
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

    @ApiOperation("查询部门")
    @GetMapping("/depts")
    public ResponseVO selectAllDept(DeptPO params) {
        return deptService.selectDepts(params);
    }

    @ApiOperation("新增部门")
    @PostMapping("/depts")
    public ResponseVO insertDept(@RequestBody DeptPO params) {
        return deptService.insertDept(params);
    }

    @ApiOperation("修改部门信息")
    @PutMapping("/depts/{id}")
    public ResponseVO modifyDept(@RequestBody DeptPO params) {
        return deptService.modifyDept(params);
    }

    @ApiOperation("删除部门")
    @DeleteMapping("/dept/{id}")
    public ResponseVO removeDept(@PathVariable Integer id) {
        return deptService.removeDept(id);
    }

    @ApiOperation("批量删除部门")
    @DeleteMapping("/depts/{ids}")
    public ResponseVO removeDepts(@PathVariable String ids){
        return deptService.removeDepts(ids);
    }

    @ApiOperation("查询部门下用户数量")
    @GetMapping("/dept-user/{deptId}")
    public ResponseVO getDeptUserCount(@PathVariable Integer deptId) {
        return deptService.getDeptUserCount(deptId);
    }

    @ApiOperation("查询多选部门下是否有用户")
    @GetMapping("/dept-user")
    public ResponseVO getDeptsUserCount(@RequestParam String ids){
        return deptService.getDeptsUserCount(ids);
    }

    @ApiOperation("查询所有部门")
    @GetMapping("/allDepts")
    public String allDepts(){
        return deptService.selectAllDepts();
    }
}
