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
 <base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/sys.css" type="text/css"/>
<title>班级管理</title>
</head>

<c:if test="${pageClasses == null}">
     <jsp:forward page="/classes/showClasses.action">
     	<jsp:param value="1" name="page"/>
     </jsp:forward>
 </c:if>
 

<body>
<!--距离页面顶端5px-->
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="topg"></td>
  </tr>
</table>
<form name="createForm" action="" method="post">
<table border="0" cellspacing="0" cellpadding="0" class="wukuang">
  <tr>
    <td width="1%"><img src="images/tleft.gif"/></td>
    <td width="20%" align="left">[班级管理]</td>
    <td width="42%"align="center">&nbsp;</td>
    <td width="36%"align="right">
    	<a href="html/classesm/addOrEditClass.jsp"><img src="images/button/tianjia.gif" class="img"/></a>
        <!--<a href="html/classesm/queryClass.jsp"><img src="images/button/gaojichaxun.gif" class="img"/></a>-->
    </td>
    <td width="1%"><img src="images/tright.gif"/></td>
  </tr>
</table>
</form>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="topg"></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td ><img src="images/result.gif"/></td>
  </tr>
</table>
<table width="97%" border="1">
<thead>
  <tr class="henglan" style="font-weight:bold;">
	<th width="10%" align="center">班级名称</th>
    <th width="10%" align="center">所属课程</th>
    <th width="10%" align="center">开班时间</th>
    <th width="10%" align="center">毕业时间</th>
    <th width="10%" align="center">状态</th>
    <th width="10%" align="center">学生总数</th>
    <th width="10%" align="center">升学数</th>
    <th width="10%" align="center">留级数</th>
    <th width="5%" align="center">编辑</th>
	<th width="5%" align="center">查看</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="classes" items="${pageClasses.list}" >
  <tr class="tabtd1">
    <td align="center">${classes.name}</td>
    <td align="center">${classes.courseType.courseName}</td>
    <td align="center">${classes.beginTime}</td>
    <td align="center">${classes.endTime}</td>
    <td align="center">${classes.status}</td>
    <td align="center">${classes.totalCount}</td>
    <td align="center">${classes.upgradeCount}</td>
    <td align="center">${classes.runoffCount}</td>
    <td align="center"><a href="html/classesm/addOrEditClass.jsp?classId=${classes.classId}&name=${classes.name}&beginTime=${classes.beginTime}&endTime=${classes.endTime}&totalCount=${classes.totalCount}"><img src="images/button/modify.gif" class="img"/></a></td>
	<td align="center"><a href="html/classesm/viewClass.jsp"><img src="images/button/view.gif" class="img"/></a></td>
  </tr>
  </c:forEach>
  </tbody>
</table>

<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第${pageClasses.page}/${pageClasses.totalPage}页</span>
        <span>
        	<a href="<%=basePath%>classes/showClasses?page=1">[首页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>classes/showClasses?page=${pageClasses.page-1}">[上一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>classes/showClasses?page=${pageClasses.page+1}">[下一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>classes/showClasses?page=${pageClasses.totalPage}">[尾页]</a>
        </span>
    </td>
  </tr>
</table>

</body>
</html>
