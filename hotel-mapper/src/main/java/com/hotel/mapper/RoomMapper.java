package com.hotel.mapper;

import com.hotel.pojo.entity.Room;
import org.apache.ibatis.annotations.Param;

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

    /**
     * 查询房间详情
     *
     * @param id 房间id
     * @return
     */
    Room selectDetailById(@Param("id") Integer id);
}