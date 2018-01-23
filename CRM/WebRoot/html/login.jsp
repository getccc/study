<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<STYLE>
.cla1 {
FONT-SIZE: 12px; COLOR: #4b4b4b; LINE-HEIGHT: 18px; TEXT-DECORATION: none
}
.login_msg{
	font-family:serif;
}
.login_msg .msg{
	background-color: #acf;
}
.login_msg .btn{
	background-color: #9be;
	width: 73px;
	font-size: 18px;
	font-family: 微软雅黑;
}
</STYLE>

<TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="..css/style.css" type=text/css rel=stylesheet>
</SCRIPT>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" background="../images/rightbg.jpg">
<div ALIGN="center">
	<table border="0" width="1140px" cellspacing="0" cellpadding="0" id="table1">
		<tr>
			<td height="93"></td>
			<td></td>
		</tr>
		<tr>
			<td background="../images/right.jpg"  width="740" height="412"></td>
			<td class="login_msg" width="400">
				
				<form action="<%=basePath %>staff/staffAction!login" method="post">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/title.png" width="185" height="26"/>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<font color="#ff0000">提示信息</font> 
					<br/>
					用户名：<input name="loginName" class="msg" type="text"><br/><br/>
					密&nbsp;码：<input name="loginPwd" class="msg" type="password"><br/><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					
					
					<input class="btn" type="submit" value=" 登录 "/>
					
					<!--取消用户注册 
					<input class="btn" type="button" value=" 注册 " onclick="document.location='../html/staff/register.html'"/>
					-->
					
				</form>
			</td>
		</tr>
	</table>
</div>
</BODY></HTML>