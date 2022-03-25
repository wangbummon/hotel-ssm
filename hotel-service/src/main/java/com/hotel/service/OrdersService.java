package com.hotel.service;

import com.hotel.pojo.po.OrdersPO;
import com.hotel.pojo.vo.ResponseVO;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
public interface OrdersService {
    /**
     * 预定房间 前台房间详情中的 立即预定
     * @param params 订单PO
     * @param request
     * @return
     */
    ResponseVO reserveRoom(OrdersPO params, HttpServletRequest request);

    /**
     * 获取订单列表
     * @param params 订单PO
     * @return
     */
    ResponseVO getOrdersList(OrdersPO params);

    /**
     * 确认订单
     * @param id 订单id
     * @return
     */
    ResponseVO confirmOrder(Long id);

    /**
     * 批量确认订单
     * @param ids 逗号隔开的订单id字符串
     * @return
     */
    ResponseVO confirmOrdersByIds(String ids);
}
