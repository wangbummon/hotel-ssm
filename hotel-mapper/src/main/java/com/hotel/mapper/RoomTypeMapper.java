package com.hotel.mapper;

import com.hotel.pojo.entity.RoomType;
import java.util.List;

public interface RoomTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoomType record);

    RoomType selectByPrimaryKey(Integer id);

    List<RoomType> selectAll();

    int updateByPrimaryKey(RoomType record);
}