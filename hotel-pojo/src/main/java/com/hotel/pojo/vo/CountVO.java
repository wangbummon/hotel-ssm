package com.hotel.pojo.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author az
 * @description 首页顶部统计VO类
 * @date 2022/3/27 0027
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CountVO {

    @ApiModelProperty("用户总数")
    private String allCount;

    @ApiModelProperty("昨日增长")
    private String yesterdayAdd;

    @ApiModelProperty("七日内增长")
    private String weekAdd;
}
