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
    <title>${name}活动 - 代码牛问答邀请函</title>

    <style>
        .js_container {
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 50;
        }

        .container {
            margin-left: auto;
            margin-right: auto;
            width: 740px;
            position: relative;
        }

        body {
            /*  background: #00ada7 none repeat scroll 0 0;*/
            color: #000;
            font-family: Helvetica Neue, 微软雅黑, Helvetica, Arial, sans-serif;
            font-size: 14px;
            margin: 0;
            padding: 0;
            position: relative;
            width: 100%;
        }

        .inviter-info {
            color: #fa9c50;
            font-family: 微软雅黑;
            text-align: center;
            width: inherit;
            z-index: 100;
        }

        .tel {
            height: 80px;
            width: 540px;
            border-radius: 10px;
            font-size: 20px;
            padding-left: 10px;
        }
    </style>

</head>

<body>

<div class="container js_container">
    <img width="100%" src="http://cdn.jiying.mobi/invite/daimaniu_bg.png">
    <div style="margin-top: -480px;color: white;font-size: 22px;">
        <div style="text-align: center">
            <h1><span class="inviter-info">${name}活动</span>
                <br><span>立即注册获得问答体验券</span></h1>
        </div>
        <div style="text-align: center;margin-top: 20px;">
            <input type="tel" maxlength="11" placeholder="请输入注册的手机号" class="tel" id="phone"/>
        </div>
        <br>
        <div style="text-align: center;margin-top: 20px;">
            <img class="receive-button" id="submit" src="http://cdn.jiying.mobi/invite/registerButton.png"/>
        </div>
    </div>
</div>

<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script>
    var path = location.pathname.split('/');
    prefix = path[0];
    function isMobile(str) {
        var reg = /^[1][34578]\d{9}$/;
        return reg.test(str);
    }

    $(document).ready(function () {
        var code = "${code}";
        var type = "${type}";

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
                            location.href = prefix + "/m/invite/finish"
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