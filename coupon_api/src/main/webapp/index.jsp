<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Index</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="<c:url value="/resources/js/jquery.js"/>"></script>
    <script src="/resources/js/jquery.form.js"></script>
    <script src="/rescources/js/bootstrap.js"></script>


</head>
<body>
<div class="container">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="index.jsp">主页</a></li>
        <li role="presentation"><a href="/activityList">活动列表</a></li>
        <li role="presentation"><a href="/checkinfo.jsp">信息查询</a></li>
    </ul>


</div>
</body>
</html>
