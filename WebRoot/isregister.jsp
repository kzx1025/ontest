<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>等待</title>
    
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
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
String userid=(String)request.getParameter("userId");
String password=(String)request.getParameter("password");
String name=(String)request.getParameter("userName");
String sex=(String)request.getParameter("sex");
String identity=(String)request.getParameter("identity");
String reg_message="";
Connection con=null;
String user_exist="";
boolean exist=false;
out.println(exist);
try{
String Driver="com.mysql.jdbc.Driver";
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"+"&characterUnicode=true&characterEncoding=utf8"; 
String sql="select * from user where userid='"+userid+"'";
 con=DriverManager.getConnection(url); 
 Statement stmt=con.createStatement();
 out.println(exist);
ResultSet rs=stmt.executeQuery(sql);
out.println(exist);
if(rs.next()) 
{
exist=true;
out.println(exist);
}
if(exist)
{
user_exist="true";
session.setAttribute("user_exist", user_exist);
response.sendRedirect("register.jsp");

}
else{
out.println(exist);
 PreparedStatement stat1=con.prepareStatement("set names 'utf8'");
PreparedStatement stat=con.prepareStatement("insert into user values(?,?,?,?,?)");
stat.setString(1,userid);
stat.setString(2,password);
stat.setString(3,name);
stat.setString(4,sex);
stat.setString(5,identity);
int count=stat.executeUpdate();
if(count>0)
{

%>
<jsp:forward page="reg_success.jsp"/>
<%
}
else{

%>
<jsp:forward page ="error.jsp"/>
<%
}
}
}catch(Exception e)
{
e.printStackTrace();
//user_exist="true";
//session.setAttribute("user_exist", user_exist);
//response.sendRedirect("register.jsp");
}

  %>
  </body>
</html>
