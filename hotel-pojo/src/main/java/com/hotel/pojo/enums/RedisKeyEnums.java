package com.hotel.pojo.enums;

/**
 * @author az
 * @description 用于保存redis中的key名
 * @date 2022/3/16 0016
 */
public enum RedisKeyEnums {

    /**
     * redis中保存部门列表的key
     */
    DEPT_LIST("dept_list"),
    /**
     * redis中保存楼层列表的key
     */
    FLOOR_LIST("floor_list"),

    /**
     * redis中保存房型列表的key
     */
    ROOM_TYPE_LIST("room_type_list"),

    /**
     * redis中保存房间列表的key
     */
    ROOM_LIST("room_list");

    private String key;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    RedisKeyEnums(String key) {
        this.key = key;
    }
}
