package com.hotel.mapper;

import com.hotel.pojo.entity.Room;
import java.util.List;

public interface RoomMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Room record);

    Room selectByPrimaryKey(Integer id);

    List<Room> selectAll();

    int updateByPrimaryKey(Room record);
}