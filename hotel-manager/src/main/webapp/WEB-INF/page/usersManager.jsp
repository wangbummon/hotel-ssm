<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--获取CSRF Token--%>
    <meta name="_csrf" content="${_csrf.token}"/>
    <%--获取CSRF头，默认为X-CSRF-TOKEN--%>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <title>用户管理</title>
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
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="username" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">真实姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="realName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-inline">
                                <select name="sex" autocomplete="off" class="layui-input">
                                    <option value="">请选择性别</option>
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                        </div>
                        <%--                        <div class="layui-inline">--%>
                        <%--                            <label class="layui-form-label">用户类型</label>--%>
                        <%--                            <div class="layui-input-inline">--%>
                        <%--                                <select name="userType" autocomplete="off" class="layui-input">--%>
                        <%--                                    <option value="">请选择用户类型</option>--%>
                        <%--                                    <option value="1">超级管理员</option>--%>
                        <%--                                    <option value="2">普通用户</option>--%>
                        <%--                                </select>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <div class="layui-inline">
                            <label class="layui-form-label">所属部门</label>
                            <div class="layui-input-inline">
                                <select name="deptId" autocomplete="off" class="layui-input">
                                    <option value="">请选择部门</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">联系方式</label>
                            <div class="layui-input-inline">
                                <input type="text" name="phone" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">开始日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="startDate" id="startTime" autocomplete="off"
                                       class="layui-input" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">结束日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="endDate" id="endTime" autocomplete="off" class="layui-input"
                                       readonly>
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
        <%--表格头工具栏--%>
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
            <button class="layui-btn layui-btn-xs layui-btn-warm" lay-event="resetPwd"><i
                    class="layui-icon layui-icon-refresh"></i>重置密码
            </button>
            <button class="layui-btn layui-btn-xs" lay-event="grantRole"><i class="layui-icon layui-icon-edit"></i>分配角色
            </button>
        </script>

        <!-- 添加窗口 -->
        <div style="display: none;padding: 5px" id="addWindow">
            <form class="layui-form" style="width:90%;" id="addFrm" lay-filter="addFrm">
                <!-- 隐藏域，保存员工id -->
                <input type="hidden" name="id">

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" lay-verify="required" autocomplete="off"
                                   placeholder="请输入用户名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">真实姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="realName" lay-verify="required" autocomplete="off"
                                   placeholder="请输入真实姓名" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-block">
                            <input type="text" name="phone" lay-verify="required|phone" autocomplete="off"
                                   placeholder="请输入手机号" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" name="email" lay-verify="required|email" autocomplete="off"
                                   placeholder="请输入邮箱" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入职日期</label>
                        <div class="layui-input-block">
                            <input type="text" name="hireDate" id="addHireDate" readonly lay-verify="required"
                                   autocomplete="off" placeholder="请选择入职日期" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">所属部门</label>
                        <div class="layui-input-block">
                            <select name="deptId" class="layui-input">
                                <option value="">请选择部门</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="1" title="男" checked>
                            <input type="radio" name="sex" value="2" title="女">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="status" value="1" title="启用" checked>
                            <input type="radio" name="status" value="2" title="禁用">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="remark"></textarea>
                    </div>
                </div>

                <div class="layui-form-item layui-row layui-col-xs12">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doAdd"><span
                                class="layui-icon layui-icon-add-1"></span>提交
                        </button>
                        <button type="button" class="layui-btn layui-btn-warm"><span
                                class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <!-- 修改窗口 -->
        <div style="display: none;padding: 5px" id="updateWindow">
            <form class="layui-form" style="width:90%;" id="updateFrm" lay-filter="updateFrm">
                <!-- 隐藏域，保存员工id -->
                <input type="hidden" name="id">

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" lay-verify="required" autocomplete="off"
                                   placeholder="请输入用户名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">真实姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="realName" lay-verify="required" autocomplete="off"
                                   placeholder="请输入真实姓名" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-block">
                            <input type="text" name="phone" lay-verify="required|phone" autocomplete="off"
                                   placeholder="请输入手机号" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" name="email" lay-verify="required|email" autocomplete="off"
                                   placeholder="请输入邮箱" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入职日期</label>
                        <div class="layui-input-block">
                            <input type="text" name="hireDate" id="updateHireDate" readonly lay-verify="required"
                                   autocomplete="off" placeholder="请选择入职日期" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">所属部门</label>
                        <div class="layui-input-block">
                            <select name="deptId" class="layui-input">
                                <option value="">请选择部门</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="1" title="男" checked>
                            <input type="radio" name="sex" value="2" title="女">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="status" value="1" title="启用" checked>
                            <input type="radio" name="status" value="2" title="禁用">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="remark"></textarea>
                    </div>
                </div>

                <div class="layui-form-item layui-row layui-col-xs12">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doEdit"><span
                                class="layui-icon layui-icon-add-1"></span>提交
                        </button>
                        <button type="button" class="layui-btn layui-btn-warm"><span
                                class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <%--分配角色窗口--%>
        <div style="display: none;padding: 5px" id="selectUserRoleDiv">
            <table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['laydate', 'form', 'table', 'jquery'], function () {
        const $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            table = layui.table;

        //渲染日期选择器
        laydate.render({
            elem: '#startTime',
            type: 'date',
            trigger: "click"
        });
        laydate.render({
            elem: '#endTime',
            type: 'date',
            trigger: "click"
        });
        laydate.render({
            elem: '#addHireDate',
            type: 'date',
            trigger: 'click'
        });
        laydate.render({
            elem: '#updateHireDate',
            type: 'date',
            trigger: 'click'
        })

        //获取<meta>中封装的CSRF Token
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        // 将头中的CSRF Token信息发送出去
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        // 表格
        const tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/users',
            toolbar: '#toolbarDemo',
            request: {
                pageName: 'pageNum',
                limitName: 'pageSize'
            },
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 120, title: '用户编号', sort: true, align: "center"},
                {field: 'username', width: 150, title: '用户名', align: "center"},
                {field: 'realName', width: 150, title: '真实姓名', align: "center"},
                {field: 'phone', width: 180, title: '联系方式', align: "center"},
                {
                    field: 'sex', width: 100, title: '性别', align: "center", templet: function (data) {
                        return data.sex === 1 ? "<font color='blue'>男</font>" : "<font color='red'>女</font>";
                    }
                },
                {
                    field: 'deptName', title: '所属部门', width: 180, align: "center", templet: function (data) {
                        return data.dept.deptName;
                    }
                },
                {
                    field: 'status', title: '状态', width: 150, align: "center", templet: function (data) {
                        if (data.status === 1) {
                            return '<div> <input type="checkbox" checked="" name="status" lay-skin="switch" id="open" lay-filter="statusSwitch" userId=' + data.id + '' +
                                ' lay-text="启用|已禁用"  value=' + data.status + '></div>';
                        }
                        return '<div> <input type="checkbox" lay-skin="switch" name="status"  userId=' + data.id + ' lay-filter="statusSwitch"' +
                            'lay-text="启用|已禁用" value=' + data.status + '></div>';
                    }
                },
                {field: 'hireDate', width: 160, title: '入职日期', sort: true, align: "center"},
                {title: '操作', minWidth: 200, toolbar: '#currentTableBar', align: "center"}
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

        // 状态 开关按钮
        form.on('switch(statusSwitch)', function (data) {
            //开关是否开启 开启后 checked赋值1 否则赋值0
            let checked = data.elem.checked ? 1 : 0;
            //获取所需属性值
            let userId = data.elem.attributes['userId'].nodeValue;
            $.ajax({
                url: "/admin/users/" + userId,
                type: "PUT",
                data: JSON.stringify({
                    "id": userId,
                    "status": checked
                }),
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                success: function (result) {
                    if (result.code === 0) {
                        layer.msg(result.msg);
                        checked === 1 ? data.elem.checked = true : data.elem.checked = false;
                        //数据刷新
                        tableIns.reload();
                    }
                    // }
                }
            })
            form.render();
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

        //发送请求查询部门列表 渲染搜索框中的部门列表
        $.ajax({
            url: "/admin/depts/all",
            type: "GET",
            data: {},
            success: function (result) {
                let html = "",
                    data = JSON.parse(result);
                for (let i = 0; i < data.length; i++) {
                    html += "<option value='" + data[i].id + "'>" + data[i].deptName + "</option>";
                }
                //将数据渲染至下拉代码中
                $("[name='deptId']").append(html);
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
                case 'delete':
                    deleteByIds(obj);
                    break;
            }
        });

        /**
         * 批量删除用户
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
                layer.confirm("确定要删除所选用户吗？", {
                    icon: 3,
                    title: "提示"
                }, function (index) {
                    $.ajax({
                        url: "/admin/users/" + ids,
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
            } else {
                layer.msg("请选择要删除的用户");
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
                title: "添加部门",
                area: ["800px", "500px"],
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
                url: "/admin/users/",
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
                case 'resetPwd':
                    resetPwd(obj.data);
                    break;
                case 'grantRole':
                    grantRole(obj.data);
                    break;
            }
        });

        /**
         * 打开修改窗口
         */
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: "修改用户信息",
                area: ["800px", "500px"],
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
                url: "/admin/users/" + data.field.id,
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
         * 删除用户
         * @param data
         */
        function deleteById(data) {
            layer.confirm("确定要删除用户 [<font color='red'>" + data.realName + "</font>] 吗？", {
                icon: 3,
                title: "提示"
            }, function (index) {
                //发送删除用户的请求
                $.ajax({
                    url: "/admin/user/" + data.id,
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

        /**
         * 重置密码
         * @param data
         */
        function resetPwd(data) {
            layer.confirm("确定要重置用户 [<font color='red'>" + data.realName + "</font>] 的密码吗？", {
                icon: 3,
                title: "提示"
            }, function (index) {
                //发送重置密码的请求
                $.ajax({
                    url: "/admin/resetPwd/" + data.id,
                    type: "PUT",
                    data: JSON.stringify({
                        "id": data.id
                    }),
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
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

        /**
         * 分配角色
         * @param data
         */
        function grantRole(data) {
            mainIndex = layer.open({
                type: 1,
                title: "分配用户 [<font color='red'>" + data.realName + "</font>] 的角色",
                area: ["1000px", "500px"],
                content: $("#selectUserRoleDiv"),
                btn: ["<i class='layui-icon layui-icon-ok-circle'></i>确定", "<i class='layui-icon layui-icon-close'></i>取消"],
                anim: 2,
                yes: function (index, layero) {
                    // 获取选中行
                    let checkStatus = table.checkStatus('roleTable');
                    let idArr = [];
                    //判断是否有选中
                    if (checkStatus.data.length > 0) {
                        for (let i = 0; i < checkStatus.data.length; i++) {
                            //角色id
                            idArr.push(checkStatus.data[i].id);
                            //将数组转换为字符串
                            let ids = idArr.join(",");
                            $.ajax({
                                url: "/admin/userRoles/" + data.id,
                                type: "POST",
                                data: JSON.stringify({
                                    "roleIds": ids,
                                    "userId": data.id
                                }),
                                dataType: 'json',
                                contentType: 'application/json;charset=utf-8',
                                success: function (result) {
                                    if (result.code === 0) {
                                        layer.msg(result.msg)
                                        //数据刷新
                                        tableIns.reload();
                                    } else {
                                        layer.msg(result.msg)
                                    }
                                }
                            });
                            //关闭当前窗口
                            layer.close(mainIndex);
                        }
                    } else {
                        layer.msg("请选择要分配的角色！");
                    }
                },
                btn2: function (index, layero) {
                    //关闭当前窗口
                    layer.close(index);
                },
                success: function () {
                    // 初始化角色数据
                    initRoleData(data);
                }
            });
        }

        /**
         * 初始化角色数据
         */
        function initRoleData(data) {
            table.render({
                elem: '#roleTable',
                page: false,
                url: '${pageContext.request.contextPath}/admin/roles/init/' + data.id,
                type: 'GET',
                data: {
                    "id": data.id
                },
                cols: [[
                    {type: "checkbox", width: 50},
                    {field: 'id', width: 120, title: '角色编号', sort: true, align: "center"},
                    {field: 'role_code', width: 200, title: '角色代码', align: "center"},
                    {field: 'role_name', width: 200, title: '角色名称', align: "center"},
                    {field: 'role_desc', minWidth: 400, title: '角色描述', align: "center"},
                ]],
            });

        }

    });
</script>

</body>
</html>
