package com.hotel.mapper;

import cn.hutool.core.date.DateTime;
import com.hotel.pojo.entity.Checkin;

import java.util.Date;
import java.util.List;

import com.hotel.pojo.po.CheckinPO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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

    /**
     * 查询盈利
     *
     * @param checkinPO 入住信息PO
     * @return
     */
    double getPriceCount(CheckinPO checkinPO);

    /**
     * 查询某个时间段内某个房型的入住数量
     *
     * @param roomTypeId 房型id
     * @param begin      开始时间
     * @param end        结束时间
     * @return
     */
    @Select("SELECT COUNT(id) FROM t_checkin WHERE room_type_id = #{roomTypeId} AND (create_date BETWEEN #{begin} AND #{end})")
    int selectCountByRoomType(@Param("roomTypeId") Integer roomTypeId, @Param("begin") Date begin, @Param("end") Date end);

    /**
     * 根据房型获取房型的入住数量
     *
     * @param roomTypeId 房型id
     * @return
     */
    @Select("SELECT COUNT(id) FROM t_checkin WHERE room_type_id = #{roomTypeId}")
    int getCheckinByRoomType(@Param("roomTypeId") Integer roomTypeId);

    /**
     * 根据房型id查询本年度每月盈利数额
     *
     * @param roomTypeId 房型id
     * @param year       今年的字符串
     * @return
     */
    List<Double> getMonthForYearPriceByRoomType(@Param("roomTypeId") Integer roomTypeId, @Param("year") String year);

    /**
     * 根据房型id获取某天营业额
     *
     * @param id    房型id
     * @param begin 开始 时间
     * @param end   结束时间
     * @return
     */
    Double getRoomTypeWeekPrice(@Param("id") Integer id, @Param("begin") Date begin, @Param("end") DateTime end);
}