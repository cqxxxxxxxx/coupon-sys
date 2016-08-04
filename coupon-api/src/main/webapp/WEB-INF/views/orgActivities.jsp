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
    <jsp:param name="index" value="org"/>
    <jsp:param name="index1" value="orginfo"/>
</jsp:include>

<!--Main Wrapper-->
<div id="wrapper">

    <div class="content animate-panel">
        <div class="transition animated fadeIn">
            <div class="hpanel">
                <div class="panel-body">
                    <h2 class="font-light m-b-xs">
                        企业列表
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
                                            <th>企业名
                                            </th>
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
                                            <th>修改</th>
                                            <th>分享链接
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
    </div>

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
                        <input type="hidden" id="domain" value="${domain}">
                        <input type="hidden" id="uptoken_url" value="${uptoken_url}">
                        <input type="hidden" id="code" >
                        <div class="form-group"><label class="col-sm-2 control-label">企业名称</label>
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
                                              placeholder="企业简介."></textarea>
                            </div>
                        </div>
                        <div class="form-group"><label class="col-sm-2 control-label">当前LOGO</label>

                            <div class="col-sm-10">
                                <img id="preview" src="<c:url value="/resources/imgs/web.jpg"/> ">
                            </div>
                        </div>
                        <div class="form-group"><label class="col-sm-2 control-label">LOGO</label>

                            <div id="container" class="col-sm-5">
                                <button id="pickfiles" class="btn btn-primary btn-block">上传图片</button>
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
    <!-- Footer-->
    <jsp:include page="/WEB-INF/views/comp/footer.jsp"/>
</div>
</div>

<script src="<c:url value="/resources/js/jquery.dataTables.js"/>"></script>
<script src="<c:url value="/resources/js/qiniu.min.js"/>"></script>
<script src="<c:url value="/resources/js/plupload.full.min.js"/>"></script>
<script src="<c:url value="/resources/js/ui.js"/>"></script>
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

    function renderDate(time) {
        var date = new Date(time);
        return date.getFullYear() + "-" + (date.getMonth() + 1) + "-"
                + date.getDate();
        /* + "  " + date.getHours() + ":" + date.getMinutes()*/
    }

    function generateOp(id) {   //button的ID就是对应的code
        var code = id;
        var url = "/invite/" + code;
        return '<p>'+'http://localhost:8080'+url+'</p>';
    }

    function generateButton(id) {
        return ' <div class="btn-group">' +
                '<button id=' + id + ' class="modify btn btn-xs btn-default"> 修改</button> '
        '</div>'
    }

    function validForm() {
        if($('#totalLimit').val().trim() == ""){
            toastr.error("优惠券总数不能为空");
            return false;
        }
        if($('#num').val().trim() == ""){
            toastr.error("单人券数不能为空");
            return false;
        }
        return true;
    }


    $(document).ready(function () {
        var oTable = $('#admin-table');
        var url = prefix + "/page";
        var keyword = "keyword=" + " ";
        loadData();

        var $modal = $('#myModal');
        var $thisTr;
        oTable.find('tbody').on('click', ' tr button.modify', function (e) {
            var code = $(this).attr("id");
            console.log(code);
            $thisTr = $(this).closest("tr");
            e.preventDefault();
            $.ajax({
                url: prefix + '/info/'+code,
                type: 'GET',
                success: function (data) {
                    $('#code').val(data.code);
                    console.log(data.code);
                    $('#name').val(data.name);
                    $('#des').val(data.des);
                    $('#num').val(data.num);
                    $('#totalLimit').val(data.totalLimit);
                    $('#preview').attr('src', data.logo);
                    $modal.modal('toggle');
                }
            });
        });

        $('#submit').click(function (e) {
            e.preventDefault();
            var code= $('#code').val();
            var des = $('#des').val();
            var totalLimit = $('#totalLimit').val();
            var num = $('#num').val();
             var logo = $('#preview').attr('src');      //预览图的src
            console.log(logo);
            if (validForm()) {
                $.ajax({
                    url: prefix + "/update",
                    type: 'POST',
                    data:'des=' + des + '&code=' + code + '&totalLimit=' + totalLimit + '&num=' + num + '&logo=' + logo,
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
                        "mDataProp": "name",
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
                        "mDataProp": "code",  //利用code再新建一列
                        "bSortable": false,
                        "mRender": function (data, type, full) {
                            return generateButton(data);     //把code的值传进去
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

    })
</script>
</body>
</html>
