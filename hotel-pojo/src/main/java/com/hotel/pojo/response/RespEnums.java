package com.hotel.pojo.response;

import lombok.Data;

/**
 * @author az
 * @description 返回枚举类
 * @date 2022/3/10
 */
public enum RespEnums {

    /**
     * 成功
     */
    SUCCESS(200, "操作成功"),

    /**
     * 失败
     */
    FAILED(501, "操作失败"),

    /**
     * 数据为空
     */
    EMPTY(205, "操作成功，但数据为空"),

    /**
     * 有关联数据 一般用在删除里 若删除的数据中有关联数据则会返回此内容
     */
    HAS_LINKED(10001,"该数据有关联数据，操作失败");

    /**
     *
     */
    private Integer status;

    /**
     * 提示信息
     */
    private String msg;


    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    RespEnums(Integer status, String msg) {
        this.msg = msg;
        this.status = status;
    }
}
