<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>优惠活动 | ${activity.getTitle()}</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
    <style type="text/css">
        .contact-panel img {
            height: 100%;
            width: 100%;
        }

        .project-action {
            margin-top: 0;;
        }

        .sc-goods-list {
            font-size: 12px;
            padding: 5px;
            list-style: none;
            margin: 0;
        }

        .sc-goods-list.pic .goods-card.small-pic {
            width: 50%;
            float: left;
        }

        .sc-goods-list.pic .goods-card {
            margin: 10px 0;
        }

        .sc-goods-list .goods-card {
            position: relative;
            margin: 0 5px;
        }

        .sc-goods-list.pic .goods-card.small-pic.normal .link {
            position: relative;
            margin: 5px;
        }

        .sc-goods-list .link {
            display: block;
            background: #fff;
            min-height: 100px;
        }

        .sc-goods-list .link {
            display: block;
            background: #fff;
            min-height: 100px;
        }

        .sc-goods-list.pic .goods-card.normal .photo-block {
            width: 100%;
        }

        .sc-goods-list.pic .goods-card.small-pic .photo-block {
            height: 143px;
        }

        .sc-goods-list .photo-block {
            text-align: center;
            overflow: hidden;
            position: relative;
            background-color: #f8f8f8;
            background-size: 6px 6px;
        }

        .sc-goods-list.pic .goods-card.small-pic.normal .info {
            width: auto;
        }

        .sc-goods-list.pic .goods-card.small-pic .info {
            font-size: 13px;
        }

        .sc-goods-list.pic .goods-card.normal .info {
            position: absolute;
            height: 22px;
            bottom: 0;
            right: 10px;
            margin: 5px 0;
            padding-left: 0px;
            white-space: nowrap;
            overflow: hidden;
            background: rgba(0, 0, 0, 0.4);
            background-clip: border-box;
            border-radius: 2px;
        }

        .row {
            margin-right: 0px;
            margin-left: 0px;
        }

        .col-xs-12 {
            padding-left: 0px;
            padding-right: 0px;
        }

        .col-xs-6 {
            padding-left: 15px;
            padding-right: 15px;
        }

        .amz-toolbar {
            top: 30px;
            position: fixed;
            right: 0px;
            z-index: 999;
        }

        .amz-toolbar span.am-active {
            display: block;
        }

        .amz-toolbar span {
            display: none;
            opacity: 0.7;
        }

        .am-icon-btn {
            background: rgba(0, 0, 0, 0.4);
            border-radius: 50%;
            box-sizing: border-box;
            color: #fff;
            font-size: 24px;
            height: 48px;
            line-height: 48px;
            width: 48px;
        }

        .am-close, .am-icon-btn, [class*="am-icon-"] {
            display: inline-block;
        }

        .am-close, .am-icon-btn, [class*="am-icon-"] {
            display: inline-block;
        }

        .am-badge, .am-close, .am-icon-btn, .am-icon-fw, .am-icon-li, .am-progress-bar {
            text-align: center;
        }

        .shadow_tip {
            background-color: rgba(0, 0, 0, 0.5);
            top: 0px;
            color: #fff;
            display: block;
            font-weight: 400;
            height: 300px;
            line-height: 30px;
            position: fixed;
            width: 100%;
            text-align: center;
            z-index: 9999;
        }

        .shadow_tip .inner {
            text-align: center;
            padding: 30px;
        }

        .am-icon-btn1 {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 50%;
            box-sizing: border-box;
            color: #fff;
            font-size: 24px;
            height: 48px;
            line-height: 48px;
            width: 48px;
        }

        .xz-close {
            margin-top: 35px;
        }

        .xz-close1 {
            margin-top: -10px;
        }
    </style>
