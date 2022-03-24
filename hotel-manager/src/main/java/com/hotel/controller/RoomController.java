package com.hotel.controller;

import com.hotel.pojo.po.RoomPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.RoomService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author az
 * @description
 * @date 2022/3/24 0024
 */
@Api(tags = "房间管理")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class RoomController {

    private final RoomService roomService;

    @ApiOperation("查询房间列表")
    @GetMapping("/room")
    public ResponseVO getRoomList(RoomPO params) {
        return roomService.getRoomList(params);
    }

    @ApiOperation("新增房间")
    @PostMapping("/room")
    public ResponseVO addRoom(@RequestBody RoomPO params) {
        return roomService.addRoom(params);
    }

    @ApiOperation("修改房间信息")
    @PutMapping("/room/{id}")
    public ResponseVO modifyRoom(@RequestBody RoomPO params) {
        return roomService.modifyRoom(params);
    }

    @ApiOperation("删除房间")
    @DeleteMapping("/room/{id}")
    public ResponseVO removeRoom(@PathVariable Integer id){
        return roomService.removeRoom(id);
    }

}
