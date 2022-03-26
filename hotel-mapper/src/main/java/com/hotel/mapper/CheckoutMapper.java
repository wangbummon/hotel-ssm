package com.hotel.mapper;

import com.hotel.pojo.entity.Checkout;
import java.util.List;

public interface CheckoutMapper {
    boolean deleteByPrimaryKey(Long id);

    boolean insert(Checkout record);

    Checkout selectByPrimaryKey(Long id);

    List<Checkout> selectAll();

    boolean updateByPrimaryKey(Checkout record);
}