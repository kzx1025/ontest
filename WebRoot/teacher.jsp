<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sun.crypto.provider.RSACipher"%>
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
    
    <title>教师主页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    response.sendRedirect("login.jsp");
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
																<li class='active'><a href="teacher.jsp"    >查看题目</a></li>
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

					
			            		    		    
		    		    			    
		    
		    		    	<li class="active"><a href="teacher.jsp">查看试题</a></li>
				<li ><a href="teacher/home2.jsp">创建试题</a></li>
				<li ><a href="teacher/home3.jsp">查看试卷</a></li>
				<li ><a href="teacher/home4.jsp">创建试卷</a></li>
				<li ><a href="teacher/home5.jsp">查看学生成绩</a></li>

	</ul>
</div>
<div class="span8">

	<a class="btn btn-large btn-primary"  href="teacher/home2.jsp">添加题目</a>
	<p></p>
	<table cellpadding="10" border="1">
	<tr><td>题目id</td><td>题目内容</td><td>答案</td><td>删除题目</td><td>修改题目</td></tr>
	<%
	String Driver="com.mysql.jdbc.Driver";
 String userid = request.getParameter("userId"); 
  String password= request.getParameter("password"); 
String sql="select * from question";
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
   out.println("<td>"+rs.getString("questionid")+"</td>");
   out.println("<td>"+rs.getString("context")+"</td>");
    out.println("<td>"+rs.getString("result")+"</td>");
   
    %>
    <td>
<form id="del" name="del" action="teacher/dequestion.jsp"  method='post'>
	<input type="hidden" name="questionid" value="<%out.print(rs.getString("questionid"));%>"/>
<input type="submit" class="btn btn-small btn-info" value="删除" name="delete"/>
</td>
<td>
		</form><form id="update" name="update" action="teacher/upquestion.jsp"  method='post'>
	<input type="hidden" name="questionid" value="<%out.print(rs.getString("questionid"));%>"/>
<input type="submit" class="btn btn-small btn-info" value="修改" name="update"/>
	</form>
		</td>
 <%

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
String delsuccess="";
	if((String) session.getAttribute("delsuccess")=="false")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('你要删除的题目可能在试卷里存在,所以无法删除')</script>";
  out.println(show);
delsuccess="";
session.setAttribute("delsuccess",delsuccess);
	}
	String  up_message="";
	if((String) session.getAttribute("up_message")=="false")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('修改题目失败')</script>";
  out.println(show);
up_message="";
session.setAttribute("up_message",up_message);
	}
	if((String) session.getAttribute("up_message")=="success")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('修改题目成功')</script>";
  out.println(show);
up_message="";
session.setAttribute("up_message",up_message);
	}
%>
  </body>
</html>
