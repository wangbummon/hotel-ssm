package com.hotel.mapper;

import com.hotel.pojo.entity.Room;

import java.util.List;

public interface RoomMapper {
    boolean deleteByPrimaryKey(Integer id);

    boolean insert(Room record);

    Room selectByPrimaryKey(Integer id);

    List<Room> selectAll();

    boolean updateByPrimaryKey(Room record);

    /**
     * 查询房间列表
     *
     * @param room 房间实体
     * @return
     */
    List<Room> getRoomList(Room room);
}