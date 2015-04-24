<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>add_goods_success</title>
</head>
<body>
<script>
    alert("${add_goods_msg}");
    window.location.href = "index.jsp";
</script>
</body>
</html>