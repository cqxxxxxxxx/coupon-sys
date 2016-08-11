
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
            background: #00ada7 none repeat scroll 0 0;
            color: #000;
            font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
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
        .receive-info{
            color: #fa9c50;
            display: block;
            font-family : 微软雅黑;
            font-size: 22px;
            text-align: center;
            letter-spacing:1px;
            margin-top: 108%;
            width: inherit;
            z-index: 100;
            position: absolute;
        }
        .receive-info span{
            color: #FFFFFF;
        }
        .receive-info1{
            color: #FFFFFF;
            display: block;
            font-family : 微软雅黑;
            font-size: 18px;
            margin-top: 120%;
            width: inherit;
            text-align: center;
            letter-spacing:1px;
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
<img width="100%"  src="/resources/imgs/orgbg1.png">
<div class="receive-content">
    <div class="logo0">
        <img src="/resources/imgs/daimaniulogo.png" width="120px" height="120px">
    </div>
    <div class="logo">
        <%--<img src="${logo}" width="110px" height="143px">--%>
            <img src="/resources/imgs/ubulogo.png" width="120px" height="120px">
    </div>
    <div class="receive-info">代码牛<span>&nbsp;&nbsp;联合&nbsp;&nbsp;</span>${name}</div>
    <div class="receive-info1">邀请您使用代码牛,并送您￥50优惠券</div>
    <input type="tel" maxlength="11" placeholder="请输入注册的手机号" class="tel" id="phone"/>
    <div class="receive-button" id="submit"></div>
</div>


<script>
    var path = location.pathname.split('/');

    function isMobile(str) {
        var reg = /^[1][34578]\d{9}$/;
        return reg.test(str);
    }

    $(document).ready(function () {
        var code = "${code}";
        var type = "${type}";
        console.log("locationname:"+location.pathname);
        $('#submit').click(function () {
            var phone = $('#phone').val();
            console.log(code+type+phone+":"+validForm());
            if (isMobile(phone)) {
                $.ajax({
                    url: "invite/add",
                    type: 'POST',
                    data: 'ref=' + code + '&type=' + type + '&phone=' + phone,
                    dataTyp: 'html',
                    success: function (data) {
                        console.log(data);
                        if (data == "success") {
                            console.log("success");
                            cleanForm();
                            location.href="invite/finish?type=2"
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