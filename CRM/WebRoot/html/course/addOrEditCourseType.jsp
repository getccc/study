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
<title>无标题文档</title>
<link href="../../css/sys.css" type="text/css" rel="stylesheet" />

</head>

<body class="emp_body">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="../../images/tleft.gif"/></td>
    <td width="44%" align="left">[添加/编辑课程类别]</td>
   
    <td width="52%"align="right">
       <a href="javascript:document:search_form.submit();"><img src="../../images/button/save.gif" /></a>
       <a href="javascript:history.go(-1);"><img src="../../images/button/tuihui.gif" /></a>
      
    </td>
    <td width="3%" align="right"><img src="../../images/tright.gif"/></td>
  </tr>
</table>

<table width="88%" border="0" class="emp_table" style="width:80%;">

 <%request.getSession().setAttribute("courseTypeId",request.getParameter("courseTypeId")); %>
 <c:if test="${courseTypeId != null}">
	<form id="search_form" action="<%=basePath%>courseType/updateCourseType?courseTypeId=<%=request.getParameter("courseTypeId")%>" method="post" >
	 <tr>
    <td width="10%">课程类别：</td>
    <td width="20%"><input value="<%=new String(request.getParameter("courseName").getBytes("ISO-8859-1"))%>" name="courseName" type="text" /></td>
    <td width="8%">总学时：</td>
    <td width="62%"><input value="<%=new String(request.getParameter("total").getBytes("ISO-8859-1"))%>" name="total" type="text" /></td>
  </tr>
  <tr>
    <td>课程费用：</td>
    <td><input name="courseCost" type="text" value="<%=new String(request.getParameter("courseCost").getBytes("ISO-8859-1"))%>" /></td>
    <td>课程简介：</td>
    <td><input name="remark" type="text" value="<%=new String(request.getParameter("remark").getBytes("ISO-8859-1"))%>" /></td>
  </tr>
  <tr>
    <td>课程介绍模板：</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><textarea cols="60" rows="10"></textarea></td>
  </tr>
</c:if>

<c:if test="${courseTypeId == null}">
<form id="search_form" action="<%=basePath%>courseType/addCourseType" method="post">
  <tr>
    <td width="10%">课程类别：</td>
    <td width="20%"><input name="courseName" type="text" /></td>
    <td width="8%">总学时：</td>
    <td width="62%"><input name="total" type="text" /></td>
  </tr>
  <tr>
    <td>课程费用：</td>
    <td><input name="courseCost" type="text" /></td>
    <td>课程简介：</td>
    <td><input name="remark" type="text" /></td>
  </tr>
  <tr>
    <td>课程介绍模板：</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><textarea cols="60" rows="10"></textarea></td>
  </tr>
  </c:if>
  
  </form>
</table>
</body>
</html>
