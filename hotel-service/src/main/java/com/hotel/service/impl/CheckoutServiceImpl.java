package com.hotel.service.impl;

import com.hotel.mapper.*;
import com.hotel.pojo.entity.Checkin;
import com.hotel.pojo.entity.Checkout;
import com.hotel.pojo.entity.Room;
import com.hotel.pojo.entity.RoomType;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.CheckoutService;
import com.hotel.util.CheckUtils;
import com.hotel.util.SnowflakeIdUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author az
 * @description
 * @date 2022/3/26 0026
 */
@Service
@Transactional
@RequiredArgsConstructor
public class CheckoutServiceImpl implements CheckoutService {

    private final CheckoutMapper checkoutMapper;
    private final UsersMapper usersMapper;
    private final CheckinMapper checkinMapper;
    private final RoomMapper roomMapper;
    private final RoomTypeMapper roomTypeMapper;


    /**
     * 办理退房
     *
     * @param checkinId 入住信息id
     * @param request
     * @return
     */
    @Override
    public ResponseVO checkoutHotel(Long checkinId, HttpServletRequest request) {
        //查询用户id
        Integer createUser = usersMapper.getUserByUsername(request.getUserPrincipal().getName()).getId();
        //随机生成退房记录编号
        SnowflakeIdUtils idUtils = new SnowflakeIdUtils(3, 9);
        long checkoutNum = idUtils.nextId();

        //向退房表中添加数据
        Checkout checkout = Checkout.builder()
                .checkinId(checkinId)
                .createDate(new Date())
                .createdUser(createUser)
                .checkOutNumber(String.valueOf(checkoutNum))
                .build();
        boolean insert = checkoutMapper.insert(checkout);

        if (insert) {
            //新增成功则将入住信息中的数据状态改为已退房
            Checkin checkin = checkinMapper.selectByPrimaryKey(checkinId);
            checkin.setStatus(2);
            checkinMapper.updateByPrimaryKey(checkin);

            //房型表可入住房间数+1 已入住数-1
            RoomType roomType = roomTypeMapper.selectByPrimaryKey(checkin.getRoomTypeId());
            roomType.setAvilableNum(roomType.getAvilableNum() + 1);
            roomType.setLivedNum(roomType.getLivedNum() - 1);
            roomTypeMapper.updateByPrimaryKey(roomType);

            //修改房间状态为可预订
            Room room = Room.builder()
                    .id(checkin.getRoomId())
                    .status(1)
                    .build();
            roomMapper.updateByPrimaryKey(room);
        }
        return CheckUtils.checkSuccess(insert);
    }
}
