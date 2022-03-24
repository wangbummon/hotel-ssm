package com.hotel.util;

import java.util.UUID;

/**
 * @author az
 * @description
 * @date 2022/3/23 0023
 */
public class UUIDUtils {

    /**
     * 随机生成UUID
     *
     * @return
     */
    public static String randomUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
