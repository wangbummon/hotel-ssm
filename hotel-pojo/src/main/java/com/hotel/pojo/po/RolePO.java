package com.hotel.pojo.po;

import com.hotel.pojo.entity.Dept;
import com.hotel.pojo.entity.Role;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * @author az
 * @description
 * @date 2022/3/13 0013
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ToString
public class RolePO extends Role {

    /**
     * 页码
     */
    @ApiModelProperty("页码")
    private Integer pageNum;

    /**
     * 每页显示数量
     */
    @ApiModelProperty("每页显示数量")
    private Integer pageSize;
}
