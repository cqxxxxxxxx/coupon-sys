<%--
  Created by IntelliJ IDEA.
  User: cqxxxxx
  Date: 2016/7/21
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.form.js"></script>
    <link href="/resources/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<div class="container" style="width: 30%;">
    <form style="width: 100%" id="form">
        <div class="form-group">
            <label for="code1">活动编号</label>
            <input type="text" class="form-control" id="code1" placeholder="100">
        </div>
        <div class="form-group">
            <label for="type1">邀请码</label>
            <input type="text" class="form-control" id="type1" placeholder="offical/cqx100">
        </div>
        <div class="form-group">
            <select class="form-control" id="selectInfo">
                <option value="1">点击者信息</option>
                <option value="2">优惠者信息</option>
            </select>
        </div>
        <button type="submit" class="btn btn-default">查询</button>
    </form>
</div>

<div class="container">
    <table class="table table-hover" id="table1" style="visibility: hidden ">
        <tr>
            <th>邀请者</th>
            <th>活动编号</th>
            <th>浏览器</th>
            <th>IP</th>
            <th>点击时间</th>
        </tr>
    </table>
    <table class="table table-hover" id="table2" style="visibility: hidden ">
        <tr>
            <th>邀请者</th>
            <th>活动编号</th>
            <th>手机号</th>
            <th>获得时间</th>
        </tr>
    </table>
</div>

<script type="text/javascript">

    //dom加载完成后自动执行
    $(function () {

        var options;


        //            点击者的信息查询
        var options1 = {

            url: "/clickinfo/list",
            type: "GET",
            dataType: "json",
            success: function (data) {
                alert("success");
                $('#table1').visibility = true;
                $.each(data, function (index,content) {
                    var tr = "<tr><td>"+content.type+"</td><td>"+content.code+"</td><td>"+content.browser+"</td><td>"+content.ip+"</td><td>"+content.created+"</td></tr>"
                    $('#table1').append(tr);
                });
            },
        };

        //得到优惠的人的的信息查询
        var options2 = {
            url: "/shareinfo",
            type: "GET",
            dataType: "json",
            success: function (data) {
                alert("success");
                $('#table2').visibility = true;
                $.each(data, function (index,content) {
                    var tr = "<tr><td>"+content.type+"</td><td>"+content.code+"</td><td>"+content.phone+"</td><td>"+content.created+"</td></tr>"
                    $('#table2').append(tr);
                });
            },
        };

        alert("dom loaded");
        alert($('#selectInfo').val());
        /*
         var url = "/clickinfo/list";

         var options = {
         beforeSubmit: getSelect(),
         url: url ,
         dataType: "json",
         type: "GET",
         success: function (data) {
         alert("success");
         $('#info').text("哒哒哒哒哒");
         $.each(data, function (index,content) {
         $('#info').append("type为:" + content.type + "phone为:" + content.phone + "<br>");
         });
         },
         error: function () {
         alert("error");
         }
         }*/

        function getSelect() {

            if($('#selectInfo').val()=="1"){
                options = options1;

            }else{
                options = options2;

            }
            alert("options settled"+options);
        }

        getSelect();
        $('#form').ajaxForm(options);


    });

</script>
</body>
</html>
