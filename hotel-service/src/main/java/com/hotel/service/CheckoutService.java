package com.hotel.service;

import com.hotel.pojo.vo.ResponseVO;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description
 * @date 2022/3/26 0026
 */
public interface CheckoutService {
    /**
     * 办理退房
     *
     * @param checkinId 入住信息id
     * @param request
     * @return
     */
    ResponseVO checkoutHotel(Long checkinId, HttpServletRequest request);
}
