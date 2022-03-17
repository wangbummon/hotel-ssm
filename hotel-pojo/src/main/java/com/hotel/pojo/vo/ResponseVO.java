package com.hotel.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author az
 * @description 返回VO
 * @date 2022/3/10
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponseVO {

    /**
     * layui状态码 0-成功 其他均为失败
     */
    private Integer code;

    /**
     * 状态码
     */
    private Integer status;

    /**
     * 提示信息
     */
    private String msg;

    /**
     * 数据
     */
    private Object data;

    /**
     * 总条数
     */
    private Long count;


}
