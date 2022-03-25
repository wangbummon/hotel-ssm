<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="fly-html-layui fly-html-store">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/dist/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/global.css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/global(1).css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/store.css" charset="utf-8">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico">
    <title>酒店管理系统</title>
<body>
<!-- 顶部start -->
<div class="layui-header header header-store" style="background-color: #393D49;">
    <div class="layui-container">
        <a class="logo" href="${pageContext.request.contextPath}/index.html">
            <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="layui">
        </a>
        <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
        <ul class="layui-nav" id="layui-nav-userinfo">
            <li data-id="index" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav"
                   href="${pageContext.request.contextPath}/index.html">首页</a>
            </li>
            <li data-id="room" class="layui-nav-item layui-hide-xs layui-this">
                <a class="fly-case-active" data-type="toTopNav"
                   href="${pageContext.request.contextPath}/room/list">房间</a>
            </li>
            <li data-id="login" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav"
                   href="${pageContext.request.contextPath}/login.jsp">登入</a>
            </li>
            <li data-id="register" class="layui-nav-item layui-hide-xs ">
                <a class="fly-case-active" data-type="toTopNav" href="${pageContext.request.contextPath}/register.jsp">注册</a>
            </li>
            <li data-id="register" class="layui-nav-item layui-hide-xs ">
                <a class="fly-case-active" data-type="toTopNav" href="http://localhost:8080/">进入后台</a>
            </li>
            <span class="layui-nav-bar" style="left: 560px; top: 55px; width: 0px; opacity: 0;"></span>
        </ul>
    </div>
</div>
<!-- 顶部end -->

<!-- 中间区域开始 -->
<!-- 搜索框start -->
<div class="shop-nav shop-index">
    <!--搜索 start-->
    <div id="LAY-topbar" style="height: auto;">
        <form class="layui-form layuimini-form">
            <div class="input-search">
                <div id="searchRoom"><input type="text" placeholder="搜索你需要的房间" name="keywords" id="searchKeywords"
                                            autocomplete="off" value="">
                    <button class="layui-btn layui-btn-shop" lay-submit="" lay-filter="searchHotelRoom"
                            style="background-color: #009688"><i
                            class="layui-icon layui-icon-search"></i></button>
                </div>
                <div class="layui-container layui-hide-xs"><a href="#" class="topbar-logo"> <img
                        src="${pageContext.request.contextPath}/static/images/logo-1.png" alt="layui"> </a></div>
            </div>
        </form>
    </div>
    <!--搜索 end-->

</div>
<!-- 搜索框end -->
<!-- 筛选条件start -->
<div class="shoplist-filter">
    <div class="layui-container">
        <div class="layui-card">
            <div class="layui-card-header"> <span class="layui-breadcrumb" style="visibility: visible;"> <a
                    href="${pageContext.request.contextPath}/index.html">酒店首页</a><span lay-separator="">/</span> <a
                    href="${pageContext.request.contextPath}/room/list">类别</a><span lay-separator="">/</span> <a><cite>全部</cite></a>
						</span></div>
            <div class="layui-card-body">
                <div class="store-cat-item"><span><i class="layui-icon layui-icon-shop-fenlei"></i>类别：</span>
                    <%-- 隐藏域，保存当前选中的房型ID --%>
                    <input type="hidden" id="typeId" value="${typeId}">
                    <ul id="getAllRoomType">
                        <li <c:if test="${typeId==null}"> class="active" </c:if> data-id="0">
                            <a class="fly-case-active" href="${pageContext.request.contextPath}/room/list"
                               data-type="toRoomTypeListByLists">全部</a>
                        </li>
                    </ul>
                </div>

                <p class="filtEnd">筛选出<span id="filtTotal">${roomList.size()}</span>个</p>
            </div>
        </div>
    </div>
</div>
<!-- 筛选条件end -->

