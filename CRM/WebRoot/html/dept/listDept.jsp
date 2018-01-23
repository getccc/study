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

<c:if test="${pageGraduate == null}">
     <jsp:forward page="/graduate/showGraduate.action">
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
    <td width="39%" align="left">[就业情况]</td>
   
    <td width="57%"align="right">
       <a href="html/dept/addjobDept.jsp"><img src="images/button/tianjia.gif" /></a>
       
       <!--<a href="#"><img src="images/button/gaojichaxun.gif" /></a>-->
      
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
    <td width="6%" align="center">学生姓名</td>
    <td width="9%" align="center">QQ</td>
    <td width="8%" align="center">联系电话</td>
    <td width="9%" align="center">就读班级</td>
    <td width="15%" align="center">就业公司</td>
    <td width="12%" align="center">就业时间</td>
    <td width="15%" align="center">岗位</td>
    <td width="12%" align="center">工资</td>
    <td width="7%" align="center">编辑</td>
  </tr>
  
  <c:forEach var="graduate" items="${pageGraduate.list}" >
  <tr class="tabtd2">
    <td align="center">${graduate.student.name}</td>
    <td align="center">${graduate.student.qq} </td>
    <td align="center">${graduate.student.telephone}</td>
    <td align="center">${graduate.classes.name}</td>
    <td align="center">${graduate.companyName}</td>
    <td align="center">${graduate.entryTime}</td>
    <td align="center">${graduate.post}</td>
    <td align="center">${graduate.salary}</td>
  	<td width="7%" align="center"><a href="html/dept/addjobDept.html"><img src="images/button/modify.gif" class="img"></a></td>
  </tr>
  </c:forEach>
  
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第${pageGraduate.page}/${pageGraduate.totalPage}页</span>
        <span>
        	<a href="<%=basePath%>graduate/showGraduate?page=1">[首页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>graduate/showGraduate?page=${pageGraduate.page-1}">[上一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>graduate/showGraduate?page=${pageGraduate.page+1}">[下一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>graduate/showGraduate?page=${pageGraduate.totalPage}">[尾页]</a>
        </span>
    </td>
  </tr>
</table>
</body>
</html>
