<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!-- Header -->
<div id="header">
    <div class="color-line">
    </div>
    <div id="logo" class="light-version">
        <span>
            优惠券活动
        </span>
    </div>
    <nav role="navigation">
        <div class="header-link hide-menu"><i class="fa fa-bars"></i></div>

        <div class="navbar-right">
            <ul class="nav navbar-nav no-borders">
                <li class="dropdown">
                <a data-toggle="dropdown" href="#" class="dropdown-toggle" aria-expanded="false">
                    <i class="pe-7s-speaker"></i>
                </a>
                <ul class="dropdown-menu hdropdown notification animated flipInX">
                    <li>
                        <a>
                            <span class="label label-success">公告</span> 这是一个系统公告.
                        </a>
                    </li>
                </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="logout">
                        <i class="pe-7s-upload pe-rotate-90"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<script type="text/javascript">
    var path = location.pathname.split('/');
    var url = path[0]+"/logout";
    console.log(url);

    $('.logout').click(function (e) {
        $.post(url, function (data) {
            if (data == "success") {
                window.location.href = "/login";
            }
        });
    })
</script>
