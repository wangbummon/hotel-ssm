<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--获取CSRF Token--%>
    <meta name="_csrf" content="${_csrf.token}"/>
    <%--获取CSRF头，默认为X-CSRF-TOKEN--%>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <title>角色管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/css/layui.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/dtree.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/font/dtreefont.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/zdy.css">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <%--   搜索区域     --%>
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">角色名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roleName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">角色代码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roleCode" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary" lay-submit
                                    lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        <%--头部工具栏--%>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加</button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除</button>
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
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="grantMenu"><i
                    class="layui-icon layui-icon-edit"></i>分配菜单</a>
        </script>

        <%-- 添加窗口 --%>
        <div style="display: none;padding: 5px" id="addWindow">
            <form class="layui-form" style="width:90%;" id="addFrm" lay-filter="addFrm">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px">角色代码ROLE_</label>
                    <div class="layui-input-block">
                        <%--隐藏域--%>
                        <input type="hidden" name="id">
                        <input type="text" name="roleCode" style="width: 500px" lay-verify="required" autocomplete="off"
                               placeholder="请输入角色代码" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px">角色名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="roleName" style="width: 500px" lay-verify="required" autocomplete="off"
                               placeholder="请输入角色名称"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px">角色描述</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" style="width: 500px" name="roleDesc"
                                  id="addContent"></textarea>
                    </div>
                </div>
                <div class="layui-form-item layui-row layui-col-xs12">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doAdd"><span
                                class="layui-icon layui-icon-add-1"></span>提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-warm"><span
                                class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <%--修改窗口--%>
        <div style="display: none;padding: 5px" id="updateWindow">
            <form class="layui-form" style="width:90%;" id="updateFrm" lay-filter="updateFrm" method="">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px">角色代码ROLE_</label>
                    <div class="layui-input-block">
                        <%--隐藏域--%>
                        <input type="hidden" name="id">
                        <input type="text" name="roleCode" style="width: 500px" lay-verify="required" autocomplete="off"
                               placeholder="请输入角色代码" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px">角色名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="roleName" style="width: 500px" lay-verify="required" autocomplete="off"
                               placeholder="请输入角色名称"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px">角色描述</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" style="width: 500px" name="roleDesc"
                                  id="editContent"></textarea>
                    </div>
                </div>
                <div class="layui-form-item layui-row layui-col-xs12">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doEdit"><span
                                class="layui-icon layui-icon-add-1"></span>提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-warm"><span
                                class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <!-- 分配菜单的弹出层 开始 -->
        <div style="display: none;margin: 10px 5px" id="selectRoleMenuDiv">
            <ul id="roleTree" class="dtree" data-id="0" style="width: 350px"></ul>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.extend({
        dtree: "${pageContext.request.contextPath}/static/layui_ext/dtree/dtree",
    }).use(['jquery', 'form', 'table', 'layer', 'dtree'], function () {
        var $ = layui.jquery,
            form = layui.form,
            layer = layui.layer,
            dtree = layui.dtree,
            table = layui.table;

        //获取<meta>中封装的CSRF Token
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        // 将头中的CSRF Token信息发送出去
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/roles',
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
                {field: 'id', width: 120, title: '角色编号', sort: true, align: "center"},
                {field: 'roleCode', width: 350, title: '角色代码', align: "center"},
                {field: 'roleName', width: 350, title: '角色名称', align: "center"},
                {field: 'roleDesc', width: 500, title: '角色描述', align: "center"},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            page: true,
            done: function (res, curr, count) {
                if (curr > 1 && res.data.lenth === 0) {
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

        /**
         * 表格头部工具栏监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddWindow();
                    break;
                case 'delete':
                    deleteByIds(obj)
                    break;
            }
        });


        /**
         * 批量删除角色
         * @param obj
         */
        function deleteByIds(obj) {
            let checkStatus = table.checkStatus('currentTableId');
            let idArr = [],
                ids = "";
            if (checkStatus.data.length > 0) {
                for (let i = 0; i < checkStatus.data.length; i++) {
                    idArr.push(checkStatus.data[i].id);
                    ids = idArr.join(",");
                }
                $.ajax({
                    url: "/admin/role-user",
                    type: "GET",
                    data: {"ids": ids},
                    success: function (result) {
                        if (result.code === 1) {
                            layer.msg(result.msg);
                        } else {
                            layer.confirm("确定要删除所选角色吗？", {
                                icon: 3,
                                title: "提示"
                            }, function (index) {
                                $.ajax({
                                    url: "/admin/roles/" + ids,
                                    type: "DELETE",
                                    data: {"ids": ids},
                                    success: function (result) {
                                        if (result.code === 0) {
                                            layer.msg(result.msg)
                                            //数据刷新
                                            tableIns.reload();
                                            layer.close(index);
                                        } else {
                                            layer.msg(result.msg)
                                        }
                                    }
                                })
                            });
                        }
                    }
                });
            } else {
                layer.msg("请选择要删除的角色");
            }
        }

        //定义变量 保存提交地址和窗口索引
        var url, mainIndex;

        /**
         * 打开添加窗口
         */
        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: "添加角色",
                area: ["740px", "380px"],
                content: $("#addWindow"),
                success: function () {
                    $("#addFrm")[0].reset();
                }
            });
        }

        /**
         * 监听新增提交事件
         */
        form.on('submit(doAdd)', function (data) {
            $.ajax({
                url: "/admin/roles",
                type: "POST",
                data: JSON.stringify(data.field),
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                success: function (result) {
                    if (result.code === 0) {
                        layer.msg(result.msg)
                        //数据刷新
                        tableIns.reload();
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
                case 'grantMenu':
                    grantMenu(obj.data);
                    break;
            }
        });

        /**
         * 打开修改窗口
         */
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: "修改部门信息",
                area: ["800px", "400px"],
                content: $("#updateWindow"),
                success: function () {
                    //表单数据回显
                    form.val("updateFrm", data);
                }
            });
        }

        /**
         * 监听修改提交事件
         */
        form.on('submit(doEdit)', function (data) {
            $.ajax({
                url: "/admin/roles/" + data.id,
                type: "PUT",
                data: JSON.stringify(data.field),
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                success: function (result) {
                    if (result.code === 0) {
                        layer.msg(result.msg)
                        //数据刷新
                        tableIns.reload();
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
         * 删除角色
         * @param data
         */
        function deleteById(data) {
            $.ajax({
                url: "/admin/role-user/" + data.id,
                type: "GET",
                data: {"roleId": data.id},
                success: function (result) {
                    if (result.code === 1) {
                        layer.msg(result.msg);
                    } else {
                        //提示用户是否确定删除
                        layer.confirm("确定要删除角色[<font color='red'>" + data.roleName + "</font>]吗？", {
                            icon: 3,
                            title: "警告"
                        }, function (index) {
                            //发送删除部门的请求
                            $.ajax({
                                url: "/admin/role/" + data.id,
                                type: "DELETE",
                                data: {"id": data.id},
                                success: function (result) {
                                    if (result.code === 0) {
                                        layer.msg(result.msg)
                                        //数据刷新
                                        tableIns.reload();
                                    } else {
                                        layer.msg(result.msg)
                                    }
                                }
                            })
                            layer.close(index);
                        })
                    }
                }
            });
        }

        /**
         * 打开分配权限窗口
         */
        function grantMenu(data) {
            mainIndex = layer.open({
                type: 1,
                title: "分配角色 [<font color='red'>" + data.roleName + "</font>] 的权限",
                area: ["400px", "550px"],
                content: $("#selectRoleMenuDiv"),
                btn: ['<i class="layui-icon layui-icon-ok"> 确定</i>', '<i class="layui-icon layui-icon-close"> </i>取消'],
                yes: function (index, layero) {
                    //获取复选框选中的值
                    let checked = dtree.getCheckbarNodesParam("roleTree");
                    if (checked.length > 0) {
                        layer.confirm("确定要分配这些菜单吗？", {icon: 3, title: "提示"}, function (inedx) {
                            //保存选中值
                            let idArr = [];
                            for (let i = 0; i < checked.length; i++) {
                                idArr.push(checked[i].nodeId);
                            }
                            //将数组转为字符串
                            let ids = idArr.join(",");
                            //发送请求保存选中菜单id
                            $.ajax({
                                url: "/admin/role/permission/" + data.id,
                                type: "POST",
                                data: JSON.stringify({"menuIds": ids, "rid": data.id}),
                                dataType: 'json',
                                contentType: 'application/json;charset=utf-8',
                                success: function (result) {
                                    layer.msg(result.msg)
                                    //数据刷新
                                    tableIns.reload();
                                    //关闭当前窗口
                                    layer.close(mainIndex);
                                }
                            });
                            layer.close(index);
                        });

                    } else {
                        layer.msg("请选择要分配的菜单！");
                    }
                },
                btn2: function (index, layero) {

                },
                success: function () {
                    dtree.render({
                        elem: "#roleTree",
                        url: "/admin/permissions/menuTree/" + data.id,
                        dataStyle: "layuiStyle",
                        dataFormat: "list",
                        response: {message: "msg", statusCode: 0},
                        checkbar: true,
                        checkbarType: "no-all",
                        skin: "zdy",
                        width: 350
                    });
                }
            });
        }


    });
</script>

</body>
</html>