package com.hotel.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.hotel.mapper.DeptMapper;
import com.hotel.mapper.UsersMapper;
import com.hotel.pojo.entity.Dept;
import com.hotel.pojo.enums.RedisKeyEnums;
import com.hotel.pojo.po.DeptPO;
import com.hotel.pojo.vo.DeptVO;
import com.hotel.pojo.vo.ResponseVO;
import com.hotel.service.DeptService;
import com.hotel.util.*;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/13 0013
 */
@Service
@Transactional
@RequiredArgsConstructor
public class DeptServiceImpl implements DeptService {

    private final DeptMapper deptMapper;
    private final UsersMapper usersMapper;

    private Dept dept = null;

    /**
     * 查询所部门
     *
     * @param params 部门PO
     * @return
     */
    @Override
    public ResponseVO selectDepts(DeptPO params) {
        dept = new Dept();
        MyBeanUtils.copyProperties(params, dept);
        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        List<Dept> depts = deptMapper.selectAll(dept);
        return CheckUtils.checkEmpty(depts, DeptVO.class);
    }

    /**
     * 新增部门
     *
     * @param params 部门PO
     * @return
     */
    @Override
    public ResponseVO insertDept(DeptPO params) {
        dept = new Dept();
        MyBeanUtils.copyProperties(params, dept);
        dept.setCreateDate(new Date());
        boolean insert = deptMapper.insert(dept);
        //添加成功后清除redis中部门缓存
        if (insert) {
            JedisPoolUtils.getJedis().del(RedisKeyEnums.DEPT_LIST.getKey());
        }
        return CheckUtils.checkSuccess(insert);
    }

    /**
     * 根据id修改部门信息
     *
     * @param params 部门PO
     * @return
     */
    @Override
    public ResponseVO modifyDept(DeptPO params) {
        dept = new Dept();
        MyBeanUtils.copyProperties(params, dept);
        boolean update = deptMapper.updateByPrimaryKey(dept);
        if (update) {
            JedisPoolUtils.getJedis().del(RedisKeyEnums.DEPT_LIST.getKey());
        }
        return CheckUtils.checkSuccess(update);
    }

    /**
     * 根据id删除部门
     *
     * @param id 主键
     * @return
     */
    @Override
    public ResponseVO removeDept(Integer id) {
        boolean delete = deptMapper.deleteByPrimaryKey(id);
        if (delete) {
            JedisPoolUtils.getJedis().del(RedisKeyEnums.DEPT_LIST.getKey());
        }
        return CheckUtils.checkSuccess(delete);
    }

    /**
     * 查询部门下用户数量
     *
     * @param deptId 部门id
     * @return
     */
    @Override
    public ResponseVO getDeptUserCount(Integer deptId) {
        int count = usersMapper.selectUserCountByDeptId(deptId);
        if (count > 0) {
            return ResponseUtils.hasLinked("该部门下有关联用户，删除失败！");
        }
        return ResponseUtils.success(count);
    }

    /**
     * 查询所有部门并缓存到redis中
     *
     * @return
     */
    @Override
    public String selectAllDepts() {
        Jedis jedis = JedisPoolUtils.getJedis();
        //获取redis中的数据
        String deptList = jedis.get(RedisKeyEnums.DEPT_LIST.getKey());
        //验证查出数据是否为空 若为空则去数据库查找并存至redis
        if (StringUtils.isEmpty(deptList)) {
            List<Dept> depts = deptMapper.selectAll(null);
            jedis.set(RedisKeyEnums.DEPT_LIST.getKey(), JSON.toJSONString(depts));
            deptList = jedis.get(RedisKeyEnums.DEPT_LIST.getKey());
        }
        return deptList;
    }

    /**
     * 批量删除部门
     *
     * @param ids 逗号隔开的部门id
     * @return
     */
    @Override
    public ResponseVO removeDepts(String ids) {
        List deptIds = Arrays.asList(ids.split(","));
        boolean remove = deptMapper.removeDepts(deptIds);
        return CheckUtils.checkSuccess(remove);
    }

    /**
     * 查询多个部门中是否某个部门下有用户
     *
     * @param ids 逗号隔开的部门id
     * @return
     */
    @Override
    public ResponseVO getDeptsUserCount(String ids) {
        String[] deptIds = ids.split(",");
        for (String deptId : deptIds) {
            int count = usersMapper.selectUserCountByDeptId(Integer.valueOf(deptId));
            if (count > 0) {
                return ResponseUtils.hasLinked("所选的某部门下有用户，操作失败！");
            }
        }
        return ResponseUtils.success();
    }


}
