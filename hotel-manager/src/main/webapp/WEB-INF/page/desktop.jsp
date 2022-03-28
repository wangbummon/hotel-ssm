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


    <div class="layui-row layui-col-space15">
        <div class="layui-col-xs12 layui-col-md6">
            <div id="echarts-dataset" style="background-color:#ffffff;min-height:300px;padding: 10px"></div>
        </div>
        <div class="layui-col-xs12 layui-col-md6">
            <div id="echarts-map" style="background-color:#ffffff;min-height:300px;padding: 10px"></div>
        </div>
    </div>


</div>
<!--</div>-->
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/layui/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<%--<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>--%>
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
                $("#priceCompareWithYesterday").text("▲ " + result.yesterdayAdd + " 元");
                $("#priceCompareWithWeek").text("▲ " + result.weekAdd + " 元");
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

        let echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');
        echartsRecords.showLoading();
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
                echartsRecords.hideLoading();
                echartsRecords.setOption(optionRecords);
            }
        });

        var echartsPies = echarts.init(document.getElementById('echarts-pies'), 'walden');
        echartsPies.showLoading();
        //渲染入住房型占比玫瑰图
        $.ajax({
            url: "/admin/charts/checkin/roomTypeCount",
            type: "GET",
            data: {},
            success: function (result) {
                let typeNames = result.typeNames,
                    checkinCounts = result.checkinCounts;
                let dataMap = [];
                for (let i = 0; i < typeNames.length; i++) {
                    let kvArr = {};
                    kvArr.name = typeNames[i];
                    kvArr.value = checkinCounts[i];
                    dataMap.push(kvArr);
                }

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
                echartsPies.hideLoading();
                echartsPies.setOption(optionPies);
            }
        });


        /**
         * 柱状图
         */
        var echartsDataset = echarts.init(document.getElementById('echarts-dataset'), 'walden');
        var option;

        $.ajax({
            url: "/admin/charts/price/week",
            type: "GET",
            data: {},
            success: function (res) {
                console.log(res)
                let typeNames = res.typeNames,
                    prices = res.prices;
                let series = [];
                for (let i = 0; i < typeNames.length; i++) {
                    series.push({
                        name: typeNames[i],
                        type: 'bar',
                        stack: 'total',
                        label: {
                            show: true
                        },
                        emphasis: {
                            focus: 'series'
                        },
                        data: prices[i]
                    })
                }
                option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            // Use axis to trigger tooltip
                            type: 'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
                        }
                    },
                    legend: {},
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        type: 'value',
                        minInterval: 1
                    },
                    yAxis: {
                        type: 'category',
                        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                    },
                    series: series
                };

                option && echartsDataset.setOption(option);
            }
        });


        // var echartsDataset = echarts.init(document.getElementById('echarts-dataset'), 'walden');
        //
        // var optionDataset = {
        //     legend: {},
        //     tooltip: {},
        //     dataset: {
        //         dimensions: ['product', '2018', '2020', '2021'],
        //         source: [
        //             {product: '单间', '2021': 43.3, '2020': 85.8, '2018': 93.7},
        //             {product: '标间', '2021': 83.1, '2020': 73.4, '2018': 55.1},
        //             {product: '豪华套房', '2021': 86.4, '2020': 65.2, '2018': 82.5},
        //             // {product: 'Walnut Brownie', '2021': 72.4, '2020': 53.9, '2018': 39.1}
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
         * 渲染房型盈利占比
         */
        var echartsMap = echarts.init(document.getElementById('echarts-map'), 'walden');
        echartsMap.showLoading();
        $.ajax({
            url: "/admin/charts/checkin/price",
            type: "GET",
            date: {},
            success: function (res) {
                let checkinPrices = res.checkinPrices,
                    typeNames = res.typeNames;
                let dataArr = [];
                dataArr.push(['product', '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'])
                for (let i = 0; i < typeNames.length; i++) {
                    let itemArr = [];
                    itemArr.push(typeNames[i]);
                    for (let j = 0; j < checkinPrices[i].length; j++) {
                        itemArr.push(checkinPrices[i][j]);
                    }
                    dataArr.push(itemArr);
                }
                let series = [];
                for (let i = 0; i < typeNames.length; i++) {
                    series.push({
                        type: 'line',
                        smooth: true,
                        seriesLayoutBy: 'row',
                        emphasis: {focus: 'series'}
                    })
                }
                series.push({
                    type: 'pie',
                    id: 'pie',
                    radius: '30%',
                    center: ['50%', '25%'],
                    emphasis: {
                        focus: 'self'
                    },
                    label: {
                        formatter: '{b}: {@1月} ({d}%)'
                    },
                    encode: {
                        itemName: 'product',
                        value: '1月',
                        tooltip: '1月'
                    }
                })
                var app = {};

                var option;

                setTimeout(function () {
                    option = {
                        legend: {},
                        tooltip: {
                            trigger: 'axis',
                            showContent: false
                        },
                        dataset: {
                            source: dataArr
                        },
                        xAxis: {type: 'category'},
                        yAxis: {gridIndex: 0},
                        grid: {top: '10%'},
                        series: series
                    };
                    echartsMap.on('updateAxisPointer', function (event) {
                        const xAxisInfo = event.axesInfo[0];
                        if (xAxisInfo) {
                            const dimension = xAxisInfo.value + 1;
                            echartsMap.setOption({
                                series: {
                                    id: 'pie',
                                    label: {
                                        formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                                    },
                                    encode: {
                                        value: dimension,
                                        tooltip: dimension
                                    }
                                }
                            });
                        }
                    });
                    echartsMap.hideLoading();
                    echartsMap.setOption(option);
                });

                if (option && typeof option === 'object') {
                    echartsMap.setOption(option);
                }
            }
        });


        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords.resize();
        }
    });
</script>
</body>
</html>
