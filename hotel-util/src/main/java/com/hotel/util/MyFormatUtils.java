package com.hotel.util;

import cn.hutool.core.util.NumberUtil;

/**
 * @author az
 * @description 格式化工具类
 * @date 2022/3/27 0027
 */
public class MyFormatUtils {

    /**
     * 获取保留两位小数的百分比
     *
     * @param source 需要转换的数
     * @return
     */
    public static String toPercentage(long source) {
        return NumberUtil.decimalFormat("#.##%", source);
    }
}
