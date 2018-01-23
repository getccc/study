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
<title>无标题文档</title>

<link href="css/sys.css" type="text/css" rel="stylesheet" />

</head>

<c:if test="${pageCourseType == null}">
     <jsp:forward page="/courseType/showCourseType.action">
     	<jsp:param value="1" name="page"/>
     </jsp:forward>
</c:if>
 
<body>
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="images/tleft.gif"/></td>
    <td width="39%" align="left">[课程类别]</td>
   
    <td width="57%"align="right">
    	<!-- -->
       <a href="html/course/addOrEditCourseType.jsp"><img src="images/button/tianjia.gif" /></a>
       <a href="html/course/queryCourse.jsp"><img src="images/button/gaojichaxun.gif" /></a>
      
    </td>
    <td width="3%" align="right"><img src="images/tright.gif"/></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
  <tr>
    <td ><img src="images/result.gif"/></td>
  </tr>
</table>
<table width="97%" border="1" >
  
  <tr class="henglan" style="font-weight:bold;">
    <td width="14%" align="center">名称</td>
    <td width="33%" align="center">简介</td>
    <td width="13%" align="center">总学时</td>
    <td width="18%" align="center">收费标准</td>
	<td width="11%" align="center">编辑</td>
  </tr>

<c:forEach var="courseType" items="${pageCourseType.list}" >
  <tr class="tabtd2">
    <td align="center">${courseType.courseName}</td>
    <td align="center">${courseType.remark} </td>
    <td align="center">${courseType.total}</td>
    <td align="center">${courseType.courseCost}</td>
  	<td width="11%" align="center"><a href="html/course/addOrEditCourseType.jsp?courseTypeId=${courseType.courseTypeId}&courseName=${courseType.courseName}&courseCost=${courseType.courseCost}&total=${courseType.total}&remark=${courseType.remark}"><img src="images/button/modify.gif" class="img"/></a></td>
  </tr>
 </c:forEach>
  
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第${pageCourseType.page}/${pageCourseType.totalPage}页</span>
        <span>
        	<a href="<%=basePath%>courseType/showCourseType?page=1">[首页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>courseType/showCourseType?page=${pageCourseType.page-1}">[上一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>courseType/showCourseType?page=${pageCourseType.page+1}">[下一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>courseType/showCourseType?page=${pageCourseType.totalPage}">[尾页]</a>
        </span>
    </td>
  </tr>
</table>
</body>
</html>
