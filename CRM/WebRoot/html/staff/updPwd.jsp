<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更改口令</title>
<link href="../../css/sys.css" type="text/css" rel="stylesheet" />
	<style>
		.updpwd{
			background-color: #2ae;
		}
		.login_btn{
			background-color: #9be;
			width: 99px;
			font-size: 14px;
			font-family: 微软雅黑;
		}
		.upd_pwd_msg{
			font-size: 14px;
			text-align: right;
		}
	</style>
	<script  type="text/javascript">
		function closeWindow(flag){
			if(flag == 'change'){
		/*	var pwd = document.getElementById("loginPwd").value;
			var pwd1 = document.getElementById("newpwd").value;
            var pwd2 = document.getElementById("newTwoPwd").value;
             alert(pwd);
             alert(pwd1);
             alert(pwd2);
            if(pwd == null || pwd2 == null || pwd2 == null ){
                return false; 
            }else if(pwd1 != pwd2 ) {
            	alert("两次密码输入不一致");
            }else{ 
             document.form[0].submit();
             } */
			   }
			parent.window.opener = null;
			parent.close();
		}
	</script>
</head>

<body class="updpwd">
  <form action="<%=basePath %>staff/staffAction!updatePasswd" method="post">
	<span class="upd_pwd_msg">
	 <br/>
	   &nbsp;&nbsp;原始密码：<input id="loginPwd" name="loginPwd" type="password"/><br/><br/>
	   &nbsp;&nbsp;新&nbsp;密&nbsp;码：<input id="newpwd" name="newpwd" type="password"/><br/><br/>
	&nbsp;&nbsp;确认密码：<input id="password" name="newTwoPwd" type="password"/><br/><br/>
	 </span>
	&nbsp;&nbsp;<input class="login_btn" type="submit" value="修    改" onclick="closeWindow('change')"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="login_btn" type="submit" value="关    闭" onclick="closeWindow()"/>
  </form>
</body>
</html>
