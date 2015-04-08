<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/2/9
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>1.jsp</title>
</head>
<body>
<%
  Cookie[] cookies = request.getCookies();
  for(Cookie c: cookies){
    out.print(c.getName()+"\t"+c.getValue());
  }
%>
</body>
</html>
