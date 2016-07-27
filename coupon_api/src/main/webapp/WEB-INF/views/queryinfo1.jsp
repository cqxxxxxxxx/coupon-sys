<%--
  Created by IntelliJ IDEA.
  User: cqxxxxx
  Date: 2016/7/27
  Time: 15:30
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
    <title>查询页面</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
</head>
<body>
<div class="fixed-navbar fixed-sidebar">
    <%--header--%>
    <jsp:include page="comp/header.jsp"/>

    <%--Aside menu--%>
    <jsp:include page="comp/siderbar.jsp">
        <jsp:param name="index" value="info"/>
        <jsp:param name="index1" value="shareinfo"/>
    </jsp:include>
    <!--Main Wrapper-->
    <div id="wrapper">

        <div class="content animate-panel">
            <div class="transition animated fadeIn">
                <div class="hpanel">
                    <div class="panel-body">
                        <!--m-b-xs margin bottom 元素的下外边距-->
                        <h2 class="font-light m-b-xs">
                            活动列表
                        </h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 animated-panel zoomIn" style="animation-delay: 0.1s;">
                    <div class="hpanel">
                        <div class="panel-body">
                            <div id="">
                                <div>
                                    <div>
                                        <table class="table table-striped table-bordered"
                                               id="admin-table">
                                            <thead>
                                            <tr role="row">
                                                <th class="table-id">ID</th>
                                                <th>活动编号
                                                </th>
                                                <th>活动主题
                                                </th>
                                                <th>活动内容
                                                </th>
                                                <th>新建时间
                                                </th>
                                                <th>修改事件
                                                </th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Footer-->
        <jsp:include page="/WEB-INF/views/comp/footer.jsp"/>

    </div>
</div>

</body>
</html>
