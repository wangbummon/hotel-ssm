package com.hotel.mapper;

import com.hotel.pojo.entity.Checkin;
import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CheckinMapper {
    int deleteByPrimaryKey(@Param("id") Long id, @Param("payPrice") BigDecimal payPrice);

    int insert(Checkin record);

    Checkin selectByPrimaryKey(@Param("id") Long id, @Param("payPrice") BigDecimal payPrice);

    List<Checkin> selectAll();

    int updateByPrimaryKey(Checkin record);
}