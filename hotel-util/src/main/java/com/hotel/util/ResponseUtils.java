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
        ResponseVO responseVO = new ResponseVO();
        responseVO.setCode(0);
        responseVO.setStatus(ResponseEnums.SUCCESS.getStatus());
        responseVO.setMsg(msg);
        responseVO.setData(data);
        responseVO.setCount(count);
        return responseVO;
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
        ResponseVO responseVO = new ResponseVO();
        responseVO.setCode(1);
        responseVO.setStatus(ResponseEnums.FAILED.getStatus());
        responseVO.setMsg(msg);
        responseVO.setData(data);
        return responseVO;
    }

    /**
     * 数据为空
     *
     * @return
     */
    public static ResponseVO empty() {
        ResponseVO responseVO = new ResponseVO();
        responseVO.setCode(0);
        responseVO.setStatus(ResponseEnums.EMPTY.getStatus());
        responseVO.setMsg(ResponseEnums.EMPTY.getMsg());
        responseVO.setData(null);
        responseVO.setCount(0L);
        return responseVO;
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
        ResponseVO responseVO = new ResponseVO();
        responseVO.setCode(1);
        responseVO.setStatus(ResponseEnums.HAS_LINKED.getStatus());
        responseVO.setMsg(msg);
        responseVO.setData(null);
        return responseVO;
    }
}
