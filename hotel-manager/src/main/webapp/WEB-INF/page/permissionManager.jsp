<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--获取CSRF Token--%>
    <meta name="_csrf" content="${_csrf.token}"/>
    <%--获取CSRF头，默认为X-CSRF-TOKEN--%>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/css/layui.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layuimini.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/themes/default.css" media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/layui/lib/font-awesome-4.7.0/css/font-awesome.min.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/dtree.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/font/dtreefont.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/zdy.css">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-row">
            <%--左侧菜单树--%>
            <div class="layui-col-md2">
                <%-- 树节点开始 --%>
                <ul id="menuTree" class="dtree" data-id="0" style="width: 240px;list-style: none;"></ul>
                <%-- 树节点结束 --%>
            </div>

            <%-- 右侧数据表格 --%>
            <div class="layui-col-md10">
                <%--头部工具栏--%>
                <script type="text/html" id="toolbarDemo">
                    <div class="layui-btn-container">
                        <button class="layui-btn layui-btn-normal data-add-btn" lay-event="add"><i
                                class="layui-icon layui-icon-add-1">添加</i>
                        </button>
                    </div>
                </script>
                <%--表格工具栏--%>
                <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
                <%--行工具栏--%>
                <script type="text/html" id="currentTableBar">
                    <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i
                            class="layui-icon layui-icon-edit"></i>编辑</a>
                    <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i
                            class="layui-icon layui-icon-close"></i>删除</a>
                </script>


                <%-- 添加窗口 --%>
                <div style="display: none;padding: 5px" id="addWindow">
                    <form class="layui-form" style="width:90%;" id="addFrm" lay-filter="addFrm">
                        <%-- 菜单编号 --%>
                        <input type="hidden" name="id">
                        <div class="layui-form-item">
                            <label class="layui-form-label">父级菜单</label>
                            <div class="layui-inline" style="width: 64%">
                                <input type="hidden" name="parentId" id="addParentId">
                                <ul id="addMenuTree" class="dtree" data-id="0"></ul>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-danger" id="addResetMenu"
                                        lay-filter="resetMenu" style="width: 108%"><span
                                        class="layui-icon layui-icon-return">重置菜单</span></button>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="required" autocomplete="off"
                                       placeholder="请输入菜单名称" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" id="addMenuHrefDiv">
                            <label class="layui-form-label">菜单地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="href" autocomplete="off"
                                       placeholder="请输入菜单地址" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单图标</label>
                            <div class="layui-input-block">
                                <input type="hidden" name="icon" id="addIcon">
                                <input type="text" name="iconFa" id="addIconPicker" lay-filter="addIconPicker"
                                       autocomplete="off" placeholder="请输入菜单图标" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">是否展开</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="spread" value="1" title="是">
                                    <input type="radio" name="spread" value="2" title="否" checked>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">菜单类型</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="type" value="menu" title="菜单" checked
                                           lay-filter="checkPermission">
                                    <input type="radio" name="type" value="permission" title="权限"
                                           lay-filter="checkPermission">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item" style="display: none" id="permissionCodeDiv">
                            <label class="layui-form-label">权限编码</label>
                            <div class="layui-input-block">
                                <input type="text" name="permissionCode" autocomplete="off" placeholder="请输入权限编码"
                                       class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item layui-row layui-col-xs12">
                            <div class="layui-input-block" style="text-align: center">
                                <button type="button" class="layui-btn" lay-submit lay-filter="doAdd"><span
                                        class="layui-icon layui-icon-add-1">确定</span></button>
                                <button type="reset" class="layui-btn layui-btn-warm"><span
                                        class="layui-icon layui-icon-refresh-1">清空</span></button>

                            </div>
                        </div>
                    </form>
                </div>

                <%-- 修改窗口 --%>
                <div style="display: none;padding: 5px" id="updateWindow">
                    <form class="layui-form" style="width:90%;" id="updateFrm" lay-filter="updateFrm">
                        <%-- 菜单编号 --%>
                        <input type="hidden" name="id">
                        <div class="layui-form-item">
                            <label class="layui-form-label">父级菜单</label>
                            <div class="layui-inline" style="width: 64%">
                                <input type="hidden" name="parentId" id="editParentId">
                                <ul id="editMenuTree" class="dtree" data-id="0"></ul>
                            </div>
                            <div class="layui-inline">
                                <button type="button" class="layui-btn layui-btn-danger" id="editResetMenu"
                                        lay-filter="resetMenu" style="width: 108%"><span
                                        class="layui-icon layui-icon-return">重置菜单</span></button>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="required" autocomplete="off"
                                       placeholder="请输入菜单名称" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" id="editMenuHrefDiv">
                            <label class="layui-form-label">菜单地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="href" id="editHref" autocomplete="off"
                                       placeholder="请输入菜单地址" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单图标</label>
                            <div class="layui-input-block">
                                <input type="hidden" name="icon" id="editIcon">
                                <input type="text" name="icon" lay-verify="required" id="editIconPicker"
                                       lay-filter="editIconPicker"
                                       autocomplete="off" placeholder="请输入菜单图标" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">是否展开</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="spread" value="1" title="是">
                                    <input type="radio" name="spread" value="2" title="否" checked>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">菜单类型</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="type" value="menu" title="菜单" checked
                                           lay-filter="checkPermission">
                                    <input type="radio" name="type" value="permission" title="权限"
                                           lay-filter="checkPermission">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item" style="display: none" id="permissionCodeDiv">
                            <label class="layui-form-label">权限编码</label>
                            <div class="layui-input-block">
                                <input type="text" name="permissionCode" autocomplete="off" placeholder="请输入权限编码"
                                       class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item layui-row layui-col-xs12">
                            <div class="layui-input-block" style="text-align: center">
                                <button type="button" class="layui-btn" lay-submit lay-filter="doEdit"><span
                                        class="layui-icon layui-icon-add-1">确定</span></button>
                                <button type="reset" class="layui-btn layui-btn-warm"><span
                                        class="layui-icon layui-icon-refresh-1">清空</span></button>

                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="UTF-8"></script>

