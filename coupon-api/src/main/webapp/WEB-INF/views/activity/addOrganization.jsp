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
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker3.min.css"/>">
    <!-- Page title -->
    <title>添加企业</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
    <style type="text/css">
        .contact-panel img {
            height: 100%;
            width: 100%;
        }

    </style>
</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Header -->
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>

<!--Aside Menu -->
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value="org"/>
    <jsp:param name="index1" value="addorg"/>
</jsp:include>

<!-- Main Wrapper -->
<div id="wrapper">
    <div class="content animate-panel">
        <div class="transition animated fadeIn">
            <div class="hpanel">
                <div class="panel-body">
                    <h2 class="font-light m-b-xs">
                        企业管理
                    </h2>
                    <small>
                        <ol class="hbreadcrumb breadcrumb">
                            <li><a href="index.html">服务管理</a></li>
                            <li>
                                <span>添加企业</span>
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
                        企业信息
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="get">
                            <input type="hidden" id="domain" value="${domain}">
                            <input type="hidden" id="uptoken_url" value="${uptoken_url}">

                            <div class="form-group"><label class="col-sm-2 control-label">活动编号</label>
                                <div class="col-sm-10">
                                    <input id="code"  type="text" class="form-control m-b" placeholder="数字或字母，不能为6位">
                                </div>
                            </div>

                            <div class="form-group"><label class="col-sm-2 control-label">企业名</label>

                                <div class="col-sm-10">
                                    <input id="name" type="text" class="form-control m-b" placeholder="请输入例如:小火堆科技">
                                </div>
                            </div>
                            <div class="form-group"><label class="col-sm-2 control-label">企业简介</label>

                                <div class="col-sm-10">
                                    <textarea id="des" type="text" class="form-control m-b"
                                              placeholder="简介信息."></textarea>
                                </div>
                            </div>
                            <div class="form-group"><label class="col-sm-2 control-label">优惠券总数</label>
                                <div class="col-sm-3">
                                    <input id="total_limit" type="text" class="form-control m-b" required="true">
                                </div>
                                <label class="col-sm-2 control-label">每人分发张数</label>
                                <div class="col-sm-3">
                                    <input id="num" type="text" class="form-control m-b" required="true">
                                </div>
                            </div>
                            <div class="form-group"><label class="col-sm-2 control-label">开始时间</label>
                                <div class=" col-sm-3">
                                    <div class="input-group date">
                                        <input id="Starttime" name="Starttime" type="text"
                                               class="form-control"><span
                                            class="input-group-addon"><i
                                            class="fa fa-clock-o"></i></span>
                                    </div>
                                </div>
                                <label class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-3">
                                    <div class="input-group date ">
                                        <input id="Endtime" name="Endtime" type="text"
                                               class="form-control"><span
                                            class="input-group-addon"><i
                                            class="fa fa-clock-o"></i></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group"><label class="col-sm-2 control-label ">当前LOGO</label>
                                <div class="col-sm-10 ">
                                    <img id="preview" width="100px" height="100px"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNcvHh+PQAGPAJmNT5JDwAAAABJRU5ErkJggg==">
                                </div>
                            </div>
                            <div class="form-group">
                                <div id="container" class="col-sm-3" style="margin-left: 10%">
                                    <button id="pickfiles" class="btn btn-primary btn-block">上传LOGO</button>
                                </div>
                                <div class="col-sm-4">
                                    <button id="submit" class="btn btn-success">提交</button>
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
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.min.js"/>"></script>
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.zh-CN.min.js"/>"></script>
<script src="<c:url value="/resources/js/qiniu.min.js"/>"></script>
<script src="<c:url value="/resources/js/plupload.full.min.js"/>"></script>
<script src="<c:url value="/resources/js/ui.js"/>"></script>
</div>
</body>
<script type="text/javascript">
    var path = location.pathname.split('/');
    var app = path[1];
    var prefix = "/" + app;
    $('.date').datepicker({
        language: 'zh-CN'
    });
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }

    function checkCode(value) {
        var Regx = /^[A-Za-z0-9]*$/;
        if (Regx.test(value)) {
            return true;
        }
        else {
            return false;
        }
    }

    $(document).ready(function () {
        console.log(prefix + $('#uptoken_url').val());
        console.log($('#preview').attr('src'));

       /* function checkcode(){
            var code = $('#code').val();
            $.ajax({
                url: prefix + "/" + code + "/check",
                type: 'GET',
                data: 'code=' + code,
                success: function (data) {
                    if (data == "success") {
                        toastr.success('编号可用')
                    } else {
                        toastr.error('编号已存在，请换个编号');
                    }
                }
            })
        }*/

       /* $('#code').onchange(function () {
            var code = $('#code').val();
            $.ajax({
                url: prefix + "/" + code + "/check",
                type: 'GET',
                data: 'code=' + code,
                success: function (data) {
                    if (data == "success") {
                        toastr.success('编号可用')
                    } else {
                        toastr.error('编号已存在，请换个编号');
                    }
                }
            })
        })*/

        $('#submit').click(function (e) {
            e.preventDefault();
            var code = $('#code').val();
            var name = $('#name').val();
            var des = $('#des').val();
            var total_limit = $('#total_limit').val();
            var num = $('#num').val();
            var starttime = $('#Starttime').val().replace("年", "-").replace("月", "-").replace("日", "");
            var endtime = $('#Endtime').val().replace("年", "-").replace("月", "-").replace("日", "");
            var logo = $('#preview').attr('src');      //预览图的src
            console.log(logo);
            if (validForm()) {
                $.ajax({
                    url: prefix + "/add",
                    type: 'POST',
                    data: 'code=' + code + '&name=' + name + '&des=' + des + '&total_limit=' + total_limit + '&num=' + num + '&starttime=' + starttime + '&endtime=' + endtime + '&logo=' + logo,
                    success: function (data) {
                        if (data == "success") {
                            cleanForm();
                            toastr.success('新建' + name + '成功')
                        } else {
                            toastr.error('新建失败!code重复，请换个code');
                        }
                    }
                });
            }
        });

        var preview = $('#preview');

        var uploader = Qiniu.uploader({
            runtimes: 'html5,flash,html4',
            browse_button: 'pickfiles',
            container: 'container',
            drop_element: 'container',
            max_file_size: '100mb',
            flash_swf_url: 'js/plupload/Moxie.swf',
            dragdrop: true,
            chunk_size: '4mb',
            uptoken_url: prefix + $('#uptoken_url').val(),
            domain: $('#domain').val(),
            unique_names: false,
            save_key: false,
            auto_start: true,
            init: {
                'FilesAdded': function (up, files) {
                    $('table').show();
                    $('#success').hide();
                    plupload.each(files, function (file) {
//                        var progress = new FileProgress(file, 'fsUploadProgress');
//                        progress.setStatus("等待...");
                    });
                },
                'BeforeUpload': function (up, file) {
                    var progress = new FileProgress(file, 'fsUploadProgress');
                    var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                    if (up.runtime === 'html5' && chunk_size) {
//                        progress.setChunkProgess(chunk_size);
                    }
                },
                'UploadProgress': function (up, file) {
                    var progress = new FileProgress(file, 'fsUploadProgress');
                    var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
//                    progress.setProgress(file.percent + "%", up.total.bytesPerSec, chunk_size);
                },
                'UploadComplete': function () {
                    $('#success').show();
                },
                'FileUploaded': function (up, file, info) {
                    var progress = new FileProgress(file, 'fsUploadProgress');
//                    progress.setComplete(up, info);

                    preview.attr('src', generateSrc(up, info));
                    preview.addClass('uploaded');
                },
                'Error': function (up, err, errTip) {
                    $('table').show();
//                    var progress = new FileProgress(err.file, 'fsUploadProgress');
//                    progress.setError();
//                    progress.setStatus(errTip);
                }
                ,
                'Key': function (up, file) {
                    var key = new Date().getTime();
                    // do something with key
                    return 'sv' + key; // back的意思
                }
            }
        });


        function generateSrc(up, info) {
            var url;
            var res = $.parseJSON(info);

            var domain = up.getOption('domain');
            url = domain + '/' + encodeURI(res.key);

            return 'http://' + url;
        }

        function cleanForm() {
            $('#code').val('');
            $('#name').val('');
            $('#des').val('');
            $('#preview').attr('src', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNcvHh+PQAGPAJmNT5JDwAAAABJRU5ErkJggg==');
            $('#total_limit').val('');
            $('#num').val('');
            $('#Starttime').val('');
            $('#Endtime').val('');

        }

        function validForm() {
            if(!checkCode($('#code').val().trim())){
                toastr.error("编号必须为字母或者数字");
                return false;
            }
            if ($('#code').val().trim().length == 6) {
                toastr.error('code长度不能6位');
                return false;
            }
            if ($('#name').val().trim() == "") {
                toastr.error('企业名不能为空');
                return false;
            }
            if ($('#des').val().trim() == "") {
                toastr.error('简介不能为空');
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
            if (!$('#preview').hasClass('uploaded')) {
                toastr.error('logo不能为空');
                return false;
            }
            return true;
        }

        $('#container').on(
                'dragenter',
                function (e) {
                    e.preventDefault();
                    $('#container').addClass('draging');
                    e.stopPropagation();
                }
        ).on('drop', function (e) {
            e.preventDefault();
            $('#container').removeClass('draging');
            e.stopPropagation();
        }).on('dragleave', function (e) {
            e.preventDefault();
            $('#container').removeClass('draging');
            e.stopPropagation();
        }).on('dragover', function (e) {
            e.preventDefault();
            $('#container').addClass('draging');
            e.stopPropagation();
        });
    });
</script>
</html>