package com.hotel.service.impl;

import com.github.pagehelper.PageHelper;
import com.hotel.mapper.DeptMapper;
import com.hotel.mapper.UsersMapper;
import com.hotel.pojo.entity.Dept;
import com.hotel.pojo.po.DeptPO;
import com.hotel.pojo.vo.DeptVO;
import com.hotel.pojo.response.RespVO;
import com.hotel.service.DeptService;
import com.hotel.util.CheckUtils;
import com.hotel.util.MyBeanUtils;
import com.hotel.util.RespUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
     * 查询所有部门
     *
     * @param params 部门PO
     * @return
     */
    @Override
    public RespVO selectAllDept(DeptPO params) {
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
    public RespVO insertDept(DeptPO params) {
        dept = new Dept();
        MyBeanUtils.copyProperties(params, dept);
        dept.setCreateDate(new Date());
        return CheckUtils.checkSuccess(deptMapper.insert(dept));
    }

    /**
     * 根据id修改部门信息
     *
     * @param params 部门PO
     * @return
     */
    @Override
    public RespVO modifyDept(DeptPO params) {
        dept = new Dept();
        MyBeanUtils.copyProperties(params, dept);

        return CheckUtils.checkSuccess(deptMapper.updateByPrimaryKey(dept));
    }

    /**
     * 根据id删除部门
     *
     * @param id 主键
     * @return
     */
    @Override
    public RespVO removeDept(Integer id) {
        return CheckUtils.checkSuccess(deptMapper.deleteByPrimaryKey(id));
    }

    /**
     * 查询部门下用户数量
     * @param deptId 部门id
     * @return
     */
    @Override
    public RespVO getDeptUserCount(Integer deptId) {
        int count = usersMapper.selectUserByDeptId(deptId);
        if (count > 0){
            return RespUtils.hasLinked();
        }
        return RespUtils.success(count);
    }


}
