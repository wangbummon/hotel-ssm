package com.hotel.service;

import com.hotel.pojo.po.FloorPO;
import com.hotel.pojo.vo.ResponseVO;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
public interface FloorService {

    /**
     * 获取楼层列表
     * @param params 楼层PO
     * @return
     */
    ResponseVO getFloorList(FloorPO params);

    /**
     * 新增楼层
     * @param params 楼层PO
     * @return
     */
    ResponseVO addFloors(FloorPO params);

    /**
     * 修改楼层信息
     * @param params 楼层PO
     * @return
     */
    ResponseVO modifyFloors(FloorPO params);

    /**
     * 根据id删除楼层
     * @param id 楼层id
     * @return
     */
    ResponseVO removeFloors(Integer id);
}
