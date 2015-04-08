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
    <title>付款</title>
</head>
<body>
<%--<c:if test="${empty lg_id}">
    <script>
        alert("你还未登陆登录，请先登录");
        window.location.href = "login.jsp";
    </script>
</c:if>--%>
<div id="order_inf">
收货地址：
<input type="text" name="receiverName">
</div>
<script>
    var arr = document.cookie.split("; ");
    for (var i = 0, len = arr.length; i < len; i++) {
        var item = arr[i].split("=");
        if (item[1].indexOf("undefined") < 0) {
            $("#order_inf").append("<a style=’text-decoration: none‘ href=details.jsp?goods_id=" + item[0] + ">商品id：" + item[0] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量：" + item[1] + "</a><br>");
        }
    }
</script>
</body>
</html>
