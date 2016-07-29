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
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <title>领取优惠券</title>
    <link rel="stylesheet" href="css/modal.css">
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
            top: 0;
            z-index: 50;
        }

        @media only screen and (min-width:321px) {
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
                margin-top: 180px !important;
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

        .receive-info span.share-money {
            color: #FF3C00;
            font-size: 25px;
        }

        .receive-button {
            width: 90%;
            height: 50px;
            line-height: 50px;
            color: #fff;
            margin: 0 auto;
            margin-top: 40px;
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
<img width="100%" src="/resources/imgs/bg1.png">
<div class="receive-content">
    <div class="money">优惠券活动</div>
    <div class="receive-info">
        嗨！我是<span class="share-name">${type}</span><br> 邀请您参加<span class="share-money">${activity.getTitle()}</span>
        具体活动如下:${activity.getDes()}
    </div>
    <input type="tel" maxlength="11" placeholder="请输入您领取优惠券的手机号" class="tel">
    <div class="receive-button" id="button1">领取优惠券</div>

</div>
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/global.js" type="text/javascript"></script>
<script>
    var args = getQueryStringArgs();
    var host = window.location.host;
    document.querySelector('.share-name').innerHTML = args.name;

    function isMobile(str) {
        var reg = /^[1][34578]\d{9}$/;
        return reg.test(str);
    }
    document.querySelector('.receive-button').addEventListener('click', function() {
        var url = "shareinfo/add";
        var phone = document.querySelector('.tel').value;
        var code = ${code};
        var type = ${type};
        if (isMobile(tel)) {
            $.ajax({
                url: url,
                type: "POST",
                data: 'code=' + code + '&type=' + type + '&phone=' + phone,
                dataTyp: 'html',
                success: function (data) {
                    console.log(data);
                    if (data == "success") {
                        console.log("success");
                        cleanForm();
                        toastr.success('领取成功');
                    } else {
                        console.log("failed");
                        toastr.error('领取失败，已经领取过了');
                    }
                }
            });
        } else if (phone == '') {
            alert('手机号码不能为空');
        } else {
            alert('无效的手机号码');
        }
    }, false);
</script>
<script type="text/javascript">
    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cspan id='cnzz_stat_icon_1258874133'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1258874133' type='text/javascript'%3E%3C/script%3E"));
</script><span id="cnzz_stat_icon_1258874133"><a title="站长统计" target="_blank" href="http://www.cnzz.com/stat/website.php?web_id=1258874133">站长统计</a></span><script type="text/javascript" src=" http://s95.cnzz.com/z_stat.php?id=1258874133"></script><script type="text/javascript" charset="utf-8" src="http://c.cnzz.com/core.php?web_id=1258874133&amp;t=z"></script>


</body></html>