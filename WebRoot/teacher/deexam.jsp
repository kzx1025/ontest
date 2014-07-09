<%@page import="java.sql.Statement"%>
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
    
    <title>删除中</title>
    
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

  if((String) session.getAttribute("name")==null||((String) session.getAttribute("type")).equals("1"))
  {
  String show = "<script language='javascript' type='text/javascript'>alert('你没有登录账户或者没有获取相应的权限,无法访问该网页!网也将自动跳转至登陆页面')</script>";
  out.println(show);
    response.sendRedirect("/ontest/login.jsp");
  }
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
String delsuccess2="";
 int m=0;
Connection con=null;
int examid=Integer.parseInt(request.getParameter("examid"));
String Driver="com.mysql.jdbc.Driver";
out.println(examid);
String sql="delete from exam where examid="+examid;
try{
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"; 

con=DriverManager.getConnection(url); 

Statement stmt=con.createStatement();
boolean success=stmt.execute(sql);
if(success==true)
{

response.sendRedirect("home3.jsp");
return;
}
con.close();
response.sendRedirect("home3.jsp");
return;
}catch(Exception e){
//e.printStackTrace();
delsuccess2="false";
session.setAttribute("delsuccess2",delsuccess2);
response.sendRedirect("home3.jsp");

}
  %>
  </body>
</html>
