package com.hotel.service;

import com.hotel.pojo.po.DeptPO;
import com.hotel.pojo.response.RespVO;

/**
 * @author az
 * @description
 * @date 2022/3/13 0013
 */
public interface DeptService {
    /**
     * 查询所有部门
     * @return
     * @param params 部门PO类
     */
    RespVO selectAllDept(DeptPO params);

    /**
     * 新增部门
     * @param params 部门PO
     * @return
     */
    RespVO insertDept(DeptPO params);

    /**
     * 根据id修改部门信息
     * @param params
     * @return
     */
    RespVO modifyDept(DeptPO params);

    /**
     * 根据id删除部门
     * @param id
     * @return
     */
    RespVO removeDept(Integer id);

    /**
     * 查询部门下用户数量
     * @param deptId 部门id
     * @return
     */
    RespVO getDeptUserCount(Integer deptId);
}
