package com.hotel.desk.controller;

import com.hotel.pojo.entity.Room;
import com.hotel.pojo.po.RoomPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.pojo.vo.RoomVO;
import com.hotel.service.RoomService;
import com.hotel.util.MyBeanUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@Api(tags = "房间控制器")
@Controller
@RequestMapping("/room")
@RequiredArgsConstructor
public class RoomController {

    private final RoomService roomService;

    @ApiOperation("查看房间详情")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        RoomVO room = roomService.selectDetailById(id);
        model.addAttribute("room", room);
        return "detail";
    }

    @ApiOperation("查看房间列表")
    @RequestMapping("/list")
    public String list(Model model) {
        RoomPO roomPO = new RoomPO();
        //调用查询房间列表的方法
        List<Room> rooms = roomService.selectRoomList(roomPO);
        List<RoomVO> roomList = new ArrayList<>();
        MyBeanUtils.convertList2List(rooms, roomList, RoomVO.class);
        //将房间列表放到模型中
        model.addAttribute("roomList", roomList);
        return "roomList";
    }

    @ApiOperation("根据房型查询")
    @GetMapping("/list/{typeId}")
    public String listByRoomType(@PathVariable Integer typeId, Model model) {
        RoomPO roomPO = new RoomPO();
        //设置房型id
        roomPO.setRoomTypeId(typeId);
        //调用查询房间列表的方法
        List<Room> roomList = roomService.selectRoomList(roomPO);
        //将房间列表放到模型中
        model.addAttribute("roomList", roomList);
        //将房型ID保存到模型中，目的在房间列表页面进行回显
        model.addAttribute("typeId", typeId);
        return "roomList";
    }

    @ApiOperation("根据楼层查询")
    @GetMapping("/{floorId}")
    public String listByFloor(@PathVariable Integer floorId, Model model) {
        RoomPO roomPO = new RoomPO();
        //设置房型id
        roomPO.setFloorId(floorId);
        //调用查询房间列表的方法
        List<Room> roomList = roomService.selectRoomList(roomPO);
        //将房间列表放到模型中
        model.addAttribute("roomList", roomList);
        //将房型ID保存到模型中，目的在房间列表页面进行回显
        model.addAttribute("floorId", floorId);
        return "roomList";
    }
}
