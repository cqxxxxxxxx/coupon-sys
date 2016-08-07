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
    <title>修改活动</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Header -->
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>

<!--Aside Menu -->
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value="Activity"/>
    <jsp:param name="index1" value="updateActivity"/>
</jsp:include>

<!-- Main Wrapper -->
<div id="wrapper">
    <div class="content animate-panel">
        <div class="transition animated fadeIn">
            <div class="hpanel">
                <div class="panel-body">
                    <h2 class="font-light m-b-xs">
                        活动管理
                    </h2>
                    <small>
                        <ol class="hbreadcrumb breadcrumb">
                            <li><a href="index.html">活动管理</a></li>
                            <li>
                                <span>修改活动</span>
                            </li>
                        </ol>
                    </small>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 animated-panel zoomIn" style="animation-delay: 0.3s;">
                <div class="hpanel">
                    <div class="panel-heading">
                        活动信息
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal">
                            <div class="form-group"><label class="col-sm-2 control-label">活动编号</label>

                                <div class="col-sm-10">
                                    <input id="code" type="text" class="form-control m-b" required="true" placeholder="8位字母或者数字">
                                </div>
                            </div>
                            <div class="form-group"><label class="col-sm-2 control-label">活动主题</label>

                                <div class="col-sm-10">
                                    <input id="title" type="text" class="form-control m-b" required="true">
                                </div>
                            </div>
                            <div class="form-group"><label class="col-sm-2 control-label">活动内容</label>

                                <div class="col-sm-10">
                                    <input id="des" type="text" class="form-control m-b" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <button id="submit" class="btn btn-primary">修改活动</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
    <jsp:include page="/WEB-INF/views/comp/footer.jsp"/>
</div>
</div>
</body>
<script type="text/javascript">
    var path = location.pathname.split('/');
    var app = path[1];
    var prefix = "/" + app;

    toastr.options = {      //这个是个通知的插件
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",      //出现多久
        "hideDuration": "1000",     //
        "timeOut": "5000",          //
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    $(document).ready(function () {

        console.log("prefix"+prefix);
        $('#submit').click(function (e) {
            e.preventDefault();
            var title = $('#title').val();
            var des = $('#des').val();
            var code = $('#code').val();
            if (validForm()) {
                $.ajax({
                    url: prefix + "/update",
                    type: 'POST',
                    data: 'code=' + code + '&title=' + title + '&des=' + des,
                    success: function (data) {
                        console.log(data);
                        if (data == "success") {
                            cleanForm();
                            toastr.success('修改成功');
                        } else {
                            toastr.error('修改失败,活动编号错误');
                        }
                    }
                });
            } else {
                toastr.error('code填写出错');
            }
        });

        function cleanForm() {
            $('#title').val('');
            $('#des').val('');
        }

        function validForm() {
            if ($('#code').val().trim() != ""&&$('#code').val().trim().length==8) {
                return true;
            }
            return false;
        }
    });
</script>
</html>