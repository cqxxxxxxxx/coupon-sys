<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cqxxxxx
  Date: 2016/7/21
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>邀请页面</title>
    <script type="text/javascript" src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.form.js"></script>
    <link href="/resources/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>

    邀请页面
    code:${code}
    type:${type}
<%--    <%=request.getAttribute("code")%>
    <form action="/shareinfo/${code}/${type}" method="post">
        <input type="number" name="phone">
       &lt;%&ndash; <input type="text" name="code" value="${code}" style="visibility: hidden">
        <input type="text" name="type" value="${type}" style="visibility: hidden">
     &ndash;%&gt;
        <input type="submit" value="提交">
    </form>--%>


    <div class="container">
        <form id="form" action="/shareinfo/${code}/${type}" method="post">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">phone</span>
                <input name="phone" type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
            </div>
            <button type="submit" class="btn-default">
        </form>



    </div>



    <script type="text/javascript">
        $(function () {
            var options = {
                type:"POST",
                dataType:"json",
                success:function () {
                    alert("success");
                }
            };

            $('#form').ajaxForm(options);

        });

    </script>

</body>
</html>
