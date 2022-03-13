package com.hotel.pojo.po;

import com.hotel.pojo.entity.Dept;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * @author az
 * @description
 * @date 2022/3/13 0013
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ToString
public class DeptPO extends Dept {

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
