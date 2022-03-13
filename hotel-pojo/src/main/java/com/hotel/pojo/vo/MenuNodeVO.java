package com.hotel.pojo.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.List;

/**
 * @author az
 * @description
 * @date 2022/3/12 0012
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MenuNodeVO {

    /**
     * 菜单权限编号（id）
     */
    @ApiModelProperty("菜单权限编号（id）")
    private Integer id;

    /**
     * 父级菜单权限编号
     */
    @ApiModelProperty("父级菜单权限编号")
    private Integer parentId;

    /**
     * 菜单名称
     */
    @ApiModelProperty("菜单名称")
    private String title;

    /**
     * 菜单图标
     */
    @ApiModelProperty("菜单图标")
    private String icon;

    /**
     * 菜单地址
     */
    @ApiModelProperty("菜单地址")
    private String href;

    /**
     * 是否展开 1-展开 2-折叠
     */
    @ApiModelProperty("是否展开")
    private Integer spread;

    /**
     * 打开方式
     */
    @ApiModelProperty("打开方式")
    private String target;

    /**
     * 子菜单
     */
    @ApiModelProperty("子菜单")
    private List<MenuNodeVO> child;
}
