<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta charset="UTF-8" />
		<title>计算机学院管理后台</title>
		<link rel="stylesheet" href="CSS/bootstrap.min.css" />

  </head>
  
  <body>
<div class="containter-fluid">
			<div class="row-fluid">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<!-- <a class="brand" href="#">计算机学院官网管理后台</a> -->
			<div class="nav-collapse collapse">
							<ul class="nav">
				<li class="active" ><a     href="#"    >华中大计算机官网后台</a></li>
									<li class="active"><a  class="active" href="">欢迎,李坚</a></li>
																<li ><a href="/admin/students/home?type=44"    >发通知</a></li>
										
										
					
										<li ><a  href="/admin/indexnews/home" >首页</a></li>
					<li ><a   href="/admin/introduce/introduce">概况</a></li>
					<li class='active'><a  href="/admin/teacher/home"    >师资</a></li>
					<li ><a href="/admin/bg/home?type=1"    >学术</a></li>
					<li ><a href="/admin/students/home?type=16"    >人事</a></li>
					<li ><a href="/admin/students/home?type=11"    >学生工作</a></li>
					<li ><a href="/admin/students/home?type=43"    >本科</a></li>
					<li ><a href="/admin/students/organ?id=10"    >研究生</a></li>
					<li ><a href="/admin/students/organ?id=31"    >继续</a></li>
					<li ><a href="/admin/materials/home"    >资料</a></li>
										
					
					
										
										
										
					
										
					
										
										
					
					
					<li  ><a href="/admin/materials/home2/"    >课件</a></li>
					<li  ><a href="/admin/teach/home">教师主页</a></li>
                    <li  ><a href="/admin/teach/help">帮助</a></li>
					<li><a href="/admin/login/out"    >注销</a></li>
					
								</ul>
			</div>
		</div>
	</div>
</div>
			<div class="row-fluid" style="margin-top: 60px">
				<div class="span3"  id="navbar">
	<ul class="nav nav-pills nav-stacked span3" style="position:fixed">
		
		<li class='active' >
			<a href="/admin/teacher/home">教师管理</a>
		</li>
		<li >
			<a href="/admin/teacher/js">师资建设</a>
		</li>
	</ul>
</div>
<div class="span8">
	<div class="">
		<a href="/admin/teacher/add" class='btn btn-danger btn-large'>添加教师</a>
		<p></p>
		
		<table cellpadding="10" border="1"><tr><td>教师名字</td><td>教师等级</td><td>tel</td><td>email</td><td>管理</td></tr><tr><td>周可</td><td>教授</td><td>13971075916</td><td>k.zhou@hust.edu.cn</td><td><a href="/admin/teacher/edit?id=1007&page=1">编辑</a>|<a href="/teacher/detail?id=1007&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=1007&page=1">删除</a></td></tr><tr><td>曾令仿</td><td>副教授</td><td>+86-27-87792450</td><td>lfzeng[at]hust[dot]edu[dot]cn</td><td><a href="/admin/teacher/edit?id=1006&page=1">编辑</a>|<a href="/teacher/detail?id=1006&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=1006&page=1">删除</a></td></tr><tr><td>于俊清</td><td>教授</td><td>027-87558541</td><td>yjqing@hust.edu.cn</td><td><a href="/admin/teacher/edit?id=1005&page=1">编辑</a>|<a href="/teacher/detail?id=1005&dp=5">查看主页|</a><a href="/admin/teacher/delete?id=1005&page=1">删除</a></td></tr><tr><td>许蔚</td><td>讲师</td><td></td><td>azurexu@mail.hust.edu.cn</td><td><a href="/admin/teacher/edit?id=1004&page=1">编辑</a>|<a href="/teacher/detail?id=1004&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=1004&page=1">删除</a></td></tr><tr><td>谢长生</td><td>教授</td><td></td><td>cs_xie@mail.hust.edu.cn</td><td><a href="/admin/teacher/edit?id=1003&page=1">编辑</a>|<a href="/teacher/detail?id=1003&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=1003&page=1">删除</a></td></tr><tr><td>吴非</td><td>副教授</td><td>02787792405</td><td>wufei@mail.hust.edu.cn</td><td><a href="/admin/teacher/edit?id=1002&page=1">编辑</a>|<a href="/teacher/detail?id=1002&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=1002&page=1">删除</a></td></tr><tr><td>王桦</td><td>讲师</td><td></td><td>hwang@mail.hust.edu.cn</td><td><a href="/admin/teacher/edit?id=1001&page=1">编辑</a>|<a href="/teacher/detail?id=1001&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=1001&page=1">删除</a></td></tr><tr><td>王海卫</td><td>副教授</td><td></td><td>hiway@hust.edu.cn</td><td><a href="/admin/teacher/edit?id=1000&page=1">编辑</a>|<a href="/teacher/detail?id=1000&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=1000&page=1">删除</a></td></tr><tr><td>王芳</td><td>教授</td><td></td><td>wangfang@mail.hust.edu.cn</td><td><a href="/admin/teacher/edit?id=999&page=1">编辑</a>|<a href="/teacher/detail?id=999&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=999&page=1">删除</a></td></tr><tr><td>万继光</td><td>副教授</td><td>13871545162</td><td>jgwan@mail.hust.edu.cn</td><td><a href="/admin/teacher/edit?id=998&page=1">编辑</a>|<a href="/teacher/detail?id=998&dp=2">查看主页|</a><a href="/admin/teacher/delete?id=998&page=1">删除</a></td></tr></table>		<div class="pagination">
			<ul>
				<li>
					<a href="/admin/indexnews/home">首页</a>
				</li>
								<li class="active">
					<a href="/admin/teacher/home?page={$this->page}">第1页
					</a>
				</li>
				<li><a href="/admin/teacher/home?page=2">第2页</a></li><li><a href="/admin/teacher/home?page=3">第3页</a></li><li><a href="/admin/teacher/home?page=4">第4页</a></li><li><a href="/admin/teacher/home">...</a>				<li>
					<a href="/admin/teacher/home?page=20">尾页</a>
				</li>
			</ul>
		</div>
	</div>

			</div>
					</div>

  </body>
</html>
