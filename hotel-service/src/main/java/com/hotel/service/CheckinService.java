package com.hotel.service;

import com.hotel.pojo.po.CheckinPO;
import com.hotel.pojo.vo.ResponseVO;

import javax.servlet.http.HttpServletRequest;

/**
 * @author az
 * @description
 * @date 2022/3/26 0026
 */
public interface CheckinService {
    /**
     * 获取入住列表
     *
     * @param params 入住PO
     * @return
     */
    ResponseVO getCheckinList(CheckinPO params);

    /**
     * 登记入住
     *
     * @param params  入住信息PO
     * @param request
     * @return
     */
    ResponseVO checkinHotel(CheckinPO params, HttpServletRequest request);

}
