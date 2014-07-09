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
    
    <title>开始考试</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="CSS/bootstrap2.min.css">
<link rel="stylesheet" href="CSS/globel.css" type="text/css"/>
<link rel="stylesheet" href="CSS/layout.css" type="text/css"/>
   <link href="CSS/bluegray.css" rel="stylesheet" type="text/css"  data-title="skin_file"/>
<style>
.enddiv{ margin-left:650px} 
</style>


  </head>
  
  <body class="body">
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
</div>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
String examname= request.getParameter("examname"); 
%>	
<form  action="student/home3.jsp"  method='post' >
<div class="survey" id="survey">
    <div class="survey-body">
        <div class="survey-header">
                        <h1 class="survey-title"><%out.println(examname);%></h1>           
                    </div>
       <div class="survey-content" >
        <div class="page" >

<%
int examid=Integer.parseInt(request.getParameter("examid"));
 int m=0;
Connection con=null;
int i;
int j=0;
int n=1;
String Driver="com.mysql.jdbc.Driver";
String sql="select * from question where questionid in (select questionid from exam where examid="+examid+")";
//String sql1="select distinct examname  from exam where examid="+examid+"";
try{
Class.forName(Driver).newInstance();
String url="jdbc:mysql://localhost/"+"ontest"+"?user="+"root"+"&password="+"kzx"; 

Connection conn=DriverManager.getConnection(url); 
Statement stmt=conn.createStatement();
Statement stmt1=conn.createStatement();
ResultSet rs=stmt.executeQuery(sql);
ResultSet rs1=stmt1.executeQuery(sql);
String num="";
//while(rs.next()){
// out.println("<p>"+rs1.getString("examname")+"</p>");
 //}
 while(rs1.next())
{ 
j++;
}
String temp[]=new String[j];

while(rs.next())
{ 
%>
<div class="part select" >
 <h4 class="title">
    <span class="index"></span>
    <span class="subject" style="font-size:20px"><%out.print(n);%>.<%out.print(rs.getString("context"));%></span>
        </h4>
        
          <input  id="solution<%out.print(m);%>" type="checkbox" name="<%out.print(rs.getString("questionid"));%>"   value="8"   style="width: 18px; height: 20px;margin-left: 20px;margin-top: 10px;"/>
            <span style="font-size: 16px;position: relative;top:5px">A.<%out.print(rs.getString("answer1"));%></span>
          <p></p>
          
            <input  id="solution<%out.print(m);%>" type="checkbox" name="<%out.print(rs.getString("questionid"));%>"   value="4"   style="width: 18px; height: 20px;margin-left: 20px;margin-top: 10px;"/>
            <span style="font-size: 16px;position: relative;top:5px">B.<%out.print(rs.getString("answer2"));%></span>
            <p></p>
            
            <input  id="solution<%out.print(m);%>"  type="checkbox" name="<%out.print(rs.getString("questionid"));%>"   value="2"   style="width: 18px; height: 20px;margin-left: 20px;margin-top: 10px;"/>
            <span style="font-size: 16px;position: relative;top:5px">C.<%out.print(rs.getString("answer3"));%></span>
             <p></p>
             
              <input  id="solution<%out.print(m);%>" type="checkbox" name="<%out.print(rs.getString("questionid"));%>"   value="1"   style="width: 18px; height: 20px;margin-left: 20px;margin-top: 10px;"/>
            <span style="font-size: 16px;position: relative;top:5px">D.<%out.print(rs.getString("answer4"));%></span>
           </div>
<%
temp[m]=rs.getString("questionid");
num=Integer.toString(j);
//out.print(temp[m]);
//out.print(j);
m=m+1;
n=n+1;
    }
   session.setAttribute( "temp",temp); 
    session.setAttribute("number",num); 
    session.setAttribute("examid",Integer.toString(examid)); 
conn.close();
}catch(Exception e){
e.printStackTrace();
}finally{
}
 session.setAttribute("examname",examname);
 %>    


</div>
</div>
</div>
</div>
  <div class="enddiv">          
<input type="submit" class="btn btn-large btn-info" value="提交答卷" name='go'/>

</div>
</form>
<%
     /** 
     String isfinish="";
		if (((String) session.getAttribute("isfinish"))==("false"))
		 {
			String show = "<script language='javascript' type='text/javascript'>alert('抱歉,请将全部答案填写完成再提交试卷')</script>";
			out.println(show);
		}
 isfinish="";
		session.setAttribute("isfinish", isfinish);**/
	%>

  </body>

</html>
