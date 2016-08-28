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
            z-index: 50;
            margin-left: auto;
            margin-right: auto;
            width: 740px;
            position: relative;
        }

        .QRcode {
            width: 100%;
            text-align: center;
            z-index: 100;
            margin-top: 380px;
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
            position: relative;
        }

        .logo {
            float: right;
            margin-right: 20%;
            z-index: 100;
            position: relative;
        }

        .daimaniu {
            margin-left: 20%;
            z-index: 100;
            position: relative;
        }

    </style>

</head>

<body>
<div class="content">
    <img width="100%" src="http://cdn.jiying.mobi/invite/orgInvitebg.png">
    <div style="margin-top: -960px;">
        <div>
            <img class="daimaniu" src="http://cdn.jiying.mobi/invite/daimaniulogo.png" width="120px" height="120px">
            <img class="logo" src="${logo}" width="120px" height="120px">
        </div>
        <div class="QRcode">
            <img src="http://cdn.jiying.mobi/invite/QRcode0.png" width="250px" , height="250px">
        </div>
        <div class="info">扫描下载代码牛APP,&nbsp;立即领取</div>
    </div>
</div>
</body>
</html>