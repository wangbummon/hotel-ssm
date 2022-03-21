package com.hotel.pojo.po;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

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
@JsonIgnoreProperties(ignoreUnknown = true)
public class PermissionPO {

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
     * 菜单类型(菜单为menu，权限为permission)
     */
    @ApiModelProperty("菜单类型 菜单-menu 权限-permission")
    private String type;

    /**
     * 菜单名称
     */
    @ApiModelProperty("菜单名称")
    private String title;

    /**
     * 权限编码
     */
    @ApiModelProperty("权限编码")
    private String permissionCode;

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
     * 页码
     */
    @ApiModelProperty("页码")
    private Integer pageNum;

    /**
     * 每页显示数量
     */
    @ApiModelProperty("每页显示数量")
    private Integer pageSize;
}
