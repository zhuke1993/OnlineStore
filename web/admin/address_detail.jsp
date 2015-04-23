<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/22
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>地址详情</title>
</head>
<body>
<c:if test="${!empty address}">
    地址信息：
    <br>

    <p>id:${address.id}</p>

    <p>收货人：${address.receiverName}</p>

    <p>电话：${address.phoneNumber}</p>

    <p>详细地址：${address.detailAddress}</p>

    <p>邮编：${address.postCode}</p>
</c:if>
</body>
</html>
