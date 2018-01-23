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

 <c:if test="${pageStation == null}">
     <jsp:forward page="/station/showStation.action">
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
    <td width="39%" align="left">[学员升级/留班]</td>
   <td width="57%"align="right">
       <a href="#"><img src="images/button/gaojichaxun.gif" /></a>
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
    <td width="7%" align="center">QQ</td>
    <td width="8%" align="center">联系电话</td>
    <td width="8%" align="center">类别</td>
    <td width="11%" align="center">之前的班级</td>
    <td width="12%" align="center">之后的班级</td>
    <td width="12%" align="center">操作时间</td>
    <td width="12%" align="center">经办人</td>
    <td width="6%" align="center">查看</td>
  </tr>
   <c:forEach var="station" items="${pageStation.list}" >
  <tr class="tabtd2">
    <td align="center">${station.student.name}</td>
    <td align="center">${station.student.qq}</td>
    <td align="center">${station.student.telephone}</td>
    <td align="center">${station.flag}</td>
    <td align="center">${station.classByBeforeClassId.name}</td>
    <td align="center">${station.ClassByAfterClassId.name}</td>
    <td align="center">${station.createDate}</td>
    <td align="center">${station.staff.name}</td>
    <td width="6%" align="center"><a href="html/role/viewRolepri.html"><img src="images/button/view.gif" class="img"></a></td>
  </tr>
   </c:forEach>
  
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第${pageStation.page}/${pageStation.totalPage}页</span>
        <span>
        	<a href="<%=basePath%>station/showStation?page=1">[首页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>station/showStation?page=${pageStation.page-1}">[上一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>station/showStation?page=${pageStation.page+1}">[下一页]</a>&nbsp;&nbsp;
            <a href="<%=basePath%>station/showStation?page=${pageStation.totalPage}">[尾页]</a>
        </span>
    </td>
  </tr>
</table>
</body>
</body>
</html>
