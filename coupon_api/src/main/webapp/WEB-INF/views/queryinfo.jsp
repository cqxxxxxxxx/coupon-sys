<%@ page pageEncoding="UTF-8"%>
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
    <title>链接点击信息查询</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker3.min.css"/>">
</head>
<body class="fixed-navbar fixed-sidebar">
<!-- Header -->
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>
<!--Aside Menu -->
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value="info"/>
    <jsp:param name="index1" value="checkinfo"/>
</jsp:include>

<div id="wrapper">
    <div class="content">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="col-sm-12">
                            <div class="row">
                                <form id="searchForm">
                                    <div class="form-group">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label class="control-label inline">活动编号</label>
                                                <input name="code" id="code"
                                                       type="text" placeholder="活动编号" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label class="control-label inline">邀请人</label>
                                                <input name="type" id="type"
                                                       type="text" placeholder="邀请人/offical" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label class="control-label inline">浏览器</label>
                                                <input name="browser" id="browser"
                                                       type="text" placeholder="浏览器" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-3">
                                            <label class="control-label inline">日期（起）</label>
                                            <div class="input-group date">
                                                <input id="Starttime" name="Starttime" type="text"
                                                       class="form-control"><span
                                                    class="input-group-addon"><i
                                                    class="fa fa-clock-o"></i></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label inline">日期(止)</label>
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
                        </div>
                        <div class="col-sm-12">
                            <div class="row text-center">
                                <button id="addBtn" class="btn  btn-danger">
                                    <i class="fa fa-plus"></i>&nbsp;&nbsp;新增
                                </button>
                                <button id="search" class="btn  btn-primary"><i class="fa fa-search"></i>&nbsp;&nbsp;查询
                                </button>
                                <button id="clearBtn" class="btn  btn-default"><i class="fa fa-trash"></i>&nbsp;&nbsp;清空
                                </button>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-striped table-bordered"
                                       id="admin-table">
                                    <thead>
                                    <tr role="row">
                                        <th>活动编号
                                        </th>
                                        <th>邀请人
                                        </th>
                                        <th>IP
                                        </th>
                                        <th>浏览器
                                        </th>
                                        <th>点击时间
                                        </th>
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

</div>
<script src="<c:url value="/resources/js/jquery.dataTables.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script src="<c:url value="/resources/js/qiniu/plupload.full.min.js"/>"></script>
<script src="<c:url value="/resources/js/qiniu/qiniu.min.js"/>"></script>
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.min.js"/>"></script>
<script src="<c:url value="/resources/js/date/bootstrap-datepicker.zh-CN.min.js"/>"></script>
<script src="<c:url value="/resources/js/common/common.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap2-typeahead.min.js"/>"></script>
<script type="text/javascript">

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

    $(document).ready(function () {
        var oTable = $('#admin-table');
        var url = "clickinfo/list";
        console.log(url);
        loadData();
        $('.date').datepicker({
            language: 'zh-CN'
        });
        $("#search").click(function (e) {
            var table = oTable.dataTable();
            table.fnDraw();
        });


        /****查询--start********/

        function resetSearchForm() {
            $('#searchForm').resetForm();   //jquery.form.js 里的清空表单
        }

        $("#clearBtn").click(function (e) {
            e.preventDefault();     //组织元素发生的默认行为
            resetSearchForm();         //调用上面的方法，清空form
            var table = oTable.dataTable();
            table.fnDestroy();  //初始化datatable
        });

        function renderDate(time) {     //改变下格式
            var date = new Date(time);
            return date.getFullYear() + "-" + (date.getMonth() + 1) + "-"
                    + date.getDate() + "  " + date.getHours() + ":" + date.getMinutes();
        }


        function loadData() {

            oTable.dataTable({
                "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r><'row'<'col-sm-12't>><'row'<'col-sm-6'i><'col-sm-6'p>>",
                "bScrollCollapse": true,
                "aoColumns": [

                    {
                        "mDataProp": "code",
                        "bSortable": true,
                    },
                    {
                        "mDataProp": "type",
                        "bSortable": false,

                    },
                    {
                        "mDataProp": "ip",
                        "bSortable": false
                    },
                    {
                        "mDataProp": "browser",
                        "bSortable": false
                    },
                    {
                        "mDataProp": "created",
                        "bSortable": true,
                        "mRender": function (time) {    //  转下格式显示出来
                            return renderDate(time);
                        }
                    },
                ],
                "bFilter": true,
                "bServerSide": true,
                "sAjaxSource": url,
                "sServerMethod": "GET",
                "bRetrieve": true,
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
                }, "fnServerParams": function (aoData) {
                    aoData.push(        //Ajax 把数据穿给后台
                            {"name": "code", "value": $('#code').val().trim()},
                            {"name": "type", "value": $('#type').val().trim()},
                            {"name": "browser", "value": encodeURIComponent($('#browser').val().trim())},
                            {"name": "starttime", "value": $('#Starttime').val().replace("年","-").replace("月","-").replace("日","")},
                            {"name": "endtime", "value": $('#Endtime').val().replace("年","-").replace("月","-").replace("日","")})
                },
                "oClasses": {
                    "sFilter": "dataTables_filter"
                },
                "aaSorting": [[2, "asc"]]  //按第三列进行升序排列
            });
        }

        /****查询--end********/

    })
</script>
</body>
</html>

