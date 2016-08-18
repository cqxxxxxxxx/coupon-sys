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
    <title>代码牛问答 - 联合邀请函</title>
    <style>

        body {
            background: #00ada7 none repeat scroll 0 0;
            color: #000;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            margin: 0;
            padding: 0;
            position: relative;
            width: 100%;
        }

        .receive-content {
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 50;
        }

        .receive-button {
            width: 60%;
            height: 55px;
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
            margin-top: 152%;
        }

        .logo {
            float: right;
            margin-top: 38%;
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
            margin-top: 38%;
            margin-left: 10%;
            z-index: 100;
            position: absolute;
        }

        .daimaniudes {
            margin-top: 75%;
            margin-left: 6%;
            z-index: 100;
            position: absolute;
        }

        .receive-info {
            color: #fa9c50;
            display: block;
            font-family: 微软雅黑;
            font-size: 22px;
            text-align: center;
            letter-spacing: 1px;
            margin-top: 102%;
            width: inherit;
            z-index: 100;
            position: absolute;
        }

        .receive-info span {
            color: #FFFFFF;
        }

        .receive-info1 {
            color: #FFFFFF;
            display: block;
            font-family: 微软雅黑;
            font-size: 18px;
            margin-top: 115%;
            width: inherit;
            text-align: center;
            letter-spacing: 1px;
            z-index: 100;
            position: absolute;
        }

        input[type='tel'] {
            width: 76%;
            margin: 0 auto;
            display: block;
            height: 50px;
            border-radius: 10px;
            padding: 0;
            border: none;
            -webkit-appearance: none;
            -webkit-box-shadow: none;
            box-shadow: none;
            font-size: 20px;
            text-align: center;
            z-index: 1000;
            position: absolute;
            margin-left: 13%;
            margin-top: 134%;
        }
    </style>

</head>

<body>
<img width="100%" src="http://cdn.jiying.mobi/invite/orgbg1.png">
<div class="receive-content">
    <div class="daimaniu">
        <img src="http://cdn.jiying.mobi/invite/daimaniulogo.png" width="120px" height="120px">
        <div id="dmn" class="logodes">代码牛</div>
    </div>
    <%--<div class="daimaniudes">--%>
    <%--<img src="http://cdn.jiying.mobi/invite/daimaniudes.png" width="140px" height="35px">--%>
    <%--</div>--%>
    <div class="logo">
        <img src="${logo}" width="120px" height="120px">
        <div id="logodes" class="logodes">${name}</div>
    </div>

    <div class="receive-info">代码牛<span>&nbsp;&nbsp;联合&nbsp;&nbsp;</span>${name}</div>
    <div class="receive-info1">邀请您参与代码牛技术问答公测<br>注册并领取体验券</div>
    <input type="tel" maxlength="11" placeholder="请输入注册的手机号" class="tel" id="phone"/>
    <div class="receive-button" id="submit"></div>
</div>

<script src="//cdn.bootcss.com/zepto/1.1.6/zepto.min.js"></script>
<script>
    var path = location.pathname.split('/');
    prefix = path[0];
    prefix1 = path[1];
    function isMobile(str) {
        var reg = /^[1][34578]\d{9}$/;
        return reg.test(str);
    }

    function check(data) {
        var str = /[_a-zA-Z]/;
        if (str.test(data)) {
            $('#logodes').css("font-family", "Corbel");
        } else {
            $('#logodes').css("font-family", "微软雅黑");
        }
    }

    $(document).ready(function () {

        var logodes = '${name}';
        check(logodes);


        if (${timeout}=='1'
        )
        {
            alert("活动已经过期，请下次在来");
            location.href = prefix + "/m/invite/finish";

        }
        if (${remain}=='1'
        )
        {
            alert("优惠券已经发完，请下次在来");
            location.href = prefix + "/m/invite/finish";
        }

        var code = "${code}";
        var type = "${type}";
        console.log("locationname:" + location.pathname);
        console.log(prefix);
        console.log(prefix1);
        $('#submit').click(function () {
            var phone = $('#phone').val();
            console.log(code + type + phone + ":" + validForm());
            if (isMobile(phone)) {
                $.ajax({
                    url: prefix + "/m/invite/add",
                    type: 'POST',
                    data: 'ref=' + code + '&type=' + type + '&phone=' + phone,
                    dataTyp: 'html',
                    success: function (data) {
                        console.log(data);
                        if (data == "success") {
                            console.log("success");
                            cleanForm();
                            location.href = prefix + "/m/invite/finish?type=2&logo=${logo}";
                        } else {
                            console.log("failed");
                            alert('领取失败，已经领取过了');
                        }
                    },
                    error: function (data) {
                        alert("失败");
                    }
                });
            } else {
                alert('phone格式不对');
            }
        });

        function cleanForm() {
            $('#title').val('');
            $('#des').val('');
        }

        function validForm() {
            if ($('#phone').val().trim() == "") {
                return false;
            }
            return true;
        }
    });
</script>
</body>
</html>