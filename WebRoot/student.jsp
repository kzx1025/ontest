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
    
    <title>参加考试</title>
    
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
					<li ><a   href="stident.jsp">帮助</a></li>
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

					
			            		    		    
		    		    			    
		    
		    		    	<li class="active"><a href="student.jsp">参加考试</a></li>

				<li ><a href="student/home4.jsp">查看考试成绩</a></li>

	</ul>
</div>
<div class="span8">

		<script type="text/javascript">
			function checkForm(){
 var examid=document.getElementById( "attend");

document.test.submit();

}
</script>
	<p></p>


	<table cellpadding="10" border="1">
	<tr><td>试卷id</td><td>试卷名称</td><td>出卷人</td><td>&nbsp;&nbsp;&nbsp;参加</td></tr>
	<%
	String Driver="com.mysql.jdbc.Driver";
 String userid =(String)session.getAttribute("userid"); 
session.setAttribute("userid",userid); 
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

   out.println("<td>"+rs.getString("examid")+"</td>");
   out.println("<td>"+rs.getString("examname")+"</td>");
    out.println("<td>"+rs.getString("creator")+"</td>");
    %>
    <td>
	<form id="test" name="test" action="student/home2.jsp"  method='post' >
	<input type="hidden" name="examid" value="<%out.print(rs.getString("examid"));%>"/>
	<input type="hidden" name="examname" value="<%out.print(rs.getString("examname"));%>"/>
<input type="submit" class="btn btn-large btn-info" value="参加考试" name="<%out.print(rs.getString("examid"));%>"/>
</form>
    </td>
 <%
  out.println("<tr>");
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
  </body>
</html>
