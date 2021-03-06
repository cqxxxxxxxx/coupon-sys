<%--
  Created by IntelliJ IDEA.
  User: cqxxxxx
  Date: 2016/8/19
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--page title-->
    <title>访问量查询</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker3.min.css"/>">

</head>
<body class="fixed-navbar fixed-sidebar">
<%--header--%>
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>

<%--Aside menu--%>
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value="info"/>
    <jsp:param name="index1" value="chartInfo"/>
</jsp:include>
<div id="wrapper">
    <div class="content">
        <div class="hpanel">
            <div class="panel-body">
                <h2 class="font-light m-b-xs">
                    活动管理
                </h2>
                <small>
                    <ol class="hbreadcrumb breadcrumb">
                        <li><a href="">活动管理</a></li>
                        <li>
                            <span>点击量查询</span>
                        </li>
                    </ol>
                </small>
            </div>
            <br>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-7">
                        <div id="main" style="width: 1000px;height:500px;"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group" style="margin-left: 15%">
                        <div class="col-sm-3">
                            <label class="control-label inline">开始日期</label>
                            <div class="input-group date">
                                <input id="beginDate" type="text"
                                       class="form-control"><span
                                    class="input-group-addon"><i
                                    class="fa fa-clock-o"></i></span>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <label class="control-label inline">截止日期</label>
                            <div class="input-group date">
                                <input id="endDate" type="text"
                                       class="form-control"><span
                                    class="input-group-addon"><i
                                    class="fa fa-clock-o"></i></span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <label class="control-label inline">活动编号</label>
                            <div class="input-group">
                                <input type="text" id="code" placeholder="活动编号" class="form-control ">
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <label class="control-label inline">&nbsp;</label>
                            <div class="input-group">
                                <button id="submit" class="btn btn-primary" type="submit">提交</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/comp/footer.jsp"/>
</div>

