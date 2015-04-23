<%--
  Created by IntelliJ IDEA.
  User: zhuke
  Date: 2015/4/8
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>

    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!--page specific plugin styles-->

    <!--fonts-->

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>

    <!--ace styles-->

    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!--inline styles related to this page-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <!--basic scripts-->

    <title>付款</title>
</head>
<body>
<c:if test="${empty cus_lg_id}">
    <script>
        alert("你还未登陆登录，请先登录");
        window.location.href = "login.jsp";
    </script>
</c:if>
<div class="main-container container-fluid">
    <a class="menu-toggler" id="menu-toggler" href="#">
        <span class="menu-text"></span>
    </a>

    <div class="main-content">
        <div class="page-content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="row-fluid">
                        <h3 class="header smaller lighter blue">添加订单</h3>
                        新增收货地址：
                        <form id="add_address" method="post">
                            收件人姓名：<input type="text" name="receiverName" id="receiverName">
                            手机号码：<input type="text" name="phoneNumber" id="phoneNumber">
                            详细地址：<input type="text" name="detailAddress" id="detailAddress">
                            邮编：<input type="text" name="postCode" id="postCode">
                            <button id="add_add_btn" onclick="return add_address()">确认添加</button>
                        </form>
                        <hr>
                        <div class="table-header">
                            选择收货地址
                        </div>
                        <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                </th>
                                <th>收货人姓名</th>
                                <th>电话</th>
                                <th>
                                    详细地址
                                </th>

                                <th>
                                    邮编
                                </th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
                <script>
                    jQuery.ajax({
                                url: 'address.action',
                                type: 'post',
                                dataType: 'json',
                                data: {
                                    "flag": "get"
                                },
                                success: function (data) {
                                    for (var i = 0; i < data.length; i++) {
                                        //$("#address_info").append("<input type='radio' id='address_id_se' name='add_select' value=" + data[i].id + ">收件人姓名：" + data[i].receiverName + "&nbsp;&nbsp;&nbsp;&nbsp;联系电话：" + data[i].phoneNumber + "&nbsp;&nbsp;&nbsp;&nbsp;详细地址：" + data[i].detailAddress + "&nbsp;&nbsp;&nbsp;&nbsp;邮编：" + data[i].postCode + "<br>");
                                        $("#sample-table-2").append("<tr><td class=\"center\"><label><input type=\"radio\" id=\"address_id_se\" name=\"add_select\" value=" + data[i].id + "><span class=\"lbl\"></span></label></td><td><p>" + data[i].receiverName + "</p></td><td>" + data[i].phoneNumber + "</td><td>" + data[i].detailAddress + "</td><td class=\"td-actions\">" + data[i].postCode + "</td></tr>");
                                    }
                                }
                            }
                    );
                </script>
            </div>
            <hr>
            <div id="goods_item">
                <form id="pay_form" action="pay.action" method="post">
                </form>
            </div>
        </div>
    </div>
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>
<script>
    <%--从cookies中读取购买信息，并添加到相关的div中进行显示--%>
    var arr = document.cookie.split("; ");
    var total_pay = 0;
    $("#goods_item").append("<br>商品购买信息：<br>");
    for (var i = 0, len = arr.length; i < len; i++) {
        var item = arr[i].split("=");
        if (item[1].indexOf("undefined") < 0) {
            $("#goods_item").append("<a style=’text-decoration: none‘ href=details.jsp?goods_id=" + item[0] + ">商品id：" + item[0] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量：" + item[1] + "</a><br>");
            $("#pay_form").append("<input type='hidden' name='goods_ids' value= " + item[0] + ">");
            $("#pay_form").append("<input type='hidden' name='goods_nums' value= " + item[1] + ">");
        }
        total_pay = parseFloat(total_pay) + parseFloat(item[1]);
    }
    $("#goods_item").append("<br><button id='pay_order_btn' onclick='return pay_btn_fun();'>添加订单</button><hr>");

    //设置cookie
    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + "; " + expires;
    }
    //清除cookie
    function clearCookie(name) {
        setCookie(name, "", -1);
    }

    /*添加到订单*/
    function pay_btn_fun() {
//        给地址赋值
        $("#pay_form").append("<input id='test' name='address_id' value= " + $("#address_id_se").val() + ">");
        //清除cookie信息
        <%--从cookies中读取购买信息，并添加到相关的div中进行显示--%>
        var arr = document.cookie.split("; ");
        for (var i = 0, len = arr.length; i < len; i++) {
            var item = arr[i].split("=");
            if (item[1].indexOf("undefined") < 0) {
                clearCookie(item[0]);
            }
        }
        $("#pay_form").submit();
    }

    /*添加收货地址的ajax提交代码*/
    function add_address() {
        jQuery.ajax({
                    url: 'address.action',
                    type: 'post',
                    dataType: 'text',
                    data: {
                        "flag": "add",
                        "receiverName": $("#receiverName").val(),
                        "phoneNumber": $("#phoneNumber").val(),
                        "detailAddress": $("#detailAddress").val(),
                        "receiverName": $("#receiverName").val(),
                        "postCode": $("#postCode").val()
                    },
                    success: function (data) {
                        alert(data);
                        location.reload();
                    }
                }
        );
    }
</script>

<!--[if !IE]>-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!--<![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
</body>
</html>
