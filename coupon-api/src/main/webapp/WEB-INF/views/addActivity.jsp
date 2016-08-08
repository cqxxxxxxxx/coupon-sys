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
    <title>添加活动</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker3.min.css"/>">

</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Header -->
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>

<!--Aside Menu -->
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value="activity"/>
    <jsp:param name="index1" value="addActivity"/>
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
                                <span>添加活动</span>
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
                                    <input id="code" type="text" class="form-control m-b" required="true"
                                           placeholder="8位字母或者数字">
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
                            <div class="form-group"><label class="col-sm-2 control-label">优惠券总数</label>

                                <div class="col-sm-10">
                                    <input id="total_limit" type="text" class="form-control m-b" required="true">
                                </div>
                            </div>
                            <div class="form-group"><label class="col-sm-2 control-label">每人分发张数</label>

                                <div class="col-sm-10">
                                    <input id="num" type="text" class="form-control m-b" required="true">
                                </div>
                            </div>
                            <div class="form-group" style="margin-left: 15%">
                                <div class="col-sm-4">
                                    <label class="control-label inline">活动开始日期</label>
                                    <div class="input-group date">
                                        <input id="Starttime" name="Starttime" type="text"
                                               class="form-control"><span
                                            class="input-group-addon"><i
                                            class="fa fa-clock-o"></i></span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="control-label inline">活动截止日期</label>
                                    <div class="input-group date">
                                        <input id="Endtime" name="Endtime" type="text"
                                               class="form-control"><span
                                            class="input-group-addon"><i
                                            class="fa fa-clock-o"></i></span>
                                    </div>
                                </div>
                                <div class="col-sm-3 col-sm-offset-1">
                                    <button id="submit" class="btn btn-primary" style="margin-top: 25px">添加活动</button>
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
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.min.js"/>"></script>
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.zh-CN.min.js"/>"></script>

<script type="text/javascript">
    var path = location.pathname.split('/');
    console.log(location.pathname);
    var app = path[1];
    var prefix = "/" + app;
    $('.date').datepicker({
        language: 'zh-CN'
    });
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

        console.log("prefix" + prefix);
        $('#submit').click(function (e) {
            e.preventDefault();
            var title = $('#title').val();
            var des = $('#des').val();
            var code = $('#code').val();
            var total_limit = $('#total_limit').val();
            var num = $('#num').val();
            var starttime = $('#Starttime').val().replace("年", "-").replace("月", "-").replace("日", "");
            var endtime = $('#Endtime').val().replace("年", "-").replace("月", "-").replace("日", "")
            if (validForm()) {
                $.ajax({
                    url: prefix + "/add",
                    type: 'POST',
                    data: 'code=' + code + '&title=' + title + '&des=' + des + '&total_limit=' + total_limit + '&num=' + num + '&starttime=' + starttime + '&endtime=' + endtime,
                    dataType: 'html',
                    success: function (data) {
                        console.log(data);
                        if (data == "success") {
                            console.log("success");
                            cleanForm();
                            toastr.success('添加成功');
                        } else {
                            console.log("failed");
                            toastr.error('code被占用');
                        }
                    }
                });
            } else {
                toastr.error('添加失败');
            }
        });

        function cleanForm() {
            $('#title').val('');
            $('#des').val('');
            $('#Starttime').val('');
            $('#Endtime').val('');
        }

        function validForm() {
            if ($('#code').val().trim().length!=8) {
                toastr.error('code长度必须为8位');
                return false;
            }
            if ($('#title').val().trim() == "") {
                toastr.error('活动名不能为空');
                return false;
            }
            if ($('#des').val().trim() == "") {
                toastr.error('内容不能为空');
                return false;
            }
            if ($('#Starttime').val().trim() == "") {
                toastr.error('开始时间不能为空');
                return false;
            }
            if ($('#Endtime').val().trim() == "") {
                toastr.error('结束时间不能为空');
                return false;
            }
            if ($('#total_limit').val().trim()=="") {
                toastr.error('优惠券总数不能为空');
                return false;
            }

            if ($('#num').val().trim()=="") {
                toastr.error('num不能为空');
                return false;
            }
            return true;
        }
    });
</script>
</html>