<script src="<c:url value="/resources/js/jquery.dataTables.js"/>"></script>
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.min.js"/>"></script>
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.zh-CN.min.js"/>"></script>
<script src="<c:url value="/resources/js/echarts.js"/>"></script>
<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('main'));

    $(function () {
        $('.date').datepicker({
            language: 'zh-CN'
        });
        myChart.showLoading();
        var prefix = "${pageContext.request.contextPath}";
        console.log(prefix);
        console.log(new Date().getTime());
        $.ajax({
            url: "/chart/data",
            type: "GET",
            dataType: "JSON",
            success: function (data) {
                myChart.hideLoading();
                console.log("success");
                console.log(data);
                myChart.setOption({
                    title: {
                        text: '访问量统计图表',
                        subtext: '全部活动',

                    },
                    tooltip: {
                        trigger: 'axis',
                    },
                    legend: {
                        data: ['访问总量', '独立Ip访问量', '优惠券注册量', 'APP注册量']
                    },
                    dataZoom:[
                        {
                            id: 'dataZoomX',
                            type:'slider',
                            xAxisIndex:[0],
                            filterMode:'filter'
                        },
                    ],

                    toolbox: {
                        show: true,
                        feature: {
                            mark: {show: true},
                            magicType: {show: true, type: ['line', 'bar', 'tiled']},
                            restore: {show: true},
                            saveAsImage: {show: true},
                            dataView: {show: true, readOnly: true,
                                lang: ['数据视图', '关闭',''],
                                optionToContent: function(opt) {
                                    var axisData = opt.xAxis[0].data;
                                    var series = opt.series;
                                    var table = '<table id="datatable" class="table table-striped table-bordered  hover" style="width:100%;text-align:center">'
                                            + '<thead><tr>'
                                            + '<th>时间</th>'
                                            + '<th>' + series[0].name + '</th>'
                                            + '<th>' + series[1].name + '</th>'
                                            + '<th>' + series[2].name + '</th>'
                                            + '<th>' + series[3].name + '</th>'
                                            + '</tr></thead>'
                                            + '<tbody>';
                                    for (var i = 0, l = axisData.length; i < l; i++) {
                                        table += '<tr>'
                                                + '<td>' + axisData[i] + '</td>'
                                                + '<td>' + series[0].data[i] + '</td>'
                                                + '<td>' + series[1].data[i] + '</td>'
                                                + '<td>' + series[2].data[i] + '</td>'
                                                + '<td>' + series[3].data[i] + '</td>'
                                                + '</tr>';
                                    }
                                    table += '</tbody></table>';
                                    return table;
                                }

                            }
                        }
                    },
                    calculable: true,
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: data.vCategories
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name: '访问总量',
                            type: 'line',
                        /*    stack: '总量',*/
                            data: data.vValues,
                        },
                        {
                            name: '独立Ip访问量',
                            type: 'line',
                        /*    stack: '总量',*/
                            data: data.dValues
                        },
                        {
                            name: '优惠券注册量',
                            type: 'line',
                      /*      stack: '总量',*/
                            data: data.rValues
                        },
                        {
                            name: 'APP注册量',
                            type: 'line',
                        /*    stack: '总量',*/
                            data: data.aValues
                        },
                    ]
                });
            }
        });

        $('#submit').click(function () {
            var code = $('#code').val().trim();
            var begin = $('#beginDate').val().trim().replace("年", "-").replace("月", "-").replace("日", "");
            var end = $('#endDate').val().trim().replace("年", "-").replace("月", "-").replace("日", "");
            console.log(code + "--" + begin + "--" + end)
            $.ajax({
                url: "/chart/data",
                type: "GET",
                data: "code=" + code + "&begin=" + begin + "&end=" + end,
                dataType: "JSON",
                success: function (data) {
                    myChart.hideLoading();
                    console.log("success");
                    console.log(data);
                    myChart.setOption({
                        title: {
                            text: '访问量统计图表',
                            subtext: '活动：'+code,
                        },
                        dataZoom:[
                            {
                                id: 'dataZoomX',
                                type:'slider',
                                xAxisIndex:[0],
                                filterMode:'filter'
                            },
                        ],
                        tooltip: {
                            trigger: 'axis',
                        },
                        legend: {
                            data: ['访问总量', '独立Ip访问量', '优惠券注册量', 'APP注册量']
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: {show: true},
                                magicType: {show: true, type: ['line', 'bar', 'tiled']},
                                restore: {show: true},
                                saveAsImage: {show: true},
                                dataView: {show: true, readOnly: true,
                                    lang: ['数据视图', '关闭',''],
                                    optionToContent: function(opt) {
                                        var axisData = opt.xAxis[0].data;
                                        var series = opt.series;
                                        var table = '<table id="datatable" class="table table-striped table-bordered  hover" style="width:100%;text-align:center">'
                                                + '<thead><tr>'
                                                + '<th>时间</th>'
                                                + '<th>' + series[0].name + '</th>'
                                                + '<th>' + series[1].name + '</th>'
                                                + '<th>' + series[2].name + '</th>'
                                                + '<th>' + series[3].name + '</th>'
                                                + '</tr></thead>'
                                                + '<tbody>';
                                        for (var i = 0, l = axisData.length; i < l; i++) {
                                            table += '<tr>'
                                                    + '<td>' + axisData[i] + '</td>'
                                                    + '<td>' + series[0].data[i] + '</td>'
                                                    + '<td>' + series[1].data[i] + '</td>'
                                                    + '<td>' + series[2].data[i] + '</td>'
                                                    + '<td>' + series[3].data[i] + '</td>'
                                                    + '</tr>';
                                        }
                                        table += '</tbody></table>';
                                        return table;
                                    }

                                }
                            }
                        },
                        calculable: true,
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: data.vCategories
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [
                            {
                                name: '访问总量',
                                type: 'line',
                            /*    stack: '总量',*/
                                data: data.vValues
                            },
                            {
                                name: '独立Ip访问量',
                                type: 'line',
                            /*    stack: '总量',*/
                                data: data.dValues
                            },
                            {
                                name: '优惠券注册量',
                                type: 'line',
                            /*    stack: '总量',*/
                                data: data.rValues
                            },
                            {
                                name: 'APP注册量',
                                type: 'line',
                           /*     stack: '总量',*/
                                data: data.aValues
                            },
                        ]
                    })
                }
            });
        })
    })
</script>


</body>
</html>
