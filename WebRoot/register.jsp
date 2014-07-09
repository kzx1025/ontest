<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <!-- Le styles -->
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/jquery-ui-1.10.3.custom.css">
    <link rel="stylesheet" href="CSS/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/register_style.css"/>
    <link rel="stylesheet" href="/exam/css/bootstrap-datetimepicker.min.css"/>
    <link href="/exam/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/exam/css/autocomplete_ui.css" rel="stylesheet" type="text/css" />
	

  </head>
  
  <body>


<div id="back_color" class="clearfix">
    <div class="body_container">
        <div style="padding-top: 40px"><span>&nbsp;&nbsp;&nbsp;多选题测试平台</span></div>
        <div style="padding-bottom: 40px;padding-left: 80px;"><span style="font-size: 30px">Online Judge</span></div>
    </div>

    <div id="container" class="common_width clearfix">
        <div id="main_head">
            <span class="ziti" id="main_reg">注册</span>
        </div>

        <!--注册信息-->
        <div id="info_container">
            <form name="defaultForm" id="defaultForm" method="post" action="isregister.jsp" class="form-horizontal" >
              
                    <h4 style="margin-left: 20px;">账号信息</h4>
                    <hr/>
                    <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号<span>*</span></label>

                        <div class="col-lg-5 fl">
                            <input type="text" class="form-control input_height input_height" name="userId" id="userId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码<span>*</span></label>

                        <div class="col-lg-5 fl">
                            <input type="password" class="form-control input_height" name="password" id="password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">重复密码<span>*</span></label>

                        <div class="col-lg-5 fl">
                            <input type="password" class="form-control input_height" name="checkPassword" id="checkPassword"/>
                        </div>
                    </div>


                <div id="eduInfo" class="clearfix">
                    <h4 style="margin-left: 20px;">基本信息</h4>
                    <hr/>
                    <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名<span>*</span></label>

                        <div class="col-lg-5 fl">
                            <input type="text" class="form-control input_height" name="userName"  name="userName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别<span>*</span></label>

                        <div class="fl" style="margin-left: 15px">
                            <select class="form-control input_height" name="sex" id="sex" style="font-size: 12px">
                                <option value="1">男</option>
                                <option value="0">女</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-lg-3 control-label mylabel fl">身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份<span>*</span></label>

                        <div class="fl" style="margin-left: 15px">
                            <select class="form-control input_height" name="identity" id="degree" style="font-size: 12px">
                                <option value="1">学生</option>
                                <option value="0">教师</option>
                            </select>
                        </div>
                    </div>
                 
                    <div class="form-group">

                        <div class="col-lg-9 col-lg-offset-3 mybtn">
                            <div class="btn-group">
                                <a type="button" onclick="submitForm();" id="submitForm" class="btn btn-primary btn-lg">立刻注册</a>
                                <a href="login.jsp" class="btn btn-default btn-lg">返回登录</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
        <div class="banquan">
                        Copyright © 2014 柯志祥
    </div>
</div>
<script language=javascript>

function submitForm()
{
flag=1;
if(document.defaultForm.userId.value=="")
{
alert("请输入账户名");
document.defaultForm.userId.focus();
flag=0;
return false;
}
if(document.defaultForm.password.value=="")
{
alert("请输入密码");
document.defaultForm.password.focus();
flag=0;
return false;
}
if(document.defaultForm.checkPassword.value=="")
{
alert("请输入重复密码");
document.defaultForm.checkPassword.focus();
flag=0;
return false;
}
if(document.defaultForm.userName.value=="")
{
alert("请输入姓名");
document.defaultForm.userName.focus();
flag=0;
return false;
}

if(document.defaultForm.password.value!=document.defaultForm.checkPassword.value)
{
alert("两次密码不同!");
document.defaultForm.password.value="";
document.defaultForm.checkPassword.value="";
flag=0;
}
if(flag==1)
{
document.defaultForm.submit();
}
}
</script>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 

String user_exist="";
	if((String) session.getAttribute("user_exist")=="true")
	{
	 String show = "<script language='javascript' type='text/javascript'>alert('账户已存在,请重新注册')</script>";
  out.println(show);
user_exist="";
session.setAttribute("user_exist",user_exist);
	}
%>
</body>

</html>
