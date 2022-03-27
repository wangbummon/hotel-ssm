package com.hotel.service;

import java.util.Map;

/**
 * @author az
 * @description
 * @date 2022/3/27 0027
 */
public interface ChartsService {
    /**
     * 获取本周入住信息
     *
     * @return
     */
    Map<Object, Object> getCheckinByWeek();

    /**
     * 获取所有入住房型数量
     *
     * @return
     */
    Map<Object, Object> getRoomTypeCountByCheckin();
}
