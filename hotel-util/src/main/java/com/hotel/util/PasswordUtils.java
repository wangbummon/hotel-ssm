package com.hotel.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author az
 * @description 密码加密工具类
 * @date 2022/3/16 0016
 */
public class PasswordUtils {

    public static String encode(String password) {
        return new BCryptPasswordEncoder().encode(password);
    }
}
