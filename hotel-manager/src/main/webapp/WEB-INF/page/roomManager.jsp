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
            height: 255px;
            overflow: hidden;
            border: 1px solid #e6e6e6;
            border-radius: 2px;
            cursor: pointer;
            position: relative;
            text-align: center;
            line-height: 200px;
            width: 380px;
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
                            <label class="layui-form-label">房间名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间编号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roomNum" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间类型</label>
                            <div class="layui-input-inline">
                                <select name="roomTypeId" id="s_roomTypeId" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">所属楼层</label>
                            <div class="layui-input-inline">
                                <select name="floorId" id="s_floorId" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间状态</label>
                            <div class="layui-input-inline">
                                <select name="status" id="s_status" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                    <option value="1">可预订</option>
                                    <option value="2">已预订</option>
                                    <option value="3">入住中</option>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="text-align: center">
                                <button type="submit" class="layui-btn layui-btn-primary" lay-submit
                                        lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                                </button>
                            </div>
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
                                <label class="layui-form-label">房间名称</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="title" lay-verify="required"
                                           placeholder="请输入房间名称">
                                </div>
                            </div>
                            <div class="layui-form-item magt3" style="margin-top: 8px;">
                                <label class="layui-form-label">房间编号</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="roomNum" lay-verify="required"
                                           placeholder="请输入房间编号">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">房间类型</label>
                                <div class="layui-input-block">
                                    <select name="roomTypeId" id="addRoomTypeId" lay-verify="required">
                                        <option value="">请选择房型</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">房间备注</label>
                                <div class="layui-input-block">
                                    <textarea class="layui-textarea" name="remark" id="addRemark"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs5">
                            <div class="layui-upload-list thumbBox mag0 magt3" id="addPhotoDiv">
                                <input type="hidden" name="photo" id="addPhoto" value="/statics/images/defaultimg.jpg">
                                <img class="layui-upload-img thumbImg" id="addImg"
                                     src="${pageContext.request.contextPath}/static/images/defaultimg.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item magb0">
                        <div class="layui-inline">
                            <label class="layui-form-label">所属楼层</label>
                            <div class="layui-input-inline">
                                <select name="floorId" id="addFloorId" lay-verify="required">
                                    <option value="">请选择楼层</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间状态</label>
                            <div class="layui-input-inline">
                                <select name="status" id="addStatus" lay-verify="required">
                                    <option value="">请选择房间状态</option>
                                    <option value="1">可预订</option>
                                    <option value="2">已预订</option>
                                    <option value="3">入住中</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">房间要求</label>
                        <div class="layui-input-block">
                            <textarea id="addRoomRequirement" name="roomRequirement" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">房间描述</label>
                        <div class="layui-input-block">
                            <textarea id="addRoomDesc" name="roomDesc" class="layui-textarea"></textarea>
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
                                <label class="layui-form-label">房间名称</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="title" lay-verify="required"
                                           placeholder="请输入房间名称">
                                </div>
                            </div>
                            <div class="layui-form-item magt3" style="margin-top: 8px;">
                                <label class="layui-form-label">房间编号</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="roomNum" lay-verify="required"
                                           placeholder="请输入房间编号">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">房间类型</label>
                                <div class="layui-input-block">
                                    <select name="roomTypeId" id="editRoomTypeId" lay-verify="required">
                                        <option value="">请选择房型</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">房间备注</label>
                                <div class="layui-input-block">
                                    <textarea class="layui-textarea" name="remark" id="editRemark"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs5">
                            <div class="layui-upload-list thumbBox mag0 magt3" id="editPhotoDiv">
                                <input type="hidden" name="photo" id="editPhoto" value="/static/images/defaultimg.jpg">
                                <img class="layui-upload-img thumbImg" id="editImg"
                                     src="${pageContext.request.contextPath}/static/images/defaultimg.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item magb0">
                        <div class="layui-inline">
                            <label class="layui-form-label">所属楼层</label>
                            <div class="layui-input-inline">
                                <select name="floorId" id="editFloorId" lay-verify="required">
                                    <option value="">请选择楼层</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间状态</label>
                            <div class="layui-input-inline">
                                <select name="status" id="editStatus" lay-verify="required">
                                    <option value="">请选择房间状态</option>
                                    <option value="1">可预订</option>
                                    <option value="2">已预订</option>
                                    <option value="3">入住中</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">房间要求</label>
                        <div class="layui-input-block">
                            <textarea id="editRoomRequirement" name="roomRequirement" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">房间描述</label>
                        <div class="layui-input-block">
                            <textarea id="editRoomDesc" name="roomDesc" class="layui-textarea"></textarea>
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
    layui.use(['form', 'table', 'laydate', 'jquery', 'layer', 'upload', 'layedit'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            upload = layui.upload,
            layedit = layui.layedit,
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
            url: '/admin/room',
            toolbar: '#toolbarDemo',
            request: {
                pageName: "pageNum",
                limitName: "pageSize",
            },
            cols: [[
                {field: 'id', width: 60, title: '编号', align: "center"},
                {field: 'title', minWidth: 150, title: '房间标题', align: "center"},
                {field: 'roomNum', minWidth: 120, title: '房间编号', align: "center"},
                {
                    field: 'roomType', minWidth: 100, title: '房间类型', align: "center", templet: function (data) {
                        return data.roomType.typeName;
                    }
                },
                {
                    field: 'floor', minWidth: 100, title: '所属楼层', align: "center", templet: function (data) {
                        return data.floor.floorName;
                    }
                },
                {
                    field: 'status', minWidth: 100, title: '房间状态', align: "center", templet: function (data) {
                        if (data.status === 1) {
                            return "<font color='green'>可预订</font>";
                        } else if (data.status === 2) {
                            return "<font color='orange'>已预订</font>";
                        } else {
                            return "<font color='red'>入住中</font>";
                        }
                    }
                },
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
            url: "/admin/roomImg",
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
            url: "/admin/roomImg",
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

        //发送请求查询房型列表 渲染搜索框中的房型列表
        $.ajax({
            url: "/admin/roomType/all",
            type: "GET",
            data: {},
            success: function (result) {
                let html = "",
                    data = JSON.parse(result);
                for (let i = 0; i < data.length; i++) {
                    html += "<option value='" + data[i].id + "'>" + data[i].typeName + "</option>";
                }
                //将数据渲染至下拉代码中
                $("[name='roomTypeId']").append(html);
                //重新渲染下拉列表
                form.render("select");
            }
        });

        //发送请求查询楼层列表 渲染搜索框中的楼层列表
        $.ajax({
            url: "/admin/floors/all",
            type: "GET",
            data: {},
            success: function (result) {
                let html = "",
                    data = JSON.parse(result);
                for (let i = 0; i < data.length; i++) {
                    html += "<option value='" + data[i].id + "'>" + data[i].floorName + "</option>";
                }
                //将数据渲染至下拉代码中
                $("[name='floorId']").append(html);
                //重新渲染下拉列表
                form.render("select");
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
        var url, mainIndex, detailIndex;

        /**
         * 打开添加窗口
         */
        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: "添加房间",
                area: ["800px", "650px"],
                maxmin: true,
                content: $("#addWindow"),
                success: function () {
                    $("#addFrm")[0].reset();
                    $("#addPhoto").val("images/defaultimg.jpg")
                    $("#addImg").attr("src", "/hotel/show/images/defaultimg.jpg")
                }
            });
            layer.full(mainIndex);
        }

        /**
         * 监听新增提交事件
         */
        form.on('submit(doAdd)', function (data) {
            layedit.sync(detailIndex);
            $.ajax({
                url: "/admin/room",
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
                title: "修改房间 [<font color='red'>" + data.roomNum + "</font>] 信息",
                area: ["800px", "650px"],
                content: $("#updateWindow"),
                maxmin: true,
                success: function () {
                    //表单数据回显
                    form.val("updateFrm", data);
                    //图片回显
                    $("#editImg").attr("src", "/hotel/show/room/main/" + data.photo);
                }
            });
            layer.full(mainIndex);
        }

        /**
         * 监听修改提交事件
         */
        form.on('submit(doEdit)', function (data) {
            layedit.sync(detailIndex);
            $.ajax({
                url: "/admin/room/" + data.id,
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

        function deleteById(data) {
            //判断当前房间状态是否为可预订
            if (data.status != 1) { //1为可预订
                layer.msg("只能删除状态为可预订的房间");
            } else {
                layer.confirm("确定要删除房间 [<font color='red'>" + data.title + "</font>] 吗？", {
                    icon: 3,
                    title: "警告"
                }, function (index) {
                    $.ajax({
                        url: "/admin/room/" + data.id,
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
                });
            }
        }

    });
</script>

</body>
</html>
