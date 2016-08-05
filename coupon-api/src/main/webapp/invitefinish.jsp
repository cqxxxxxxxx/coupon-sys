
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

    <style type="text/css">
        body {
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            width: 100%;
            position: absolute;
            font-size: 14px;
            color: #000;
            background: #6d4a34;
        }

        .receive-content {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 50;
        }
        .receive-button {
            width: 60%;
            height: 148px;
            line-height: 50px;
            margin: 0 auto;
            text-align: center;
            -webkit-border-radius: 10px;
            border-radius: 10px;
            display: block;
            -webkit-appearance: none;
            appearance: none;
            -webkit-box-shadow: none;
            box-shadow: none;
            z-index: 1000;
            position: absolute;
            margin-left: 21%;
            margin-top: 141%;
        }
        .receive-info{
            color: #FFFFFF;
            display: block;
            font-size: 60px;
            line-height: 25px;
            margin-top: 102%;
            margin-left: 17%;
            font-weight: bold;
            z-index: 100;
            position: absolute;
        }

        input[type='tel'] {
            width: 76%;
            margin: 0 auto;
            display: block;
            height: 180px;
            border-radius: 10px;
            padding: 0;
            border: none;
            -webkit-appearance: none;
            appearance: none;
            -webkit-box-shadow: none;
            box-shadow: none;
            font-size: 60px;
            text-align: center;
            z-index: 1000;
            position: absolute;
            margin-left: 13%;
            margin-top: 121%;
        }
    </style>

</head>

<body>
<img width="100%" src="/resources/imgs/invitefinish.png">
<%--<div class="receive-content" style="margin: auto;">
    &lt;%&ndash; <div class="receive-info">
         ${name}abcdef
         </span><br> 邀请您参加<span class="share-title">${activity.getTitle()}</span>活动<br><br>
     </div>&ndash;%&gt;
    <div class="receive-info">abdEEF</div>
    <input type="tel" maxlength="11" placeholder="请输入您领取优惠券的手机号" class="tel" id="phone"/>
    <div class="receive-button" id="submit"></div>

    &lt;%&ndash;    <div class="discount-info">
            <a href="#">优惠说明</a>
        </div>&ndash;%&gt;
</div>--%>
</body>
</html>