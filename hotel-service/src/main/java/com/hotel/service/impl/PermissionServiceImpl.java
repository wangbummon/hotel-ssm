package com.hotel.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.hotel.mapper.PermissionMapper;
import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.po.PermissionPO;
import com.hotel.pojo.vo.MenuNodeVO;
import com.hotel.pojo.vo.PermissionVO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.PermissionService;
import com.hotel.util.CheckUtils;
import com.hotel.util.MyBeanUtils;
import com.hotel.pojo.vo.TreeNodeVO;
import com.hotel.util.ResponseUtils;
import com.hotel.util.TreeUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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

    private Permission permission = new Permission();

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

    /**
     * 初始化权限的菜单树
     *
     * @return
     */
    @Override
    public ResponseVO loadMenuTree() {
        //查询所有菜单
        List<Permission> permissionList = permissionMapper.selectAllPermission(null);
        //创建树形节点
        List<TreeNodeVO> treeNodes = new ArrayList<>();
        permissionList.forEach(item -> {
            //获取菜单是否展开
            boolean spread = null == item || 1 == item.getSpread();
            assert item != null;
            treeNodes.add(TreeNodeVO.builder()
                    .id(item.getId())
                    .parentId(item.getParentId())
                    .title(item.getTitle())
                    .spread(spread)
                    .build());
        });
        return ResponseUtils.success(treeNodes);
    }

    /**
     * 查询权限菜单列表
     *
     * @param params 权限PO
     * @return
     */
    @Override
    public ResponseVO getPermissions(PermissionPO params) {
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Permission> permissions = permissionMapper.selectAllPermission(params);
        return CheckUtils.checkEmpty(permissions, PermissionVO.class);
    }

    /**
     * 根据id修改权限菜单信息
     *
     * @param params 权限菜单PO
     * @return
     */
    @Override
    public ResponseVO modifyPermissionById(PermissionPO params) {
        permission = new Permission();
        MyBeanUtils.copyProperties(params, permission);
        boolean modify = permissionMapper.modifyPermissionById(permission);
        return CheckUtils.checkSuccess(modify);
    }

    /**
     * 新增权限菜单
     *
     * @param params 权限菜单PO
     * @return
     */
    @Override
    public ResponseVO insertPermission(PermissionPO params) {
        permission = new Permission();
        MyBeanUtils.copyProperties(params, permission);
        //如果为空则表示用户未选中父级菜单 表示此菜单为父级菜单
        if (permission.getParentId() == null) {
            permission.setParentId(0);
        }
        //如果用户未选择图标，则设置默认图标
        if (permission.getIcon() == null) {
            permission.setIcon("fa fa-tag");
        }
        permission.setTarget("_self");
        boolean insert = permissionMapper.insertPermission(permission);
        return CheckUtils.checkSuccess(insert);
    }

    /**
     * 根据id删除权限菜单
     *
     * @param id 权限菜单id
     * @return
     */
    @Override
    public ResponseVO removePermissionById(Integer id) {
        return CheckUtils.checkSuccess(permissionMapper.removePermissionById(id));
    }

    /**
     * 根据id查询此 菜单/权限 是否有 子菜单/权限
     *
     * @param id 菜单/权限id
     * @return
     */
    @Override
    public ResponseVO checkPermissionChildCount(Integer id) {
        //获取权限/菜单下的子部门数量
        Integer count = permissionMapper.checkPermissionChildCount(id);
        //获取菜单详情
        Permission permission = permissionMapper.selectPermissionById(id);
        //判断是否拥有子菜单或子权限
        if (count > 0) {
            if ("menu".equals(permission.getType())) {
                return ResponseUtils.hasLinked("该菜单下拥有子菜单，无法删除！");
            } else {
                return ResponseUtils.hasLinked("该权限下拥有子权限，无法删除！");
            }
        }
        return ResponseUtils.success(count);
    }
}
