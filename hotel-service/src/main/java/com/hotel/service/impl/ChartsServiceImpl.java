package com.hotel.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.hotel.mapper.ChartsMapper;
import com.hotel.mapper.CheckinMapper;
import com.hotel.mapper.RoomTypeMapper;
import com.hotel.pojo.entity.RoomType;
import com.hotel.service.ChartsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author az
 * @description
 * @date 2022/3/27 0027
 */
@Service
@Transactional
@RequiredArgsConstructor
public class ChartsServiceImpl implements ChartsService {

    private final ChartsMapper chartsMapper;
    private final RoomTypeMapper roomTypeMapper;
    private final CheckinMapper checkinMapper;

    /**
     * 获取本周入住信息
     *
     * @return
     */
    @Override
    public Map<Object, Object> getCheckinByWeek() {
        List<List<Integer>> counts = new ArrayList<>();
        Map<Object, Object> dateMap = new HashMap<>();
        //获取本周第一天开始时间与结束时间
        Date beginOfWeek = DateUtil.beginOfWeek(new Date(), true);
        Date endOfBeginWeek = DateUtil.endOfDay(beginOfWeek);

        //查询所有房型
        List<RoomType> roomTypes = roomTypeMapper.selectAll();
        List<String> typeNames = roomTypes.stream().map(RoomType::getTypeName).collect(Collectors.toList());

        //查询每个房型的入住数量
        roomTypes.forEach(item -> {
            List<Integer> countByType = new ArrayList<>();
            //查询某个房型一周的入住数量
            for (int i = 0; i < 7; i++) {
                Date begin = DateUtil.offsetDay(beginOfWeek, i);
                Date end = DateUtil.offsetDay(endOfBeginWeek, i);
                int count = checkinMapper.selectCountByRoomType(item.getId(), begin, end);
                countByType.add(count);
            }
            counts.add(countByType);
        });

        dateMap.put("typeNames", typeNames);
        dateMap.put("weekCount", counts);
        //查询本周入住信息
        return dateMap;
    }

    /**
     * 获取所有入住房型数量
     *
     * @return
     */
    @Override
    public Map<Object, Object> getRoomTypeCountByCheckin() {
        Map<Object, Object> data = new HashMap<>();
        List<Integer> checkinCounts = new ArrayList<>();
        //查询所有房型
        List<RoomType> roomTypes = roomTypeMapper.selectAll();
        //获取房型名
        List<String> typeNames = roomTypes.stream().map(RoomType::getTypeName).collect(Collectors.toList());
        //获取每种房型入住数量
        for (RoomType roomType : roomTypes) {
            int checkinCount = checkinMapper.getCheckinByRoomType(roomType.getId());
            checkinCounts.add(checkinCount);
        }
        data.put("typeNames", typeNames);
        data.put("checkinCounts", checkinCounts);
        return data;
    }

    /**
     * 获取月度房型盈利占比
     *
     * @return
     */
    @Override
    public Map<Object, Object> getPriceByRoomType() {
        Map<Object, Object> data = new HashMap<>();
        //存放房型金额
        List<List<Double>> prices = new ArrayList<>();

        //获取今年年数
        String yearStr = String.valueOf(DateUtil.year(new Date()));
        //查询所有房型
        List<RoomType> roomTypes = roomTypeMapper.selectAll();
        //获取房型名
        List<String> typeNames = roomTypes.stream().map(RoomType::getTypeName).collect(Collectors.toList());
        data.put("typeNames", typeNames);
        roomTypes.forEach(item -> {
            List<Double> monthForYearPrice = checkinMapper.getMonthForYearPriceByRoomType(item.getId(), yearStr);
            prices.add(monthForYearPrice);
        });
        data.put("checkinPrices", prices);

        return data;
    }

    /**
     * 获取每种房型周盈利
     *
     * @return
     */
    @Override
    public Map<Object, Object> getRoomTypeWeekPrice() {
        Map<Object, Object> data = new HashMap<>();
        List<List<Double>> prices = new ArrayList<>();
        //查询所有房型
        List<RoomType> roomTypes = roomTypeMapper.selectAll();
        //获取房型名
        List<String> typeNames = roomTypes.stream().map(RoomType::getTypeName).collect(Collectors.toList());
        data.put("typeNames", typeNames);
        //获取本周开始与结束时间
        Date beginOfWeek = DateUtil.beginOfWeek(new Date(), true);
        Date endOfWeek = DateUtil.endOfDay(beginOfWeek);
        //循环出一周七天的时间并查询
        for (RoomType roomType : roomTypes) {
            List<Double> weekPrice = new ArrayList<>();
            for (int i = 0; i < 7; i++) {
                Date begin = DateUtil.offsetDay(beginOfWeek, i);
                DateTime end = DateUtil.endOfDay(begin);
                Double roomTypePrice = checkinMapper.getRoomTypeWeekPrice(roomType.getId(), begin, end);
                weekPrice.add(roomTypePrice);
            }
            prices.add(weekPrice);
        }
        data.put("prices", prices);
        return data;
    }
}
