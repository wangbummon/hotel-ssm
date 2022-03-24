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
    <style>
        .thumbBox {
            height: 200px;
            overflow: hidden;
            border: 1px solid #e6e6e6;
            border-radius: 2px;
            cursor: pointer;
            position: relative;
            text-align: center;
            line-height: 200px;
            width: 210px;
        }

        .thumbImg {
            max-width: 100%;
            max-height: 100%;
            border: none;
        }

        .thumbBox:after {
            position: absolute;
            width: 100%;
            height: 100%;
            line-height: 200px;
            z-index: -1;
            text-align: center;
            font-size: 20px;
            content: "缩略图";
            left: 0;
            top: 0;
            color: #9F9F9F;
        }
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <%-- 搜索条件 --%>
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">房型名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="typeName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">状态</label>
                            <div class="layui-input-inline">
                                <label>
                                    <select name="status" autocomplete="off" class="layui-input">
                                        <option value="">请选择性别</option>
                                        <option value="1">可入住</option>
                                        <option value="2">房型已满</option>
                                    </select>
                                </label>
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

        <%-- 表格工具栏 --%>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i
                        class="layui-icon layui-icon-add-1"></i>添加
                </button>
            </div>
        </script>

        <%-- 数据表格 --%>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <%-- 行工具栏 --%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i
                    class="layui-icon layui-icon-edit"></i>编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i
                    class="layui-icon layui-icon-close"></i>删除</a>
        </script>

        <%-- 添加窗口 --%>
        <div style="display: none;padding: 5px" id="addWindow">
            <form class="layui-form" style="width:90%;" id="addFrm" lay-filter="addFrm">
                <!-- 隐藏域，保存房型id -->
                <input type="hidden" name="id">
                <div class="layui-col-md12 layui-col-xs12">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md9 layui-col-xs7">
                            <div class="layui-form-item magt3" style="margin-top: 8px;">
                                <label class="layui-form-label">房型名称</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="typeName" lay-verify="required"
                                           placeholder="请输入房型名称">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">房型状态</label>
                                <div class="layui-input-block">
                                    <select name="status" id="addStatus" lay-verify="required">
                                        <option value="">请选择房型状态</option>
                                        <option value="1">可入住</option>
                                        <option value="1">房型已满</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">房型备注</label>
                                <div class="layui-input-block">
                                    <textarea class="layui-textarea" name="remark" id="addRemark"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs5">
                            <div class="layui-upload-list thumbBox mag0 magt3" id="addPhotoDiv">
                                <input type="hidden" name="photo" id="addPhoto" value="/static/images/defaultimg.jpg">
                                <img class="layui-upload-img thumbImg"
                                     id="addImg" src="${pageContext.request.contextPath}/static/images/defaultimg.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item magb0">
                        <div class="layui-inline">
                            <label class="layui-form-label">参考价格</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="price" lay-verify="required|number"
                                       placeholder="请输入参考价格">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">可住人数</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="liveNum" lay-verify="required|number"
                                       placeholder="请输入可住人数">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">床位数</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="bedNum" lay-verify="required|number"
                                       placeholder="请输入床位数">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间数</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="roomNum" lay-verify="required|number"
                                       placeholder="请输入房间数">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="text-align: center;">
                            <button type="button" class="layui-btn" lay-submit lay-filter="doAdd" id="doAdd"><span
                                    class="layui-icon layui-icon-add-1"></span>提交
                            </button>
                            <button type="reset" class="layui-btn layui-btn-warm"><span
                                    class="layui-icon layui-icon-refresh-1"></span>重置
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <%-- 修改窗口 --%>
        <div style="display: none;padding: 5px" id="updateWindow">
            <form class="layui-form" style="width:90%;" id="updateFrm" lay-filter="updateFrm">
                <!-- 隐藏域，保存房型id -->
                <input type="hidden" name="id">
                <div class="layui-col-md12 layui-col-xs12">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md9 layui-col-xs7">
                            <div class="layui-form-item magt3" style="margin-top: 8px;">
                                <label class="layui-form-label">房型名称</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="typeName" lay-verify="required"
                                           placeholder="请输入房型名称">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">房型状态</label>
                                <div class="layui-input-block">
                                    <select name="status" id="editStatus" lay-verify="required">
                                        <option value="">请选择房型状态</option>
                                        <option value="1">可入住</option>
                                        <option value="1">房型已满</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">房型备注</label>
                                <div class="layui-input-block">
                                    <textarea class="layui-textarea" name="remark" id="editRemark"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs5">
                            <div class="layui-upload-list thumbBox mag0 magt3" id="editPhotoDiv">
                                <input type="hidden" name="photo" id="editPhoto" value="/statics/images/defaultimg.jpg">
                                <img class="layui-upload-img thumbImg" id="editImg"
                                     src="${pageContext.request.contextPath}/static/images/defaultimg.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item magb0">
                        <div class="layui-inline">
                            <label class="layui-form-label">参考价格</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="price" lay-verify="required|number"
                                       placeholder="请输入参考价格">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">可住人数</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="liveNum" lay-verify="required|number"
                                       placeholder="请输入可住人数">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">床位数</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="bedNum" lay-verify="required|number"
                                       placeholder="请输入床位数">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间数</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="roomNum" lay-verify="required|number"
                                       placeholder="请输入房间数">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="text-align: center;">
                            <button type="button" class="layui-btn" lay-submit lay-filter="doEdit" id="doEdit"><span
                                    class="layui-icon layui-icon-add-1"></span>提交
                            </button>
                            <button type="reset" class="layui-btn layui-btn-warm"><span
                                    class="layui-icon layui-icon-refresh-1"></span>重置
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table', 'laydate', 'jquery', 'layer', 'upload'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            upload = layui.upload,
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
        var tableIns = table.render({
            elem: '#currentTableId',
            url: '/admin/roomType',
            toolbar: '#toolbarDemo',
            request: {
                pageName: "pageNum",
                limitName: "pageSize",
            },
            cols: [[
                {field: 'id', width: 60, title: '编号', align: "center"},
                {field: 'typeName', minWidth: 150, title: '名称', align: "center"},
                {field: 'price', minWidth: 100, title: '价格', align: "center"},
                {field: 'liveNum', minWidth: 100, title: '可住人数', align: "center"},
                {field: 'bedNum', minWidth: 100, title: '床位数', align: "center"},
                {field: 'roomNum', minWidth: 100, title: '房间数', align: "center"},
                {field: 'avilableNum', minWidth: 100, title: '可用房间数', align: "center"},
                {field: 'reservedNum', minWidth: 100, title: '已预订数', align: "center"},
                {field: 'livedNum', minWidth: 100, title: '已入住数', align: "center"},
                {
                    field: 'status', minWidth: 100, title: '状态', align: "center", templet: function (d) {
                        return d.status == 1 ? "<font color='green'>可入住</font>" : "<font color='red'>房型已满</font>";
                    }
                },
                {field: 'remark', minWidth: 100, title: '备注', align: "center"},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
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

        //渲染文件上传组件
        upload.render({
            elem: "#addPhotoDiv",
            url: "/admin/roomTypeImg",
            method: "POST",
            field: "attach",
            done: function (res, index, upload) {
                //设置图片回显路径
                $("#addImg").attr("src", res.data.src);
                $("#addPhotoDiv").css("background", "#fff");
                //给图片隐藏域赋值
                $("#addPhoto").val(res.imagePath);
                layer.msg(res.msg);
            }
        });
        upload.render({
            elem: "#editPhotoDiv",
            url: "/admin/roomTypeImg",
            method: "POST",
            field: "attach",
            done: function (res, index, upload) {
                //设置图片回显路径
                $("#editImg").attr("src", res.data.src);
                $("#editPhotoDiv").css("background", "#fff");
                //给图片隐藏域赋值
                $("#editPhoto").val(res.imagePath);
                layer.msg(res.msg);
            }
        });

        /**
         * 表格头部工具栏监听事件
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
                title: "添加房型",
                area: ["800px", "500px"],
                content: $("#addWindow"),
                success: function () {
                    $("#addFrm")[0].reset();
                    $("#addPhoto").val("images/defaultimg.jpg")
                    $("#addImg").attr("src", "/hotel/show/images/defaultimg.jpg")
                }
            });
        }

        /**
         * 监听新增提交事件
         */
        form.on('submit(doAdd)', function (data) {
            $.ajax({
                url: "/admin/roomType",
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
            }
        });

        /**
         * 打开修改窗口
         */
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: "修改房型信息",
                area: ["800px", "500px"],
                content: $("#updateWindow"),
                success: function () {
                    //表单数据回显
                    form.val("updateFrm", data);
                    //图片回显
                    $("#editImg").attr("src", "/hotel/show/roomType/" + data.photo);
                }
            });
        }

        /**
         * 监听修改提交事件
         */
        form.on('submit(doEdit)', function (data) {
            $.ajax({
                url: "/admin/roomType/" + data.id,
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
         * 删除房型
         * @param data
         */
        function deleteById(data) {
            $.ajax({
                url: "/admin/roomType/room/" + data.id,
                type: "GET",
                data: {"roleId": data.id},
                success: function (result) {
                    if (result.code === 1) {
                        layer.msg(result.msg);
                    } else {
                        //提示用户是否确定删除
                        layer.confirm("确定要删除房型[<font color='red'>" + data.typeName + "</font>]吗？", {
                            icon: 3,
                            title: "警告"
                        }, function (index) {
                            //发送删除房型的请求
                            $.ajax({
                                url: "/admin/roomType/" + data.id,
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
