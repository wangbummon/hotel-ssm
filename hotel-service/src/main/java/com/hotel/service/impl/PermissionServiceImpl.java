package com.hotel.service.impl;

import com.alibaba.fastjson.JSON;
import com.hotel.mapper.PermissionMapper;
import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.po.PermissionPO;
import com.hotel.pojo.vo.MenuNodeVO;
import com.hotel.service.PermissionService;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.TreeUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author az
 * @description
 * @date 2022/3/12 0012
 */
@Service
@Transactional
@RequiredArgsConstructor
public class PermissionServiceImpl implements PermissionService {

    private final PermissionMapper permissionMapper;

    /**
     * 查询所有菜单
     *
     * @param params 菜单PO
     * @return
     */
    @Override
    public String selectAllPermission(PermissionPO params) {
        //保存layui中初始化后台左侧菜单栏信息
        Map<String, Object> map = new LinkedHashMap<>();
        //有序保存homeInfo信息
        Map<String, Object> homeInfo = new LinkedHashMap<>();
        //有序保存logoInfo信息
        Map<String, Object> logoInfo = new LinkedHashMap<>();

        List<Permission> menus = permissionMapper.selectAllPermission(params);
        //筛选出type为menu的集合
        List<Permission> collect = menus.stream().filter(item ->
                        "menu".equals(item.getType()))
                .collect(Collectors.toList());
        List<MenuNodeVO> menuList = new ArrayList<>();

        //将Permission的list集合转换为MenuNodeVO的list集合
        MyBeanUtils.convertList2List(collect, menuList, MenuNodeVO.class);

        //保存homeInfo对象信息
        homeInfo.put("title", "首页");
        homeInfo.put("href", "/admin/desktop");
        //保存logoInfo对象信息
        logoInfo.put("title", "后台管理系统");
        logoInfo.put("image", "/static/images/logo.png");
        logoInfo.put("href", "/index.jsp");
        //保存menuInfo对象信息
        map.put("menuInfo", TreeUtils.toTree(menuList, 0));
        map.put("homeInfo", homeInfo);
        map.put("logoInfo", logoInfo);

        return JSON.toJSONString(map);
    }
}