</head>
<body>
<%--<div class="color-line"></div>--%>
<!-- Main Wrapper -->
<div class="row">
    <div class="col-xs-12 animated-panel zoomIn" style="animation-delay: 0.3s;">
        <div class="hpanel hgreen contact-panel">
            <!--</div>-->
            <div id="amz-toolbar" class="amz-toolbar" style="right: 30px;">
                <span id="share"
                      class="am-icon-btn am-icon-arrow-up am-active"
                      title="分享"><i class="pe-7s-share"></i></span>
                <span id="follow" style="margin-top: 10px"
                      class="am-icon-btn am-icon-arrow-up am-active"
                      title="关注公众号"><i class="pe-7s-like2"></i></span>
            </div>

            <div id="tip" class="shadow_tip hide">
                <div class="inner">
                    <img
                            src="<c:url value="/resources/imgs/intro.png"></c:url>"
                            class="img-responsive m-b" alt="intro">
                </div>
                <div><span id="close"
                           class="am-icon-btn1 xz-close"
                           title="关闭提示"><i class="pe-7s-close"></i></span></div>
            </div>

            <div id="tip1" class="shadow_tip hide">
                <br>
                <span style="margin-top: 10px;font-size: 18px">喜欢,就关注我吧</span>
                <br>
                <div class="inner">
                    <img
                            src="<c:url value="/resources/imgs/weixin.jpg"/> "
                            style="height: 150px;width: 150px;" class=" m-b" alt="intro">
                </div>
                <div><span id="close1"
                           class="am-icon-btn1 xz-close1"
                           title="关闭提示"><i class="pe-7s-close"></i></span></div>
            </div>
            <c:choose>
                <c:when test="${empty store.cover}">
                    <img
                            src="<c:url value="/resources/imgs/default.jpg"></c:url>"
                            class="img-responsive m-b" style="height: 250px" alt="logo">
                </c:when>
                <c:otherwise>
                    <img
                        <%--src="${store.cover}"--%>
                            src="/resources/imgs/bg1.png"
                            class="img-responsive m-b" style="height: 250px" alt="logo">
                </c:otherwise>
            </c:choose>

            <div class="store text-center" style="margin-top: -100px">
                <%--如果活动有对应的头像 就显示用户的  没有就显示默认的--%>
                <c:choose>
                    <c:when test="${empty user.avatar}">
                        <img src="<c:url value="/resources/imgs/logo_gray.jpg"></c:url> "
                             style="width: 120px;height: 120px" class="img-circle m-b" alt="logo">
                    </c:when>
                    <c:otherwise>
                        <img src="${user.avatar}"
                             style="width: 120px;height: 120px" class="img-circle m-b" alt="logo">
                    </c:otherwise>
                </c:choose>

                <h3>${activity.getTitle()}</h3>

                <div class="text-muted font-bold m-b-xs">${activity.getDes()}</div>
                <p style="margin-left: 30px;margin-right: 30px">
                    分享链接: localhost:8088/clickinfo/${code}/${type}
                </p></div>
        </div>
    </div>
</div>
<c:forEach var="item" items="${services}" varStatus="status">
    <c:if test="${status.index%2 == 0}">
        <div class="row">
        <a href="<c:url value="/services/${item.id}/consult">
                            <c:param name="ref" value="${ref}"/>
</c:url>">
            <div class="col-xs-6">
                <div class="hpanel hgreen contact-panel">
                    <img src="ui.jpg" class="img-responsive m-b" alt="logo">

                    <p class="text-center"
                       style="margin-top: -20px;background-color: #000000;opacity: 0.3;">
            <span><a class="hide" style="font-weight: bold;color: #ffffff;"
                     href="">${item.name} </a>
            </span>
                    </p>

                    <div class="panel-footer border-top contact-footer">
                        <div class="row">
                            <div class="col-md-12 animated-panel zoomIn"
                                 style="animation-delay: 0.2s;">
                                <div class="contact-stat bold">
                                    <strong>点击咨询</strong></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </a>
    </c:if>
    <c:if test="${status.index%2 == 1}">
        <a href="<c:url value="/services/${item.id}/consult">
                            <c:param name="ref" value="${ref}"/>
</c:url>">
            <div class="col-xs-6">
                <div class="hpanel hgreen contact-panel">
                    <img src="${item.cover}" class="img-responsive m-b" alt="logo">

                    <p class="text-center"
                       style="margin-top: -20px;background-color: #000000;opacity: 0.3;">
            <span class="hide"><a class="hide" style="font-weight: bold;color: #ffffff;"
                                  href="">${item.name} </a>
            </span>
                    </p>

                    <div class="panel-footer border-top contact-footer">
                        <div class="row ">
                            <div class="col-md-12 animated-panel zoomIn" style="animation-delay: 0.2s;">
                                <div class="contact-stat bold">
                                    <strong>点击咨询</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
        </div>
    </c:if>
    <c:if test="${status.index%2 == 0 && status.last}">
        <!--line end-->
        </div>
    </c:if>
</c:forEach>
<jsp:include page="/WEB-INF/views/comp/footer.jsp"/>
</body>
<script type="text/javascript">
    $(function () {
        $('#share').click(function () {
            var $tip = $('#tip');
            if ($tip.hasClass('hide')) {
                $tip.removeClass('hide');
            }
        })

        $('#follow').click(function () {
            var $tip = $('#tip1');
            if ($tip.hasClass('hide')) {
                $tip.removeClass('hide');
            }
        })

        $('#tip').click(function () {
            var $tip = $('#tip');
            if (!$tip.hasClass('hide')) {
                $tip.addClass('hide');
            }
        })

        $('#close').click(function () {
            var $tip = $('#tip');
            if (!$tip.hasClass('hide')) {
                $tip.addClass('hide');
            }
        })

        $('#close1').click(function () {
            var $tip = $('#tip1');
            if (!$tip.hasClass('hide')) {
                $tip.addClass('hide');
            }
        })
        $('#tip1').click(function () {
            var $tip = $('#tip1');
            if (!$tip.hasClass('hide')) {
                $tip.addClass('hide');
            }
        })
    });

/*
    $(function () {
        var path = location.pathname.split('/');
        console.log(location.pathname);
        var app = path[0];
        var url = "${code}/"
       $('#a').href();
    });*/

</script>
</html>