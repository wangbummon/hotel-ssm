package com.hotel.controller;

import com.hotel.pojo.po.FloorPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.FloorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
@Api(tags = "楼层管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class FloorController {

    private final FloorService floorService;

    @ApiOperation("查询楼层列表")
    @GetMapping("/floors")
    public ResponseVO getFloorList(FloorPO params){
        return floorService.getFloorList(params);
    }

    @ApiOperation("新增楼层")
    @PostMapping("/floors")
    public ResponseVO addFloors(@RequestBody FloorPO params){
        return floorService.addFloors(params);
    }

    @ApiOperation("修改楼层信息")
    @PutMapping("/floors/{id}")
    public ResponseVO modifyFloorById(@RequestBody FloorPO params){
        return floorService.modifyFloors(params);
    }

    @ApiOperation("删除楼层")
    @DeleteMapping("/floors/{id}")
    public ResponseVO removeFloorById(@PathVariable Integer id){
        return floorService.removeFloors(id);
    }

    @ApiOperation("查询所有楼层")
    @GetMapping("/floors/all")
    public String getAllFloors(){
        return floorService.getAllFloors();
    }
}
