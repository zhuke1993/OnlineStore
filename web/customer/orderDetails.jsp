<%@ page import="com.onlinestore.entity.COrder" %>
<%@ page import="com.onlinestore.entity.Goods2Num" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单管理</title>
    <!--basic styles-->

    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!--page specific plugin styles-->

    <!--fonts-->

    <!--ace styles-->

    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!--inline styles related to this page-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

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
<c:if test="${empty cus_lg_id}">
    <script>
        alert("你还未登陆登录，请先登录");
        window.location.href = "login.jsp";
    </script>
</c:if>
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
<div class="main-container container-fluid" style="width: 100%" align="center">
    <a class="menu-toggler" id="menu-toggler" href="#">
        <span class="menu-text"></span>
    </a>

    <div class="main-content">
        <div class="page-content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="row-fluid">

                        <div class="table-header">
                            订单详情
                        </div>
                        <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label>
                                        <input type="checkbox"/>
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>订单id</th>
                                <th>金额</th>
                                <th class="hidden-480">
                                    <i class="icon-time bigger-110 hidden-phone"></i>
                                    下单时间
                                </th>

                                <th class="hidden-phone">
                                    商品列表
                                </th>
                                <th class="hidden-480">订单状态</th>
                                <th class="hidden-480">邮寄地址</th>
                            </tr>
                            </thead>
                            <c:forEach items="${order_list}" var="i">
                                <tr>
                                    <td class="center">
                                        <label>
                                            <input type="checkbox" id="select_id" name="select_id" value="${i.id}"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <p>${i.id}</p>
                                    </td>
                                    <td>${i.price}</td>
                                    <td class="hidden-480">${i.bargainDate}</td>
                                    <td>
                                        <%
                                            Set<Goods2Num> goods2NumSet = ((COrder) pageContext.getAttribute("i")).getGoods2NumSet();
                                            Iterator<Goods2Num> iterator = goods2NumSet.iterator();
                                            while (iterator.hasNext()) {
                                                int id = iterator.next().getGoods().getId();
                                                out.print("<a target='_blank' href=\"../searchGoods.action?id=" + id + "\">&nbsp;" + id + "&nbsp;</a>");
                                            }
                                        %>
                                    </td>
                                    <td class="td-actions">
                                        <c:if test="${i.status eq 0}">
                                            <p style="color: #D15B47;">未处理</p>
                                        </c:if>
                                        <c:if test="${i.status eq 1}">
                                            <p style="color: #0088CC;">已处理</p>
                                        </c:if>
                                    </td>
                                    <td class="hidden-480"><a
                                            href="../address.action?flag=find&address_id=${i.address.id}"> ${i.address.detailAddress}</a>
                                    </td>

                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-small btn-danger pull-left" data-dismiss="modal" id="status_btn"
                            onclick="return cus_modify()">
                        <i class="icon-remove">删除订单</i>

                    </button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function cus_modify() {
            var arr = document.getElementsByName("select_id");
            var selected_id = new Array();
            for (var i = 0, j = 0; i < arr.length; i++) {
                if (arr[i].checked) {
                    selected_id[j] = arr[i].value;
                    j++;
                }
            }
            jQuery.ajax({
                        url: 'orderModify.action?order_ids_str=' + selected_id,
                        type: 'post',
                        dataType: 'text',
                        data: {
                            "flag": "cus_delete"
                        },
                        success: function (data) {
                            alert(data);
                            window.location.href = "../orderDetail.action";
                        }
                    }
            );
        }
    </script>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>

    <!--basic scripts-->

    <!--[if !IE]>-->


    <!--<![endif]-->

    <!--[if IE]>
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

    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>

    <!--ace scripts-->

    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>

    <!--inline scripts related to this page-->

    <script type="text/javascript">
        $(function () {
            var oTable1 = $('#sample-table-2').dataTable({
                "aoColumns": [
                    {"bSortable": false},
                    null, null, null, null, null,
                    {"bSortable": false}
                ]
            });


            $('table th input:checkbox').on('click', function () {
                var that = this;
                $(this).closest('table').find('tr > td:first-child input:checkbox')
                        .each(function () {
                            this.checked = that.checked;
                            $(this).closest('tr').toggleClass('selected');
                        });

            });


            $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
            function tooltip_placement(context, source) {
                var $source = $(source);
                var $parent = $source.closest('table')
                var off1 = $parent.offset();
                var w1 = $parent.width();

                var off2 = $source.offset();
                var w2 = $source.width();

                if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
                return 'left';
            }
        })
    </script>
</div>
</body>
</html>
