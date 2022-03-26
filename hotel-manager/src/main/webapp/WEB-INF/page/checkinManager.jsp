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

        <%-- 搜索条件 --%>
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">入住人</label>
                            <div class="layui-input-inline">
                                <input type="text" name="customerName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">身份证号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="idCard" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="phone" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">房间类型</label>
                            <div class="layui-input-inline">
                                <select name="roomTypeId" autocomplete="off" class="layui-input s_roomTypeId">
                                    <option value="">全部</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">入住状态</label>
                            <div class="layui-input-inline">
                                <select name="status" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                    <option value="1">入住中</option>
                                    <option value="2">已退房</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">入住日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="startDate" id="startTime" autocomplete="off"
                                       class="layui-input" placeholder="请选择入住日期" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">离店日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="endDate" id="endTime" autocomplete="off" class="layui-input"
                                       placeholder="请选择离店日期" readonly>
                            </div>
                        </div>
                        <button type="submit" class="layui-btn layui-btn-primary" lay-submit
                                lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                        </button>
                    </div>
                </form>
            </div>
        </fieldset>

        <%-- 表格工具栏 --%>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="checkIn"><i
                        class="layui-icon layui-icon-edit"></i>登记入住
                </button>
            </div>
        </script>

        <%-- 数据表格 --%>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <%-- 行工具栏 --%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="checkout"><i
                    class="layui-icon layui-icon-delete"></i>退房</a>
        </script>

        <%-- 添加窗口 --%>
        <div style="display: none;padding: 5px" id="addWindow">
            <form class="layui-form" style="width:90%;" id="addFrm" lay-filter="addFrm">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">预订编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="ordersId" lay-verify="required" autocomplete="off" readonly
                                   placeholder="请选择预订订单" class="layui-input">
                        </div>
                        <div class="layui-form-mid" style="position:relative;bottom:5px;">
                            <button type="button" class="layui-btn layui-btn-sm" id="openAddOrdersWindow"><i
                                    class="layui-icon layui-icon-add-circle-fine"></i>选择订单
                            </button>
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">所属房型</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="roomTypeId">
                            <input type="text" name="roomTypeName" placeholder="请选择房型" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">房间编号</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="roomId">
                            <input type="text" name="roomNum" placeholder="请输入房间号码" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入住人</label>
                        <div class="layui-input-inline">
                            <input type="text" name="customerName" placeholder="请输入入住人姓名" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">手机号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" placeholder="请输入手机号码" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入住价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="payPrice" placeholder="请输入入住价格" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">入住状态</label>
                        <div class="layui-input-inline">
                            <input type="text" value="已入住" autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入住日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="arriveDate" placeholder="请选择入住日期" readonly autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">离店日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="leaveDate" placeholder="请选择离店日期" readonly autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">身份证号</label>
                    <div class="layui-input-block">
                        <input type="text" name="idCard" placeholder="请输入身份证号码" lay-verify="required" autocomplete="off"
                               readonly class="layui-input">
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
                        <button type="reset" class="layui-btn layui-btn-warm"><span
                                class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <%-- 修改窗口 --%>
        <div style="display: none;padding: 5px" id="updateWindow">
            <form class="layui-form" style="width:90%;" id="updateFrm" lay-filter="updateFrm">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">预订编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="ordersId" lay-verify="required" autocomplete="off" readonly
                                   placeholder="请选择预订订单" class="layui-input">
                        </div>
                        <div class="layui-form-mid" style="position:relative;bottom:5px;">
                            <button type="button" class="layui-btn layui-btn-sm" id="openEditOrdersWindow"><i
                                    class="layui-icon layui-icon-add-circle-fine"></i>选择订单
                            </button>
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">所属房型</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="roomTypeId">
                            <input type="text" name="roomTypeName" placeholder="请选择房型" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">房间编号</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="roomId">
                            <input type="text" name="roomNum" placeholder="请输入房间号码" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入住人</label>
                        <div class="layui-input-inline">
                            <input type="text" name="customerName" placeholder="请输入入住人姓名" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">手机号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" placeholder="请输入手机号码" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入住价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="payPrice" placeholder="请输入入住价格" lay-verify="required"
                                   autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">入住状态</label>
                        <div class="layui-input-inline">
                            <input type="text" value="已入住" autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">入住日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="arriveDate" placeholder="请选择入住日期" readonly autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">离店日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="leaveDate" placeholder="请选择离店日期" readonly autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">身份证号</label>
                    <div class="layui-input-block">
                        <input type="text" name="idCard" placeholder="请输入身份证号码" lay-verify="required" autocomplete="off"
                               readonly class="layui-input">
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
                        <button type="reset" class="layui-btn layui-btn-warm"><span
                                class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <!-- 选择预定订单窗口 -->
        <div style="display: none;" id="selectOrdersWindow">
            <%-- 数据表格 --%>
            <table class="layui-hide" id="ordersTableId" lay-filter="ordersTableFilter"></table>
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

        //渲染日期组件
        laydate.render({
            elem: '#startTime', //指定元素
            type: 'datetime'
        });
        laydate.render({
            elem: '#endTime', //指定元素
            type: 'datetime'
        });

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
            url: '${pageContext.request.contextPath}/admin/checkin',
            toolbar: '#toolbarDemo',
            request: {
                pageName: "pageNum",
                limitName: "pageSize"
            },
            cols: [[
                {field: 'id', width: 100, title: '入住编号', align: "center"},
                {
                    field: 'roomType', width: 150, title: '入住房型', align: "center", templet: function (d) {
                        return d.roomType.typeName;
                    }
                },
                {
                    field: 'room', width: 120, title: '房间号', align: "center", templet: function (d) {
                        return d.room.roomNum;
                    }
                },
                {field: 'customerName', width: 120, title: '入住人', align: "center"},
                {field: 'idCard', minWidth: 120, title: '身份证号', align: "center"},
                {field: 'phone', width: 150, title: '手机号', align: "center"},
                {
                    field: 'status', width: 100, title: '状态', align: "center", templet: function (d) {
                        return d.status == 1 ? "<font color='red'>入住中</font>" : "<font color='red'>已退房</font>";
                    }
                },
                {field: 'payPrice', width: 120, title: '支付金额', align: "center"},
                {field: 'arriveDate', width: 170, title: '入住日期', align: "center"},
                {field: 'leaveDate', width: 170, title: '离店日期', align: "center"},
                {title: '操作', width: 150, toolbar: '#currentTableBar', align: "center"}
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

        //查询房型列表
        $.ajax({
            url: "/admin/roomType/all",
            type: "GET",
            data: {},
            success: function (result) {
                let html = "";
                let data = JSON.parse(result)
                //循环遍历数据
                for (let i = 0; i < data.length; i++) {
                    html += "<option value='" + data[i].id + "'>" + data[i].typeName + "</option>"
                }
                //将数据追加到下拉列表中
                $("[name='roomTypeId']").append(html);
                //重新渲染下拉列表
                form.render("select");
            }
        });


        //监听头部工具栏事件
        table.on("toolbar(currentTableFilter)", function (obj) {
            switch (obj.event) {
                case 'checkIn':
                    openCheckinWindow();
                    break;
            }
        });
        table.on("tool(currentTableFilter)", function (obj) {
            switch (obj.event) {
                case 'checkout':
                    checkout(obj.data);
                    break;
            }
        });

        var url, mainIndex;

        /**
         * 打开登记入住窗口
         */
        function openCheckinWindow() {
            mainIndex = layer.open({
                type: 1,//打开类型
                title: "登记入住",//窗口标题
                area: ["800px", "570px"],//窗口宽高
                content: $("#addWindow"),//引用的内容窗口
                success: function () {
                    //清空表单数据
                    $("#addFrm")[0].reset();
                }
            });
        }

        //当点击登记入住的选择订单按钮时触发
        $("#openAddOrdersWindow").click(function () {
            var index = layer.open({
                type: 1,//打开类型
                title: "选择订单",//窗口标题
                area: ["1300px", "500px"],//窗口宽高
                maxmin: true,//开启最大化和最小化
                content: $("#selectOrdersWindow"),//引用的内容窗口
                success: function () {
                    //清空表单数据
                    //$("#dataFrm")[0].reset();
                    //初始化表格数据
                    initOrdersTableData();
                },
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    //判断使用有选中行
                    var checkStatus = table.checkStatus('ordersTableId');
                    if (checkStatus.data.length > 0) {
                        //获取选中行的数据
                        var data = checkStatus.data[0];
                        //给表单赋值
                        form.val("addFrm", {
                            //key是form表单的name属性值
                            "ordersId": data.id//订单id
                            , "roomTypeId": data.roomTypeId //房型ID
                            , "roomTypeName": data.roomType.typeName //房型名称
                            , "roomNum": data.room.roomNum   //房间号码
                            , "roomId": data.roomId          //房间ID
                            , "customerName": data.reservationName   //预订人姓名
                            , "phone": data.phone    //预订人手机
                            , "payPrice": data.reservePrice  //预订价格
                            , "arriveDate": data.arriveDate  //入住日期
                            , "leaveDate": data.leaveDate    //离店日期
                            , "idCard": data.idCard  //身份证号码
                            , "remark": data.remark //备注
                        });
                        //关闭窗口
                        layer.close(index);
                    } else {
                        layer.msg("请选择一条订单信息");
                    }
                },
                btn2: function (index, layero) {

                }
            });
        });

        /**
         * 初始化预订订单表格数据
         */
        function initOrdersTableData() {
            table.render({
                elem: '#ordersTableId',
                url: '${pageContext.request.contextPath}/admin/orders?status=2',
                toolbar: '#toolbarDemo',
                request: {
                    pageName: "pageNum",
                    limitName: "pageSize"
                },
                cols: [[
                    {type: "radio", width: 50},
                    {field: 'id', width: 100, title: '预订编号', align: "center"},
                    {
                        field: 'roomType', width: 100, title: '预订房型', align: "center", templet: function (d) {
                            return d.roomType.typeName;
                        }
                    },
                    {
                        field: 'room', width: 80, title: '房间号', align: "center", templet: function (d) {
                            return d.room.roomNum;
                        }
                    },
                    {field: 'reservationName', width: 100, title: '预订人', align: "center"},
                    {field: 'idCard', width: 170, title: '身份证号', align: "center"},
                    {field: 'phone', width: 140, title: '手机号', align: "center"},
                    {
                        field: 'status', width: 80, title: '状态', align: "center", templet: function (d) {
                            if (d.status == 1) {
                                return "<font color='red'>待确认</font>";
                            } else if (d.status == 2) {
                                return "<font color='orange'>已确认</font>";
                            } else if (d.status == 3) {
                                return "<font color='blue'>入住中</font>";
                            }
                        }
                    },
                    {field: 'reservePrice', width: 80, title: '预订价', align: "center"},
                    {field: 'reserveDate', width: 160, title: '预订时间', align: "center"},
                    {field: 'arriveDate', width: 110, title: '入住日期', align: "center"},
                    {field: 'leaveDate', width: 110, title: '离店日期', align: "center"},
                ]],
                page: true,
            });
        }

        //监听表单提交事件
        form.on("submit(doAdd)", function (data) {
            $.ajax({
                url: "/admin/checkin",
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
            //禁止页面刷新
            return false;
        });

        //办理退房
        function checkout(data) {
            console.log(data)
            if (data.status === 1) {
                layer.confirm("确定要为房间 [<font color='red'>" + data.room.roomNum + "</font>] 办理退房吗",
                    {
                        icon: 3,
                        title: "提示："
                    }, function (index) {
                        //发送请求
                        $.ajax({
                            url: "/admin/checkout/" + data.id,
                            type: "PUT",
                            data: JSON.stringify({"checkinId": data.id}),
                            dataType: "JSON",
                            contentType: "application/json;charset=utf-8",
                            success: function (result) {
                                if (result.code === 0) {
                                    layer.msg(result.msg)
                                    //数据刷新
                                    tableIns.reload();
                                    //关闭当前窗口
                                    layer.close(mainIndex);
                                } else {
                                    layer.msg(result.msg);
                                }
                            }
                        });
                        layer.close(index);
                    });
            } else {
                layer.msg("该订单已退房，请勿重复操作！")
            }
        }

    });
</script>

</body>
</html>
