package com.hotel.mapper;

import com.hotel.pojo.entity.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptMapper {
    /**
     * 根据id删除部门
     * @param id 主键
     * @return
     */
    boolean deleteByPrimaryKey(@Param("id") Integer id);

    /**
     * 新增部门
     * @param dept 部门实体类
     * @return
     */
    boolean insert(Dept dept);

    /**
     * 根据id查询部门详情
     * @param id 主键
     * @return
     */
    Dept selectByPrimaryKey(Integer id);

    /**
     * 查询所有部门
     * @return
     * @param dept 部门实体类
     */
    List<Dept> selectAll(Dept dept);

    /**
     * 根据id修改部门信息
     * @param dept 部门实体类
     * @return
     */
    boolean updateByPrimaryKey(Dept dept);

    /**
     * 批量删除部门
     * @param deptIds 部门id列表
     * @return
     */
    boolean removeDepts(@Param("deptIds") List deptIds);
}