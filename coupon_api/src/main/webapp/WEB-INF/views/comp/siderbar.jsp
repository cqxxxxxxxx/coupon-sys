<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<aside id="menu">
    <div id="navigation">
        <div class="profile-picture">
            <a href="">
                <img src="http://7xijg6.com1.z0.glb.clouddn.com/19441948517.jpg?imageView/2/w/100/h/100"
                     class="img-circle m-b" alt="logo">
            </a>

            <div class="stats-label text-color">
                <span class="font-extra-bold font-uppercase">${signin_user.username}</span>

                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                        <small class="text-muted">管理员<b class="caret"></b></small>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="#">个人信息</a></li>
                        <li class="divider"></li>
                        <li><a href="#" class="logout">退出</a></li>
                    </ul>
                </div>

                <div>
                    <h5 class="font-extra-bold m-b-xs">
                        优惠券活动系统.
                    </h5>
                </div>
            </div>
        </div>

        <ul class="nav" id="side-menu">
<%--            <li class="<c:if test="${param.index eq 'dashboard'}">active</c:if>">
                <a href="<c:url value="/"/>"> <span class="nav-label">控制面板</span>
                </a>
            </li>--%>
            <li class="<c:if test="${param.index eq 'activity'}">active</c:if>">
                <a href="#"><span class="nav-label">活动管理</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li class="<c:if test="${param.index1 eq 'activities'}">active</c:if>"><a
                            href="<c:url value="/activities"/> ">活动列表</a></li>
                    <li class="<c:if test="${param.index1 eq 'addActivity'}">active</c:if>"><a
                            href="<c:url value="/activities/add"/>">添加活动</a>
                    </li>
                    <li class="<c:if test="${param.index1 eq 'updateActivity'}">active</c:if>"><a
                            href="<c:url value="/activities/update"/>">修改活动</a></li>
                </ul>
            </li>
            <li class="<c:if test="${param.index eq 'info'}">active</c:if>">
                <a href="#"><span class="nav-label">查询管理</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li class="<c:if test="${param.index1 eq 'clickinfo'}">active</c:if>"><a
                            href="<c:url value="/clickinfo"/> ">活动点击量信息查询</a></li>
                    <li class="<c:if test="${param.index1 eq 'shareinfo'}">active</c:if>"><a
                            href="<c:url value="/shareinfo"/> ">已参加动用户信息查询</a></li>
                </ul>
            </li>
            <li class="<c:if test="${param.index eq 'advice'}">active</c:if>">
                <a href="<c:url value="/clickinfo/100/cqx100/火狐/192.1.1"/> "><span class="nav-label">个人分享链接</span></a>
            </li>

            <%--<li>--%>
            <%--<a href="../html/gift1.html"> <span--%>
            <%--class="nav-label">有礼兑换管理</span></a>--%>
            <%--</li>--%>
<%--            <li class="<c:if test="${param.index eq 'about'}">active</c:if>">
                <a href="<c:url value="/datatable.jsp"/> "> <span class="nav-label">DataTable</span></a>
            </li>--%>
        </ul>
    </div>
</aside>
<script type="text/javascript">
    var path = location.pathname.split('/');
    var app = path[1];
    var prefix = "/" + app;
    $('.logout').click(function (e) {
        $.post(prefix + '/logout', function (data) {
            if (data == "success") {
                window.location.href = prefix + "/login";
            }
        });
    })
</script>