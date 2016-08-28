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
            <li class="<c:if test="${param.index eq 'index'}">active</c:if>">
                <a href="/chart/todayInfo"><span class="nav-label">首页</span><span class="fa arrow"></span> </a>
            </li>
            <li class="<c:if test="${param.index eq 'Activity'}">active</c:if>">
                <a href="#"><span class="nav-label">活动管理</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li class="<c:if test="${param.index1 eq 'activities'}">active</c:if>"><a
                            href="<c:url value="/activities"/> ">活动列表</a></li>
                    <li class="<c:if test="${param.index1 eq 'addActivity'}">active</c:if>"><a
                            href="<c:url value="/activities/add"/>">添加活动</a>
                    </li>
              <%--      <li class="<c:if test="${param.index1 eq 'updateActivity'}">active</c:if>"><a
                            href="<c:url value="/activities/update"/>">修改活动</a></li>--%>
                </ul>
            </li>
            <li class="<c:if test="${param.index eq 'info'}">active</c:if>">
                <a href="#"><span class="nav-label">查询管理</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level collapse">
                    <li class="<c:if test="${param.index1 eq 'clickInfo'}">active</c:if>"><a
                            href="<c:url value="/clickinfo"/> ">活动点击量信息查询</a></li>
                    <li class="<c:if test="${param.index1 eq 'shareInfo'}">active</c:if>"><a
                            href="<c:url value="/shareinfo"/> ">已参加用户信息查询</a></li>
                    <li class="<c:if test="${param.index1 eq 'chartInfo'}">active</c:if>"><a
                            href="<c:url value="/chart"/> ">访问量查询</a>
                    </li>
                    <li class="<c:if test="${param.index1 eq 'personalInfo'}">active</c:if>"><a
                            href="<c:url value="/chart/personal"/> ">分享数查询</a>
                    </li>
                   <%-- <li class="<c:if test="${param.index1 eq 'chartInfo'}">active</c:if>"><a
                            href="<c:url value="/chart/today"/> ">今日访问量查询</a>
                    </li>
                    <li class="<c:if test="${param.index1 eq 'personalInfo'}">active</c:if>"><a
                            href="<c:url value="/chart/today/personal"/> ">今日分享数查询</a>
                    </li>--%>
                </ul>
            </li>
    <li class="<c:if test="${param.index eq 'org'}">active</c:if>">
        <a href="#"><span class="nav-label">企业活动管理</span><span class="fa arrow"></span> </a>
        <ul class="nav nav-second-level collapse">
            <li class="<c:if test="${param.index1 eq 'orginfo'}">active</c:if>"><a
                    href="<c:url value="/organization"/> ">企业活动列表</a></li>
            <li class="<c:if test="${param.index1 eq 'addorg'}">active</c:if>"><a
                    href="<c:url value="/organization/add"/> ">添加企业</a></li>
        </ul>
    </li>
        </ul>
    </div>
</aside>
