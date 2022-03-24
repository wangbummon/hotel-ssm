package com.hotel.desk.controller;

import com.alibaba.fastjson.JSON;
import com.hotel.service.FloorService;
import com.hotel.service.RoomService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@Api(tags = "首页")
@Controller
@RequiredArgsConstructor
public class IndexController {

    private final FloorService floorService;
    private final RoomService roomService;

    @RequestMapping("/index")
    public String floorList(Model model) {
        //查询所有楼层
        String allFloors = floorService.getAllFloors();
        //查询所有房间
        String allRooms = roomService.getAllRooms();

        model.addAttribute("floorList", JSON.parse(allFloors));
        model.addAttribute("roomList", JSON.parse(allRooms));
        return "forward:index.jsp";
    }
}
