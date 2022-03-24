package com.hotel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotel.mapper.RoomMapper;
import com.hotel.pojo.entity.Room;
import com.hotel.pojo.po.RoomPO;
import com.hotel.pojo.vo.RoomVO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.RoomService;
import com.hotel.util.CheckUtils;
import com.hotel.util.MyBeanUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/24 0024
 */
@Service
@Transactional
@RequiredArgsConstructor
public class RoomServiceImpl implements RoomService {

    private final RoomMapper roomMapper;

    /**
     * 查询房间列表
     *
     * @param params 房间PO
     * @return
     */
    @Override
    public ResponseVO getRoomList(RoomPO params) {
        Room room = new Room();
        MyBeanUtils.copyProperties(params, room);
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Room> roomList = roomMapper.getRoomList(room);
        PageInfo<Room> pageInfo = new PageInfo<>(roomList);
        return CheckUtils.checkEmpty(pageInfo.getTotal(), pageInfo.getList(), RoomVO.class);
    }

    /**
     * 新增房间
     *
     * @param params 房间PO
     * @return
     */
    @Override
    public ResponseVO addRoom(RoomPO params) {
        Room room = new Room();
        MyBeanUtils.copyProperties(params, room);
        boolean insert = roomMapper.insert(room);
        return CheckUtils.checkSuccess(insert);
    }

    /**
     * 修改房间信息
     *
     * @param params 房间PO
     * @return
     */
    @Override
    public ResponseVO modifyRoom(RoomPO params) {
        Room room = new Room();
        MyBeanUtils.copyProperties(params, room);
        boolean update = roomMapper.updateByPrimaryKey(room);
        return CheckUtils.checkSuccess(update);
    }

    /**
     * 删除房间
     *
     * @param id 房间id
     * @return
     */
    @Override
    public ResponseVO removeRoom(Integer id) {
        boolean delete = roomMapper.deleteByPrimaryKey(id);
        return CheckUtils.checkSuccess(delete);
    }
}
