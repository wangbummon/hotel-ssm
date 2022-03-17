package com.hotel.util;

import com.github.pagehelper.PageInfo;
import com.hotel.pojo.vo.ResponseVO;

import java.util.ArrayList;
import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/10 0010
 */
public class CheckUtils {

    /**
     * 检查集合是否为空
     *
     * @param sources   源集合
     * @param listClass 转换类的class
     * @return
     */
    public static <E, T> ResponseVO checkEmpty(List<E> sources, Class<T> listClass) {
        List<T> targetList = new ArrayList<>();
        //将源集合转换为VO集合
        MyBeanUtils.convertList2List(sources, targetList, listClass);
        PageInfo<T> pageInfo = new PageInfo<>(targetList);
        if (targetList.isEmpty() || pageInfo.getTotal() <= 0) {
            return ResponseUtils.empty();
        }
        return ResponseUtils.success(pageInfo);
    }

    /**
     * 检查方法是否执行成功
     *
     * @param result 执行结果
     * @return
     */
    public static ResponseVO checkSuccess(boolean result) {
        if (result) {
            return ResponseUtils.success();
        }
        return ResponseUtils.failed();
    }
}
