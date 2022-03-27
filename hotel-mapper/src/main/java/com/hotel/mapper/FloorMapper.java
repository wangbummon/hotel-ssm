package com.hotel.mapper;

import com.hotel.pojo.entity.Floor;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FloorMapper {
    /**
     * 根据id删除楼层
     *
     * @param id 楼层id
     * @return
     */
    boolean deleteByPrimaryKey(@Param("id") Integer id);

    /**
     * 新增楼层
     *
     * @param record 楼层实体
     * @return
     */
    boolean insert(Floor record);

    /**
     * 根据id查询详情
     *
     * @param id 楼层id
     * @return
     */
    Floor selectByPrimaryKey(@Param("id") Integer id);

    /**
     * 获取所有楼层
     *
     * @return
     */
    List<Floor> selectAll();

    /**
     * 根据id修改楼层信息
     *
     * @param record 楼层实体
     * @return
     */
    boolean updateByPrimaryKey(Floor record);

    /**
     * 查询楼层列表
     *
     * @param floor 楼层实体类
     * @return
     */
    List<Floor> selectFloorList(Floor floor);

    /**
     * 获取楼层数量
     *
     * @return
     */
    @Select("SELECT COUNT(id) FROM t_floor")
    int getFloorCount();
}