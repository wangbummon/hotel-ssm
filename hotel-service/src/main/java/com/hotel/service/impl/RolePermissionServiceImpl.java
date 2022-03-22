package com.hotel.service.impl;

import com.hotel.mapper.RolePermissionMapper;
import com.hotel.pojo.entity.RolePermission;
import com.hotel.pojo.po.RolePermissionPO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.RolePermissionService;
import com.hotel.util.CheckUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/21 0021
 */
@Service
@Transactional
@RequiredArgsConstructor
public class RolePermissionServiceImpl implements RolePermissionService {

    private final RolePermissionMapper rolePermissionMapper;

    @Override
    public ResponseVO distributionRoleWithMenu(RolePermissionPO params) {
        rolePermissionMapper.removePermissionByRid(params.getRid());
        List menuIds = Arrays.asList(params.getMenuIds().split(","));
        boolean insert = rolePermissionMapper.distributionRoleWithMenu(menuIds, params.getRid());
        return CheckUtils.checkSuccess(insert);
    }
}
