package com.hotel.service;

import com.hotel.pojo.entity.Room;
import com.hotel.pojo.po.RoomPO;
import com.hotel.pojo.vo.CountVO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.pojo.vo.RoomVO;

import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/24 0024
 */
public interface RoomService {
    /**
     * 查询房间列表
     *
     * @param params 房间PO
     * @return
     */
    ResponseVO getRoomList(RoomPO params);

    /**
     * 新增房间
     *
     * @param params 房间PO
     * @return
     */
    ResponseVO addRoom(RoomPO params);

    /**
     * 修改房间信息
     *
     * @param params 房间PO
     * @return
     */
    ResponseVO modifyRoom(RoomPO params);

    /**
     * 删除房间
     *
     * @param id 房间id
     * @return
     */
    ResponseVO removeRoom(Integer id);

    /**
     * redis获取所有房间
     *
     * @return
     */
    String getAllRooms();

    /**
     * 根据id查询详情
     *
     * @param id 房间id
     * @return
     */
    RoomVO selectDetailById(Integer id);

    /**
     * 前台查询房间列表
     *
     * @param roomPO 房间PO
     * @return
     */
    List<Room> selectRoomList(RoomPO roomPO);

    /**
     * 获取房间数量及房型、楼层数量
     *
     * @return
     */
    CountVO getRoomCount();

}
