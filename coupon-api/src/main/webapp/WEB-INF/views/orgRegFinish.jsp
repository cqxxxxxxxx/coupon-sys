<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no"
          name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <title>领取优惠券</title>
    <script src="<c:url value="/resources/js/jquery.js"/>"></script>

    <style>
        body {
            margin: 0;
            padding: 0;
            position: relative;
            width: 100%;
        }
        .content {
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 50;
        }

        .logo{
            float: right;
            margin-top: 38%;
            margin-right: 10%;
            z-index: 100;
            position: relative;
        }
        .logo0{
            margin-top: 38%;
            margin-left: 10%;
            z-index: 100;
            position: absolute;
        }
        .QRcode {
            width: 100%;
            text-align: center;
            margin-top: 87%;
            z-index: 100;
        }
        .info{
            color: #FFFFFF;
            font-family : 微软雅黑;
            font-size: 20px;
            text-align: center;
            letter-spacing:1.5px;
            margin-top: 8%;
            width: inherit;
            z-index: 100;
            position: absolute;
        }
    </style>

</head>

<body>
<img width="100%" src="/resources/imgs/orgbg2.png">
<div class="content">
    <div class="logo0">
        <img src="/resources/imgs/daimaniulogo.png" width="120px" height="120px">
    </div>
    <div class="logo">
        <%--<img src="${logo}" width="110px" height="143px">--%>
        <img src="/resources/imgs/ubulogo.png" width="120px" height="120px">
    </div>
    <div class="QRcode">
        <img src="/resources/imgs/QRcode0.png" width="230px", height="230px">
    </div>
    <div class="info">扫描下载代码牛APP,&nbsp;立即领取</div>
</div>
</body>
</html>