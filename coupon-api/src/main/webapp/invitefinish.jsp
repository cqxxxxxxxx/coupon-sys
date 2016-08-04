<html>
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


        .logo {
            width: auto;
            height: auto;
            position: absolute;
            left: 20%;
            top: 30%;
            z-index: 50;
        }

        .logo img {
            width: 432px;
            height: 569px;
        }

        .discount-info a {
            text-decoration: none;
            color: #fff;
        }

        input[type='tel'] {
            width: 90%;
            margin: 0 auto;
            display: block;
            height: 50px;
            border-radius: 10px;
            padding: 0;
            border: none;
            -webkit-appearance: none;
            appearance: none;
            -webkit-box-shadow: none;
            box-shadow: none;
            font-size: 16px;
            text-align: center;
        }
    </style>

</head>

<body>
<img width="100%" src="/resources/imgs/invitefinish.png">
<div class="logo" >
    <img src="/resources/imgs/logo.png"/>
</div>

</body>
</html>