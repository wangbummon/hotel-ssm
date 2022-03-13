package com.hotel.mapper;

import com.hotel.pojo.entity.Checkout;
import java.util.List;

public interface CheckoutMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Checkout record);

    Checkout selectByPrimaryKey(Long id);

    List<Checkout> selectAll();

    int updateByPrimaryKey(Checkout record);
}