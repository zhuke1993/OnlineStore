<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/8
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <title>付款</title>
</head>
<body>
<c:if test="${empty lg_id}">
    <script>
        alert("你还未登陆登录，请先登录");
        window.location.href = "login.jsp";
    </script>
</c:if>
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
                        $("#address_info").append("<input type='radio' id='address_id_se' name='add_select' value=" + data[i].id + ">收件人姓名：" + data[i].receiverName + "&nbsp;&nbsp;&nbsp;&nbsp;联系电话：" + data[i].phoneNumber + "&nbsp;&nbsp;&nbsp;&nbsp;详细地址：" + data[i].detailAddress + "&nbsp;&nbsp;&nbsp;&nbsp;邮编：" + data[i].postCode + "<br>");
                    }
                }
            }
    );
</script>
<div id="order_inf">
    收货地址：
    <form id="address_info" method="post">
    </form>
    新增收货地址：
    <form id="add_address" method="post">
        收件人姓名：<input type="text" name="receiverName" id="receiverName">
        手机号码：<input type="text" name="phoneNumber" id="phoneNumber">
        详细地址：<input type="text" name="detailAddress" id="detailAddress">
        邮编：<input type="text" name="postCode" id="postCode">
        <button id="add_add_btn" onclick="return add_address()">确认添加</button>
    </form>

    <div id="goods_item">
        <form id="pay_form" action="pay.action" method="post">

        </form>
    </div>

</div>
<script>
    <%--从cookies中读取购买信息，并添加到相关的div中进行显示--%>
    var arr = document.cookie.split("; ");
    var total_pay = 0;
    $("#order_inf").append("<br>商品购买信息：<br>");
    for (var i = 0, len = arr.length; i < len; i++) {
        var item = arr[i].split("=");
        if (item[1].indexOf("undefined") < 0) {
            $("#order_inf").append("<a style=’text-decoration: none‘ href=details.jsp?goods_id=" + item[0] + ">商品id：" + item[0] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量：" + item[1] + "</a><br>");
            $("#pay_form").append("<input type='hidden' name='goods_ids' value= " + item[0] + ">");
            $("#pay_form").append("<input type='hidden' name='goods_nums' value= " + item[1] + ">");
        }
        total_pay = parseFloat(total_pay) + parseFloat(item[1]);
    }
    $("#order_inf").append("<button id='pay_order_btn' onclick='return pay_btn_fun();'>添加订单</button>");

    /*添加到订单*/
    function pay_btn_fun() {
//        给地址赋值
        $("#pay_form").append("<input name='address_id' value= " + $("#address_id_se").val() + ">");
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
</body>
</html>
