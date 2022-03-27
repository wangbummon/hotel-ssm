package com.hotel.pojo.enums;

import java.util.Objects;

/**
 * @author az
 * @description
 * @date 2022/3/27 0027
 */
public enum WeekEnums {
    /**
     * 周一到周日
     */
    MONDAY("monday", 0),
    TUESDAY("tuesday", 1),
    WEDNESDAY("wednesday", 2),
    THURSDAY("thursday", 3),
    FRIDAY("friday", 4),
    SATURDAY("saturday", 5),
    SUNDAY("sunday", 6);

    private String weekName;
    private Integer weekNum;

    public Integer getWeekNum() {
        return weekNum;
    }

    public void setWeekNum(Integer weekNum) {
        this.weekNum = weekNum;
    }

    public String getWeekName() {
        return weekName;
    }

    public void setWeekName(String weekNum) {
        this.weekName = weekNum;
    }

    WeekEnums(String weekName, Integer weekNum) {
        this.weekName = weekName;
        this.weekNum = weekNum;
    }

    public static String getWeekName(int weekNum) {
        for (WeekEnums week : WeekEnums.values()) {
            if (Objects.equals(week.getWeekNum(), weekNum)) {
                return week.weekName;
            }
        }
        return null;
    }
}
