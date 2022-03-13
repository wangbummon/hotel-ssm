package com.hotel.pojo.po;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * @author az
 * @description 登录参数
 * @date 2022/3/11
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class LoginPO {

    /**
     * 用户名
     */
    @ApiModelProperty("用户名")
    private String username;

    /**
     * 密码
     */
    @ApiModelProperty("密码")
    private String password;

    /**
     * 验证码
     */
    @ApiModelProperty("验证码")
    private String captcha;
}