<!-- 房间列表start -->
<div class="shop-temp shoplist">
    <div class="temp-normal">
        <div class="layui-container">
            <div class="layui-row layui-col-space20 shoplist" id="roomList">
                <c:forEach var="room" items="${roomList}">
                    <div data-id="${room.id}" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <a class="template store-list-box fly-case-active" href="/room/detail/${room.id}"
                           data-type="toRoomInfo">
                            <img src="/hotel/show/room/main/${room.photo}" class="store-list-cover">
                            <h2 class="layui-elip" style="margin-left: 70px">${room.title}
                                <c:if test="${room.status==1}">
                                    <span style="border-color: dodgerblue;color: dodgerblue;font-weight:bolder;border-width: 1px;border-style: solid;background-color: #fff;ext-align: center;margin: 0px 5px 5px 5px;font-size: 12px;padding: 2px 3px">可预订</span>
                                </c:if>
                                <c:if test="${room.status==2}">
                                    <span style="border-color: lightseagreen;color: lightseagreen;font-weight:bolder;border-width: 1px;border-style: solid;background-color: #fff;ext-align: center;margin: 0px 5px 5px 5px;font-size: 12px;padding: 2px 3px">已预订</span>
                                </c:if>
                                <c:if test="${room.status==3}">
                                    <span style="border-color: lightsalmon;color: lightsalmon;font-weight:bolder;border-width: 1px;border-style: solid;background-color: #fff;ext-align: center;margin: 0px 5px 5px 5px;font-size: 12px;padding: 2px 3px">已入住</span>
                                </c:if></h2>
                            <div>
                                <label class="layui-badge-rim store-list-pay" style="position: static;font-size: 14px">
                                    ￥${room.roomType.price} </label>
                                <div class="store-list-colorbar">
                                    <span class="store-color-bar"
                                          style="border-color: #009688;color: #009688;border-width: 1px;border-style: solid;background-color: #fff;    text-align: center;position: static">NO.${room.roomNum}</span>
                                    <span class="store-color-bar"
                                          style="border-color: #5fb878;color: #5fb878;border-width: 1px;border-style: solid;background-color: #fff;    text-align: center;">${room.roomType.typeName}</span>
                                    <span class="store-color-bar"
                                          style="border-color: #01aaed;color: #01aaed;border-width: 1px;border-style: solid;background-color: #fff;    text-align: center;">${room.floor.floorName}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <div style="margin: 50px 0 80px; text-align: center;"></div>
        </div>
    </div>
</div>
<!-- 房间列表end -->


<!-- 中间区域结束 -->

<!-- 底部 -->
<div class="fly-footer">
    <p><a href="#">酒店系统</a> 2020 © <a href="#">test.cn</a></p>
    <p>
        友情链接
        <a href="http://java.goodym.cn" target="_blank">java项目源码分享网</a>
        <a href="http://www.goodym.cn/code/list/all/1/20.html" target="_blank">源码下载平台</a>
        <a href="http://www.goodym.cn/market/list/all/1/20.html" target="_blank">源码市场</a>
        <a href="http://www.goodym.cn/resumetemplate/list/1/20.html" target="_blank">简历制作</a>
        <a href="http://www.goodym.cn/forum/list/0/1/20.html" target="_blank">社区论坛</a></p>

</div>


<!-- 脚本开始 -->
<script src="${pageContext.request.contextPath}/static/layui/dist/layui.js"></script>
<script>
    layui.use(["form", "element", "carousel"], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            carousel = layui.carousel,
            $ = layui.$;

        //渲染轮播图
        carousel.render({
            elem: '#LAY-store-banner'
            , width: '100%' //设置容器宽度
            , height: '460' //设置容器高度
            , arrow: 'always' //始终显示箭头
        });

        $.ajax({
            url: "/roomType/list",
            type: "GET",
            data: {},
            success: function (result) {
                let html = "";
                let data = JSON.parse(result);
                for (let i = 0; i < data.length; i++) {
                    //判断当前房型ID
                    if (data[i].id == $("#typeId").val()) {
                        html += "<li data-id='" + data[i].id + "' class='active'>";
                    } else {
                        html += "<li data-id='" + data[i].id + "'>";
                    }
                    html += "<a class='fly-case-active' href='/room/list/" + data[i].id + "' data-type='toRoomTypeListByLists'>" + data[i].typeName + "</a>";
                    html += "</li>";
                }
                $("#getAllRoomType").append(html);
            }
        });
    });
</script>
<!-- 脚本结束 -->
<ul class="layui-fixbar">
    <li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li>
</ul>
<div class="layui-layer-move"></div>

</body>
</html>