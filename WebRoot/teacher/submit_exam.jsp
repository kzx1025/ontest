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
    
    <title>试卷提交中</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


  </head>
  
  <body>
  <%
  String message="";
  try{
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
int examid=Integer.parseInt(request.getParameter("exam_id"));
String examname=(String)request.getParameter("exam_name");
String creator=(String) session.getAttribute("name");
String[] exam_flag=request.getParameterValues("flag");
Connection con=null;

int i;

String Driver="com.mysql.jdbc.Driver";
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"+"&characterUnicode=true&characterEncoding=utf8"; 
 con=DriverManager.getConnection(url); 
PreparedStatement stat1=con.prepareStatement("set names 'utf8'");
PreparedStatement stat[]=new PreparedStatement[100];
int count[]=new int[100];

for( i=0;i<exam_flag.length;i++)
{
stat[i]=con.prepareStatement("insert into exam(examid,examname,questionid,creator)  values(?,?,?,?)");
stat[i].setInt(1,examid);
stat[i].setString(2,examname);
stat[i].setInt(3,Integer.parseInt(exam_flag[i]));
stat[i].setString(4,creator);
count[i]=stat[i].executeUpdate();
}

message="success";
session.setAttribute("message",message);
i=0;

%>

<jsp:forward page="home4.jsp"/>
<%

con.close();
}
catch(Exception e)
{
e.printStackTrace();
message="false";
session.setAttribute("message",message);

response.sendRedirect("home4.jsp");
}

  %>
  </body>
</html>
