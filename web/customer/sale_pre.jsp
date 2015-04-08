<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/6
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>sale_pre</title>
    <script src="js/jquery.min.js"></script>
</head>
<body>
<c:if test="${empty goodsPage}">
    <script>
        jQuery.ajax({
            url: 'getPage.action',
            type: 'post',
            dataType: 'text',
            data: {
                "flag": "customer",
                "page": 1,
                "rows": 12
            },
            success: function (data) {
                window.location.href = "sale.jsp";
            }
        });
    </script>
</c:if>
</body>
</html>
