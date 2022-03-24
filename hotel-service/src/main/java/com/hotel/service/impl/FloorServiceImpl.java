package com.hotel.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotel.mapper.FloorMapper;
import com.hotel.pojo.entity.Floor;
import com.hotel.pojo.enums.RedisKeyEnums;
import com.hotel.pojo.po.FloorPO;
import com.hotel.pojo.vo.FloorVO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.FloorService;
import com.hotel.util.CheckUtils;
import com.hotel.util.JedisPoolUtils;
import com.hotel.util.MyBeanUtils;
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
        PageInfo<Floor> pageInfo = new PageInfo<>(floorList);
        return CheckUtils.checkEmpty(pageInfo.getTotal(),pageInfo.getList(), FloorVO.class);
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
        //成功则删除redis中的数据
        if (insert) {
            JedisPoolUtils.getJedis().del(RedisKeyEnums.FLOOR_LIST.getKey());
        }
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
        //成功则删除redis中的数据
        if (update) {
            JedisPoolUtils.getJedis().del(RedisKeyEnums.FLOOR_LIST.getKey());
        }
        return CheckUtils.checkSuccess(update);
    }

    /**
     * 删除楼层
     *
     * @param id 楼层id
     * @return
     */
    @Override
    public ResponseVO removeFloors(Integer id) {
        boolean remove = floorMapper.deleteByPrimaryKey(id);
        //成功则删除redis中的数据
        if (remove) {
            JedisPoolUtils.getJedis().del(RedisKeyEnums.FLOOR_LIST.getKey());
        }
        return CheckUtils.checkSuccess(remove);
    }

    /**
     * 获取所有楼层
     *
     * @return
     */
    @Override
    public String getAllFloors() {
        Jedis jedis = JedisPoolUtils.getJedis();
        //获取楼层列表
        String floorList = jedis.get(RedisKeyEnums.FLOOR_LIST.getKey());
        //若获取到的为空则到数据库查询并存入redis
        if (StringUtils.isEmpty(floorList)) {
            floorList = JSON.toJSONString(floorMapper.selectAll());
            jedis.set(RedisKeyEnums.FLOOR_LIST.getKey(), floorList);
        }
        return floorList;
    }
}
