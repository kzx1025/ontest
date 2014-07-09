<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
        <link type="text/css" rel="stylesheet" href="CSS/login.css"/>
        <link rel="stylesheet" href="CSS/bootstrap.min.css"/>
        <link rel="stylesheet" href="CSS/custom-theme/jquery-ui-1.10.3.custom.css"/>
        <link rel="stylesheet" href="CSS/font-awesome.min.css"/>

  </head>
  

<body onKeyDown = "ondown()">
<% 
String name=null;
session.setAttribute("name",name);//重新登陆之前无法登录有账户的网页
%>
<!--整个body的背景颜色-->
<div class="reg_body">
    <!--body的title-->
    <div class="body_container">
        <div style="padding-top: 60px"><span>&nbsp;&nbsp;&nbsp;多选题测试平台</span></div>
        <div style="padding-bottom: 40px;padding-left: 80px;"><span style="font-size: 30px">Online Judge</span></div>
    </div>


    <div class="reg_main">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">登录</h3>
            </div>
            <div class="panel-body" style="padding:0;">
                <form id="LoginId" name="LoginId" action="logincheck.jsp" method="post" class="form-horizontal"   style="margin-top: 30px;">

                    <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">账&nbsp;&nbsp;&nbsp;&nbsp;号</label>

                        <div class="col-lg-5 fl">
                            <input type="text" class="form-control"   name="userId" id="userId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>

                        <div class="col-lg-5 fl">
                            <input type="password" class="form-control" name="password" id="password"/>
                        </div>
                        </div>
                        
                   <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码&nbsp;:</label>                   
                          &nbsp;&nbsp;&nbsp; <img src="servlet/IdentityServlet" id="authImg"/><a href="javascript:void(0)" onClick="refresh()">我看不清!</a>
                   </div>

                         <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">输入验证码:</label>
                        <div class="col-lg-5 fl">
                         <input type="text" id="inputCode" class="form-control"   name="inputCode"/>
                         </div>
                        </div>
                       



                    <div class="form-group" style="margin-top: 20px;">
                        <div class="col-lg-9 col-lg-offset-3">
                  <a type="button" onclick="submitForm();" id="submitForm" class="btn btn-primary btn-lg">登录</a>
                            <span class="resume" style="position: relative;top: 6px;">
                            <a href="register.jsp" style="font-size: 14px;margin-right: 30px;">注册</a></span>
                            <span style="font-weight: bold;font-size: 14px;color:  #858585;float:right;position: relative;top: 20px;">没有账号？</span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
        <div class="banquan">
                        Copyright © 2014 柯志祥
    </div>
</div>
<script type="text/javascript">
  function refresh() {  
        document.getElementById("authImg").src = "servlet/IdentityServlet";  
    }  
			function submitForm(){
			     flag=1;

				if(document.LoginId.userId.value==""){
					alert("请输入用户名!");
					flag=0;
					document.LoginId.userId.focus();
					return false;
				}
				if(document.LoginId.password.value ==""){
					alert("密码长度不足4位!");
					flag=0;
					document.LoginId.password.focus();
					return false;
				}
	
if(flag==1)
{
document.LoginId.submit();
}
}
function ondown()
{
if(event.keyCode ==13)
submitForm();
}
</script>
<%
String login_message="";
	if((String) session.getAttribute("login_message")=="false")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('账户密码不对,登录失败!')</script>";
  out.println(show);
  login_message="";
session.setAttribute("login_message",login_message);
	}
	String yanzheng="";
		if((String) session.getAttribute("yanzheng")=="false")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('验证码错误!')</script>";
  out.println(show);
  yanzheng="";
session.setAttribute("yanzheng",yanzheng);
	}
%>


</body>

</html>
