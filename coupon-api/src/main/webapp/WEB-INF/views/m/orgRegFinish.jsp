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
    <title>已领优惠券,请注册使用</title>

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

        .QRcode {
            width: 100%;
            text-align: center;
            margin-top: 87%;
            z-index: 100;
        }

        .info {
            color: #FFFFFF;
            font-family: 微软雅黑;
            font-size: 20px;
            text-align: center;
            letter-spacing: 1.5px;
            margin-top: 10px;
            width: inherit;
            z-index: 100;
            position: absolute;
        }

        .logo {
            float: right;
            margin-top: 22%;
            margin-right: 10%;
            z-index: 100;
            position: relative;
        }

        .logodes {

            color: #c7fffd;
            font-size: 17px;
            letter-spacing: 5px;
            text-align: center;
            margin-top: 15%;
            z-index: 100;
            position: relative;
        }

        .daimaniu {
            margin-top: 22%;
            margin-left: 10%;
            z-index: 100;
            position: absolute;
        }

        .daimaniudes {
            color: #c7fffd;
            font-size: 17px;
            font-family: 微软雅黑;
            letter-spacing: 5px;
            text-align: center;
            margin-top: 15%;
            z-index: 100;
            position: relative;
        }
    </style>

</head>

<body>
<img width="100%" src="http://cdn.jiying.mobi/invite/orgInvitebg.png">
<div class="content">
    <div class="daimaniu">
        <img src="http://cdn.jiying.mobi/invite/daimaniulogo.png" width="120px" height="120px">

    </div>
    <%--<div class="daimaniudes">--%>
    <%--<img src="http://cdn.jiying.mobi/invite/daimaniudes.png" width="140px" height="35px">--%>
    <%--</div>--%>
    <div class="logo">
        <img src="${logo}" width="120px" height="120px">

    </div>
    <div class="QRcode">
        <img src="http://cdn.jiying.mobi/invite/QRcode0.png" width="200px" , height="200px">
    </div>
    <div class="info">扫描下载代码牛APP,&nbsp;立即领取</div>
</div>
</body>
</html>