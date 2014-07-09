<%@page import="java.sql.ResultSet"%>
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
    
    <title>检测账户</title>
    
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
String rand = (String)session.getAttribute("randomString");
String input = request.getParameter("inputCode");
if(rand.equals(input)){ 

} else{ 
String yanzheng="false";
session.setAttribute("yanzheng", yanzheng);
response.sendRedirect("login.jsp");
return;
} 
boolean isValid=false;
String Driver="com.mysql.jdbc.Driver";
 String userid = request.getParameter("userId"); 
  String password= request.getParameter("password"); 
String sql="select * from user where userid='"+userid+"' and password='"+password+"'";
String type="";
String name="";
String login_message="";
try{
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"; 

Connection conn=DriverManager.getConnection(url); 
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(sql);
if(rs.next()) 
{
isValid=true;
type=rs.getString("identity");
name=rs.getString("name");
}
rs.close();
stmt.close();
conn.close();
}catch(Exception e){
e.printStackTrace();
}finally{
}


if(isValid)
{
session.setAttribute("userid",userid);
session.setAttribute("name",name);
session.setAttribute("type",type);
if(type.equals("1")){
response.sendRedirect("student.jsp");
}
else{
response.sendRedirect("teacher.jsp");
}

}
else{
login_message="false";
session.setAttribute("login_message",login_message);

response.sendRedirect("login.jsp");
}
%>
  </body>
</html>
