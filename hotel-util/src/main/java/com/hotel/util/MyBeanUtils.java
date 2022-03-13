package com.hotel.util;

import org.springframework.beans.BeanUtils;
import org.springframework.util.ObjectUtils;

import java.util.List;
import java.util.Objects;

/**
 * @author az
 * @description
 * @date 2022/3/12 0012
 */
public class MyBeanUtils {

    /**
     * 对象属性转换
     *
     * @param source 源类
     * @param target 目标类
     */
    public static void copyProperties(Object source, Object target) {
        try {
            BeanUtils.copyProperties(source, target);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 集合属性转换
     *
     * @param sourceList  源类集合
     * @param targetList  目标类集合
     * @param targetClass 目标类class对象
     */
    public static <E, T> void convertList2List(List<E> sourceList, List<T> targetList, Class<T> targetClass) {
        if ((!ObjectUtils.isEmpty(sourceList)) && (!Objects.isNull(targetList))) {
            sourceList.forEach(item -> {
                try {
                    T target = targetClass.newInstance();
                    BeanUtils.copyProperties(item, target);
                    targetList.add(target);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
        }
    }

}
