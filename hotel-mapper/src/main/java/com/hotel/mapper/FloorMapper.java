package com.hotel.mapper;

import com.hotel.pojo.entity.Floor;
import java.util.List;

public interface FloorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Floor record);

    Floor selectByPrimaryKey(Integer id);

    List<Floor> selectAll();

    int updateByPrimaryKey(Floor record);
}