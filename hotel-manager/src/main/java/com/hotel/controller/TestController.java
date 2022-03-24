package com.hotel.controller;

import com.hotel.mapper.RoomMapper;
import com.hotel.pojo.entity.Room;
import com.hotel.pojo.po.RoomPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.RoomService;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.ResponseUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author az
 * @description
 * @date 2022/3/24 0024
 */
@RestController
@RequiredArgsConstructor
public class TestController {
    private final RoomMapper roomMapper;

    @RequestMapping("/test")
    public ResponseVO test() {
        for (int i = 2; i < 11; i++) {
            String num = null;
            if (i >= 10) {
                num = "3" + i;
            } else {
                num = "30" + i;
            }
            Room room = Room.builder()
                    .title("豪华套房" + i)
                    .photo("20220324/5f2e9733585b42f7ad72bf38d36f24b5.jpg")
                    .roomNum(num)
                    .roomTypeId(1)
                    .floorId(1)
                    .status(1)
                    .roomRequirement("物品损坏照价赔偿")
                    .remark("豪华套房" + num)
                    .build();
            boolean insert = roomMapper.insert(room);
            if (!insert) {
                return ResponseUtils.failed();
            }
        }
        return ResponseUtils.success();
    }
}
