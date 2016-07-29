
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
    <title>参与者信息查询</title>
    <jsp:include page="/WEB-INF/views/comp/header.include.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker3.min.css"/>">
</head>
<body class="fixed-navbar fixed-sidebar">
<!-- Header -->
<jsp:include page="/WEB-INF/views/comp/header.jsp"/>
<!--Aside Menu -->
<jsp:include page="/WEB-INF/views/comp/siderbar.jsp">
    <jsp:param name="index" value="info"/>
    <jsp:param name="index1" value="shareinfo"/>
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
                                        <th>手机号
                                        </th>
                                        <th>领取时间
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
    <%--<div class="modal fade in" id="studentModal" tabindex="-1" role="dialog" aria-hidden="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 id="modal-title" class="modal-title">新增学员</h4>
                </div>
                <div class="modal-body">
                    <form id="studentForm" method="get" class="form-horizontal">
                        <input id="id" type="hidden" name="id" value="0">
                        <input id="coachId" type="hidden" name="coachId" value="0">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">机构编号<span class="needed">*</span></label>
                            <input id="insId" type="hidden" name="insId"
                            <c:choose>
                            <c:when test="${signin_user.root == 0}">
                                   value="${signin_user.insId}"
                            </c:when>
                            <c:otherwise>
                                   value="0"
                            </c:otherwise>
                            </c:choose>>
                            <div class="col-sm-4">
                                <input id="insName" name="insName" data-provide="typeahead"
                                       autocomplete="off"
                                       type="text" placeholder="所属驾校" class="form-control typeahead"
                                       required
                                <c:if
                                        test="${signin_user.root == 0}">
                                       disabled value="${signin_user.insName}"
                                </c:if>>
                            </div>
                            &lt;%&ndash;<label class="col-sm-2 control-label">学员名称<span class="needed">*</span></label>&ndash;%&gt;

                            &lt;%&ndash;<div class="col-md-4">&ndash;%&gt;
                            &lt;%&ndash;<input name="stunum" id="stunum"&ndash;%&gt;
                            &lt;%&ndash;type="text" placeholder="学员名称" class="form-control"&ndash;%&gt;
                            &lt;%&ndash;required>&ndash;%&gt;
                            &lt;%&ndash;</div>&ndash;%&gt;
                            <label class="col-sm-2 control-label">所属教练<span class="needed">*</span></label>
                            <div id="scrollable-dropdown-menu1" class="col-md-4">
                                <input name="coachName" id="coachName" data-provide="typeahead"
                                       autocomplete="off"
                                       type="text" placeholder="所属教练" class="form-control typeahead"
                                       required>
                            </div>
                        </div>
                        &lt;%&ndash;<div class="form-group">&ndash;%&gt;

                        &lt;%&ndash;</div>&ndash;%&gt;
                        <div class="form-group">
                            <label class="col-sm-2 control-label">学员姓名<span class="needed">*</span></label>

                            <div class="col-sm-4">
                                <input id="name" type="text" name="name"
                                       placeholder="学员姓名" class="form-control m-b"
                                       required>
                            </div>
                            <label class="col-sm-2 control-label">学员性别<span class="needed">*</span></label>

                            <div class="col-sm-4">
                                <select id="sex" class="form-control m-b" name="sex">
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">费用支付方式<span class="needed">*</span></label>

                            <div class="col-sm-4">
                                <select id="payType" class="form-control m-b" name="payType">
                                    <option value="1" selected>按时付费</option>
                                    <option value="2">一次性交费</option>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">是否允许短信签到<span class="needed">*</span></label>

                            <div class="col-sm-4">
                                <select id="allowSms" class="form-control m-b" name="allowSms">
                                    <option value="0">不允许(默认)</option>
                                    <option value="1">允许</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">证件类型<span class="needed">*</span></label>

                            <div class="col-sm-4">
                                <select id="cardtype" class="form-control m-b" name="cardtype">
                                    <option value="身份证">身份证</option>
                                    <option value="护照">护照</option>
                                    <option value="军官证">军官证</option>
                                    <option value="其它">其它</option>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">证件号<span class="needed">*</span></label>

                            <div class="col-sm-4">
                                <input id="cardnum" type="text" name="cardnum" placeholder="证件号"
                                       class="form-control m-b"
                                       required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机号码<span class="needed">*</span></label>

                            <div class="col-md-4"><input id="phone" name="phone"
                                                         type="text" placeholder="手机号码" class="form-control"
                                                         required></div>
                            <label class="col-sm-2 control-label">国籍</label>

                            <div class="col-sm-4">
                                <input id="nationality" name="nationality"
                                       type="text" placeholder="国籍 " class="form-control"
                                ></div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系地址</label>

                            <div class="col-md-4"><input id="address" name="address"
                                                         type="text" placeholder="联系地址" class="form-control"
                            ></div>
                            &lt;%&ndash;<label class="col-sm-2 control-label">暂住证</label>&ndash;%&gt;

                            &lt;%&ndash;<div class="col-md-4"><input id="tempcardno" name="tempcardno"&ndash;%&gt;
                            &lt;%&ndash;type="text" placeholder="暂住证号" class="form-control"&ndash;%&gt;
                            &lt;%&ndash;></div>&ndash;%&gt;

                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">业务类型<span class="needed">*</span></label>

                            <div class="col-sm-4">
                                <select id="busitype" class="form-control m-b" name="busitype">
                                    <option value="初领">初领</option>
                                    <option value="护照">增领</option>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">驾驶证号</label>

                            <div class="col-sm-4">
                                <input id="drilicnum" type="text" name="drilicnum" placeholder="驾驶证号"
                                       class="form-control m-b"
                                >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">准驾车型</label>

                            <div class="col-sm-4">
                                <select id="perdritype" class="form-control m-b" name="perdritype">
                                    <option value="C1">C1(手动挡小型汽车)</option>
                                    <option value="C2">C2(小型自动挡汽车)</option>
                                    <option value="C3">C3(低速载货汽车)</option>
                                    <option value="C4">C4(三轮汽车)</option>
                                    <option value="C5">C5(小型自动挡残疾汽车)</option>
                                    <option value="A1">A1(大型客车)</option>
                                    <option value="A2">A2(牵引车)</option>
                                    <option value="A3">A3(城市公交车)</option>
                                    <option value="B1">B1(中型客车)</option>
                                    <option value="B2">B2(大型货车)</option>
                                    <option value="D">D(普通三轮摩托车)</option>
                                    <option value="E">E(普通二轮摩托车)</option>
                                    <option value="F">F(轻便摩托车)</option>
                                    <option value="M">M(轮式自行机械车)</option>
                                    <option value="N">N(无轨电车)</option>
                                    <option value="P">P(有轨电车)</option>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">培训车型<span class="needed">*</span></label>

                            <div class="col-md-4">
                                <select id="traintype" class="form-control m-b" name="traintype">
                                    <option value="C1">C1(手动挡小型汽车)</option>
                                    <option value="C2">C2(小型自动挡汽车)</option>
                                    <option value="C3">C3(低速载货汽车)</option>
                                    <option value="C4">C4(三轮汽车)</option>
                                    <option value="C5">C5(小型自动挡残疾汽车)</option>
                                    <option value="A1">A1(大型客车)</option>
                                    <option value="A2">A2(牵引车)</option>
                                    <option value="A3">A3(城市公交车)</option>
                                    <option value="B1">B1(中型客车)</option>
                                    <option value="B2">B2(大型货车)</option>
                                    <option value="D">D(普通三轮摩托车)</option>
                                    <option value="E">E(普通二轮摩托车)</option>
                                    <option value="F">F(轻便摩托车)</option>
                                    <option value="M">M(轮式自行机械车)</option>
                                    <option value="N">N(无轨电车)</option>
                                    <option value="P">P(有轨电车)</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">驾驶证初领日期</label>

                            <div class="col-sm-4">
                                <div class="input-group date">
                                    <input id="fstdrilicdate" name="fstdrilicdate" type="text"
                                           class="form-control"><span
                                        class="input-group-addon"><i
                                        class="fa fa-clock-o"></i></span>
                                </div>

                            </div>
                            <label class="col-sm-2 control-label">报名时间<span class="needed">*</span></label>

                            <div class="col-sm-4">
                                <div class="input-group date">
                                    <input id="applydate" name="applydate" type="text"
                                           class="form-control" required><span
                                        class="input-group-addon"><i
                                        class="fa fa-clock-o"></i></span>
                                </div>

                            </div>

                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">学员头像:</span>

                            <div class="col-sm-6">
                                <button id="addPhoto" class="btn btn-default" type="button">上传学员头像</button>
                                <span class="error-tip" style="display: block;padding-top: 5px;">&nbsp;&nbsp;(仅支持jpg,jpeg,png格式,分辨率至少320px,图片大小限1M)</span>
                            </div>

                            <div style="margin-top: 10px" class="col-sm-8 col-sm-offset-2 inline">
                                <div class="col-sm-8" style="padding-left: 0px"><a data-lightbox="gallery" class=""
                                                                                   href="#">
                                    <img style="height: 100px;width: 160px;"
                                         class="img form-control"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNcvHh+PQAGPAJmNT5JDwAAAABJRU5ErkJggg=="
                                         id="photoUrl"> </a></div>
                            </div>
                        </div>
                        <div class="form-group" id="idCardContainer">
                            <span class="col-sm-2 control-label">身份证照片:</span>

                            <div class="col-sm-5">
                                <button id="addFace" class="btn btn-default" type="button">上传正面照片</button>
                                <span class="error-tip" style="display: block;padding-top: 5px;">&nbsp;&nbsp;(仅支持jpg,jpeg,png格式,分辨率至少320px,图片大小限1M)</span>
                            </div>
                            <div class="col-sm-4">
                                <button id="addBack" class="btn btn-default" type="button">上传背面照片</button>
                                <span class="error-tip" style="display: block;padding-top: 5px;">&nbsp;&nbsp;(仅支持jpg,jpeg,png格式,分辨率至少320px,图片大小限1M)</span>
                            </div>
                            <div style="margin-top: 10px" class="col-sm-8 col-sm-offset-2 inline">
                                <div class="col-sm-8" style="padding-left: 0px"><a data-lightbox="gallery" class=""
                                                                                   href="#">
                                    <img style="height: 100px;width: 160px;"
                                         class="img form-control"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNcvHh+PQAGPAJmNT5JDwAAAABJRU5ErkJggg=="
                                         id="idcardFace"> </a></div>
                                <div class="col-sm-4" style="margin-left: -20px"><a data-lightbox="gallery" class=""
                                                                                    href="#">
                                    <img style="height: 100px;width: 160px;"
                                         class="img form-control"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNcvHh+PQAGPAJmNT5JDwAAAABJRU5ErkJggg=="
                                         id="idcardBack"> </a></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">指纹照片:</span>

                            <div class="col-sm-6">
                                <button id="addFingerprint" class="btn btn-default" type="button">上传指纹照片</button>
                                <span class="error-tip" style="display: block;padding-top: 5px;">&nbsp;&nbsp;(仅支持jpg,jpeg,png格式,分辨率至少320px,图片大小限1M)</span>
                            </div>

                            <div style="margin-top: 10px" class="col-sm-8 col-sm-offset-2 inline">
                                <div class="col-sm-8" style="padding-left: 0px"><a data-lightbox="gallery" class=""
                                                                                   href="#">
                                    <img style="height: 100px;width: 160px;"
                                         class="img form-control"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNcvHh+PQAGPAJmNT5JDwAAAABJRU5ErkJggg=="
                                         id="fingerprint"> </a></div>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="saveBtn" type="button" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>--%>
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
        var url = "shareinfo/list";
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
            $('#searchForm').resetForm();
        }

        $("#clearBtn").click(function (e) {
            e.preventDefault();
            resetSearchForm();
            var table = oTable.dataTable();
            table.fnDestroy();
            loadData();
        });

        function renderDate(time) {
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
                        "mDataProp": "phone",
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
                            {"name": "starttime", "value": $('#Starttime').val().replace("年","-").replace("月","-").replace("日","")},
                            {"name": "endtime", "value":$('#Endtime').val().replace("年","-").replace("月","-").replace("日","")})
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
