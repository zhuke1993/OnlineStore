<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>我的账户</title>
    <c:if test="${empty shop_lg_id}">
        <script>
            alert("请先登录。");
            window.location.href = "login.jsp";
        </script>
    </c:if>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>

    <script src="js/jquery.min.js"></script>
    <!-- start gallery_sale -->
    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
    <script type="text/javascript">
        $(function () {

            var filterList = {

                init: function () {

                    // MixItUp plugin
                    // http://mixitup.io
                    $('#portfoliolist').mixitup({
                        targetSelector: '.portfolio',
                        filterSelector: '.filter',
                        effects: ['fade'],
                        easing: 'snap',
                        // call the hover effect
                        onMixEnd: filterList.hoverEffect()
                    });

                },

                hoverEffect: function () {

                    // Simple parallax effect
                    $('#portfoliolist .portfolio').hover(
                            function () {
                                $(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
                                $(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');
                            },
                            function () {
                                $(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
                                $(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');
                            }
                    );

                }

            };

            // Run the show!
            filterList.init();


        });
    </script>
    <!-- start top_js_button -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
            });
        });
    </script>
</head>
<body>
<!-- start header -->
<!-- start main -->
<div class="main_bg">
    <div class="wrap">
        <div class="main">
            <!-- start gallery_sale  -->
            <div class="gallery1">
                <div class="container">
                    <input type="hidden" name="flag" value="customer">
                    <fieldset>
                        <label>
															<span class="block input-icon input-icon-right">
																邮箱<input id="email" name="rg_email" type="email"
                                                                         class="span12"
                                                                         placeholder="Email"/>
                                                                <label style="color: red" id="lemail"></label>
																<i class="icon-envelope"></i>
															</span>
                        </label><br>
                        <label>
															<span class="block input-icon input-icon-right">
																电话：<input id="phone" name="rg_phone" type="phone"
                                                                          class="span12"
                                                                          placeholder="Phone"/>
                                                                <label style="color: red" id="lphone"></label>
																<i class="icon-phone"></i>
															</span>
                        </label><br>

                        <label>
															<span class="block input-icon input-icon-right">
																用户名：<input id="name" name="rg_name" type="text"
                                                                           class="span12"
                                                                           placeholder="Username"/>
                                                                 <label style="color: red" id="lname"></label>
																<i class="icon-user"></i>
															</span>
                        </label><br>

                        <label>
                        </label><br>

                        <label>
															<span class="block input-icon input-icon-right">
																修改密码：<input id="pwd" name="repwd" type="password"
                                                                            class="span12"
                                                                            placeholder="Repeat password"/>
																<i class="icon-retweet"></i>
                                                                 <label style="color: red" id="lpwd"></label>
															</span>
                        </label><br>

                        <label>
                            <input type="checkbox"/>
                        </label><br>

                        <div class="space-24"></div>

                        <div class="clearfix">
                            <button type="reset" class="width-30 pull-left btn btn-small">
                                <i class="icon-refresh"></i>
                                重置
                            </button>

                            <button onclick="return sub_modify();"
                                    class="width-65 pull-right btn btn-small btn-success">
                                修改
                                <i class="icon-arrow-right icon-on-right"></i>
                            </button>
                        </div>
                    </fieldset>
                </div>
                <!-- container -->
                <script type="text/javascript" src="js/fliplightbox.min.js"></script>
                <script type="text/javascript">$('body').flipLightBox()</script>
                <div class="clear"></div>
            </div>
            <!---End-gallery----->
        </div>
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
                "flag": "shop_isexist",
                "login_name": $("#name").val()
            },
            success: function (data) {
                if (data == 1) {
                    $("#lname").text("用户名已存在");
                    return true;
                } else {
                    $("#lname").text("可以使用");
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
    function sub_modify() {
        if (check()) {
            jQuery.ajax({
                url: 'account.action',
                type: 'post',
                dataType: 'text',
                data: {
                    "flag": "customer",
                    "name": $("#name").val(),
                    "pwd": $("#pwd").val(),
                    "phone": $("#phone").val(),
                    "email": $("#email").val()
                },
                success: function (data) {
                    alert(data);
                }
            });
        }
    }
</script>
</body>
</html>