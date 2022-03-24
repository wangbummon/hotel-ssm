package com.hotel.service;

import com.hotel.pojo.po.RoomTypePO;
import com.hotel.pojo.vo.ResponseVO;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
public interface RoomTypeService {

    /**
     * 获取房型列表
     *
     * @param params 房型PO
     * @return
     */
    ResponseVO getRoomList(RoomTypePO params);

    /**
     * 新增房型
     *
     * @param params 房型PO
     * @return
     */
    ResponseVO addRoomType(RoomTypePO params);

    /**
     * 修改房型
     *
     * @param params 房型PO
     * @return
     */
    ResponseVO modifyRoomType(RoomTypePO params);

    /**
     * 删除房型
     *
     * @param id 房型id
     * @return
     */
    ResponseVO removeRoomType(Integer id);

    /**
     * 查询房型下是否有房间在使用
     *
     * @param id 房型id
     * @return
     */
    ResponseVO checkRoomTypeHasRoom(Integer id);

    /**
     * redis查询所有房型
     *
     * @return
     */
    String allRoomType();
}
