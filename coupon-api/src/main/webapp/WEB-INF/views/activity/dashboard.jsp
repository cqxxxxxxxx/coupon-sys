<%--
  Created by IntelliJ IDEA.
  User: cqxxxxx
  Date: 2016/8/28
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>优惠券管理系统</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker3.min.css"/>">

</head>
<body>
<%--header--%>
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>

<%--Aside menu--%>
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value="index"/>
</jsp:include>
    <div id="wrapper">
        <div class="normalheader transition animated fadeIn">
            <div class="hpanel">
                <div class="panel-body">
        <div class="col-sm-12" style="margin-top: 10px">
            <div class="row">
                <div class="col-sm-4">
                    <h2 class="font-light m-b-xs">
                        首页
                    </h2>
                    <small>
                        <ol class="hbreadcrumb breadcrumb">
                            <li><a href="#">首页</a></li>
                            <li>
                                <span id="name">今日数据统计</span>
                            </li>
                        </ol>
                    </small>
                </div>
                <div class="col-sm-2">
                </div>
                <div class="col-sm-6">
                    <div class="col-md-8 animated-panel zoomIn" style="animation-delay: 0.5s;"><input
                            type="text" id="code" placeholder="活动编号" class="form-control ">
                    </div>
                    <button id="search" class="btn  btn-primary"><i class="fa fa-search"></i>&nbsp;&nbsp;搜索
                    </button>
                </div>
            </div>
        </div>
                    </div>
                </div>
            </div>
        <%--<div class="normalheader transition animated fadeIn">
            <div class="hpanel">
                <div class="panel-body">
                    <h2 class="font-light m-b-xs">
                        首页
                    </h2>
                    <small>
                        <ol class="hbreadcrumb breadcrumb">
                            <li><a href="index.html">首页</a></li>
                            <li>
                                <span>今日数据统计</span>
                            </li>
                        </ol>
                    </small>
                </div>
            </div>
        </div>--%>
        <div class="content animate-panel">
            <div class="row">
                <div class="col-lg-3 animated-panel zoomIn" style="animation-delay: 0.6s;">
                    <div class="hpanel">
                        <div class="panel-body text-center h-200">
                            <i class="pe-7s-add-user fa-4x"></i>

                            <h1 class="m-xs" id="views">${views}</h1>

                            <h3>
                                今日访问量
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 animated-panel zoomIn" style="animation-delay: 0.8s;">
                    <div class="hpanel">
                        <div class="panel-body text-center h-200">
                            <i class="pe-7s-users fa-4x"></i>

                            <h1 class="m-xs" id="dviews">${dviews}</h1>

                            <h3>独立IP访问量
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 animated-panel zoomIn" style="animation-delay: 1s;">
                    <div class="hpanel">
                        <div class="panel-body text-center h-200">
                            <i class="pe-7s-coffee fa-4x"></i>

                            <h1 class="m-xs" id="rviews">${rviews}</h1>

                            <h3>今日优惠券注册数
                            </h3>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 animated-panel zoomIn" style="animation-delay: 1s;">
                    <div class="hpanel">
                        <div class="panel-body text-center h-200">
                            <i class="pe-7s-coffee fa-4x"></i>

                            <h1 class="m-xs" id="aviews">${aviews}</h1>

                            <h3>今日APP注册数
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 animated-panel zoomIn" style="animation-delay: 0.6s;">
                    <div class="hpanel">
                        <div class="panel-body text-center h-200">
                            <i class="pe-7s-chat fa-4x"></i>

                            <h1 class="m-xs" id="pviews">${pviews}</h1>

                            <h3>
                                今日分享者数
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 animated-panel zoomIn" style="animation-delay: 0.6s;">
                    <div class="hpanel">
                        <div class="panel-body text-center h-200">
                            <i class="pe-7s-chat fa-4x"></i>

                            <h1 class="m-xs" id="dpviews">${dpviews}</h1>

                            <h3>
                                今日分享数
                            </h3>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    <jsp:include page="/WEB-INF/views/comp/footer.jsp"/>
    </div>
    <script type="text/javascript">
        $(function () {

            $('#search').click(function () {
                var code = $('#code').val().trim();
                $.ajax({
                    url: "/chart/todayInfo/"+code,
                    type: 'GET',
                    dataType: 'JSON',
                    success: function (data) {
                            console.log(data.views);
                            $('#name').html("编号:"+code);
                            $('#views').html(data.views);
                            $('#dviews').html(data.dviews);
                            $('#rviews').html(data.rviews);
                            $('#aviews').html(data.aviews);
                            $('#pviews').html(data.pviews);
                            $('#dpviews').html(data.dpviews);



                    }
                })


            })

        })

    </script>
</body>
</html>
