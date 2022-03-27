package com.hotel.pojo.po;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.hotel.pojo.entity.Account;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @author az
 * @description
 * @date 2022/3/25 0025
 */
@EqualsAndHashCode(callSuper = true)
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccountPO extends Account {

    @ApiModelProperty("搜索-开始时间")
    private Date startTime;

    @ApiModelProperty("搜索-结束时间")
    private Date endTime;
}
