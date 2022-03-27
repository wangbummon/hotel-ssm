<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="${pageContext.request.contextPath}/static/echarts/echarts.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/css/layui.css"
          media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/layui/lib/font-awesome-4.7.0/css/font-awesome.min.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <style>
        .top-panel {
            border: 1px solid #eceff9;
            border-radius: 5px;
            text-align: center;
        }

        .top-panel > .layui-card-body {
            height: 60px;
        }

        .top-panel-number {
            line-height: 60px;
            font-size: 30px;
            border-right: 1px solid #eceff9;
        }

        .top-panel-tips {
            line-height: 30px;
            font-size: 12px
        }
    </style>

</head>
<body>

<!--<div class="layuimini-container">-->
<div class="layuimini-main">


    <div class="layui-row layui-col-space15">
        <%--顶部统计-总盈利--%>
        <div class="layui-col-xs12 layui-col-md4">
            <div class="layui-card top-panel">
                <div class="layui-card-header" style="font-weight: bolder">总盈利</div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-col-xs9 layui-col-md9 top-panel-number">
                            <%--                            <span style="color: darkorange; font-size: 36px"></span>--%>
                            <a style="color: red;font-size: 32px;font-weight: bolder" id="allPriceCount"></a>&nbsp;&nbsp;<span
                                style="font-size: 24px;font-weight: bolder">元</span>
                        </div>
                        <div class="layui-col-xs3 layui-col-md3 top-panel-tips">
                            <span style="font-weight: bolder;font-size: 14px">昨天</span>
                            &nbsp; <a id="priceCompareWithYesterday" style="color: #bd3004;"></a><br>
                            <span style="font-weight: bolder;font-size: 14px">七日</span>
                            &nbsp; <a id="priceCompareWithWeek" style="color: #bd3004"></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%--顶部统计-用户数量--%>
        <div class="layui-col-xs12 layui-col-md4">
            <div class="layui-card top-panel">
                <div class="layui-card-header" style="font-weight: bolder">用户数量</div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-col-xs9 layui-col-md9 top-panel-number">
                            <a style="font-size: 32px;font-weight: bolder" id="allUserCount"></a>
                        </div>
                        <div class="layui-col-xs3 layui-col-md3 top-panel-tips">
                            <span style="font-weight: bolder;font-size: 14px">昨天</span>
                            &nbsp; <a id="userCompareWithYesterday" style="color: #bd3004"></a><br>
                            <span style="font-weight: bolder;font-size: 14px">七日</span>
                            &nbsp; <a id="userCompareWithWeek" style="color: #bd3004"></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%--顶部统计-房间数量--%>
        <div class="layui-col-xs12 layui-col-md4">

            <div class="layui-card top-panel">
                <div class="layui-card-header" style="font-weight: bolder">房间数量</div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-col-xs9 layui-col-md9 top-panel-number">
                            <a style="font-size: 32px;font-weight: bolder" id="roomCount"></a>
                        </div>
                        <div class="layui-col-xs3 layui-col-md3 top-panel-tips">
                            <span style="font-weight: bolder;font-size: 14px">房型共</span>
                            <a id="roomTypeCount" style="color: #1aa094"></a><br>
                            <span style="font-weight: bolder;font-size: 14px">楼层共</span>
                            <a id="floorCount" style="color: #bd3004"></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <div class="layui-row layui-col-space15">
        <div class="layui-col-xs12 layui-col-md9">
            <div id="echarts-records" style="background-color:#ffffff;min-height:400px;padding: 10px"></div>
        </div>
        <div class="layui-col-xs12 layui-col-md3">
            <div id="echarts-pies" style="background-color:#ffffff;min-height:400px;padding: 10px"></div>
        </div>
    </div>


<%--    <div class="layui-row layui-col-space15">--%>
<%--        <div class="layui-col-xs12 layui-col-md6">--%>
<%--            <div id="echarts-dataset" style="background-color:#ffffff;min-height:300px;padding: 10px"></div>--%>
<%--        </div>--%>
<%--        <div class="layui-col-xs12 layui-col-md6">--%>
<%--            <div id="echarts-map" style="background-color:#ffffff;min-height:300px;padding: 10px"></div>--%>
<%--        </div>--%>
<%--    </div>--%>


