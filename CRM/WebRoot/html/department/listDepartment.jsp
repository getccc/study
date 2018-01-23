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
 <c:if test="${pagebean == null}">
     <jsp:forward page="/staff/showAllAction.action">
     	<jsp:param value="1" name="page"/>
     </jsp:forward>
 </c:if>
<body >
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="images/tleft.gif"/></td>
    <td width="39%" align="left">[部门管理]</td>
   
    <td width="57%"align="right">
    	<!-- 添加部门 -->
       <a href="html/department/addOrEditDepartment.jsp"><img src="images/button/tianjia.gif" /></a>
      
    </td>
    <td width="3%" align="right"><img src="images/tright.gif"/></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
  <tr>
    <td ><img src="images/result.gif"/></td>
  </tr>
</table>
<table width="100%" border="1" >
  
  <tr class="henglan" style="font-weight:bold;">
    <td width="6%" align="center">部门名称</td>
    <td width="7%" align="center">编辑</td>
  </tr>
  
  <c:forEach var="department" items="${pagebean.list}" >
  <tr class="tabtd2">
    <td align="center">${department.depName}</td>
  	<td width="7%" align="center"><a href="html/department/addOrEditDepartment.jsp?depId=${ department.depId}&depName=${department.depName}"><img src="images/button/modify.gif" class="img"/></a></td>
  </tr>
 </c:forEach>
 
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第${pagebean.page}/${pagebean.totalPage}页</span>
        <span>
        	<a href="<%=basePath%>staff/departmentAction!showAll?page=1">[首页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>staff/departmentAction!showAll?page=${pagebean.page-1}">[上一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>staff/departmentAction!showAll?page=${pagebean.page+1}">[下一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>staff/departmentAction!showAll?page=${pagebean.totalPage}">[尾页]</a>
        </span>
    </td>
  </tr>
</table>
</body>
</html>
