package com.hotel.mapper;

import com.hotel.pojo.entity.Orders;
import com.hotel.pojo.po.OrdersPO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersMapper {
    boolean deleteByPrimaryKey(@Param("id") Long id);

    boolean insert(Orders record);

    Orders selectByPrimaryKey(@Param("id") Long id);

    List<Orders> selectAll();

    boolean updateByPrimaryKey(Orders record);

    /**
     * 获取订单列表
     * @param orders 订单实体
     * @return
     */
    List<Orders> getOrdersList(OrdersPO orders);

    /**
     * 批量确认订单
     * @param idList 订单id的list集合
     */
    boolean confirmOrdersByIds(@Param("idList") List idList);
}