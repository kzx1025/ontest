<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
   <%
try{
String Driver="com.mysql.jdbc.Driver";
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"; 
Connection connection=DriverManager.getConnection(url); 
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery("select * from user");
while (rs.next())
{
out.println(rs.getString(1));
out.println(rs.getString(2));
out.println(rs.getString(3));
out.println(rs.getString(4));
out.println(rs.getString(5));
}
if(!connection.isClosed())
{
connection.close();
}
}catch (SQLException e){
e.printStackTrace();
}

%>

  </body>
</html>
