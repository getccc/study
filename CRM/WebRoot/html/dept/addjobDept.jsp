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
    <td width="44%" align="left">[添加学员就业信息]</td>
   
    <td width="52%"align="right">
       <a href="javascript:document:search_form.submit();"><img src="../../images/button/save.gif" /></a>
       <a href="javascript:history.go(-1);"><img src="../../images/button/tuihui.gif" /></a>
    </td>
    <td width="3%" align="right"><img src="../../images/tright.gif"/></td>
  </tr>
</table>

<table width="88%" border="0" class="emp_table" style="width:80%;">
  <form id="search_form" action="<%=basePath%>graduate/addGraduate" method="post">
  <tr>
    <td width="9%">班级：</td>
    <td width="19%"><select ><option>--------请----选----择--------</option></select></td>
  </tr>
  <tr>
    <td width="9%">学生：</td>
    <td width="19%"><select ><option>--------请----选----择--------</option></select></td>
    <td width="8%">QQ：</td>
    <td width="64%"><input type="text" /></td>
  </tr>
  <tr>
    <td>联系电话：</td>
    <td><input type="text" /></td>
    <td>就读时间：</td>
    <td><input type="text" /></td>
  </tr>
  <tr>
    <td>公司名字：</td>
    <td><input name="companyName" type="text" /></td>
    <td>就业时间：</td>
    <td><input name="entryTime" type="text" /></td>
  </tr>
  <tr>
    <td>薪资：</td>
    <td><input name="salary" type="text" /></td>
    <td>岗位：</td>
    <td><input name="post" type="text" /></td>
  </tr>
  <tr>
    <td>联系电话：</td>
    <td><input type="text" /></td>
    <td>入职时间：</td>
    <td><input type="text" /></td>
  </tr>
  <tr>
    <td>离职公司：</td>
    <td><input type="text" /></td>
    <td>离职手续：</td>
    <td><input  type="text" value="是/否" /></td>
  </tr>
  <tr>
    <td>备注：</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><textarea cols="60" rows="10"></textarea></td>
  </tr>
  </form>
</table>

</body>
</html>