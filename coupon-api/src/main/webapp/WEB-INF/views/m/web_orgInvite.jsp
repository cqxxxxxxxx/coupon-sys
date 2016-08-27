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
            /* background: #00ada7 none repeat scroll 0 0;*/
            color: #000;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            margin: 0;
            padding: 0;
            position: relative;
            width: 100%;
        }

        .receive-content {
            z-index: 50;
            margin-left: auto;
            margin-right: auto;
            width: 740px;
            position: relative;
        }

        .receive-button {
            margin-top: 50px;
        }

        .logo {
            float: right;
            z-index: 100;
            position: relative;
            width: 50%;
            text-align: center;
        }

        .logodes {
            color: #c7fffd;
            font-size: 17px;
            letter-spacing: 5px;
            text-align: center;
            z-index: 100;
            position: relative;
        }

        .daimaniu {
            text-align: center;
            z-index: 100;
            position: relative;
            width: 50%;
            float: left;
        }

        .daimaniudes {
            color: #c7fffd;
            font-size: 17px;
            font-family: 微软雅黑;
            text-align: center;
            z-index: 100;
            position: relative;
        }

        .receive-info {
            color: #fa9c50;
            display: block;
            font-family: 微软雅黑;
            font-size: 22px;
            text-align: center;
            letter-spacing: 1px;
            width: inherit;
            z-index: 100;
            position: relative;
            margin-top: 480px;

        }

        .receive-info span {
            color: #FFFFFF;
        }

        .receive-info1 {
            color: #FFFFFF;
            display: block;
            font-family: 微软雅黑;
            font-size: 18px;
            width: inherit;
            text-align: center;
            letter-spacing: 1px;
            z-index: 100;
            position: relative;
            margin-top: 10px;
        }

        input[type='tel'] {
            width: 76%;
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
            position: relative;
            margin: 50px auto 0 13%;
        }
    </style>

</head>

<body>
<div class="receive-content">
    <img width="100%" src="http://cdn.jiying.mobi/invite/orgInvitebg.png">
    <div style="margin-top: -960px;">
        <div style="display: inline">
            <div class="daimaniu">
                <img src="http://cdn.jiying.mobi/invite/daimaniulogo.png" width="120px" height="120px">
                <p id="dmn" class="daimaniudes">代码牛</p>
            </div>
            <div class="logo">
                <img src="${logo}" width="120px" height="120px">
                <p id="logodes" class="logodes">${name}</p>
            </div>
        </div>
        <br>
        <div class="receive-info">代码牛<span>&nbsp;&nbsp;联合&nbsp;&nbsp;</span>${name}</div>
        <div class="receive-info1">邀请您参与代码牛技术问答公测<br>注册并领取体验券</div>
        <input type="tel" maxlength="11" placeholder="请输入注册的手机号" class="tel" id="phone"/>
        <div style="text-align: center;margin-top: 20px;">
            <img class="receive-button" id="submit" src="http://cdn.jiying.mobi/invite/registerButton.png"/>
        </div>
    </div>
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
                            alert('领取失败，您已经领取过该优惠券');
                        }
                    },
                    error: function (data) {
                        alert("系统出错，请联系管理员");
                    }
                });
            } else {
                alert('手机号码格式出错，请重新填写');
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