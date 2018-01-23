<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

		<table border="0" cellspacing="0" cellpadding="0" class="wukuang"
			width="100%">
			<tr>
				<td width="1%">
					<img src="../../images/tleft.gif" />
				</td>
				<td width="44%" align="left">
					[添加/编辑部门]
				</td>

				<td width="52%" align="right">
					<a
						href="javascript:document:search_form.submit();"><img
							src="../../images/button/save.gif" />
					</a>
					<a href="javascript:history.go(-1);"><img
							src="../../images/button/tuihui.gif" />
					</a>
				</td>
				<td width="3%" align="right">
					<img src="../../images/tright.gif" />
				</td>
			</tr>
		</table>

		<table width="88%" border="0" class="emp_table" style="width: 80%;">
		<%request.getSession().setAttribute("depId",request.getParameter("depId")); %>
		<c:if test="${depId != null}">
			<form id="search_form" action="<%=basePath%>staff/departmentAction!updateDept?depId=<%=request.getParameter("depId")%>" method="post" >
		</c:if>
		
		<c:if test="${depId == null}">
			<form id="search_form" action="<%=basePath%>staff/departmentAction!addDepartment" method="post">
		</c:if>
			
			<!--<form id="search_form" method="post" action="<%=basePath%>staff/departmentAction!addDepartment">-->
			<tr>
				<td width="10%">
					部门名称：
				</td>
				<td width="20%">
				<c:if test="${depId != null}">
					<input id="depName" value="<%=new String(request.getParameter("depName").getBytes("ISO-8859-1"))%>" name="depName" type="text" />
				</c:if>
				<c:if test="${depId == null}">
					<input id="depName" name="depName" type="text" />
				</c:if>
				</td>
				<td width="70%"></td>
			</tr>
			</form>
		</table>
	</body>
</html>
