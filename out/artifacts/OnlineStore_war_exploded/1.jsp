<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/2/9
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>1.jsp</title>
</head>
<body>
<form action="fileUpload.action" method="post" enctype="multipart/form-data">
  <input type="file" name="files">
  <input type="submit" value="upload">
</form>
</body>
</html>
