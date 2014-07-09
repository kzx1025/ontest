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
    
    <title>查询本人成绩</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" href="CSS/bootstrap2.min.css">

  </head>
  
  <body>
<%

  if((String) session.getAttribute("name")==null||((String) session.getAttribute("type")).equals("0"))
  {
  String show = "<script language='javascript' type='text/javascript'>alert('你没有登录账户,无法访问该网页!网也将自动跳转至登陆页面')</script>";
  out.println(show);
    response.sendRedirect("/ontest/login.jsp");
  }

   %>
		<div class="containter-fluid">
			<div class="row-fluid">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">

			<div class="nav-collapse collapse">
							<ul class="nav">
				<li class="active" >学生主页</li>
									<li class="active"><a  class="active" href="student.jsp">欢迎你,<%=(String) session.
getAttribute("name")+"同学"%></a></li>
																<li class='active'><a href="student.jsp"    >参加考试</a></li>
					<li ><a   href="student.jsp">帮助</a></li>
					<li ><a  href="register.jsp"    >注册</a></li>
					<li><a href="login.jsp"    >退出账户</a></li>
					
								</ul>
			</div>
		</div>
	</div>
</div>
			<div class="row-fluid" style="margin-top: 60px">
				<div class="span3"  id="navbar">
	<ul class="nav nav-pills nav-stacked span3" style="position:fixed">

					
			            		    		    
		    		    			    
		    
		    		    	<li ><a href="student.jsp">参加考试</a></li>

				<li class="active"><a href="student/home4.jsp">查看考试成绩</a></li>

	</ul>
</div>
<div class="span8">

	<a class="btn btn-large btn-primary"  href="student/home4.jsp">刷新</a>
	<p></p>
	<table cellpadding="10" border="1">
	<tr><td>考试ID</td><td>账号</td><td>考试人</td><td>试卷ID</td><td>试卷名称</td><td>分数</td></tr>
	<%
	String Driver="com.mysql.jdbc.Driver";
 String userId = request.getParameter("userId"); 
  String password= request.getParameter("password"); 
  String id=(String)session.getAttribute("userid");

String sql="select * from test where userid='"+id+"'";
String q_message="";
try{
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"; 

Connection conn=DriverManager.getConnection(url); 
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{ 
 out.println("<tr>");
   out.println("<td>"+rs.getString("testid")+"</td>");
   out.println("<td>"+rs.getString("userid")+"</td>");
    out.println("<td>"+rs.getString("name")+"</td>");
    out.println("<td>"+rs.getString("examid")+"</td>");
    out.println("<td>"+rs.getString("examname")+"</td>");    
    out.println("<td>"+rs.getString("score")+"</td>");        
out.println("</tr>");
}
conn.close();
}catch(Exception e){
e.printStackTrace();
}finally{
}

%>
</table>	
<div class="pagination">
		<ul>
			<li>
				<a href="#">首页</a>
			</li>
						<li class="active">
				<a href="#">第1页 </a>
			</li>
						<li><a href="#">尾页</a></li>
		</ul>
	</div>
</div>
</div>
</div>
  </body>
</html>
