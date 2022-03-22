<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 获取CSRF Token -->
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- 获取CSRF头，默认为X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <title>layui</title>
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

        <!-- 搜索条件 -->
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">楼层名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="floorName" autocomplete="off" class="layui-input">
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

        <!-- 表格工具栏 -->
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i
                        class="layui-icon layui-icon-add-1"></i>添加
                </button>
            </div>
        </script>

        <!-- 数据表格 -->
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <!-- 行工具栏 -->
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i
                    class="layui-icon layui-icon-edit"></i>编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i
                    class="layui-icon layui-icon-close"></i>删除</a>
        </script>

        <!-- 添加窗口 -->
        <div style="display: none;padding: 5px" id="addWindow">
            <form class="layui-form" style="width:90%;" id="addFrm" lay-filter="addFrm">
                <div class="layui-form-item">
                    <label class="layui-form-label">楼层名称</label>
                    <div class="layui-input-block">
                        <!-- 楼层编号 -->
                        <input type="text" name="floorName" lay-verify="required" autocomplete="off"
                               placeholder="请输入楼层名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">楼层备注</label>
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

        <!-- 修改窗口 -->
        <div style="display: none;padding: 5px" id="updateWindow">
            <form class="layui-form" style="width:90%;" id="updateFrm" lay-filter="updateFrm">
                <div class="layui-form-item">
                    <label class="layui-form-label">楼层名称</label>
                    <div class="layui-input-block">
                        <!-- 楼层编号 -->
                        <input type="hidden" name="id">
                        <input type="text" name="floorName" lay-verify="required" autocomplete="off"
                               placeholder="请输入楼层名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">楼层备注</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="remark" id="editContent"></textarea>
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
    layui.use(['form', 'table', 'laydate', 'jquery', 'layer'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            table = layui.table;

        //获取<meta>标签中封装的CSRF Token
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        //将头中的CSRF Token信息进行发送
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        //渲染表格组件
        let tableIns = table.render({
            elem: '#currentTableId',
            url: '/admin/floors',
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
                {field: 'id', width: 100, title: '楼层编号', align: "center"},
                {field: 'floorName', width: 180, title: '楼层名称', align: "center"},
                {field: 'remark', minWidth: 200, title: '备注', align: "center"},
                {title: '操作', width: 180, toolbar: '#currentTableBar', align: "center"}
            ]],
            page: true,
            done: function (res, curr, count) {
                //判断当前页码是否是大于1并且当前页的数据量为0
                if (curr > 1 && res.data.length == 0) {
                    var pageValue = curr - 1;
                    //刷新数据表格的数据
                    tableIns.reload({
                        page: {curr: pageValue}
                    });
                }
            }
        });


        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            tableIns.reload({
                where: data.field,
                page: {
                    curr: 1
                }
            });
            return false;
        });

        //监听表格头部工具栏事件
        table.on("toolbar(currentTableFilter)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddWindow(obj.data);
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
                title: "添加楼层",
                area: ["800px", "300px"],
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
                url: "/admin/floors",
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

        //监听表格行工具栏事件
        table.on("tool(currentTableFilter)", function (obj) {
            switch (obj.event) {
                case 'edit':
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
                title: "修改楼层信息",
                area: ["800px", "300px"],
                content: $("#updateWindow"),
                success: function () {
                    //表单数据回显
                    form.val("updateFrm", data);
                    console.log(data)
                }
            });
        }

        /**
         * 监听修改提交事件
         */
        form.on('submit(doEdit)', function (data) {
            console.log(data.field)
            $.ajax({
                url: "/admin/floors/" + data.field.id,
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

    });
</script>

</body>
</html>
