package com.hotel.service;

import com.hotel.pojo.po.RoomPO;
import com.hotel.pojo.vo.ResponseVO;

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
     * @param params 房间PO
     * @return
     */
    ResponseVO modifyRoom(RoomPO params);

    /**
     * 删除房间
     * @param id 房间id
     * @return
     */
    ResponseVO removeRoom(Integer id);

    /**
     * redis获取所有房间
     * @return
     */
    String getAllRooms();
}
