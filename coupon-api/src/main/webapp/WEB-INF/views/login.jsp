<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>优惠券 | 管理系统登录</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
</head>
<body class="blank">

<div class="color-line"></div>

<div class="login-container">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center m-b-md">
                <h3>优惠券管理系统</h3>
            </div>
            <div class="hpanel">
                <div class="panel-body">
                    <c:url var="auth" value="/login"/>
                    <form:form id="loginForm" method="post" modelAttribute="adminLoginForm"
                               accept-charset="utf-8" action="${auth}">
                        <div class="form-group">
                            <label for="username" class="control-label">管理员帐号</label>
                            <form:input type="text" path="username" class="form-control" id="username" name="username"
                                        required=""/>
                        </div>
                        <div class="form-group center">
                            <form:errors path="username" cssClass="badge-danger"/>
                        </div>
                        <div class="form-group">
                            <label for="password" class="control-label">密码</label>
                            <form:input type="password" path="password" class="form-control" id="password"
                                        name="password"/>
                        </div>
                        <div class="form-group center">
                            <form:errors path="password" cssClass="badge-danger"/>
                        </div>
                        <div class="checkbox">
                            <div class="checked" style="position: relative;"><form:checkbox path="remember"
                                                                                            checked="" class="i-checks"
                                                                                            style="position: absolute; opacity: 0;"/>
                                记住密码
                            </div>

                            <p class="help-block small">(请保证你在私人网络下)</p>
                        </div>
                        <button type="submit" class="btn btn-success btn-block">登录</button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>