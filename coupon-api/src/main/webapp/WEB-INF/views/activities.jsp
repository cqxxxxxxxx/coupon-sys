<%--
  Created by IntelliJ IDEA.
  User: cqxxxxx
  Date: 2016/7/19
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--page title-->
    <title>活动列表</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker3.min.css"/>">

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
    </style>
</head>
<body class="fixed-navbar fixed-sidebar">
<%--header--%>
<jsp:include page="comp/header.jsp"/>

<%--Aside menu--%>
<jsp:include page="comp/siderbar.jsp">
    <jsp:param name="index" value="Activity"/>
    <jsp:param name="index1" value="activities"/>
</jsp:include>

<!--Main Wrapper-->
<div id="wrapper">

    <div class="content animate-panel">
        <div class="transition animated fadeIn">
            <div class="hpanel">
                <div class="panel-body">
                    <div class="col-sm-12" style="margin-top: 10px">
                        <div class="row">
                            <div class="col-sm-4">
                                <button id="addBtn" class="btn  btn-danger" data-toggle="modal" data-target="#myModal1">
                                    <i class="fa fa-plus"></i>&nbsp;&nbsp;新增
                                </button>
                                <button id="refresh" class="btn  btn-default"><i class="fa fa-refresh"></i>&nbsp;&nbsp;刷新
                                </button>
                            </div>
                            <div class="col-sm-2">
                            </div>
                            <div class="col-sm-6">
                                <div class="col-md-8 animated-panel zoomIn" style="animation-delay: 0.5s;"><input
                                        type="text" id="keyword" placeholder="活动名" class="form-control ">
                                </div>
                                <button id="search" class="btn  btn-primary"><i class="fa fa-search"></i>&nbsp;&nbsp;搜索
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 animated-panel zoomIn" style="animation-delay: 0.1s;">
                <div class="hpanel">
                    <div class="panel-body">
                            <div>
                                <div>
                                    <table class="table table-striped table-bordered  hover"
                                           id="admin-table">
                                        <thead>
                                        <tr role="row">
                                            <th class="table-id">ID</th>
                                            <th>活动编号
                                            </th>
                                            <th>活动主题
                                            </th>
                                            <%-- <th>活动内容
                                             </th>--%>
                                            <th>优惠券总数
                                            </th>
                                            <th>已发数
                                            </th>
                                            <th>单人可领数
                                            </th>
                                            <th>活动开始时间
                                            </th>
                                            <th>活动截止时间
                                            </th>
                                            <th>新建时间
                                            </th>
                                            <th>操作</th>
                                            <th>分享链接
                                            </th>
                                            <%-- <th>辅助
                                             </th>--%>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
    <jsp:include page="/WEB-INF/views/comp/footer.jsp"/>
    <div role="dialog" id="myModal" class="modal fade in ">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="color-line"></div>
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true"></span></button>
                    <h4 class="modal-title">修改信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="get">
                        <input type="hidden" id="code">
                        <div class="form-group"><label class="col-sm-2 control-label">活动名称</label>
                            <div class="col-sm-10">
                                <input id="name" type="text" class="form-control m-b" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">优惠券总数</label>
                            <div class="col-sm-3">
                                <input id="totalLimit" type="text" class="form-control m-b" placeholder="请输入例如:5000">
                            </div>
                            <label class="col-sm-3 control-label">每人分发数量</label>
                            <div class="col-sm-3">
                                <input id="num" type="text" class="form-control m-b" placeholder="请输入例如:5">
                            </div>
                        </div>
                        <div class="form-group"><label class="col-sm-2 control-label">简介</label>
                            <div class="col-sm-10">
                                    <textarea id="des" type="text" class="form-control m-b"
                                              placeholder="活动简介."></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                    <button id="submit" class="btn btn-primary" type="button">提交修改</button>
                </div>
            </div>
        </div>
    </div>
    <div role="dialog" id="myModal1" class="modal fade in ">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="color-line"></div>
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true"></span></button>
                    <h4 class="modal-title">新建活动</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="get">
                        <div class="form-group"><label class="col-sm-2 control-label">活动编号</label>
                            <div class="col-sm-10">
                                <input id="code1" type="text" class="form-control m-b" placeholder="8位字母或者数字">
                            </div>
                        </div>
                        <div class="form-group"><label class="col-sm-2 control-label">活动名称</label>
                            <div class="col-sm-10">
                                <input id="name1" type="text" class="form-control m-b">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">优惠券总数</label>
                            <div class="col-sm-3">
                                <input id="totalLimit1" type="text" class="form-control m-b" placeholder="例如:5000">
                            </div>
                            <label class="col-sm-3 control-label">每人分发数量</label>
                            <div class="col-sm-3">
                                <input id="num1" type="text" class="form-control m-b" placeholder="例如:5">
                            </div>
                        </div>
                        <div class="form-group"><label class="col-sm-2 control-label">简介</label>
                            <div class="col-sm-10">
                                    <textarea id="des1" type="text" class="form-control m-b"
                                              placeholder="活动简介."></textarea>
                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 15%">
                            <div class="col-sm-5">
                                <label class="control-label inline">活动开始日期</label>
                                <div class="input-group date">
                                    <input id="Starttime" name="Starttime" type="text"
                                           class="form-control"><span
                                        class="input-group-addon"><i
                                        class="fa fa-clock-o"></i></span>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <label class="control-label inline">活动截止日期</label>
                                <div class="input-group date">
                                    <input id="Endtime" name="Endtime" type="text"
                                           class="form-control"><span
                                        class="input-group-addon"><i
                                        class="fa fa-clock-o"></i></span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                    <button id="submit1" class="btn btn-primary" type="button">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script src="<c:url value="/resources/js/jquery.dataTables.js"/>"></script>
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.min.js"/>"></script>
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.zh-CN.min.js"/>"></script>
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

    function validForm() {
        if ($('#totalLimit').val().trim() == "") {
            toastr.error("优惠券总数不能为空");
            return false;
        }
        if ($('#num').val().trim() == "") {
            toastr.error("单人券数不能为空");
            return false;
        }
        return true;
    }

    function validForm1() {
        if ($('#code1').val().trim().length!=8){
            toastr.error("code长度必须为8位数");
            return false;
        }
        if ($('#name1').val().trim()==""){
            toastr.error("活动名不能为空");
            return false;
        }
        if ($('#des1').val().trim()==""){
            toastr.error("活动简介不能为空");
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
        if ($('#totalLimit1').val().trim() == "") {
            toastr.error("优惠券总数不能为空");
            return false;
        }
        if ($('#num1').val().trim() == "") {
            toastr.error("单人券数不能为空");
            return false;
        }
        return true;
    }

    function renderDate(time) {
        var date = new Date(time);
        return date.getFullYear() + "-" + (date.getMonth() + 1) + "-"
                + date.getDate();
        /* + "  " + date.getHours() + ":" + date.getMinutes()*/
    }

    function generateUrl(id) {   //button的ID就是对应的code
        var code = id;
        var url = "/invite/" + code;
        return '<p>' + 'http://localhost:8080/invite?ref=' + code + '</p>';
    }

    function generateOp(id) {
        return ' <div class="btn-group">' +
                '<button id=' + id + ' class="modify btn btn-xs btn-default"> 修改</button> ' +
                '<button id=' + id + ' class="delete btn btn-xs btn-danger">删除</button>' +
                '</div>'
    }

    /****表单提交**/
    function resetForm() {
        $('#activityForm').resetForm();
        var $textareas = $('#activityForm textarea');
        $.each($textareas, function (key, value) {
            $(this).html("");
        });
        $('#id').val("0");
        blankImgList(images);
        setPermission("")
    }



    $(document).ready(function () {
        var oTable = $('#admin-table');
        var url = prefix + "/page";
        var title;
        loadData();
        var $modal = $('#myModal');
        $("#addBtn").click(function (e) {
            e.preventDefault();
            // resetForm();
            $('#activity-title').html("新增活动");
            $('#addActivity').modal('show');
        });

        $('#search').click(function (e) {
            e.preventDefault();
            var table = oTable.dataTable();
            table.fnDestroy();
            loadData();
            $("table").css("width", "100%");
        });
        function loadData() {
            oTable.dataTable({
                "sDom": "<'row'<'col-sm-6'l>r><'row'<'col-sm-12't>><'row'<'col-sm-6'i><'col-sm-6'p>>",

                "bScrollCollapse": true,
                "aoColumns": [
                    {
                        "mDataProp": "id",
                        "bVisible": false
                    },
                    {
                        "mDataProp": "code",
                        "bSortable": false
                    },
                    {
                        "mDataProp": "title",
                        "bSortable": false,


                    },
                    {
                        "mDataProp": "totalLimit",
                        "bSortable": false
                    },
                    {
                        "mDataProp": "sended",
                        "bSortable": false
                    },
                    {
                        "mDataProp": "num",
                        "bSortable": false
                    },
                    {
                        "mDataProp": "starttime",
                        "bSortable": false,
                        "mRender": function (time) {    //  转下格式显示出来
                            return renderDate(time);
                        }
                    },
                    {
                        "mDataProp": "endtime",
                        "bSortable": false,
                        "mRender": function (time) {    //  转下格式显示出来
                            return renderDate(time);
                        }
                    },
                    {
                        "mDataProp": "created",
                        "bSortable": false,
                        "mRender": function (time) {    //  转下格式显示出来
                            return renderDate(time);
                        }
                    },
                    {
                        "mDataProp": "code",  //利用code再新建一列
                        "bSortable": false,
                        "mRender": function (data, type, full) {
                            return generateOp(data);     //把code的值传进去
                        }
                    },

                    {
                        "mDataProp": "code",  //利用code再新建一列
                        "bSortable": false,
                        "mRender": function (data, type, full) {
                            return generateUrl(data);     //把code的值传进去
                        }
                    },
                ],
                "bFilter": true,
                "bServerSide": true,
                "sAjaxSource": url,
                "sServerMethod": "GET",
                "bRetrieve": true,
                "pagingType": "full_numbers",
                "oLanguage": {
                    "sSearch": "结果过滤:",
                    "sZeroRecords": "找不到相关的记录",
                    "oPaginate": {
                        "sNext": "下一页",
                        "sPrevious": "上一页",
                        "sLast": "最后一页",
                        "sFirst": "第一页"
                    },
                    "sInfo": "共 <code>_TOTAL_</code> 结果 当前显示 (<code>_START_</code> - <code>_END_</code>)",
                    "sEmptyTable": "表中无可用记录",
                    "sLengthMenu": "显示 _MENU_ 记录",
                    "sInfoFiltered": "(从 <code>_MAX_</code>条记录中过滤)",
                    "sInfoEmpty": "共 <code>0</code> 结果 当前显示 (<code>0</code> - <code>0</code>)"
                },
                "fnServerParams": function (aoData) {
                    aoData.push(
                            {"name": "keyword", "value": encodeURIComponent($('#keyword').val().trim())});
                },
                "oClasses": {
                    "sFilter": "dataTables_filter"
                },
                "aaSorting": [[2, "asc"]]
            });
        }

        oTable.find('tbody').on('click', ' tr button.modify', function (e) {
            var code = $(this).attr("id");
            $thisTr = $(this).closest("tr");
            e.preventDefault();
            $.ajax({
                url: prefix + '/info/' + code,
                type: 'GET',
                dataType: 'JSON',
                success: function (data) {
                    $('#code').val(data.code);
                    $('#name').val(data.title);
                    $('#des').val(data.des);
                    $('#num').val(data.num);
                    $('#totalLimit').val(data.totalLimit);
                    console.log(data);
                    $modal.modal('toggle');
                },
                error: function () {
                    toastr.error("error");
                }
            });
        });

        oTable.find('tbody').on('click', ' tr button.delete', function (e) {
            var code = $(this).attr("id");
            console.log(code);
            $thisTr = $(this).closest("tr");
            e.preventDefault();
            swal({
                        title: "删除活动",
                        text: "",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#5ECD1E",
                        confirmButtonText: "Yes, 删除",
                        cancelButtonText: "No, 取消",
                        closeOnConfirm: true,
                        closeOnCancel: true
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                            $.ajax({
                                url: prefix + '/delete/' + code,
                                type: 'DELETE',
                                success: function (data) {
                                    if (data == "success") {
                                        toastr.success('删除成功');
                                        location.reload();
                                    } else {
                                        toastr.warning('删除失败');
                                    }
                                }
                            });
                        } else {

                        }
                    });
        });

        $('#submit').click(function (e) {
            e.preventDefault();
            var code = $('#code').val();
            var des = $('#des').val();
            var totalLimit = $('#totalLimit').val();
            var num = $('#num').val();
            console.log(code + "--" + des + "--" + totalLimit + "--" + num);
            if (validForm()) {
                $.ajax({
                    url: prefix + "/update",
                    type: 'POST',
                    data: 'des=' + des + '&code=' + code + '&totalLimit=' + totalLimit + '&num=' + num,
                    success: function (data) {
                        if (data == "success") {
                            toastr.success('更新成功')
                        } else {
                            toastr.error('更新失败!请联系管理员');
                        }
                    }
                });
            }
        });

        $('#submit1').click(function (e) {
            e.preventDefault();
            var title = $('#name1').val();
            var des = $('#des1').val();
            var code = $('#code1').val();
            var totalLimit = $('#totalLimit1').val();
            var num = $('#num1').val();
            var starttime = $('#Starttime').val().replace("年", "-").replace("月", "-").replace("日", "");
            var endtime = $('#Endtime').val().replace("年", "-").replace("月", "-").replace("日", "")
            console.log("sdafasd---"+$('#totalLimit1').val());
            if (validForm1()) {
                $.ajax({
                    url: prefix + "/add",
                    type: "POST",
                    data: "title=" + title + '&des=' + des + '&code=' + code + '&total_limit=' + totalLimit + '&num=' + num + "&starttime=" + starttime + "&endtime=" + endtime,
                    success: function (data) {
                        toastr.success("添加成功");
                    },
                    error: function () {
                        toastr.error("失败,请联系管理员");
                    }

                });
            }
        })

        $('#refresh').click(function (e) {
            e.preventDefault();
            refreshTable();
        });
        function refreshTable() {
            $('#keyword').val("");
            var table = oTable.dataTable();
            table.fnDestroy();
            loadData();
            $("table").css("width", "100%");
        }
    })
</script>
</body>
</html>
