package com.hotel.mapper;

import com.hotel.pojo.entity.RoomType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomTypeMapper {
    /**
     * 根据主键删除房型
     *
     * @param id 房型id
     * @return
     */
    boolean deleteByPrimaryKey(@Param("id") Integer id);

    /**
     * 新增房型
     *
     * @param record 房型实体
     * @return
     */
    boolean insert(RoomType record);

    /**
     * 根据id查询详情
     *
     * @param id 房型id
     * @return
     */
    RoomType selectByPrimaryKey(@Param("id") Integer id);

    /**
     * 查询所有房型
     *
     * @return
     */
    List<RoomType> selectAll();

    /**
     * 根据主键修改房型信息
     *
     * @param record 房型实体
     * @return
     */
    boolean updateByPrimaryKey(RoomType record);

    /**
     * 获取房型列表
     *
     * @param roomType 房型实体
     * @return
     */
    List<RoomType> selectRoomTypeList(RoomType roomType);

    /**
     * 查询房型下是否有房间
     *
     * @param id 房型id
     */
    int checkRoomTypeHasRoom(@Param("id") Integer id);
}