package com.hotel.util;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;

import java.util.Date;

/**
 * @author az
 * @description 时间工具类
 * @date 2022/3/27 0027
 */
public class MyDateUtils {

    /**
     * 获取昨天开始时间
     *
     * @return
     */
    public static Date getYesterdayBegin() {
        DateTime yesterday = DateUtil.yesterday();
        return DateUtil.beginOfDay(yesterday);
    }

    /**
     * 获取昨天结束
     *
     * @return
     */
    public static Date getYesterdayEnd() {
        DateTime yesterday = DateUtil.yesterday();
        return DateUtil.endOfDay(yesterday);
    }

    /**
     * 获取以当前时间为基准 七天前的开始时间
     *
     * @return
     */
    public static Date get7daysBegin() {
        return getOffsetBegin(DateField.DAY_OF_YEAR, -7);
    }

    /**
     * 获取以当前时间为基准 七天前的开始时间
     *
     * @return
     */
    public static Date get7daysEnd() {
        return getOffsetEnd(DateField.DAY_OF_YEAR, -7);
    }

    /**
     * 获取当前日期偏移后的开始时间
     *
     * @param offset    偏移量 正数代表向后偏移 负数代表向日期前偏移
     * @param dateField 偏移单位 如秒、分钟、小时、天、月、年等
     * @return
     */
    public static Date getOffsetBegin(DateField dateField, Integer offset) {
        Date offsetDay = DateUtil.offset(new Date(), dateField, offset);
        return DateUtil.beginOfDay(offsetDay);
    }

    /**
     * 获取当前日期偏移后的结束
     *
     * @param offset    偏移量 正数代表向后偏移 负数代表向日期前偏移
     * @param dateField 偏移单位 如秒、分钟、小时、天、月、年等
     * @return
     */
    public static Date getOffsetEnd(DateField dateField, Integer offset) {
        Date offsetDay = DateUtil.offset(new Date(), dateField, offset);
        return DateUtil.endOfDay(offsetDay);
    }
}
