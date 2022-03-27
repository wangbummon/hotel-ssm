package com.hotel.pojo.po;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @author az
 * @description 周一到周日开始和结束时间PO
 * @date 2022/3/27 0027
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WeekPO {

    //private String typeName;
    //
    //private Integer checkinCount;

    private List<String> typeNames;

    private List<Integer> weekCounts;

    //@ApiModelProperty("周一开始时间")
    //private Date mondayBegin;
    //
    //@ApiModelProperty("周一结束时间")
    //private Date mondayEnd;
    //
    //@ApiModelProperty("周二开始时间")
    //private Date tuesdayBegin;
    //
    //@ApiModelProperty("周二结束时间")
    //private Date tuesdayEnd;
    //
    //@ApiModelProperty("周三开始时间")
    //private Date wednesdayBegin;
    //
    //@ApiModelProperty("周三结束时间")
    //private Date wednesdayEnd;
    //
    //@ApiModelProperty("周四开始时间")
    //private Date thursdayBegin;
    //
    //@ApiModelProperty("周四结束时间")
    //private Date thursdayEnd;
    //
    //@ApiModelProperty("周五开始时间")
    //private Date fridayBegin;
    //
    //@ApiModelProperty("周五结束时间")
    //private Date fridayEnd;
    //
    //@ApiModelProperty("周六开始时间")
    //private Date saturdayBegin;
    //
    //@ApiModelProperty("周六结束时间")
    //private Date saturdayEnd;
    //
    //@ApiModelProperty("周日开始时间")
    //private Date sundayBegin;
    //
    //@ApiModelProperty("周日结束时间")
    //private Date sundayEnd;
}
