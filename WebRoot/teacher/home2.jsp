<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>创建题目</title>
    
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
			<div class="nav-collapse collapse">
							<ul class="nav">
				<li class="active" >教师主页</li>
									<li class="active"><a  class="active" href="teacher.jsp">欢迎你,<%=(String) session.
getAttribute("name")+"老师"%></a></li>
																<li class='active'><a href="teacher/home2.jsp"    >创建题目</a></li>
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
				<li class="active"><a href="teacher/home2.jsp">创建试题</a></li>
				<li ><a href="teacher/home3.jsp">查看试卷</a></li>
				<li ><a href="teacher/home4.jsp">创建试卷</a></li>
				<li ><a href="teacher/home5.jsp">查看学生成绩</a></li>

	</ul>
</div>

</div>

   </div> 
   			<div class="row-fluid" style="margin-top: 0px; margin-left: 250px">

<div class="span10 offset1">
	<form action="teacher/submit_question.jsp"  method='post'   >
		<h2>请输入题干内容</h2>
		<br />
		<textarea name="context" id="context" ></textarea>
		
		<br />
		<h2>请输入A选项内容</h2>
		<input type="text" name='answer1' class='span10'  id='answer1'/>
			<h2>请输入B选项内容</h2>
		<input type="text" name='answer2' class='span10'  id='answer2'/>
			<h2>请输入C选项内容</h2>
		<input type="text" name='answer3' class='span10'  id='answer3'/>
			<h2>请输入D选项内容</h2>
		<input type="text" name='answer4' class='span10'  id='answer4'/>
		
		<p></p>
			<h2>勾选正确的答案</h2>
		                       <input  id="flag" type="checkbox" name="flag" value="8"
                               style="width: 20px; height: 20px;margin-top: 10px;"/>&nbsp;
                        <span style="font-size: 16px;position: relative;top:-5px">A</span>
                        		 <input  id="flag" type="checkbox" name="flag" value="4"
                               style="width: 20px; height: 20px;margin-top: 10px;"/>&nbsp;
                        <span style="font-size: 16px;position: relative;top:-5px">B</span>
                        		 <input  id="flag" type="checkbox" name="flag" value="2"
                               style="width: 20px; height: 20px;margin-top: 10px;"/>&nbsp;
                        <span style="font-size: 16px;position: relative;top:-5px">C</span>
                        		 <input  id="flag" type="checkbox" name="flag" value="1"
                               style="width: 20px; height: 20px;margin-top: 10px;"/>&nbsp;
                        <span style="font-size: 16px;position: relative;top:-5px">D</span>

		<p></p>
		<input type="submit" class="btn btn-large btn-info" value="继续添加" name='continue'/>
	</form>
</div>
			</div>  
			<%
			String q_message="";
				if((String) session.getAttribute("q_message")=="success")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('提交试题成功,你可以在查看试题页中发现')</script>";
  out.println(show);
  q_message="";
session.setAttribute("q_message",q_message);
	} 
			
				if((String) session.getAttribute("q_message")=="false")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('提交试题失败!重新添加')</script>";
  out.println(show);
  q_message="";
session.setAttribute("q_message",q_message);
	} 
	  %> 
  </body>

</html>