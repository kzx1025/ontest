<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

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
    
    <title>查看试卷</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="CSS/bootstrap2.min.css">





  </head>
  
  <body>
 <%

  if((String) session.getAttribute("name")==null||((String) session.getAttribute("type")).equals("1"))
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
			<!-- <a class="brand" href="#">计算机学院官网管理后台</a> -->
			<div class="nav-collapse collapse">
							<ul class="nav">
				<li class="active" >教师主页</li>
									<li class="active"><a  class="active" href="teacher.jsp">欢迎你,<%=(String) session.
getAttribute("name")+"老师"%></a></li>
																<li class='active'><a href="teacher.jsp"    >创建题目</a></li>
					<li ><a   href="teacher.jsp">帮助</a></li>
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

					
			            		    		    
		    		    			    
		    
		    		    	<li ><a href="teacher.jsp">查看试题</a></li>
				<li ><a href="teacher/home2.jsp">创建试题</a></li>
				<li class="active"><a href="teacher/home3.jsp">查看试卷</a></li>
				<li ><a href="teacher/home4.jsp">创建试卷</a></li>
				<li ><a href="teacher/home5.jsp">查看学生成绩</a></li>

	</ul>
</div>
<div class="span8">

	<a class="btn btn-large btn-primary"  href="teacher/home4.jsp">添加试卷</a>
	<p></p>
	<table cellpadding="10" border="1">
	<tr><td>试卷id</td><td>试卷名称</td><td>出卷人</td><td>管理</td></tr>
	<%
	String Driver="com.mysql.jdbc.Driver";
 String userid = request.getParameter("userId"); 
  String password= request.getParameter("password"); 
String sql="select distinct examid,examname,creator from exam";

try{
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"; 

Connection conn=DriverManager.getConnection(url); 
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{ 
 out.println("<tr>");
   out.println("<td>"+rs.getString("examid")+"</td>");
   out.println("<td>"+rs.getString("examname")+"</td>");
    out.println("<td>"+rs.getString("creator")+"</td>");
    %>
    <td>
   <form id="del" name="del" action="teacher/deexam.jsp"  method='post'>
	<input type="hidden" name="examid" value="<%out.print(rs.getString("examid"));%>"/>
<input type="submit" class="btn btn-small btn-info" value="删除" name="delete"/>
		</form>
    </td>
    </tr>
 <%
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
				<a href="/admin/students/home?type=44">首页</a>
			</li>
						<li class="active">
				<a href="/admin/students/home?type=44&page=1">第1页 </a>
			</li>
						<li><a href="/admin/students/home?type=44&page=1">尾页</a></li>
		</ul>
	</div>
</div>

			</div>
					</div>
					        <%
String delsuccess2="";
	if((String) session.getAttribute("delsuccess2")=="false")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('由于一些特殊原因,您可能无法删除该套试卷')</script>";
  out.println(show);
delsuccess2="";
session.setAttribute("delsuccess2",delsuccess2);
	}
%>
  </body>
</html>