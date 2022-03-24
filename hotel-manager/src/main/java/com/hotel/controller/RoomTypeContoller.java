package com.hotel.controller;

import com.hotel.pojo.po.RoomTypePO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.pojo.vo.RoomTypeVO;
import com.hotel.service.RoomTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
@Api(tags = "房型管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class RoomTypeContoller {

    private final RoomTypeService roomTypeService;

    @ApiOperation("获取房型列表")
    @GetMapping("/roomType")
    public ResponseVO getRoomTypeList(RoomTypePO params) {
        return roomTypeService.getRoomList(params);
    }

    @ApiOperation("新增房型")
    @PostMapping("/roomType")
    public ResponseVO addRoomType(@RequestBody RoomTypePO params) {
        return roomTypeService.addRoomType(params);
    }

    @ApiOperation("修改房型")
    @PutMapping("/roomType/{id}")
    public ResponseVO modifyRoomType(@RequestBody RoomTypePO params) {
        return roomTypeService.modifyRoomType(params);
    }

    @ApiOperation("删除房型")
    @DeleteMapping("/roomType/{id}")
    public ResponseVO removeRoomType(@PathVariable Integer id){
        return roomTypeService.removeRoomType(id);
    }

    @ApiOperation("查询房型下是否有房间")
    @GetMapping("/roomType/room/{id}")
    public ResponseVO checkRoomTypeHasRoom(@PathVariable Integer id){
        return roomTypeService.checkRoomTypeHasRoom(id);
    }

    @ApiOperation("查询所有房型")
    @GetMapping("/roomType/all")
    public String allRoomType(){
        return roomTypeService.allRoomType();
    }
}
