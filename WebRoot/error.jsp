<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
      <h1>An Error Has Occurred</h1>
      <p>
        Sorry, but things didn't work out as planned. As much information about
        the problem has been logged for the administrator.
      </p>
      <p>
        If the problem continues please contact the administrator.
      </p>
<p></p>
      <p>点击链接返回登陆页面</p>
<a href="http://localhost:8080/ontest/login.jsp">登录页面</a>
<% 

request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
    </body>
</html>
