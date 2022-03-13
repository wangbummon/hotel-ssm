package com.hotel.util;

import com.hotel.pojo.vo.MenuNodeVO;

import java.util.ArrayList;
import java.util.List;

/**
 * @author az
 * @description 获取多级菜单树
 * @date 2022/3/13 0013
 */
public class TreeUtils {

    /**
     * 获取多级菜单
     *
     * @param treeList 所有菜单列表
     * @param pid      父级菜单id
     * @return
     */
    public static List<MenuNodeVO> toTree(List<MenuNodeVO> treeList, Integer pid) {
        List<MenuNodeVO> list = new ArrayList<MenuNodeVO>();
        for (MenuNodeVO parent : treeList) {
            //如果传入的父级菜单id与集合中某个菜单的父级菜单id相等则将此条数据作为父类传入获取子菜单的方法中
            if (pid.equals(parent.getParentId())) {
                list.add(findChildren(parent, treeList));
            }
        }
        if (list.isEmpty()) {
            return new ArrayList<>();
        }
        return list;
    }

    /**
     * 获取子菜单
     *
     * @param parent   父菜单实体类
     * @param treeList 所有菜单
     * @return
     */
    private static MenuNodeVO findChildren(MenuNodeVO parent, List<MenuNodeVO> treeList) {
        for (MenuNodeVO child : treeList) {
            //如果传入的父类id与所有菜单中某条数据的父类id相等则表示这条数据是传入父菜单的子菜单
            if (parent.getId().equals(child.getParentId())) {
                if (parent.getChild() == null) {
                    parent.setChild(new ArrayList<>());
                }
                //自调用查看是否仍存在子节点 若存在则加入该数据的child集合中
                parent.getChild().add(findChildren(child, treeList));
            }
        }
        return parent;
    }
}
