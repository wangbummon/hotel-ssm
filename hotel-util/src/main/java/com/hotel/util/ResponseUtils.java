package com.hotel.util;

import com.github.pagehelper.PageInfo;
import com.hotel.pojo.enums.ResponseEnums;
import com.hotel.pojo.vo.ResponseVO;

/**
 * @author az
 * @description 全局返回工具类
 * @date 2022/3/10 0010
 */
public class ResponseUtils {

    /**
     * 成功
     *
     * @return
     */
    public static ResponseVO success() {
        return success(ResponseEnums.SUCCESS.getMsg(), null);
    }

    public static ResponseVO success(Object data) {
        return success(ResponseEnums.SUCCESS.getMsg(), data);
    }

    public static ResponseVO success(String msg, Object data) {
        return success(msg, data, null);
    }

    public static ResponseVO success(Long count, Object data) {
        return success(null, data, count);
    }

    public static ResponseVO success(String msg, Object data, Long count) {
        return ResponseVO.builder()
                .code(0)
                .count(count)
                .status(ResponseEnums.SUCCESS.getStatus())
                .msg(msg)
                .data(data)
                .build();
    }

    /**
     * 失败
     *
     * @return
     */
    public static ResponseVO failed() {
        return failed(null);
    }

    public static ResponseVO failed(String msg) {
        return failed(msg, null);
    }

    public static ResponseVO failed(Object data) {
        return failed(ResponseEnums.FAILED.getMsg(), data);
    }

    public static ResponseVO failed(String msg, Object data) {
        return ResponseVO.builder()
                .code(1)
                .status(ResponseEnums.FAILED.getStatus())
                .count(0L)
                .msg(msg)
                .data(data)
                .build();
    }

    /**
     * 数据为空
     *
     * @return
     */
    public static ResponseVO empty() {
        return ResponseVO.builder()
                .code(0)
                .count(0L)
                .status(ResponseEnums.EMPTY.getStatus())
                .msg(ResponseEnums.EMPTY.getMsg())
                .data(null)
                .build();
    }

    /**
     * 有关联数据 一般用在删除里 若删除的数据中有关联数据则会返回此内容
     *
     * @return
     */
    public static ResponseVO hasLinked() {
        return hasLinked(ResponseEnums.HAS_LINKED.getMsg());
    }

    public static ResponseVO hasLinked(String msg) {

        return ResponseVO.builder()
                .code(1)
                .count(0L)
                .status(ResponseEnums.HAS_LINKED.getStatus())
                .msg(msg)
                .data(null)
                .build();
    }

    /**
     * 数据已存在
     *
     * @param msg 提示信息
     * @return
     */
    public static ResponseVO exists(String msg) {
        return ResponseVO.builder()
                .code(1)
                .count(1L)
                .status(ResponseEnums.EXISTS.getStatus())
                .msg(msg)
                .data(null)
                .build();
    }


}
