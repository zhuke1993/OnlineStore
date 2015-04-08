<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/8
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  Cookie[] cookies = request.getCookies();
  for(Cookie c: cookies){
    out.print(c.getName()+"\t"+c.getValue()+"<br>");
  }
%>
</body>
</html>
