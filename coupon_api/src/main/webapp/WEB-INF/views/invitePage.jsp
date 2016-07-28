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
    <title>邀请页面</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Header -->
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>

<!--Aside Menu -->
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value="invite"/>
    <jsp:param name="index1" value="invite"/>
</jsp:include>

<!-- Main Wrapper -->
<div id="wrapper">
    <div class="content animate-panel">
        <div class="transition animated fadeIn">
            <div class="hpanel">
                <div class="panel-body">
                    <h2 class="font-light m-b-xs">
                        领取页面
                    </h2>
                    <small>
                        <ol class="hbreadcrumb breadcrumb">
                            <li><a href="index.html">领取页面</a></li>
                            <li>
                                <span>领取页面</span>
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
                        信息
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal">
                            <div class="form-group"><label class="col-sm-2 control-label">活动编号</label>

                                <div class="col-sm-10">
                                    <input id="code" type="text" class="form-control m-b" value="${code}" readonly="true">
                                </div>
                            </div>
                            <div class="form-group"><label class="col-sm-2 control-label">邀请人编号</label>

                                <div class="col-sm-10">
                                    <input id="type" type="text" class="form-control m-b" value="${type}" readonly="true">
                                </div>
                            </div>
                            <div class="form-group"><label class="col-sm-2 control-label">手机号码</label>
                                <div class="col-sm-10">
                                    <input id="phone" type="text"  class="form-control m-b" required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <button id="submit" class="btn btn-primary">领取优惠</button>
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

        console.log("locationname:"+location.pathname);
        $('#submit').click(function (e) {
            e.preventDefault();
            var code = $('#code').val();
            var type = $('#type').val();
            var phone = $('#phone').val();
            if (validForm()) {
                $.ajax({
                    url: "/shareinfo/add",
                    type: 'POST',
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
            } else {
                toastr.error('phone不能为空');
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
</html>