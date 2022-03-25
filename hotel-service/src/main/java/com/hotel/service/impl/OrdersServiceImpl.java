package com.hotel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotel.mapper.AccountMapper;
import com.hotel.mapper.OrdersMapper;
import com.hotel.mapper.RoomMapper;
import com.hotel.mapper.RoomTypeMapper;
import com.hotel.pojo.entity.Account;
import com.hotel.pojo.entity.Orders;
import com.hotel.pojo.entity.Room;
import com.hotel.pojo.entity.RoomType;
import com.hotel.pojo.po.OrdersPO;
import com.hotel.pojo.vo.OrdersVO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.OrdersService;
import com.hotel.util.CheckUtils;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.SnowflakeIdUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@Service
@Transactional
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService {

    private final OrdersMapper ordersMapper;
    private final AccountMapper accountMapper;
    private final RoomMapper roomMapper;
    private final RoomTypeMapper roomTypeMapper;

    /**
     * 预定房间 前台房间详情中的 立即预定
     *
     * @param params  订单PO
     * @param request
     * @return
     */
    @Override
    public ResponseVO reserveRoom(OrdersPO params, HttpServletRequest request) {
        Orders orders = new Orders();
        MyBeanUtils.copyProperties(params, orders);
        //获取当前预定人信息
        String loginName = request.getUserPrincipal().getName();
        Account account = accountMapper.getAccountByName(loginName);
        orders.setAccountId(account.getId());

        //设置订单默认为待确认
        orders.setStatus(1);
        //设置预定时间
        orders.setReserveDate(new Date());
        //生成唯一订单号
        SnowflakeIdUtils idUtils = new SnowflakeIdUtils(2, 5);
        long odersNum = idUtils.nextId();
        orders.setOrdersNum(String.valueOf(odersNum));

        //添加订单信息
        boolean insert = ordersMapper.insert(orders);
        if (insert) {
            //修改房间状态为已预定
            Room room = Room.builder()
                    .id(params.getRoomId())
                    .status(2)
                    .build();
            roomMapper.updateByPrimaryKey(room);
            //获取房型信息
            RoomType roomType = roomTypeMapper.selectByPrimaryKey(params.getRoomTypeId());
            //已预订数量+1
            roomType.setReservedNum(roomType.getReservedNum() + 1);
            //可预订数量-1
            roomType.setAvilableNum(roomType.getAvilableNum() - 1);
            roomTypeMapper.updateByPrimaryKey(roomType);
        }


        return CheckUtils.checkSuccess(insert);
    }

    /**
     * 获取订单列表
     *
     * @param params 订单PO
     * @return
     */
    @Override
    public ResponseVO getOrdersList(OrdersPO params) {
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Orders> orderList = ordersMapper.getOrdersList(params);
        PageInfo<Orders> pageInfo = new PageInfo<>(orderList);
        return CheckUtils.checkEmpty(pageInfo.getTotal(), pageInfo.getList(), OrdersVO.class);
    }

    /**
     * 确认订单
     *
     * @param id 订单id
     * @return
     */
    @Override
    public ResponseVO confirmOrder(Long id) {
        Orders orders = Orders.builder()
                .id(id)
                .status(2)
                .build();
        boolean update = ordersMapper.updateByPrimaryKey(orders);
        return CheckUtils.checkSuccess(update);
    }

    /**
     * 批量确认订单
     * @param ids 逗号隔开的订单id字符串
     * @return
     */
    @Override
    public ResponseVO confirmOrdersByIds(String ids) {
        List idList = Arrays.asList(ids.split(","));
        ordersMapper.confirmOrdersByIds(idList);
        return null;
    }
}
