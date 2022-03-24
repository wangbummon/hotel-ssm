package com.hotel.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotel.mapper.RoomTypeMapper;
import com.hotel.pojo.entity.RoomType;
import com.hotel.pojo.enums.RedisKeyEnums;
import com.hotel.pojo.po.RoomTypePO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.pojo.vo.RoomTypeVO;
import com.hotel.service.RoomTypeService;
import com.hotel.util.CheckUtils;
import com.hotel.util.JedisPoolUtils;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.ResponseUtils;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;

import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
@Service
@Transactional
@RequiredArgsConstructor
public class RoomTypeServiceImpl implements RoomTypeService {

    private final RoomTypeMapper roomTypeMapper;

    private final Jedis jedis = JedisPoolUtils.getJedis();

    /**
     * 获取房型列表
     *
     * @param params 房型PO
     * @return
     */
    @Override
    public ResponseVO getRoomList(RoomTypePO params) {
        RoomType roomType = new RoomType();
        MyBeanUtils.copyProperties(params, roomType);
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<RoomType> roomTypeList = roomTypeMapper.selectRoomTypeList(roomType);
        PageInfo<RoomType> pageInfo = new PageInfo<>(roomTypeList);
        return CheckUtils.checkEmpty(pageInfo.getTotal(), pageInfo.getList(), RoomTypeVO.class);
    }

    /**
     * 新增房型
     *
     * @param params 房型PO
     * @return
     */
    @Override
    public ResponseVO addRoomType(RoomTypePO params) {
        RoomType roomType = new RoomType();
        MyBeanUtils.copyProperties(params, roomType);
        //设置已预定数量为0
        roomType.setReservedNum(0);
        //设置已预定数量为0
        roomType.setLivedNum(0);
        //设置可入住房间数量
        roomType.setAvilableNum(roomType.getRoomNum());
        boolean insert = roomTypeMapper.insert(roomType);
        //成功则删除redis中的数据
        if (insert) {
            jedis.del(RedisKeyEnums.ROOM_TYPE_LIST.getKey());
        }
        return CheckUtils.checkSuccess(insert);
    }

    /**
     * 修改房型
     *
     * @param params 房型PO
     * @return
     */
    @Override
    public ResponseVO modifyRoomType(RoomTypePO params) {
        RoomType roomType = new RoomType();
        MyBeanUtils.copyProperties(params, roomType);
        //修改可用房间数量
        roomType.setAvilableNum(roomType.getRoomNum());
        boolean update = roomTypeMapper.updateByPrimaryKey(roomType);
        //成功则删除redis中的数据
        if (update) {
            jedis.del(RedisKeyEnums.ROOM_TYPE_LIST.getKey());
        }
        return CheckUtils.checkSuccess(update);
    }

    /**
     * 删除房型
     *
     * @param id 房型id
     * @return
     */
    @Override
    public ResponseVO removeRoomType(Integer id) {
        boolean delete = roomTypeMapper.deleteByPrimaryKey(id);
        //成功则删除redis中的数据
        if (delete) {
            jedis.del(RedisKeyEnums.ROOM_TYPE_LIST.getKey());
        }
        return CheckUtils.checkSuccess(delete);
    }

    /**
     * 查询房型下是否有房间
     *
     * @param id 房型id
     * @return
     */
    @Override
    public ResponseVO checkRoomTypeHasRoom(Integer id) {
        int count = roomTypeMapper.checkRoomTypeHasRoom(id);
        if (count != 0) {
            return ResponseUtils.hasLinked("该房型下有房间，无法删除！");
        }
        return ResponseUtils.success(count);
    }

    /**
     * 从redis中获取房型列表
     *
     * @return
     */
    @Override
    public String allRoomType() {
        //从redis中获取房型列表
        String roomTypeList = jedis.get(RedisKeyEnums.ROOM_TYPE_LIST.getKey());
        //如果获取到的为空 则到数据库查询并存入redis
        if (StringUtils.isEmpty(roomTypeList)) {
            roomTypeList = JSON.toJSONString(roomTypeMapper.selectAll());
            jedis.set(RedisKeyEnums.ROOM_TYPE_LIST.getKey(), roomTypeList);
        }

        return roomTypeList;
    }
}
