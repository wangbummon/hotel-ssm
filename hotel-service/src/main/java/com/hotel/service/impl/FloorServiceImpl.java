package com.hotel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotel.mapper.FloorMapper;
import com.hotel.pojo.entity.Floor;
import com.hotel.pojo.po.FloorPO;
import com.hotel.pojo.vo.FloorVO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.FloorService;
import com.hotel.util.CheckUtils;
import com.hotel.util.MyBeanUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
@Service
@Transactional
@RequiredArgsConstructor
public class FloorServiceImpl implements FloorService {

    private final FloorMapper floorMapper;


    /**
     * 获取楼层列表
     *
     * @param params 楼层PO
     * @return
     */
    @Override
    public ResponseVO getFloorList(FloorPO params) {
        Floor floor = new Floor();
        MyBeanUtils.copyProperties(params, floor);
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Floor> floorList = floorMapper.selectFloorList(floor);
        return CheckUtils.checkEmpty(floorList, FloorVO.class);
    }

    /**
     * 新增楼层
     *
     * @param params 楼层PO
     * @return
     */
    @Override
    public ResponseVO addFloors(FloorPO params) {
        Floor floor = new Floor();
        MyBeanUtils.copyProperties(params, floor);
        boolean insert = floorMapper.insert(params);
        return CheckUtils.checkSuccess(insert);
    }

    /**
     * 修改楼层信息
     *
     * @param params 楼层PO
     * @return
     */
    @Override
    public ResponseVO modifyFloors(FloorPO params) {
        Floor floor = new Floor();
        MyBeanUtils.copyProperties(params, floor);
        boolean update = floorMapper.updateByPrimaryKey(floor);
        return CheckUtils.checkSuccess(update);
    }

    /**
     * 删除楼层
     * @param id 楼层id
     * @return
     */
    @Override
    public ResponseVO removeFloors(Integer id) {
        boolean remove = floorMapper.deleteByPrimaryKey(id);
        return CheckUtils.checkSuccess(remove);
    }
}
