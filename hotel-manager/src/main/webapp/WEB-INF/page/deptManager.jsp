<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--获取CSRF Token--%>
    <meta name="_csrf" content="${_csrf.token}"/>
    <%--获取CSRF头，默认为X-CSRF-TOKEN--%>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <title>部门管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/css/layui.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <%--搜索区域--%>
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">部门名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="deptName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">部门地址</label>
                            <div class="layui-input-inline">
                                <input type="text" name="address" autocomplete="off" class="layui-input">
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
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

        <%-- 添加窗口 --%>
        <div style="display: none;padding: 5px" id="addWindow">
            <form class="layui-form" style="width:90%;" id="addFrm" lay-filter="addFrm">
                <div class="layui-form-item">
                    <label class="layui-form-label">部门名称</label>
                    <div class="layui-input-block">
                        <%--隐藏域--%>
                        <input type="hidden" name="id">
                        <input type="text" name="deptName" lay-verify="required" autocomplete="off"
                               placeholder="请输入部门名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">部门地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" lay-verify="required" autocomplete="off" placeholder="请输入部门地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">部门备注</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="remark" id="addContent"></textarea>
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
                    <label class="layui-form-label">部门名称</label>
                    <div class="layui-input-block">
                        <%--隐藏域--%>
                        <input type="hidden" name="id">
                        <input type="text" name="deptName" lay-verify="required" autocomplete="off"
                               placeholder="请输入部门名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">部门地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" lay-verify="required" autocomplete="off" placeholder="请输入部门地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">部门备注</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="remark" id="updateContent"></textarea>
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

    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['jquery', 'form', 'table', 'layer'], function () {
        var $ = layui.jquery,
            form = layui.form,
            layer = layui.layer,
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
            url: '${pageContext.request.contextPath}/admin/depts',
            request: {
                pageName: 'pageNum',
                limitName: 'pageSize'
            },
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 120, title: '部门编号', sort: true, align: "center"},
                {field: 'deptName', width: 200, title: '部门名称', align: "center"},
                {field: 'address', minWidth: 500, title: '部门地址', align: "center"},
                {field: 'createDate', width: 200, title: '创建时间', align: "center"},
                {field: 'remark', title: '备注', minWidth: 120, align: "center"},
                {title: '操作', width: 150, toolbar: '#currentTableBar', align: "center", align: "center"}
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

        //定义变量 保存提交地址和窗口索引
        var url, mainIndex;

        /**
         * 打开添加窗口
         */
        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: "添加部门",
                area: ["800px", "400px"],
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
                url: "/admin/depts/",
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
         * 批量删除部门
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
                    url: "/admin/dept/user",
                    type: "GET",
                    data: {"ids": ids},
                    success: function (result) {
                        if (result.code === 1) {
                            layer.msg(result.msg);
                        } else {
                            layer.confirm("确定要删除所选部门吗？", {
                                icon: 3,
                                title: "提示"
                            }, function (index) {
                                $.ajax({
                                    url: "/admin/depts/" + ids,
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
                layer.msg("请选择要删除的部门");
            }
        }


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
                url: "/admin/depts/" + data.id,
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
         * 删除部门
         * @param data
         */
        function deleteById(data) {
            $.ajax({
                url: "/admin/dept/user/" + data.id,
                type: "GET",
                data: {"deptId": data.id},
                success: function (result) {
                    if (result.code === 1) {
                        layer.msg(result.msg);
                    } else {
                        //提示用户是否确定删除
                        layer.confirm("确定要删除部门[<font color='red' >" + data.deptName + "</font>]吗？", {
                            icon: 3,
                            title: "提示"
                        }, function (index) {
                            //发送删除部门的请求
                            $.ajax({
                                url: "/admin/dept/" + data.id,
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


    });
</script>

</body>
</html>