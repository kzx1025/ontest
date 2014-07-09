<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>核算成绩</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="CSS/bootstrap2.min.css">
<link rel="stylesheet" href="CSS/globel.css" type="text/css" />
<link rel="stylesheet" href="CSS/layout.css" type="text/css" />
<link href="CSS/bluegray.css" rel="stylesheet" type="text/css"
	data-title="skin_file" />
<style>
.enddiv {
	margin-left: 650px
}
</style>

</head>

<body class="body">
	<%
		if ((String) session.getAttribute("name") == null
				|| ((String) session.getAttribute("type")).equals("0")) {
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
							<li class="active">学生主页</li>
							<li class="active"><a class="active" href="student.jsp">欢迎你,<%=(String) session.getAttribute("name") + "同学"%></a>
							</li>
							<li class='active'><a href="student.jsp">参加考试</a>
							</li>
							<li><a href="stident.jsp">帮助</a>
							</li>
							<li><a href="register.jsp">注册</a>
							</li>
							<li><a href="login.jsp">退出账户</a>
							</li>

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
		String context = (String) request.getParameter("context");
		String examname = (String) session.getAttribute("examname");
		String userid= (String) session.getAttribute("userid");
		String examid= (String) session.getAttribute("examid");
		String ss[] = (String[]) session.getAttribute("temp");
		int num = Integer.parseInt((String) session.getAttribute("number"));
		String isfinish="";
		String Driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/" + "ontest" + "?user="
				+ "root" + "&password=" + "kzx";
		//out.println((String)session.getAttribute("number"));
		Class.forName(Driver).newInstance();

		String sql = "";
		Connection conn = DriverManager.getConnection(url);
		Statement stmt = conn.createStatement();
		int right = 0;
		int score = 0;
		int fullscore = 0;

		int i;
		int j;
		int sum = 0;
		try {
			for (i = 0; i < num; i++) {
					sum = 0;
					if( request.getParameter(ss[i])==null)
				{
				
				}
				else{
				String[] answer_flag = request.getParameterValues(ss[i]);
				
				
				//out.println(answer_flag.length);
				//out.println(ss.length);
				sql = "select * from question where questionid=" + ss[i]
						+ "";
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					right = Integer.parseInt(rs.getString("result"));
					out.println(right);
				}
		
				
				for (j = 0; j < answer_flag.length; j++) {
					sum = sum + Integer.parseInt(answer_flag[j]);
				}
		
				if (right == sum) {
					score = score + 10;
				}
				}
				fullscore += 10;
			}
             PreparedStatement stat1=conn.prepareStatement("set names 'utf8'");
PreparedStatement stat=conn.prepareStatement("insert into test(userid,name,examid,examname,score) values(?,?,?,?,?)");
stat.setString(1,userid);
stat.setString(2,(String)session.getAttribute("name"));
stat.setInt(3,Integer.parseInt(examid));
stat.setString(4,examname);
stat.setInt(5,score);
int count=stat.executeUpdate();
if(count<=0){
		%>
<jsp:forward page ="/error.jsp"/>
<%
}
		} catch (Exception e) {
			e.printStackTrace();
				//isfinish="false";
	       // session.setAttribute("isfinish", isfinish);
		%>
<jsp:forward page ="/error.jsp"/>
<%

		} finally {
		}
	%>

	<div class="survey" id="survey">
		<div class="survey-body">
			<div class="survey-header">
				<h1 class="survey-title">
					这次<%
							isfinish="true";
					out.print(examname);
				%>
				</h1>
				<h1 class="survey-title">
					满分为<%
					out.print(fullscore);
				%>分
				</h1>
				<h1 class="survey-title">
					你的得分为<%
					out.print(score);
				%>分
				</h1>
				<h1 class="survey-title">
				请再接再厉!
				</h1>
			</div>
		</div>
	</div>
	<div class="enddiv">
		<input type="button" class="btn btn-large btn-info"
			onclick="window.location.href='/ontest/student.jsp'" value="返回">
			<input type="button" class="btn btn-large btn-info"
			onclick="window.location.href='/ontest/student/home4.jsp'" value="查看考试成绩">
	</div>
</body>
</html>
