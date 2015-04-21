<%@ page import="java.util.List" %>
<%@ page import="com.onlinestore.entity.Goods" %>
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
                <a href="index.jsp"><img src="images/logo.png" alt=""/> </a>
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
                <form>
                    <input type="text" value="">
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
                    <li class="active"><a href="index.jsp">Home</a></li>
                    |
                    <li><a href="sale.jsp">sale</a></li>
                    |
                    <li><a href="handbags.html">handbags</a></li>
                    |
                    <li><a href="accessories.html">accessories</a></li>
                    |
                    <li><a href="wallets.html">wallets</a></li>
                    |
                    <li><a href="sale.jsp">sale</a></li>
                    |
                    <li><a href="index.jsp">mens store</a></li>
                    |
                    <li><a href="shoes.html">shoes</a></li>
                    |
                    <li><a href="sale.jsp">vintage</a></li>
                    |
                    <li><a href="service.html">services</a></li>
                    |
                    <li><a href="contact.html">Contact us</a></li>
                </ul>
            </div>
            <div class="top-nav">
                <nav class="nav">
                    <a href="#" id="w3-menu-trigger"> </a>
                    <ul class="nav-list" style="">
                        <li class="nav-item"><a class="active" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a href="sale.jsp">Sale</a></li>
                        <li class="nav-item"><a href="handbags.html">Handbags</a></li>
                        <li class="nav-item"><a href="accessories.html">Accessories</a></li>
                        <li class="nav-item"><a href="shoes.html">Shoes</a></li>
                        <li class="nav-item"><a href="service.html">Services</a></li>
                        <li class="nav-item"><a href="contact.html">Contact</a></li>
                    </ul>
                </nav>
                <div class="search_box">
                    <form>
                        <input type="text" value="Search" onfocus="this.value = '';"
                               onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
                    </form>
                </div>
                <div class="clear"></div>
                <script src="js/responsive.menu.js"></script>
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
                                <h4>购买数量:&nbsp;&nbsp;&nbsp;<select id="buy_num" >
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
                                    for (var i = 0, len = arr.length; i < len; i++) {
                                        var item = arr[i].split("=");
                                        $("#").append("<a href=details.jsp?goods_id=" + item[0] + ">商品id：" + item[0] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量：" + item[1] + "</a><br>");
                                    }
                                    $("#cart_item").append("<input type='button' value='结账' onclick='window.location.href=\"pay.jsp\"'>");
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
                    <!-- start tabs -->
                    <section class="tabs">
                        <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked">
                        <label for="tab-1" class="tab-label-1">overview</label>

                        <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2">
                        <label for="tab-2" class="tab-label-2">consumer electronics</label>

                        <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3">
                        <label for="tab-3" class="tab-label-3">semiconductor</label>

                        <div class="clear-shadow"></div>

                        <div class="content">
                            <div class="content-1">
                                <p class="para top"><span>LOREM IPSUM</span> There are many variations of passages of
                                    Lorem Ipsum available, but the majority have suffered alteration in some form, by
                                    injected humour, or randomised words which don't look even slightly believable. If
                                    you are going to use a passage of Lorem Ipsum, you need to be sure there isn't
                                    anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators
                                    on the Internet tend to repeat predefined chunks as necessary, making this the first
                                    true generator on the Internet. It uses a dictionary of over 200 Latin words,
                                    combined </p>
                                <ul>
                                    <li>Research</li>
                                    <li>Design and Development</li>
                                    <li>Porting and Optimization</li>
                                    <li>System integration</li>
                                    <li>Verification, Validation and Testing</li>
                                    <li>Maintenance and Support</li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                            <div class="content-2">
                                <p class="para"><span>WELCOME </span> Contrary to popular belief, Lorem Ipsum is not
                                    simply random text. It has roots in a piece of classical Latin literature from 45
                                    BC, making it over 2000 years old. Richard McClintock, a Latin professor at
                                    Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,
                                    consectetur, from a Lorem Ipsum passage, and going through the cites of the word in
                                    classical literature, discovered the undoubtable source. Lorem Ipsum comes from
                                    sections </p>
                                <ul class="qua_nav">
                                    <li>Multimedia Systems</li>
                                    <li>Digital media adapters</li>
                                    <li>Set top boxes for HDTV and IPTV Player applications on various Operating Systems
                                        and Hardware Platforms
                                    </li>
                                </ul>
                            </div>
                            <div class="content-3">
                                <p class="para top"><span>LOREM IPSUM</span> There are many variations of passages of
                                    Lorem Ipsum available, but the majority have suffered alteration in some form, by
                                    injected humour, or randomised words which don't look even slightly believable. If
                                    you are going to use a passage of Lorem Ipsum, you need to be sure there isn't
                                    anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators
                                    on the Internet tend to repeat predefined chunks as necessary, making this the first
                                    true generator on the Internet. It uses a dictionary of over 200 Latin words,
                                    combined </p>
                                <ul>
                                    <li>Research</li>
                                    <li>Design and Development</li>
                                    <li>Porting and Optimization</li>
                                    <li>System integration</li>
                                    <li>Verification, Validation and Testing</li>
                                    <li>Maintenance and Support</li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </section>
                    <!-- end tabs -->
                </div>
                <!-- start sidebar -->
                <div class="left_sidebar">
                    <div class="sellers">
                        <h4>Best Sellers</h4>

                        <div class="single-nav">
                            <ul>
                                <li><a href="#">Always free from repetition</a></li>
                                <li><a href="#">Always free from repetition</a></li>
                                <li><a href="#">The standard chunk of Lorem Ipsum</a></li>
                                <li><a href="#">The standard chunk of Lorem Ipsum</a></li>
                                <li><a href="#">Always free from repetition</a></li>
                                <li><a href="#">The standard chunk of Lorem Ipsum</a></li>
                                <li><a href="#">Always free from repetition</a></li>
                                <li><a href="#">Always free from repetition</a></li>
                                <li><a href="#">Always free from repetition</a></li>
                                <li><a href="#">The standard chunk of Lorem Ipsum</a></li>
                                <li><a href="#">Always free from repetition</a></li>
                                <li><a href="#">Always free from repetition</a></li>
                                <li><a href="#">Always free from repetition</a></li>
                            </ul>
                        </div>
                        <div class="banner-wrap bottom_banner color_link">
                            <a href="#" class="main_link">
                                <figure><img src="images/delivery.png" alt=""></figure>
                                <h5><span>Free Shipping</span><br> on orders over $99.</h5>

                                <p>This offer is valid on all our store items.</p></a>
                        </div>
                        <div class="brands">
                            <h1>Brands</h1>

                            <div class="field">
                                <select class="select1">
                                    <option>Please Select</option>
                                    <option>Lorem ipsum dolor sit amet</option>
                                    <option>Lorem ipsum dolor sit amet</option>
                                    <option>Lorem ipsum dolor sit amet</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end sidebar -->
                <div class="clear"></div>
            </div>
            <!-- end content -->
        </div>
    </div>
</div>
<!-- start footer -->
<div class="footer_bg">
    <div class="wrap">
        <div class="footer">
            <!-- start grids_of_4 -->
            <div class="grids_of_4">
                <div class="grid1_of_4">
                    <h4>featured sale</h4>
                    <ul class="f_nav">
                        <li><a href="#">alexis Hudson</a></li>
                        <li><a href="#">american apparel</a></li>
                        <li><a href="#">ben sherman</a></li>
                        <li><a href="#">big buddha</a></li>
                        <li><a href="#">channel</a></li>
                        <li><a href="#">christian audigier</a></li>
                        <li><a href="#">coach</a></li>
                        <li><a href="#">cole haan</a></li>
                    </ul>
                </div>
                <div class="grid1_of_4">
                    <h4>mens store</h4>
                    <ul class="f_nav">
                        <li><a href="#">alexis Hudson</a></li>
                        <li><a href="#">american apparel</a></li>
                        <li><a href="#">ben sherman</a></li>
                        <li><a href="#">big buddha</a></li>
                        <li><a href="#">channel</a></li>
                        <li><a href="#">christian audigier</a></li>
                        <li><a href="#">coach</a></li>
                        <li><a href="#">cole haan</a></li>
                    </ul>
                </div>
                <div class="grid1_of_4">
                    <h4>women store</h4>
                    <ul class="f_nav">
                        <li><a href="#">alexis Hudson</a></li>
                        <li><a href="#">american apparel</a></li>
                        <li><a href="#">ben sherman</a></li>
                        <li><a href="#">big buddha</a></li>
                        <li><a href="#">channel</a></li>
                        <li><a href="#">christian audigier</a></li>
                        <li><a href="#">coach</a></li>
                        <li><a href="#">cole haan</a></li>
                    </ul>
                </div>
                <div class="grid1_of_4">
                    <h4>quick links</h4>
                    <ul class="f_nav">
                        <li><a href="#">alexis Hudson</a></li>
                        <li><a href="#">american apparel</a></li>
                        <li><a href="#">ben sherman</a></li>
                        <li><a href="#">big buddha</a></li>
                        <li><a href="#">channel</a></li>
                        <li><a href="#">christian audigier</a></li>
                        <li><a href="#">coach</a></li>
                        <li><a href="#">cole haan</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
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
                <p class="link">Copyright &copy; 2014.Company name All rights reserved.<a target="_blank"
                                                                                          href="http://www.cssmoban.com/">
                    &#x7F51;&#x9875;&#x6A21;&#x677F;</a> - More Templates <a href="http://www.cssmoban.com/"
                                                                             target="_blank" title="模板之家">模板之家</a></p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

</body>
</html>