<%@ page import="java.util.List" %>
<%@ page import="com.onlinestore.entity.Goods" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>商品详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- start details -->
    <link rel="stylesheet" type="text/css" href="css/productviewgallery.css" media="all"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/cloud-zoom.1.0.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="js/jquery.fancybox-buttons.js"></script>
    <script type="text/javascript" src="js/jquery.fancybox-thumbs.js"></script>
    <script type="text/javascript" src="js/productviewgallery.js"></script>
    <!-- start top_js_button -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
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
            <!-- start content -->
            <div class="single">
                <!-- start span1_of_1 -->
                <div class="left_content">
                    <div class="span1_of_1">
                        <!-- start product_slider -->
                        <div class="product-view">
                            <div class="product-essential">
                                <div class="product-img-box">
                                    <div class="more-views" style="float:left;">
                                        <div class="more-views-container">
                                            <ul>
                                                <li>
                                                    <a class="cs-fancybox-thumbs" data-fancybox-group="thumb"
                                                       style="width:64px;height:85px;" href="" title="" alt="">
                                                        <img src="" src_main="" title="" alt=""/></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product-image">
                                        <a class="cs-fancybox-thumbs cloud-zoom"
                                           rel="adjustX:30,adjustY:0,position:'right',tint:'#202020',tintOpacity:0.5,smoothMove:2,showTitle:true,titleOpacity:0.5"
                                           data-fancybox-group="thumb" href="images/0001-2.jpg" title="Women Shorts"
                                           alt="Women Shorts">
                                            <img src="images/0001-2.jpg" alt="Women Shorts" title="Women Shorts"/>
                                        </a>
                                    </div>
                                    <%
                                        if (request.getParameter("goods_id") != null) {
                                            int goods_id = Integer.parseInt(request.getParameter("goods_id"));
                                            pageContext.setAttribute("goods_id", new Integer(goods_id).toString());
                                            List<Goods> list = (List) session.getAttribute("goodsPage");
                                            for (Goods g : list) {
                                                if (g.getId() == goods_id) {
                                                    pageContext.setAttribute("detail_goods", g);
                                                }
                                            }
                                        }
                                    %>
                                    <input type="hidden" name="goods_id" id="goods_id" value="${goods_id}">
                                    <script type="text/javascript">
                                        jQuery.ajax({
                                            url: 'goodsDetail.action',
                                            type: 'post',
                                            dataType: 'text',
                                            data: {
                                                "goods_id": $("#goods_id").val()
                                            },
                                            success: function (data) {
                                                var prodGallery = jQblvg.parseJSON(data),
                                                        gallery_elmnt = jQblvg('.product-img-box'),
                                                        galleryObj = new Object(),
                                                        gallery_conf = new Object();
                                                gallery_conf.moreviewitem = '<a class="cs-fancybox-thumbs" data-fancybox-group="thumb" style="width:64px;height:85px;" href=""  title="" alt=""><img src="" src_main="" width="64" height="85" title="" alt="" /></a>';
                                                gallery_conf.animspeed = 200;
                                                jQblvg(document).ready(function () {
                                                    galleryObj[1] = new prodViewGalleryForm(prodGallery, 'prod_1', gallery_elmnt, gallery_conf, '.product-image', '.more-views', 'http:');
                                                    jQblvg('.product-image .cs-fancybox-thumbs').absoluteClick();
                                                    jQblvg('.cs-fancybox-thumbs').fancybox({
                                                        prevEffect: 'none',
                                                        nextEffect: 'none',
                                                        closeBtn: true,
                                                        arrows: true,
                                                        nextClick: true,
                                                        helpers: {
                                                            thumbs: {
                                                                width: 64,
                                                                height: 85,
                                                                position: 'bottom'
                                                            }
                                                        }
                                                    });
                                                    jQblvg('#wrap').css('z-index', '100');
                                                    jQblvg('.more-views-container').elScroll({
                                                        type: 'vertical',
                                                        elqty: 4,
                                                        btn_pos: 'border',
                                                        scroll_speed: 400
                                                    });

                                                });

                                                function initGallery(a, b, element) {
                                                    galleryObj[a] = new prodViewGalleryForm(prods, b, gallery_elmnt, gallery_conf, '.product-image', '.more-views', '');
                                                }
                                                ;
                                            }
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                        <!-- end product_slider -->
                    </div>
                    <!-- start span1_of_1 -->
                    <div class="span1_of_1_des">
                        <div class="desc1">

                            <h3 id="name_value">${detail_goods.name}</h3>

                            <p>${detail_goods.briefIntroduction}</p>
                            <h5>RMB:<h5 id="price_value">${detail_goods.price}</h5></h5>

                            <div class="available">
                                <h4>规格:&nbsp;&nbsp;&nbsp;${detail_goods.specification}</h4>
                                <h4>剩余库存:&nbsp;&nbsp;&nbsp;${detail_goods.inventory}</h4>
                                <h4>邮费:&nbsp;&nbsp;&nbsp;${detail_goods.postage}</h4>
                                <h4>购买数量:&nbsp;&nbsp;&nbsp;<select id="buy_num">
                                    <option selected>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                </select></h4>
                                <div class="btn_form">
                                    <input type="button" value="添加到购物车" title="" id="add_cart" name="add_cart"/>
                                </div>

                                <script type="text/javascript">
                                    $("#add_cart").click(function () {
                                        document.cookie = $("#goods_id").val() + "=" + $("#buy_num").val();
                                        alert("添加到购物车成功");
                                    });
                                </script>
                                <%--添加购物车显示--%>
                                <script>
                                    var arr = document.cookie.split("; ");
                                    if (arr.length > 0) {
                                        for (var i = 0, len = arr.length; i < len; i++) {
                                            var item = arr[i].split("=");
                                            $("#cart_item").append("<a href=details.jsp?goods_id=" + item[0] + ">商品id：" + item[0] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量：" + item[1] + "</a><br>");
                                        }
                                        $("#cart_item").append("<input type='button' value='结账' onclick='window.location.href=\"pay.jsp\"'>");
                                    }

                                </script>
                                <span class="span_right"><p style="text-decoration: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></span>

                                <div class="clear"></div>
                            </div>
                            <div class="share-desc">
                                <div class="share">
                                    <h4><br><br><br><br><br><br></h4>
                                    <ul class="share_nav">
                                        <li></li>
                                        <li></li>
                                        <li></li>
                                        <li></li>
                                    </ul>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
            <!-- end content -->
        </div>
    </div>
</div>
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