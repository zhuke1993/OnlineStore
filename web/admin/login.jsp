<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>登陆</title>

    <meta name="description" content="User login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!--basic styles-->

    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!--page specific plugin styles-->

    <!--fonts-->

    <link rel="stylesheet" href="assets/fontopensans.font"/>

    <!--ace styles-->

    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!--inline styles related to this page-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body class="login-layout">
<div class="main-container container-fluid">
    <div class="main-content">
        <div class="row-fluid">
            <div class="span12">
                <div class="login-container">
                    <div class="row-fluid">
                        <div class="center">
                            <h1>
                                <i class="icon-leaf green"></i>
                                <<span class="red">网上商城</span>
                                <span class="white">购物系统</span>
                            </h1>
                            <h4 class="blue">&copy; 余健华</h4>
                        </div>
                    </div>

                    <div class="space-6"></div>
                    <c:if test="${!empty lg_msg}">
                        <p style='color:red'>
                            <c:out value="${lg_msg}"></c:out>
                        </p>
                    </c:if>

                    <div class="row-fluid">
                        <div class="position-relative">
                            <div id="login-box" class="login-box visible widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="icon-coffee green"></i>
                                            请输入登陆信息：
                                        </h4>

                                        <div class="space-6"></div>
                                        <form name="login_form" method="post" action="login.action?flag=shop">
                                            <fieldset>
                                                <label>
															<span class="block input-icon input-icon-right">
																<input name="login_name" type="text" class="span12"
                                                                       placeholder="用户名"/>
																<i class="icon-user"></i>
															</span>
                                                </label>

                                                <label>
															<span class="block input-icon input-icon-right">
																<input name="login_pwd" type="password" class="span12"
                                                                       placeholder="密码"/>
																<i class="icon-lock"></i>
															</span>
                                                </label>

                                                <div class="space"></div>

                                                <div class="clearfix">
                                                    <label class="inline">
                                                        <input type="checkbox"/>
                                                        <span class="lbl"> Remember Me</span>
                                                    </label>

                                                    <button onclick="return $('#login_form').submit();"
                                                            class="width-35 pull-right btn btn-small btn-primary">
                                                        <i class="icon-key"></i>
                                                        登陆
                                                    </button>
                                                </div>

                                                <div class="space-4"></div>
                                            </fieldset>
                                        </form>

                                    </div>
                                    <!--/widget-main-->

                                    <div class="toolbar clearfix">
                                    </div>
                                </div>
                                <!--/widget-body-->
                            </div>

                            <!--/signup-box-->
                        </div>
                        <!--/position-relative-->
                    </div>
                </div>
            </div>
            <!--/.span-->
        </div>
        <!--/.row-fluid-->
    </div>
</div>
<!--/.main-container-->

<!--basic scripts-->

<!--[if !IE]>-->

<script src="assets/jquery.min.js"></script>

<!--<![endif]-->

<!--[if IE]>
<script src="assets/jquery1.min.js"></script>
<![endif]-->

<!--[if !IE]>-->

<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<!--<![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>

<!--page specific plugin scripts-->

<!--ace scripts-->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!--inline scripts related to this page-->

<script type="text/javascript">
    function show_box(id) {
        $('.widget-box.visible').removeClass('visible');
        $('#' + id).addClass('visible');
    }
</script>
</body>
</html>
