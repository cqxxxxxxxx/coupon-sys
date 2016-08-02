<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Index</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>

</head>
<body class="fixed-navbar">

<!-- Header -->
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>

<!--Aside Menu -->
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value=""/>
    <jsp:param name="index1" value=""/>
</jsp:include>
<div id="wrapper">
    <div class="content animate-panel">
    </div>
</div>
<%--<div class="container">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="index.jsp">主页</a></li>
        <li role="presentation"><a href="/activityList">活动列表</a></li>
        <li role="presentation"><a href="/checkinfo.jsp">信息查询</a></li>
    </ul>--%>


</body>
</html>