<script>
    layui.extend({
        dtree: "${pageContext.request.contextPath}/static/layui_ext/dtree/dtree",
        iconPickerFa: "${pageContext.request.contextPath}/static/layui/js/lay-module/iconPicker/iconPickerFa"
    }).use(['layer', 'form', 'table', 'jquery', 'dtree', 'iconPickerFa'], function () {
        let layer = layui.layer;
        let form = layui.form;
        let table = layui.table;
        let $ = layui.jquery;
        let dtree = layui.dtree;
        let iconPickerFa = layui.iconPickerFa;

        //获取<meta>中封装的CSRF Token
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        // 将头中的CSRF Token信息发送出去
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        //渲染左侧树形组件
        let menuTree = dtree.render({
            elem: "#menuTree",
            url: "/admin/permissions/menuTree",
            dataStyle: "layuiStyle",
            dataFormat: "list",
            response: {message: "msg", statusCode: 0},
            // initLevel: 1,
            // icon: "-1",
            skin: "zdy"
        });

        let tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/permissions',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            request: {
                pageName: 'pageNum',
                limitName: 'pageSize'
            },
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 120, title: '菜单编号', sort: true, align: "center"},
                {field: 'title', width: 150, title: '菜单名称', align: "center"},
                {
                    field: 'type', width: 150, title: '权限类型', align: "center", templet: function (data) {
                        return data.type === "menu" ? "<font color='#008b8b'>菜单</font>" : "<font color='#8b0000'>权限</font>";
                    }
                },
                {field: 'permissionCode', width: 150, title: '权限编码', align: "center"},
                {field: 'href', minWidth: 150, title: '菜单地址', align: "center"},
                {
                    field: 'spread', width: 150, title: '是否展开', align: "center", templet: function (data) {
                        if (data.spread === 1) {
                            return '<div> <input type="checkbox" checked="" name="status" lay-skin="switch" id="open" lay-filter="statusSwitch" menuId=' + data.id + '' +
                                ' lay-text="展开|折叠"  value=' + data.status + '></div>';
                        }
                        return '<div> <input type="checkbox" lay-skin="switch" name="status"  menuId=' + data.id + ' lay-filter="statusSwitch"' +
                            'lay-text="展开|折叠" value=' + data.status + '></div>';
                    }
                },
                {
                    field: 'icon', width: 100, title: '菜单图标', align: "center", templet: function (data) {
                        return "<i class='" + data.icon + "'></i>";
                    }
                },
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            page: true,
            done: function (res, curr, count) {
                if (curr > 1 && res.data.length === 0) {
                    tableIns:reload({
                        page: {curr: curr - 1}
                    });
                }
            }
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            tableIns.reload({
                where: data.field,//查询条件
                page: {
                    curr: 1
                }
            });
            var result = JSON.stringify(data.field);

            return false;
        });

        // 状态 开关按钮
        form.on('switch(statusSwitch)', function (data) {
            //开关是否开启 开启后 checked赋值1 否则赋值0
            let checked = data.elem.checked ? 1 : 0;
            //获取所需属性值
            let menuId = data.elem.attributes['menuId'].nodeValue;
            // layer.confirm("确定要执行此操作吗？", {icon: 3, title: "提示"}, function (index) {
            $.ajax({
                url: "/admin/permissions/" + menuId,
                type: "PUT",
                data: JSON.stringify({
                    "id": menuId,
                    "spread": checked
                }),
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                success: function (result) {
                    if (result.code === 0) {
                        layer.msg(result.msg);
                        $('#')
                        checked === 1 ? data.elem.checked = true : data.elem.checked = false;
                        //数据刷新
                        tableIns.reload();
                    }
                    // }
                }
            })
            form.render();
        });

        //树形菜单点击事件
        dtree.on("node('menuTree')", function (obj) {
            tableIns.reload({
                where: {
                    "id": obj.param.nodeId
                }
            })
        });

        //渲染新增下拉菜单树
        var addMenuTree = dtree.renderSelect({
            elem: "#addMenuTree",
            url: "/admin/permissions/menuTree",
            dataStyle: "layuiStyle",
            // select: true,
            dataFormat: "list",
            response: {message: "msg", statusCode: 0},
        });

        //新增窗口下拉菜单树菜单点击事件
        dtree.on("node('addMenuTree')", function (obj) {
            $("#addParentId").val(obj.param.nodeId)
            if ($("#addParentId").val() != null) {
                $("#addMenuHrefDiv").show()
            } else {
                $("#addMenuHrefDiv").hide()
                layer.msg("failed")
            }
        });

        //渲染新增窗口图标选择器组件
        iconPickerFa.render({
            elem: "#addIconPicker",
            url: "/static/layui/lib/font-awesome-4.7.0/less/variables.less",
            search: true,
            page: true,
            limit: 12,
            click: function (data) {
                $("#addIcon").val("fa " + data.icon);
            },
            success: function (data) {
            }
        });


        //渲染修改下拉菜单树
        var editMenuTree = dtree.renderSelect({
            elem: "#editMenuTree",
            url: "/admin/permissions/menuTree",
            // select: true,
            dataStyle: "layuiStyle",
            dataFormat: "list",
            response: {message: "msg", statusCode: 0},
        });
        //修改窗口下拉菜单树点击事件
        dtree.on("node('editMenuTree')", function (obj) {
            $("editParentId").val(obj.param.nodeId)
            if ($("#editMenuHrefDiv").val() != null) {
                $("#editMenuHrefDiv").show()
            } else {
                $("#editMenuHrefDiv").hide()
                layer.msg("failed")
            }
        });

        //渲染修改窗口图标选择器组件
        iconPickerFa.render({
            elem: "#editIconPicker",
            url: "/static/layui/lib/font-awesome-4.7.0/less/variables.less",
            search: true,
            page: true,
            limit: 12,
            click: function (data) {
                $("#addIcon").val("fa " + data.icon);
            },
            success: function (data) {
            }
        });

        //监听菜单类型按钮点击事件
        form.on("radio(checkPermission)", function (data) {
            if (data.value === "permission") {
                $("#permissionCodeDiv").show();
            } else {
                $("#permissionCodeDiv").hide();
            }
        });

        //重置新增的父级菜单
        $("#addResetMenu").click(function () {
            addMenuTree.selectResetVal();
            $("#addMenuHrefDiv").hide()
            form.render();
        })

        //重置修改的父级菜单
        $("#editResetMenu").click(function () {
            editMenuTree.selectResetVal();
            $("#editMenuHrefDiv").hide()
            form.render();
        })

        /**
         * 监听表格头部工具栏
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddWindow();
                    break;
            }
        });

        //定义变量 保存提交地址和窗口索引
        var url, mainIndex;

        /**
         * 打开添加窗口
         */
        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: "添加权限菜单",
                area: ["800px", "500px"],
                content: $("#addWindow"),
                success: function () {
                    $("#addFrm")[0].reset();
                    $("#addMenuHrefDiv").hide();
                    iconPickerFa.checkIcon("addIconPicker", "fa fa-tag");
                    $("#addIcon").val("fa fa-tag");
                }
            });
        }

        /**
         * 监听新增提交事件
         */
        form.on('submit(doAdd)', function (data) {
            $.ajax({
                url: "/admin/permissions/",
                type: "POST",
                data: JSON.stringify(data.field),
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                success: function (result) {
                    if (result.code === 0) {
                        layer.msg(result.msg)
                        //数据刷新
                        tableIns.reload();
                        //刷新左侧菜单树
                        menuTree.reload();
                        //刷新下拉菜单树
                        addMenuTree.reload();
                        //关闭当前窗口
                        layer.close(mainIndex);
                    } else {
                        layer.msg(result.msg)
                    }
                }
            })
            return false;
        });


        /**
         * 表格行监听事件
         */
        table.on('tool(currentTableFilter)', function (obj) {
            switch (obj.event) {
                case 'edit':
                    $("#updateFrm")[0].reset();
                    openUpdateWindow(obj.data);
                    break;
                case 'delete':
                    deleteById(obj.data);
                    break;
            }
        });

        /**
         * 打开修改窗口
         */
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: "修改权限菜单",
                area: ["800px", "500px"],
                content: $("#updateWindow"),
                success: function () {
                    dtree.dataInit("editMenuTree", data.parentId);
                    dtree.selectVal("editMenuTree");
                    if (data.parentId === 0) {
                        editMenuTree.reload();
                    }

                    //表单数据回显
                    form.val("updateFrm", data);

                    //图标回显
                    iconPickerFa.checkIcon("editIconPicker", data.icon);
                    $("#addIcon").val(data.icon);

                    //判断菜单地址是否为空 若为空则不显示
                    if ($("#editParentId").val() != 0) {
                        $("#editMenuHrefDiv").show();
                    } else {
                        $("#editMenuHrefDiv").hide();
                    }
                }
            });
        }

        /**
         * 监听修改提交事件
         */
        form.on('submit(doEdit)', function (data) {
            $.ajax({
                url: "/admin/permissions/" + data.field.id,
                type: "PUT",
                data: JSON.stringify(data.field),
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                success: function (result) {
                    if (result.code === 0) {
                        layer.msg(result.msg)
                        //数据刷新
                        tableIns.reload();
                        //刷新左侧菜单树
                        menuTree.reload();
                        //刷新下拉菜单树
                        editMenuTree.reload();
                        //关闭当前窗口
                        layer.close(mainIndex);
                    } else {
                        layer.msg(result.msg)
                    }
                }
            })
            return false;
        });


        /**
         * 删除权限菜单
         * @param data
         */
        function deleteById(data) {
            $.ajax({
                url: "/admin/permissions/child/" + data.id,
                type: "GET",
                data: {"id": data.id},
                success: function (result) {
                    if (result.code === 1) {
                        layer.msg(result.msg);
                    } else {
                        layer.confirm("确定要删除权限菜单 [<font color='red'>" + data.title + "</font>] 吗？", {
                            icon: 3,
                            title: "提示"
                        }, function (index) {
                            //发送删除用户的请求
                            $.ajax({
                                url: "/admin/permissions/" + data.id,
                                type: "DELETE",
                                data: {"id": data.id},
                                success: function (result) {
                                    if (result.code === 0) {
                                        layer.msg(result.msg);
                                        //数据刷新
                                        tableIns.reload();
                                        //刷新左侧菜单树
                                        menuTree.reload();
                                        //刷新下拉菜单树
                                        addMenuTree.reload();
                                        editMenuTree.reload();
                                    } else {
                                        layer.msg(result.msg)
                                    }
                                }
                            })
                            layer.close(index);
                        });
                    }
                }
            });
        }

    });
</script>
</html>
