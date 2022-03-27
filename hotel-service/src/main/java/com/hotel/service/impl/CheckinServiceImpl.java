package com.hotel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotel.mapper.*;
import com.hotel.pojo.entity.*;
import com.hotel.pojo.po.CheckinPO;
import com.hotel.pojo.vo.CheckinVO;
import com.hotel.pojo.vo.CountVO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.CheckinService;
import com.hotel.util.CheckUtils;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.MyDateUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/26 0026
 */
@Service
@Transactional
@RequiredArgsConstructor
public class CheckinServiceImpl implements CheckinService {

    private final CheckinMapper checkinMapper;
    private final OrdersMapper ordersMapper;
    private final RoomTypeMapper roomTypeMapper;
    private final UsersMapper usersMapper;
    private final RoomMapper roomMapper;
    private final CheckoutMapper checkoutMapper;

    /**
     * 获取入住列表
     *
     * @param params 入住PO
     * @return
     */
    @Override
    public ResponseVO getCheckinList(CheckinPO params) {
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Checkin> checkinList = checkinMapper.getCheckinList(params);
        PageInfo<Checkin> pageInfo = new PageInfo<>(checkinList);
        return CheckUtils.checkEmpty(pageInfo.getTotal(), pageInfo.getList(), CheckinVO.class);
    }

    /**
     * 登记入住
     *
     * @param params  入住信息PO
     * @param request
     * @return
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public ResponseVO checkinHotel(CheckinPO params, HttpServletRequest request) {
        Checkin checkin = new Checkin();
        MyBeanUtils.copyProperties(params, checkin);

        //设置状态为入住中
        checkin.setStatus(1);
        //创建时间
        checkin.setCreateDate(new Date());
        //创建人
        Integer userId = usersMapper.getUserByUsername(request.getUserPrincipal().getName()).getId();
        checkin.setCreatedUser(userId);

        boolean insert = checkinMapper.insert(checkin);
        if (insert) {
            //入住成功则将订单中的状态改为已入住
            Orders orders = Orders.builder()
                    .id(checkin.getOrdersId())
                    .status(3)
                    .build();
            ordersMapper.updateByPrimaryKey(orders);

            //修改房型中已入住数量+1
            RoomType roomType = roomTypeMapper.selectByPrimaryKey(checkin.getRoomTypeId());
            roomType.setLivedNum(roomType.getLivedNum() + 1);
            roomType.setReservedNum(roomType.getReservedNum() - 1);
            roomTypeMapper.updateByPrimaryKey(roomType);

            //修改房间状态为已入住
            Room room = Room.builder()
                    .id(params.getRoomId())
                    .status(3)
                    .build();
            roomMapper.updateByPrimaryKey(room);
        }
        return CheckUtils.checkSuccess(insert);
    }

    /**
     * 获取总盈利及昨日和七天盈利
     *
     * @return
     */
    @Override
    public CountVO getPriceCount() {
        CountVO countVO = new CountVO();
        CheckinPO checkinPO = new CheckinPO();
        //查询总盈利
        double priceCount = checkinMapper.getPriceCount(checkinPO);
        countVO.setAllCount(String.valueOf(priceCount));

        //获取昨日开始时间
        Date yesterdayBegin = MyDateUtils.getYesterdayBegin();
        checkinPO.setStartDate(yesterdayBegin);
        Date yesterdayEnd = MyDateUtils.getYesterdayEnd();
        checkinPO.setEndDate(yesterdayEnd);
        //查询昨日盈利
        double yesterdayPrice = checkinMapper.getPriceCount(checkinPO);
        double priceYesterday = priceCount - yesterdayPrice;
        countVO.setYesterdayAdd(String.valueOf(priceYesterday));

        //获取七天前开始时间
        Date weekDaysBegin = MyDateUtils.get7daysBegin();
        //获取七天前的结束时间
        Date weekDaysEnd = MyDateUtils.get7daysEnd();
        checkinPO.setStartDate(weekDaysBegin);
        checkinPO.setEndDate(weekDaysEnd);
        //获取七天内盈利
        double weekPriceAdd = checkinMapper.getPriceCount(checkinPO);
        countVO.setWeekAdd(String.valueOf(weekPriceAdd));

        return countVO;
    }

}
