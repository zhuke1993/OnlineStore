<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>商品列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>

    <script src="js/jquery.min.js"></script>
    <!-- start gallery_sale -->
    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
    <c:if test="${empty goodsPage}">
        <script>
            window.location.href = "getPage.action?flag=customer&page=1&rows=12";
        </script>
    </c:if>
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
<div class="header_bg">
    <div class="wrap">
        <div class="header">
            <div class="logo">
                <a href="sale_pre.jsp"><img src="images/logo.png" alt=""/> </a>
            </div>
            <div class="h_icon" id="cart_status">
                <ul class="icon1 sub-icon1">
                    <li><a class="active-icon c1"></a>
                        <ul class="sub-icon1 list" id="cart_item">
                        </ul>
                        购物车
                    </li>
                </ul>
            </div>
            <div class="h_search">
                <form method="post" action="searchGoods.action">
                    <input type="text" name="info">
                    <input type="submit" value="">
                </form>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="header_btm">
    <div class="wrap">
        <div class="header_sub">
            <div class="h_menu">
                <ul>
                    <li class="active"><a href="sale_pre.jsp">所有商品</a></li>
                    |
                    <li><a href="../orderDetail.action">我的订单</a></li>
                    |
                    <li><a href="account.jsp">我的账户</a></li>
                    |
                    <li><a href="logout.jsp">退出登陆</a></li>
                    |
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- start main -->
<div class="main_bg">
    <div class="wrap">
        <div class="main">
            <!-- start gallery_sale  -->
            <div class="gallery1">
                <div class="container">
                    <div id="portfoliolist">
                        <c:forEach items="${goodsPage}" var="g">
                            <div class="portfolio card" data-cat="card">
                                <div class="portfolio-wrapper">
                                    <a href="details.jsp?goods_id=${g.id}">
                                        <c:forEach items="${g.pictureSet}" var="p" begin="0" end="0">
                                            <img src="${p.url}" alt="${g.name}"/>
                                        </c:forEach>
                                    </a>
                                    <div class="label">
                                        <div class="label-text">
                                            <p style="font-size: 15px;color: blue">${g.name}</p>
                                            <p style="font-size: 15px;color: red">${g.briefIntroduction}--￥${g.price}</p>
                                        </div>
                                        <div class="label-bg"></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
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
<!-- start footer -->
<div class="footer_bg1">
    <div class="wrap">
        <div class="footer">
            <!-- scroll_top_btn -->
            <script type="text/javascript">
                $(document).ready(function () {

                    var defaults = {
                        containerID: 'toTop', // fading element id
                        containerHoverID: 'toTopHover', // fading element hover id
                        scrollSpeed: 1200,
                        easingType: 'linear'
                    };


                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>
            <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
            <!--end scroll_top_btn -->
            <div class="copy">
                <p class="link">Copyright &copy; 2015.Company 余健华 All rights reserved.</p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

</body>
</html>