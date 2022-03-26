package com.hotel.mapper;

import com.hotel.pojo.entity.Checkin;

import java.util.List;

import com.hotel.pojo.po.CheckinPO;
import org.apache.ibatis.annotations.Param;

public interface CheckinMapper {

    boolean insert(Checkin record);

    Checkin selectByPrimaryKey(@Param("id") Long id);

    List<Checkin> selectAll();

    boolean updateByPrimaryKey(Checkin record);

    /**
     * 获取入住列表
     *
     * @param checkinPO 入住实体
     * @return
     */
    List<Checkin> getCheckinList(CheckinPO checkinPO);
}