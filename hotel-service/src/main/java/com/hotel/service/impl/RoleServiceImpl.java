package com.hotel.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotel.mapper.PermissionMapper;
import com.hotel.mapper.RoleMapper;
import com.hotel.mapper.UserRoleMapper;
import com.hotel.pojo.entity.Permission;
import com.hotel.pojo.entity.Role;
import com.hotel.pojo.po.RolePO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.pojo.vo.RoleVO;
import com.hotel.pojo.vo.TreeNodeVO;
import com.hotel.service.RoleService;
import com.hotel.util.CheckUtils;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.ResponseUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author az
 * @description
 * @date 2022/3/14 0014
 */
@Service
@Transactional
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {

    private final RoleMapper roleMapper;
    private final UserRoleMapper userRoleMapper;
    private final PermissionMapper permissionMapper;


    /**
     * 查询角色
     *
     * @param params 角色PO
     * @return
     */
    @Override
    public ResponseVO getRole(RolePO params) {
        Role role = new Role();
        MyBeanUtils.copyProperties(params, role);
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Role> roles = roleMapper.selectRole(role);
        PageInfo<Role> pageInfo = new PageInfo<>(roles);
        return CheckUtils.checkEmpty(pageInfo.getTotal(),pageInfo.getList(), RoleVO.class);
    }

    /**
     * 新增角色
     *
     * @param params 角色PO
     * @return
     */
    @Override
    public ResponseVO addRole(RolePO params) {
        Role role = new Role();
        MyBeanUtils.copyProperties(params, role);
        role.setRoleCode(role.getRoleCode().toUpperCase());
        if (!role.getRoleCode().startsWith("ROLE_")) {
            role.setRoleCode("ROLE_" + role.getRoleCode());
        }
        return CheckUtils.checkSuccess(roleMapper.insert(role));
    }

    /**
     * 修改角色
     *
     * @param params 角色PO
     * @return
     */
    @Override
    public ResponseVO modifyRole(RolePO params) {
        Role role = new Role();
        MyBeanUtils.copyProperties(params, role);
        return CheckUtils.checkSuccess(roleMapper.updateByPrimaryKey(role));
    }

    /**
     * 删除角色
     *
     * @param id 角色id
     * @return
     */
    @Override
    public ResponseVO removeRole(Integer id) {
        return CheckUtils.checkSuccess(roleMapper.deleteByPrimaryKey(id));
    }

    /**
     * 查询该角色是否有用户在使用
     *
     * @param roleId 角色id
     * @return
     */
    @Override
    public ResponseVO getRoleUserCount(Integer roleId) {
        int count = userRoleMapper.getRoleUserCount(roleId);
        if (count > 0) {
            return ResponseUtils.hasLinked("该角色已被用户使用，无法删除！");
        }
        return ResponseUtils.success(count);
    }

    /**
     * 初始化角色数据
     *
     * @param id 用户id
     * @return
     */
    @Override
    public ResponseVO initRoleData(Integer id) {
        //查询所有角色的map集合的列表
        List<Map<String, Object>> roleListByMap = roleMapper.getRoleListByMap();
        //根据用户id查询其拥有的角色
        List<Integer> roleIdByUserId = roleMapper.getRoleIdByUserId(id);

        for (Map<String, Object> map : roleListByMap) {
            boolean checked = false;
            Integer rid = (Integer) map.get("id");
            for (Integer roleId : roleIdByUserId) {
                if (roleId.equals(rid)) {
                    checked = true;
                    break;
                }
            }
            map.put("LAY_CHECKED", checked);
        }
        return ResponseUtils.success(roleListByMap);
    }

    /**
     * 查询多选角色下是否有用户在使用
     *
     * @param ids 逗号拼接的角色id
     * @return
     */
    @Override
    public ResponseVO getRolesUserCount(String ids) {
        String[] roleIds = ids.split(",");
        for (String roleId : roleIds) {
            int count = userRoleMapper.getRoleUserCount(Integer.valueOf(roleId));
            if (count > 0) {
                return ResponseUtils.hasLinked("所选角色含已被用户使用的角色，无法删除！");
            }
        }
        return ResponseUtils.success();
    }

    /**
     * 批量删除角色
     *
     * @param ids 逗号拼接的角色id
     * @return
     */
    @Override
    public ResponseVO removeRoles(String ids) {
        List roleIds = Arrays.asList(ids.split(","));
        boolean remove = roleMapper.removeRoles(roleIds);
        return CheckUtils.checkSuccess(remove);
    }

    /**
     * 初始化权限菜单
     *
     * @return
     */
    @Override
    public ResponseVO initRoleMenu() {
        //查询所有菜单
        List<Permission> permissionList = permissionMapper.selectAllPermission(null);
        //创建树形节点
        List<TreeNodeVO> treeNodes = new ArrayList<>();
        permissionList.forEach(item -> {
            //获取菜单是否展开
            boolean spread = null == item || 1 == item.getSpread();
            assert item != null;
            treeNodes.add(new TreeNodeVO(item.getId(), item.getParentId(), item.getTitle(), spread));
        });
        return ResponseUtils.success(treeNodes);
    }
}
