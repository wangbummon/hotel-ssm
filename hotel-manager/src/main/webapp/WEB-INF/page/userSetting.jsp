<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--获取CSRF Token--%>
    <meta name="_csrf" content="${_csrf.token}"/>
    <%--获取CSRF头，默认为X-CSRF-TOKEN--%>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="utf-8">
    <title>基本资料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/css/layui.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <style>
        .layui-form-item .layui-input-company {
            width: auto;
            padding-right: 10px;
            line-height: 38px;
        }
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div class="layui-form layuimini-form">
            <div class="layui-form-item">
                <label class="layui-form-label required">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="username" id="username" lay-verify="required" lay-reqtext="用户名不能为空"
                           placeholder="请输入用户名" value="admin" class="layui-input">
                    <tip>填写自己管理账号的名称。</tip>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="realName" id="realName" lay-verify="required" lay-reqtext="真实姓名不能为空"
                           placeholder="请输入真实姓名"
                           value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">电话</label>
                <div class="layui-input-block">
                    <input type="number" name="phone" id="phone" lay-verify="required" lay-reqtext="电话不能为空"
                           placeholder="请输入电话号"
                           value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="email" name="email" id="email" placeholder="请输入邮箱" value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注信息</label>
                <div class="layui-input-block">
                    <textarea name="remark" id="remark" class="layui-textarea" placeholder="请输入备注信息"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/layui/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form', 'miniTab', 'jquery'], function () {
        var form = layui.form,
            layer = layui.layer,
            jquery = layui.jquery,
            $ = layui.$,
            miniTab = layui.miniTab;

        //获取<meta>中封装的CSRF Token
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        // 将头中的CSRF Token信息发送出去
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        //渲染基本信息
        $.ajax({
            url: "/admin/user/detail",
            type: "GET",
            data: {},
            success: function (result) {
                // console.log(result.data)
                let data = result.data;
                $("#username").val(data.username);
                $("#realName").val(data.realName);
                $("#phone").val(data.phone);
                $("#email").val(data.email);
                $("#remark").val(data.remark);
            }
        })

        //监听提交
        form.on('submit(saveBtn)', function (obj) {
            updateUserDetail(obj.field);
        });

        function updateUserDetail(data) {
            layer.confirm("确定要修改基本信息吗？", {
                icon: 3,
                title: "提示"
            }, function (index) {
                console.log(data)
                $.ajax({
                    url: "/admin/user/detail",
                    type: "PUT",
                    data: JSON.stringify(data),
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success: function (res) {
                        if (res.code === 0) {
                            miniTab.deleteCurrentByIframe();
                        }
                        layer.msg(res.msg)
                    }
                });
            })
        }

    });
</script>
</body>
</html>