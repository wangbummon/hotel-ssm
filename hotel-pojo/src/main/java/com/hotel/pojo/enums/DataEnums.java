package com.hotel.pojo.enums;

/**
 * @author az
 * @description
 * @date 2022/3/15 0015
 */
public enum DataEnums {

    /**
     * 用户初始密码
     */
    DEFAULT_PASSWORD("123456");

    private String data;

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    DataEnums(String data) {
        this.data = data;
    }
}
