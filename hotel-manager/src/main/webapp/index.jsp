<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <title>酒店后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/css/layui.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layuimini.css?v=2.0.4.2"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/themes/default.css" media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/layui/lib/font-awesome-4.7.0/css/font-awesome.min.css"
          media="all">
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/js/html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/respond.min.js"></script>
    <![endif]-->
    <style id="layuimini-bg-color">
    </style>
    <style>
        .layui-form-item .layui-input-company {
            width: auto;
            padding-right: 10px;
            line-height: 38px;
        }
    </style>
</head>
<body class="layui-layout-body layuimini-all" style="height: 100%; margin: 0">
<div class="layui-layout layui-layout-admin">

    <div class="layui-header header">
        <div class="layui-logo layuimini-logo"></div>

        <div class="layuimini-header-content">
            <a>
                <div class="layuimini-tool"><i title="展开" class="fa fa-outdent" data-side-fold="1"></i></div>
            </a>

            <!--电脑端头部菜单-->
            <ul class="layui-nav layui-layout-left layuimini-header-menu layuimini-menu-header-pc layuimini-pc-show">
            </ul>

            <!--手机端头部菜单-->
            <ul class="layui-nav layui-layout-left layuimini-header-menu layuimini-mobile-show">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="fa fa-list-ul"></i> 选择模块</a>
                    <dl class="layui-nav-child layuimini-menu-header-mobile">
                    </dl>
                </li>
            </ul>

            <ul class="layui-nav layui-layout-right">

                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" data-refresh="刷新"><i class="fa fa-refresh"></i></a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" data-clear="清理" class="layuimini-clear"><i class="fa fa-trash-o"></i></a>
                </li>
                <li class="layui-nav-item mobile layui-hide-xs" lay-unselect>
                    <a href="javascript:;" data-check-screen="full"><i class="fa fa-arrows-alt"></i></a>
                </li>
                <li class="layui-nav-item layuimini-setting">
                    <a href="javascript:;"><security:authentication property="name"/></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"
                               layuimini-content-href="${pageContext.request.contextPath}/admin/userSetting"
                               data-title="基本资料"
                               data-icon="fa fa-gears">基本资料<span class="layui-badge-dot"></span></a>
                        </dd>
                        <dd>
                            <%--                            layuimini-content-href="/admin/resetPwd"--%>
                            <a href="javascript:;" id="reset" data-title="修改密码"
                               data-icon="fa fa-gears">修改密码</a>
                        </dd>
                        <dd>
                            <hr>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/admin/user/logout" class="login-out">退出登录</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layuimini-select-bgcolor" lay-unselect>
                    <a href="javascript:;" data-bgcolor="配色方案"><i class="fa fa-ellipsis-v"></i></a>
                </li>
            </ul>
        </div>
    </div>

    <!--无限极左侧菜单-->
    <div class="layui-side layui-bg-black layuimini-menu-left">
    </div>

    <!--初始化加载层-->
    <div class="layuimini-loader">
        <div class="layuimini-loader-inner"></div>
    </div>

    <!--手机端遮罩层-->
    <div class="layuimini-make"></div>

    <!-- 移动导航 -->
    <div class="layuimini-site-mobile"><i class="layui-icon"></i></div>

    <div class="layui-body">

        <div class="layuimini-tab layui-tab-rollTool layui-tab" lay-filter="layuiminiTab" lay-allowclose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" id="layuiminiHomeTabId" lay-id=""></li>
            </ul>
            <div class="layui-tab-control">
                <li class="layuimini-tab-roll-left layui-icon layui-icon-left"></li>
                <li class="layuimini-tab-roll-right layui-icon layui-icon-right"></li>
                <li class="layui-tab-tool layui-icon layui-icon-down">
                    <ul class="layui-nav close-box">
                        <li class="layui-nav-item">
                            <a href="javascript:;"><span class="layui-nav-more"></span></a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;" layuimini-tab-close="current">关 闭 当 前</a></dd>
                                <dd><a href="javascript:;" layuimini-tab-close="other">关 闭 其 他</a></dd>
                                <dd><a href="javascript:;" layuimini-tab-close="all">关 闭 全 部</a></dd>
                            </dl>
                        </li>
                    </ul>
                </li>
            </div>
            <div class="layui-tab-content">
                <div id="layuiminiHomeTabIframe" class="layui-tab-item layui-show"></div>
            </div>
        </div>
    </div>

    <div style="display: none;padding: 5px" id="resetWindow">
        <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">
            <div class="layui-col-md12 layui-col-xs12">
                <div class="layui-form-item">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md12 layui-col-xs7">
                            <div class="layui-form-item magt3" style="margin-top: 8px;">
                                <label class="layui-form-label required">旧的密码</label>
                                <div class="layui-input-block">
                                    <input type="password" name="oldPwd" id="oldPwd" lay-verify="required"
                                           lay-reqtext="旧的密码不能为空"
                                           placeholder="请输入旧的密码" value="" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label required">新的密码</label>
                                <div class="layui-input-block">
                                    <input type="password" name="newPwd" id="newPwd" lay-verify="required"
                                           lay-reqtext="新的密码不能为空"
                                           placeholder="请输入新的密码" value="" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label required">新的密码</label>
                                <div class="layui-input-block">
                                    <input type="password" name="againPwd" id="againPwd" lay-verify="required"
                                           lay-reqtext="新的密码不能为空"
                                           placeholder="请输入新的密码" value="" class="layui-input">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item magt3">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doAdd"
                                id="doAdd"><span
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
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/layui/js/lay-config.js?v=2.0.0" charset="utf-8"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/js/lay-module/echarts/echarts.min.js"></script>
<script>
    layui.use(['jquery', 'layer', 'miniAdmin', 'miniTongji', 'form'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            miniAdmin = layui.miniAdmin,
            form = layui.form,
            miniTongji = layui.miniTongji;


        var options = {
            iniUrl: "${pageContext.request.contextPath}/admin/menu/getMenuByUser",    // 初始化接口
            clearUrl: "${pageContext.request.contextPath}/static/layui/api/clear.json", // 缓存清理接口
            urlHashLocation: true,      // 是否打开hash定位
            bgColorDefault: false,      // 主题默认配置
            multiModule: true,          // 是否开启多模块
            menuChildOpen: false,       // 是否默认展开菜单
            loadingTime: 0,             // 初始化加载时间
            pageAnim: true,             // iframe窗口动画
            maxTabNum: 10,              // 最大的tab打开数量
        };
        miniAdmin.render(options);

        $("#againPwd").blur(function () {
            let newPwd = $("#newPwd").val(),
                againPwd = $("#againPwd").val();
            if (newPwd !== againPwd) {
                flag = true;
                layer.tips("两次输入的密码不一致！", '#againPwd',{
                    tips:2
                });
            }
        })

        //监听提交
        form.on('submit(resetPwd)', function (data) {
            if (flag) {
                layer.tips("两次输入的密码不一致！", '#againPwd',{
                    tips:2
                });
            } else {
                $.ajax({
                    url: "/admin/user/pwd",
                    data: JSON.stringify(data.field),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: {}
                })
            }
            return false;
        });


        // 百度统计代码，只统计指定域名
        miniTongji.render({
            specific: true,
            domains: [
                '99php.cn',
                'layuimini.99php.cn',
                'layuimini-onepage.99php.cn',
            ],
        });

        $('#reset').on("click", function () {
            mainIndex = layer.open({
                type: 1,
                title: "添加房间",
                area: ["500px", "350px"],
                // maxmin: true,
                content: $("#resetWindow"),
                success: function () {
                    $("#dataFrm")[0].reset();
                }
            });
            // layer.full(mainIndex);
        });

        /**
         * 监听新增提交事件
         */
        form.on('submit(resetPwdBtn)', function (data) {
            // layedit.sync(detailIndex);
            $.ajax({
                url: "/admin/user/pwd",
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

        $('.login-out').on("click", function () {
            layer.msg('退出登录成功', function () {
                window.location = 'page/login-3.html';
            });
        });
    });
</script>
</body>
</html>