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

<c:if test="${courseTypes == null}">
     <jsp:forward page="/courseType/AllCourseType.action"></jsp:forward>
</c:if>


<body class="emp_body">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="../../images/tleft.gif"/></td>
    <td width="44%" align="left">[添加/编辑班级]</td>
   
    <td width="52%"align="right">
    	<!--<a href="listLog.html"><img src="../../images/button/find.gif" class="img"/></a>
        <a href="addLog.html"><img src="../../images/button/add.gif" class="img"/></a>~-->
        
       <!-- <a href="#"><img src="../../images/button/close.gif" class="img"/></a>-->
       <a href="javascript:document:search_form.submit();"><img src="../../images/button/save.gif" /></a>
       <a href="javascript:history.go(-1);"><img src="../../images/button/tuihui.gif" /></a>
      
    </td>
    <td width="3%" align="right"><img src="../../images/tright.gif"/></td>
  </tr>
</table>

<table width="88%" border="0" class="emp_table" style="width:80%;">
 <%request.getSession().setAttribute("classId",request.getParameter("classId")); %>
 
 <c:if test="${classId != null}">
 <form id="search_form" action="<%=basePath%>classes/updateClasses?classId=<%=request.getParameter("classId")%>" method="post">
  <tr>
    <td width="10%">班级名称：</td>
    <td width="20%"><input  name="name" type="text" value="<%=new String(request.getParameter("name").getBytes("ISO-8859-1"))%>" /></td>
    <td width="8%">所属类别：</td>
    <td width="62%">
    <select name="courseTypeId">
    
    <c:forEach var="courseTypes" items="${courseTypes}">
    <option value="${courseTypes.courseTypeId}">${courseTypes.courseName}</option>
    </c:forEach>
    
    </select>
    </td>
  </tr>
  <tr>
    <td>开课时间：</td>
    <td><input name="beginTime" type="text" value="<%=new String(request.getParameter("beginTime").getBytes("ISO-8859-1"))%>" /></td>
    <td>结业时间：</td>
    <td><input name="endTime" type="text" value="<%=new String(request.getParameter("endTime").getBytes("ISO-8859-1"))%>" /></td>
  </tr>
  <tr>
    <td>班级人数：</td>
    <td><input name="totalCount" type="text" value="<%=new String(request.getParameter("totalCount").getBytes("ISO-8859-1"))%>" /></td>
    <td>班主任</td>
    <td>
    	<select></select>
    </td>
  </tr>
  <tr>
    <td>其他说明：</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><textarea cols="60" rows="10"></textarea></td>
  </tr>
  </c:if>

<c:if test="${classId == null}">
  <form id="search_form" action="<%=basePath%>classes/addClasses" method="post">
  <tr>
    <td width="10%">班级名称：</td>
    <td width="20%"><input name="name" type="text" /></td>
    <td width="8%">所属类别：</td>
    <td width="62%">
    <select name="courseTypeId">
    
    <c:forEach var="courseTypes" items="${courseTypes}">
    <option value="${courseTypes.courseTypeId}">${courseTypes.courseName}</option>
    </c:forEach>
    
    </select>
    </td>
  </tr>
  <tr>
    <td>开课时间：</td>
    <td><input name="beginTime" type="text" /></td>
    <td>结业时间：</td>
    <td><input name="endTime" type="text" /></td>
  </tr>
  <tr>
    <td>班级人数：</td>
    <td><input name="totalCount" type="text" /></td>
    <td>班主任</td>
    <td>
    	<select></select>
    </td>
  </tr>
  <tr>
    <td>其他说明：</td>
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
