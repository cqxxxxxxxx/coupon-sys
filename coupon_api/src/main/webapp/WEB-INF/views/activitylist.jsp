<%--
  Created by IntelliJ IDEA.
  User: cqxxxxx
  Date: 2016/7/19
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.cqx.model.Activity1" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>活动列表</title>
    <script type="text/javascript" src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.form.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
    <link href="/resources/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>

<div class="container">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="index.jsp">主页</a></li>
        <li role="presentation"><a href="/activityList">活动列表</a></li>
        <li role="presentation"><a href="/clickinfo.jsp">信息查询</a></li>

    </ul>

</div>
<div class="container" >

    <div class="list-group">
        <a href="#" class="list-group-item active">
            活动信息
        </a>
        <c:forEach items="${list}" var="item">
            <a href="#" class="list-group-item active">活动名:${item.title}</a>
            <p class="list-group-item-text">${item.des}
                <span class="label label-info"><a href="/clickinfo/${item.code}/offical">官方链接</a> </span>
                <span class="label label-success"><a href="/clickinfo/${item.code}/cqx100">个人链接</a></span></p>
        </c:forEach>


        <nav>
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

</div>



</body>
</html>