</div>
<!--</div>-->
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/layui/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['layer', 'echarts'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            echarts = layui.echarts;


        //渲染用户数量统计
        $.ajax({
            url: "/admin/user/count",
            type: "GET",
            data: {},
            success: function (result) {
                $("#allUserCount").text(result.allCount);
                $("#userCompareWithYesterday").text("▲ " + result.yesterdayAdd);
                $("#userCompareWithWeek").text("▲ " + result.weekAdd);
            }
        });

        //渲染总盈利统计
        $.ajax({
            url: "/admin/price/count",
            type: "GET",
            data: {},
            success: function (result) {
                $("#allPriceCount").text(result.allCount);
                $("#priceCompareWithYesterday").text("▲ " + result.yesterdayAdd);
                $("#priceCompareWithWeek").text("▲ " + result.weekAdd);
            }
        });


        //渲染房间数量统计
        $.ajax({
            url: "/admin/room/count",
            type: "GET",
            data: {},
            success: function (result) {
                $("#roomCount").text(result.allCount);
                $("#roomTypeCount").text(result.yesterdayAdd);
                $("#floorCount").text(result.weekAdd);
            }
        });

        /**
         * 渲染开始
         */

        let echartsRecords;
        //渲染本周入住信息报表
        $.ajax({
            url: "/admin/charts/checkin/week",
            type: "GET",
            data: {},
            success: function (result) {
                let typeNames = result.typeNames,
                    weekCount = result.weekCount;

                let series = [];
                for (let i = 0; i < weekCount.length; i++) {
                    series.push({
                        name: typeNames[i],
                        type: 'line',
                        stack: '总量',
                        areaStyle: {},
                        data: weekCount[i]
                    })
                }

                echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');

                var optionRecords = {
                    title: {
                        text: '本周入住信息报表'
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            label: {
                                backgroundColor: '#6a7985'
                            }
                        }
                    },
                    legend: {
                        data: typeNames
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            minInterval: 1
                        }
                    ],
                    series: series
                };
                echartsRecords.setOption(optionRecords);
            }
        });

        //渲染入住房型占比玫瑰图
        $.ajax({
            url: "/admin/charts/checkin/roomTypeCount",
            type: "GET",
            data: {},
            success: function (result) {
                console.log(result)
                let typeNames = result.typeNames,
                    checkinCounts = result.checkinCounts;
                let dataMap = [];
                for (let i = 0; i < typeNames.length; i++) {
                    let kvArr = {};
                    kvArr.name = typeNames[i];
                    kvArr.value = checkinCounts[i];
                    dataMap.push(kvArr);
                }
                console.log(dataMap)

                var echartsPies = echarts.init(document.getElementById('echarts-pies'), 'walden');
                var optionPies = {
                    title: {
                        text: '入住房型占比',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: typeNames
                    },
                    series: [
                        {
                            name: '入住数量',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            roseType: 'radius',
                            data: dataMap,
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                echartsPies.setOption(optionPies);
            }
        });


        /**
         * 柱状图
         */
        // var echartsDataset = echarts.init(document.getElementById('echarts-dataset'), 'walden');
        //
        // var optionDataset = {
        //     legend: {},
        //     tooltip: {},
        //     dataset: {
        //         dimensions: ['product', '2015', '2016', '2017'],
        //         source: [
        //             {product: 'Matcha Latte', '2015': 43.3, '2016': 85.8, '2017': 93.7},
        //             {product: 'Milk Tea', '2015': 83.1, '2016': 73.4, '2017': 55.1},
        //             {product: 'Cheese Cocoa', '2015': 86.4, '2016': 65.2, '2017': 82.5},
        //             {product: 'Walnut Brownie', '2015': 72.4, '2016': 53.9, '2017': 39.1}
        //         ]
        //     },
        //     xAxis: {type: 'category'},
        //     yAxis: {},
        //     // Declare several bar series, each will be mapped
        //     // to a column of dataset.source by default.
        //     series: [
        //         {type: 'bar'},
        //         {type: 'bar'},
        //         {type: 'bar'}
        //     ]
        // };
        //
        // echartsDataset.setOption(optionDataset);


        /**
         * 中国地图
         */
        // var echartsMap = echarts.init(document.getElementById('echarts-map'), 'walden');
        //
        //
        // var optionMap = {
        //     legend: {},
        //     tooltip: {
        //         trigger: 'axis',
        //         showContent: false
        //     },
        //     dataset: {
        //         source: [
        //             ['product', '2012', '2013', '2014', '2015', '2016', '2017'],
        //             ['Matcha Latte', 41.1, 30.4, 65.1, 53.3, 83.8, 98.7],
        //             ['Milk Tea', 86.5, 92.1, 85.7, 83.1, 73.4, 55.1],
        //             ['Cheese Cocoa', 24.1, 67.2, 79.5, 86.4, 65.2, 82.5],
        //             ['Walnut Brownie', 55.2, 67.1, 69.2, 72.4, 53.9, 39.1]
        //         ]
        //     },
        //     xAxis: {type: 'category'},
        //     yAxis: {gridIndex: 0},
        //     grid: {top: '55%'},
        //     series: [
        //         {type: 'line', smooth: true, seriesLayoutBy: 'row'},
        //         {type: 'line', smooth: true, seriesLayoutBy: 'row'},
        //         {type: 'line', smooth: true, seriesLayoutBy: 'row'},
        //         {type: 'line', smooth: true, seriesLayoutBy: 'row'},
        //         {
        //             type: 'pie',
        //             id: 'pie',
        //             radius: '30%',
        //             center: ['50%', '25%'],
        //             label: {
        //                 formatter: '{b}: {@2012} ({d}%)'
        //             },
        //             encode: {
        //                 itemName: 'product',
        //                 value: '2012',
        //                 tooltip: '2012'
        //             }
        //         }
        //     ]
        // };
        //
        // echartsMap.setOption(optionMap);


        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords.resize();
        }
    });
</script>
</body>
</html>
