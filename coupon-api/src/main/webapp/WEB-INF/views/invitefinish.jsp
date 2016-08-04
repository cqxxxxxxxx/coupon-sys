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
        body {
            margin: 0;
            padding: 0;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            width: 100%;
            position: relative;
            font-size: 14px;
            color: #000;
            background: #6d4a34;
        }

        #cnzz_stat_icon_1258874133 {
            display: none;
        }

        .receive-content {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 31%;
            z-index: 50;
        }

        @media only screen and (min-width: 321px) {
            .money {
                width: 30%;
                height: 70px;
                margin-top: 18%;
                margin-left: 26%;
                line-height: 40px;
                padding-top: 10px;
                color: #cf0036;
                text-align: center;
                font-size: 30px;
            }

            .receive-info {
                width: 100%;
                color: #333;
                font-size: 16px;
                text-align: center;
                line-height: 25px;
                margin-top: 25px;
            }

            .tel {
                margin-top: 15px !important;
            }
        }

        @media only screen and (max-width: 320px) {
            .money {
                width: 30%;
                height: 70px;
                margin-top: 18%;
                margin-left: 26%;
                line-height: 30px;
                color: #cf0036;
                text-align: center;
                padding-top: 10px;
                font-size: 30px;
            }

            .receive-info {
                width: 100%;
                color: #333;
                font-size: 16px;
                text-align: center;
                line-height: 25px;
                margin-top: 15px;
            }

            .tel {
                margin-top: 120px !important;
            }
        }

        .receive-info span.share-title {
            color: #FF3C00;
            font-size: 30px;
            font-weight: bold;
        }
        .receive-info span.share-name {
            color: #FF3C00;
            font-size: 20px;
            font-weight: bold;
        }
        .receive-button {
            width: 90%;
            height: 50px;
            line-height: 50px;
            color: #fff;
            margin: 0 auto;
            margin-top: 30px;
            text-align: center;
            font-size: 20px;
            background: #e03500;
            -webkit-border-radius: 10px;
            border-radius: 10px;
        }

        .discount-info {
            width: 60px;
            text-align: center;
            color: #fff;
            margin: 0 auto;
            line-height: 20px;
            margin-top: 30px;
            border-bottom: 1px solid #fff;
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


</body>
</html>