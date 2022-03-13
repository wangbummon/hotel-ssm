package com.hotel.util;

import com.github.pagehelper.PageInfo;
import com.hotel.pojo.response.RespEnums;
import com.hotel.pojo.response.RespVO;

/**
 * @author az
 * @description 全局返回工具类
 * @date 2022/3/10 0010
 */
public class RespUtils {

    /**
     * 成功
     *
     * @return
     */
    public static RespVO success() {
        return success(RespEnums.SUCCESS.getMsg(), null);
    }

    public static RespVO success(Object data) {
        return success(RespEnums.SUCCESS.getMsg(), data);
    }

    public static <T> RespVO success(PageInfo<T> pageInfo) {
        RespVO respVO = new RespVO();
        respVO.setCode(0);
        respVO.setStatus(RespEnums.SUCCESS.getStatus());
        respVO.setMsg(RespEnums.SUCCESS.getMsg());
        respVO.setCount(pageInfo.getTotal());
        respVO.setData(pageInfo.getList());
        return respVO;
    }

    public static RespVO success(String msg, Object data) {
        RespVO respVO = new RespVO();
        respVO.setCode(0);
        respVO.setStatus(RespEnums.SUCCESS.getStatus());
        respVO.setMsg(msg);
        respVO.setData(data);
        return respVO;
    }

    /**
     * 失败
     *
     * @return
     */
    public static RespVO failed() {
        return failed(null);
    }

    public static RespVO failed(Object data) {
        return failed(RespEnums.FAILED.getMsg(), data);
    }

    public static RespVO failed(String msg, Object data) {
        RespVO respVO = new RespVO();
        respVO.setCode(1);
        respVO.setStatus(RespEnums.FAILED.getStatus());
        respVO.setMsg(msg);
        respVO.setData(data);
        return respVO;
    }

    /**
     * 数据为空
     *
     * @return
     */
    public static RespVO empty() {
        RespVO respVO = new RespVO();
        respVO.setCode(0);
        respVO.setStatus(RespEnums.EMPTY.getStatus());
        respVO.setMsg(RespEnums.EMPTY.getMsg());
        respVO.setData(null);
        return respVO;
    }

    /**
     * 有关联数据 一般用在删除里 若删除的数据中有关联数据则会返回此内容
     *
     * @return
     */
    public static RespVO hasLinked() {
        RespVO respVO = new RespVO();
        respVO.setCode(1);
        respVO.setStatus(RespEnums.HAS_LINKED.getStatus());
        respVO.setMsg(RespEnums.HAS_LINKED.getMsg());
        respVO.setData(null);
        return respVO;
    }
}
