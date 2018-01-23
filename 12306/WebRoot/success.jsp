<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style type="text/css">
  #head {
	position: absolute;
	top: 50px;
	left: 500px;
	font-size: 40px;
	color: black;
}
  </style>
  
  <body> 
<script> 
var t=5;//设定跳转的时间 
setInterval("refer()",1000); //启动1秒定时 
function refer(){ 
if(t==0){ 
location="myMenu.jsp"; //#设定跳转的链接地址 
} 
document.getElementById('show').innerHTML=""+t+"秒后跳转到商家"; // 显示倒计时 
t--; // 计数器递减 
} 
</script> 
<div id="head">
<span >支付成功，</span> 
<span id="show"></span> 
</div>
</body> 
</html>
