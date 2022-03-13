package com.hotel.mapper;

import com.hotel.pojo.entity.UserRole;
import java.util.List;

public interface UserRoleMapper {

    int insert(UserRole record);

    List<UserRole> selectAll();
}