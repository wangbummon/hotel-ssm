package com.hotel.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * @author az
 * @description 树节点属性类
 * @date 2022/3/18 0018
 */
@Data
@NoArgsConstructor
public class TreeNodeVO {

    /**
     * 菜单节点id
     */
    private Integer id;

    /**
     * 父节点菜单id
     */
    private Integer parentId;

    /**
     * 菜单节点名称
     */
    private String title;

    /**
     * 菜单节点图标
     */
    private String icon;

    /**
     * 菜单路径
     */
    private String href;

    /**
     * 菜单是否展开
     */
    private Boolean spread;

    /**
     * 子菜单
     */
    private List<TreeNodeVO> children = new ArrayList<>();

    /**
     * 复选框是否被选中 默认为不选中
     */
    private String checkArr = "0";

    /**
     * 构建树节点菜单
     *
     * @param id       节点编号
     * @param parentId 父节点
     * @param title    节点标题
     * @param icon     节点图标
     * @param href     节点菜单路径
     * @param spread   节点展开状态
     */
    public TreeNodeVO(Integer id, Integer parentId, String title, String icon, String href, Boolean spread) {
        this.id = id;
        this.parentId = parentId;
        this.title = title;
        this.icon = icon;
        this.href = href;
        this.spread = spread;
    }

    /**
     * 构建dtree组件
     *
     * @param id       编号
     * @param parentId 父级编号
     * @param title    名称
     * @param spread   展开状态
     */
    public TreeNodeVO(Integer id, Integer parentId, String title, Boolean spread) {
        this.id = id;
        this.parentId = parentId;
        this.title = title;
        this.spread = spread;
    }

    /**
     * 带参构造方法
     *
     * @param id       菜单权限ID
     * @param parentId 菜单权限父ID
     * @param title    菜单权限名称
     * @param spread   是否展开
     * @param checkArr 复选框是否选中
     */
    public TreeNodeVO(Integer id, Integer parentId, String title, Boolean spread, String checkArr) {
        this.id = id;
        this.parentId = parentId;
        this.title = title;
        this.spread = spread;
        this.checkArr = checkArr;
    }

}
