<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/20
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>订单详情页</title>
</head>
<body>
<c:forEach items="${order_list}" var="i">
    <li>${i.id}</li>
    <li>${i.customer.name}</li>
    <li>${i.address.detailAddress}</li>

</c:forEach>
</body>
</html>
