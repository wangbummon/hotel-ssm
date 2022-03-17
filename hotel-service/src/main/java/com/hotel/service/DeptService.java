package com.hotel.service;

import com.hotel.pojo.po.DeptPO;
import com.hotel.pojo.vo.ResponseVO;

/**
 * @author az
 * @description
 * @date 2022/3/13 0013
 */
public interface DeptService {
    /**
     * 查询部门
     * @return
     * @param params 部门PO类
     */
    ResponseVO selectDepts(DeptPO params);

    /**
     * 新增部门
     * @param params 部门PO
     * @return
     */
    ResponseVO insertDept(DeptPO params);

    /**
     * 根据id修改部门信息
     * @param params
     * @return
     */
    ResponseVO modifyDept(DeptPO params);

    /**
     * 根据id删除部门
     * @param id
     * @return
     */
    ResponseVO removeDept(Integer id);

    /**
     * 查询部门下用户数量
     * @param deptId 部门id
     * @return
     */
    ResponseVO getDeptUserCount(Integer deptId);

    /**
     * 查询所有部门
     * @return
     */
    String selectAllDepts();

    /**
     * 批量删除部门
     * @param ids 逗号隔开的部门id
     * @return
     */
    ResponseVO removeDepts(String ids);

    /**
     * 查询多个部门中是否某个部门下有用户
     * @param ids 逗号隔开的部门id
     * @return
     */
    ResponseVO getDeptsUserCount(String ids);
}
