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
    <jsp:param name="index" value="activity"/>
    <jsp:param name="index1" value="activities"/>
</jsp:include>

<!--Main Wrapper-->
<div id="wrapper">

    <div class="content animate-panel">
        <div class="transition animated fadeIn">
            <div class="hpanel">
                <div class="panel-body">
                    <!--m-b-xs margin bottom 元素的下外边距-->
                    <h2 class="font-light m-b-xs">
                        活动列表
                    </h2>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 animated-panel zoomIn" style="animation-delay: 0.1s;">
                <div class="hpanel">
                    <div class="panel-body">
                        <div id="">
                            <div>
                                <div>
                                    <table class="table table-striped table-bordered"
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
    </div>
    <!-- Footer-->
    <jsp:include page="/WEB-INF/views/comp/footer.jsp"/>
</div>
</div>

<script src="<c:url value="/resources/js/jquery.dataTables.js"/>"></script>
<script src="<c:url value="/resources/js/ZeroClipboard.js"/>"></script>
<script type="text/javascript">
    var path = location.pathname.split('/');
    var app = path[1];
    var prefix = "/" + app;

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
        var url = prefix + "/page";
        var keyword = "keyword=" + " ";
        var title;
        loadData();

        function copytext() {
            ZeroClipboard.setMoviePath("/resources/ZeroClipboard.swf");
            ZeroClipboard.setMoviePath("/resources/ZeroClipboard10.swf");
            var clip = new ZeroClipboard.Client();
            clip.setText("");
            clip.setHandCursor(true);
            clip.setCSSEffects(true);
            return clip;
        }

        function renderDate(time) {
            var date = new Date(time);
            return date.getFullYear() + "-" + (date.getMonth() + 1) + "-"
                    + date.getDate();
            /* + "  " + date.getHours() + ":" + date.getMinutes()*/
        }

        function generateOp(id) {   //button的ID就是对应的code
            var code = id;
            var url = "/invite/" + code;

            return '<p>'+'http://localhost:8080/invite?ref='+code+'</p>';
        }

        function loadData() {
            oTable.dataTable({
                "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r><'row't><'row'<'col-sm-6'i><'col-sm-6'p>>",
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
        /*            {
                        "mDataProp": "des",
                        "bSortable": false
                    },*/
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
                    /*{
                        "mDataProp": "code",  //利用code再新建一列
                        "bVisible": false,
                        "mRender": function (data, type, full) {
                            var clip = copytext();
                            clip.addEventListener("mouseDown", function (client) {
                                clip.setText($('#data').value);
                            });
                            clip.addEventListener("complete", function (client) {
                                alert("复制完成");
                                toastr.show("复制完成");
                            });
                            clip.glue('pp');
                            return data;
                        }
                    }*/
                ],
                "bFilter": true,
                "bServerSide": true,
                "sAjaxSource": url,
                "sServerMethod": "GET",
                "bRetrieve": true,
                "pagingType": "full_numbers",
                "bProcessing": true,
                "oLanguage": {
                    "sProcessing": "正在加载.....",
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
                "oClasses": {
                    "sFilter": "dataTables_filter"
                },
                "aaSorting": [[2, "asc"]]
            });
        }
    })
</script>
</body>
</html>
