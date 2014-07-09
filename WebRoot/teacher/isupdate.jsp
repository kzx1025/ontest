<%@page import="java.sql.Statement"%>
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
    
    <title>My JSP 'isupdate.jsp' starting page</title>
    
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
String context=(String)request.getParameter("context");
String answer1=(String)request.getParameter("answer1");
String answer2=(String)request.getParameter("answer2");
String answer3=(String)request.getParameter("answer3");
String answer4=(String)request.getParameter("answer4");
int questionid=Integer.parseInt(request.getParameter("questionid"));
String[] flag=request.getParameterValues("flag");
String up_message="";
int sum=0;
for(int i=0;i<flag.length;i++)
sum=sum+Integer.parseInt(flag[i]);
Connection con=null;
String sql="update question set context='"+context+"',answer1='"+answer1
+"',answer2='"+answer2+"',answer3='"+answer3+"',answer4='"+answer4+"',result="+sum+" where questionid="+questionid;
out.print(questionid);
out.print(context);
out.print(sum);
out.print(sql);
try{
String Driver="com.mysql.jdbc.Driver";
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"+"&characterUnicode=true&characterEncoding=utf8"; 
 con=DriverManager.getConnection(url); 
PreparedStatement stat1=con.prepareStatement("set names 'utf8'");
//PreparedStatement stat=con.prepareStatement("insert into question(context,answer1,answer2,answer3,answer4,result) values(?,?,?,?,?,?)");
Statement stmt=con.createStatement();

int count=stmt.executeUpdate(sql);
if(count>0)
{
up_message="success";
session.setAttribute("up_message",up_message);
response.sendRedirect("/ontest/teacher.jsp");
}
else{
up_message="false";
session.setAttribute("up_message",up_message);
response.sendRedirect("/ontest/teacher.jsp");
}
con.close();
}catch(Exception e)
{
e.printStackTrace();
up_message="false";
session.setAttribute("up_message",up_message);
response.sendRedirect("/ontest/teacher.jsp");
}

  %>
  </body>
</html>
