<%@page import="java.sql.PreparedStatement"%>
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
    
    <title>请稍等</title>
    
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
String q_message="";
try{
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
String context=(String)request.getParameter("context");
String answer1=(String)request.getParameter("answer1");
String answer2=(String)request.getParameter("answer2");
String answer3=(String)request.getParameter("answer3");
String answer4=(String)request.getParameter("answer4");
String[] flag=request.getParameterValues("flag");

int sum=0;
for(int i=0;i<flag.length;i++)
sum=sum+Integer.parseInt(flag[i]);
Connection con=null;

String Driver="com.mysql.jdbc.Driver";
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"+"&characterUnicode=true&characterEncoding=utf8"; 
 con=DriverManager.getConnection(url); 
PreparedStatement stat1=con.prepareStatement("set names 'utf8'");
PreparedStatement stat=con.prepareStatement("insert into question(context,answer1,answer2,answer3,answer4,result) values(?,?,?,?,?,?)");
stat.setString(1,context);
stat.setString(2,answer1);
stat.setString(3,answer2);
stat.setString(4,answer3);
stat.setString(5,answer4);
stat.setInt(6, sum);
int count=stat.executeUpdate();
if(count>0)
{
q_message="success";
session.setAttribute("q_message",q_message);
%>

<jsp:forward page="home2.jsp"/>
<%
}
else{
%>
<jsp:forward page ="home2.jsp"/>
<%
}
con.close();
}catch(Exception e)
{
e.printStackTrace();
q_message="false";
session.setAttribute("q_message",q_message);
response.sendRedirect("home2.jsp");
}

  %>
  </body>
</html>
