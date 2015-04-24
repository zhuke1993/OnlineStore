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
                                <span class="red">网上商城</span>
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
                                        <form name="login_form" method="post" action="../login.action?flag=customer">
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
                                        <div>
                                            <a href="#" onclick="show_box('forgot-box'); return false;"
                                               class="forgot-password-link">
                                                <i class="icon-arrow-left"></i>
                                                忘记密码
                                            </a>
                                        </div>

                                        <div>
                                            <a href="#" onclick="show_box('signup-box'); return false;"
                                               class="user-signup-link">
                                                新用户注册
                                                <i class="icon-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/widget-body-->
                            </div>
                            <!--/login-box-->

                            <div id="forgot-box" class="forgot-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header red lighter bigger">
                                            <i class="icon-key"></i>
                                            Retrieve Password
                                        </h4>

                                        <div class="space-6"></div>
                                        <p>
                                            Enter your email and to receive instructions
                                        </p>

                                        <form/>
                                        <fieldset>
                                            <label>
															<span class="block input-icon input-icon-right">
																<input type="email" class="span12" placeholder="Email"/>
																<i class="icon-envelope"></i>
															</span>
                                            </label>

                                            <div class="clearfix">
                                                <button onclick="return false;"
                                                        class="width-35 pull-right btn btn-small btn-danger">
                                                    <i class="icon-lightbulb"></i>
                                                    Send Me!
                                                </button>
                                            </div>
                                        </fieldset>
                                        </form>
                                    </div>
                                    <!--/widget-main-->

                                    <div class="toolbar center">
                                        <a href="#" onclick="show_box('login-box'); return false;"
                                           class="back-to-login-link">
                                            Back to login
                                            <i class="icon-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <!--/widget-body-->
                            </div>
                            <!--/forgot-box-->

                            <div id="signup-box" class="signup-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header green lighter bigger">
                                            <i class="icon-group blue"></i>
                                            新用户注册
                                        </h4>

                                        <div class="space-6"></div>
                                        <p> 输入以下信息注册： </p>

                                        <form name="rg_form" method="post" action="../register.action">
                                            <input type="hidden" name="flag" value="customer">
                                            <fieldset>
                                                <label>
															<span class="block input-icon input-icon-right">
																<input id="email" name="rg_email" type="email"
                                                                       class="span12"
                                                                       placeholder="Email"/>
                                                                <label style="color: red" id="lemail"></label>
																<i class="icon-envelope"></i>
															</span>
                                                </label>
                                                <label>
															<span class="block input-icon input-icon-right">
																<input id="phone" name="rg_phone" type="phone"
                                                                       class="span12"
                                                                       placeholder="Phone"/>
                                                                <label style="color: red" id="lphone"></label>
																<i class="icon-phone"></i>
															</span>
                                                </label>

                                                <label>
															<span class="block input-icon input-icon-right">
																<input id="name" name="rg_name" type="text"
                                                                       class="span12"
                                                                       placeholder="Username"/>
                                                                 <label style="color: red" id="lname"></label>
																<i class="icon-user"></i>
															</span>
                                                </label>

                                                <label>
															<span class="block input-icon input-icon-right">
																<input id="pwd" name="rg_pwd" type="password"
                                                                       class="span12"
                                                                       placeholder="Password"/>
                                                                 <label style="color: red" id="lpwd"></label>
																<i class="icon-lock"></i>
															</span>
                                                </label>

                                                <label>
															<span class="block input-icon input-icon-right">
																<input id="repwd" name="rg_repwd" type="password"
                                                                       class="span12"
                                                                       placeholder="Repeat password"/>
																<i class="icon-retweet"></i>
                                                                 <label style="color: red" id="lrepwd"></label>
															</span>
                                                </label>

                                                <label>
                                                    <input type="checkbox"/>
															<span class="lbl">
																我接受
																<a href="#">用户协议</a>
															</span>
                                                </label>

                                                <div class="space-24"></div>

                                                <div class="clearfix">
                                                    <button type="reset" class="width-30 pull-left btn btn-small">
                                                        <i class="icon-refresh"></i>
                                                        重置
                                                    </button>

                                                    <button type="submit" onclick="return check()"
                                                            class="width-65 pull-right btn btn-small btn-success">
                                                        注册
                                                        <i class="icon-arrow-right icon-on-right"></i>
                                                    </button>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>

                                    <div class="toolbar center">
                                        <a href="#" onclick="show_box('login-box'); return false;"
                                           class="back-to-login-link">
                                            <i class="icon-arrow-left"></i>
                                            返回登陆
                                        </a>
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
<script type="text/javascript">
    //CharMode函数
    //测试某个字符是属于哪一类
    function CharMode(iN) {
        if (iN >= 48 && iN <= 57) //数字
            return 1;
        if (iN >= 65 && iN <= 90) //大写字母
            return 2;
        if (iN >= 97 && iN <= 122) //小写
            return 4;
        else
            return 8; //特殊字符
    }

    function isext() {
        jQuery.ajax({
            url: "../login.action",
            type: "post",
            dataType: "text",
            data: {
                "flag": "isnameexist",
                "login_name": $("#name").val()
            },
            success: function (data) {
                if (data == 1) {
                    $("#lname").text("用户名已存在");
                    return true;
                } else {
                    $("#lname").text("可以注册");
                    return false;
                }
            }
        });
    }

    $(function () {
        $("#name").blur(function () {
            if ($("#name").val() == "") {
                $("#lname").text("用户名不能为空");
                return false;
            } else {
                return isext();
                $("#lname").text("");
                return true;
            }
        });

        $("#pwd").blur(function () {
            var pwd = $.trim($("#pwd").val());
            if ($("#pwd").val() == "") {
                $("#lpwd").text("密码不能为空");
                return false;
            } else if (!/^[\w\W]{6,18}$/.test(pwd)) {
                $("#lpwd").text("输入6-18位密码");
                return false;
            } else {
                $("#lpwd").text("");
                return true;
            }
        });

        $("#pwd").keyup(function () {
            var pwd = $.trim($("#pwd").val());
            O_color = "#eeeeee";
            L_color = "#FF0000";
            M_color = "#FF9900";
            H_color = "#33CC00";
            if (pwd == null || pwd == '') {
                Lcolor = Mcolor = Hcolor = O_color;
            } else {
                S_level = checkStrong(pwd);
                switch (S_level) {
                    case 0:
                        Lcolor = Mcolor = Hcolor = O_color;
                    case 1:
                        Lcolor = L_color;
                        Mcolor = Hcolor = O_color;
                        break;
                    case 2:
                        Lcolor = Mcolor = M_color;
                        Hcolor = O_color;
                        break;
                    default:
                        Lcolor = Mcolor = Hcolor = H_color;
                }
            }
            document.getElementById("strength_L").style.background = Lcolor;
            document.getElementById("strength_M").style.background = Mcolor;
            document.getElementById("strength_H").style.background = Hcolor;
            return;
        });

        $("#repwd").blur(function () {
            if ($("#repwd").val() == "") {
                $("#lrepwd").text("请再次输入密码");
                return false;
            } else if ($("#pwd").val() != $("#repwd").val()) {
                $("#lrepwd").text("两次输入的密码不一致");
                return false;
            } else {
                $("#lrepwd").text("");
                return true;
            }
        });

        $("#phone").blur(function () {
            var phone = $.trim($("#phone").val());
            if ($("#phone").val() == "") {
                $("#lphone").text("联系电话不能为空");
                return false;
            } else {
                //匹配格式：11位手机号码，3-4位区号，7-8位电话号码，1-4位分机号，如：12345678901、1234-12345678-1234
                if (!/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/.test(phone)) {
                    $("#lphone").text("输入正确格式的联系电话");
                    return false;
                } else {
                    $("#lphone").text("");
                    return true;
                }
            }
        });

        $("#email").blur(function () {
            var email = $.trim($("#email").val());
            if ($("#email").val() == "") {
                $("#lemail").text("电子邮箱不能为空");
                return false;
            } else {
                if (!/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/.test(email)) {
                    $("#lemail").text("输入正确格式的电子邮箱");
                    return false;
                } else {
                    $("#lemail").text("");
                    return true;
                }
            }
        });

    });

    //在提交前进行检查
    function check() {
        if ($("#name").val() == "") {
            $("#lname").text("用户名不能为空");
            return false;
        }
        if ($("#pwd").val() == "") {
            $("#lpwd").text("密码不能为空");
            return false;
        }
        if ($("#repwd").val() == "") {
            $("#lrepwd").text("请再次输入密码");
            return false;
        } else if ($("#pwd").val() != $("#repwd").val()) {
            $("#lrepwd").text("两次输入的密码不一致");
            return false;
        }
        if ($("#phone").val() == "") {
            $("#lphone").text("联系电话不能为空");
            return false;
        }
        if ($("#email").val() == "") {
            $("#lemail").text("电子邮件不能为空");
            return false;
        }
        return true;

    }
</script>
<!--/.main-container-->

<!--inline scripts related to this page-->

<script type="text/javascript">
    function show_box(id) {
        $('.widget-box.visible').removeClass('visible');
        $('#' + id).addClass('visible');
    }
</script>
</body>
</html>
