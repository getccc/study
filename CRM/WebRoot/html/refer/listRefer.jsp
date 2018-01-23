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
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>



<link href="css/sys.css" type="text/css" rel="stylesheet" />
</head>

 <c:if test="${pageRefer == null}">
     <jsp:forward page="/refer/showRefer.action">
     	<jsp:param value="1" name="page"/>
     </jsp:forward>
 </c:if>

<body>
 <table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" class="wukuang">
  <tr>
    <td width="1%"><img src="images/tleft.gif"/></td>
    <td width="33%" align="left">[咨询学生管理]</td>
   
    <td width="63%"align="right">
    	<!-- 添加咨询学生 -->
        <a class="butbg"  href="html/refer/addOrEditRefer.jsp"><img src="images/button/tianjia.gif" /></a>
        <!-- 高级查询 
        <a class="butbg"  href="#"><img src="images/button/gaojichaxun.gif" /></a>
        -->
    </td>
    <td width="3%" align="right"><img src="images/tright.gif"/></td>
  </tr>
</table>

<!-- 查询条件：添加或选择马上查询 -->
<form action="" method="post">
	<table width="88%" border="0" style="margin: 20px;" >
	  <tr>
	    <td width="80px">查询条件：</td>
	    <td width="300px"><input size="20" />（姓名|电话|QQ）</td>
	    <td ></td>
	  </tr>
	</table>
</form>

<table border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
  <tr>
    <td ><img src="images/result.gif"/></td>
  </tr>
</table>
<table width="100%" border="1" >
  
  <tr class="henglan" style="font-weight:bold;">
	<td width="80px" align="center">姓名</td>
	<td width="9%" align="center">电话</td>
	<td width="11%" align="center">QQ </td>
	<td width="15%" align="center">班级意向</td>
	<td width="17%" align="center">状态</td>
	<td width="10%" align="center">营销人员</td>
	<td width="8%" align="center">查看</td>
	<td width="8%" align="center">编辑</td>
	<td width="8%" align="center">跟踪</td>
	<td width="8%" align="center">录入学籍</td>
  </tr>
  
  <c:forEach var="refer" items="${pageRefer.list}">
  <tr class="tabtd2">
    <td align="center">${refer.name}</td>
    <td align="center">${refer.telephone}</td>
    <td align="center">${refer.qq}</td>
    <td align="center">${refer.classes.name}</td>
    <td align="center">${refer.status}</td>
    <td align="center">${refer.staff.staffName}</td>
	<td width="8%" align="center"><a href="<%=basePath%>refer/getRefer?referId=${refer.referId}"><img src="images/button/view.gif" class="img"/></a></td>
	<td width="8%" align="center"><a href="html/refer/addOrEditRefer.jsp"><img src="images/button/modify.gif" class="img"/></a></td>
	<td width="8%" align="center"><a href="html/follow/addOrEditFollow.jsp"><img src="images/button/new.gif" class="img"/></a></td>
	<td width="8%" align="center"><a href="html/student/addOrEditStudent.jsp"><img src="images/button/modify.gif" class="img"/></a></td>
  </tr>
  </c:forEach>
  
  
 
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第${pageRefer.page}/${pageRefer.totalPage}页</span>
        <span>
        	<a href="<%=basePath%>refer/showRefer?page=1">[首页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>refer/showRefer?page=${pageRefer.page-1}">[上一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>refer/showRefer?page=${pageRefer.page+1}">[下一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>refer/showRefer?page=${pageRefer.totalPage}">[尾页]</a>
        </span>
    </td>
  </tr>
</table>
</body>
</html>
