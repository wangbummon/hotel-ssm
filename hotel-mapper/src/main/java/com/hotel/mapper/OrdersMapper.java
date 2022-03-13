package com.hotel.mapper;

import com.hotel.pojo.entity.Orders;
import java.util.List;

public interface OrdersMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Orders record);

    Orders selectByPrimaryKey(Long id);

    List<Orders> selectAll();

    int updateByPrimaryKey(Orders record);
}