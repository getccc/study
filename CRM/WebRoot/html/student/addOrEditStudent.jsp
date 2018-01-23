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
    <td width="44%" align="left">[编辑正式学员]</td>
   
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

<table width="88%" class="emp_table">
<form id="search_form" action="<%=basePath%>student/addStudent" method="post">
  <tr>
    <td width="80px" align="left">姓名：</td>
    <td width="200px" align="left"><input name="name" type="text" /></td>
    <td width="80px" align="left">性别：</td>
    <td align="left"><input value="男" type="radio" name="gender"/>男<input value="女" type="radio" name="gender"/>女</td>
  </tr>
  <tr>
    <td align="left">应付学费：</td>
    <td align="left"><input type="text" name="mustTuition" /></td>
    <td align="left">实付学费：</td>
    <td align="left"><input type="text" name="actualTuition" /></td>
  </tr>
  <tr>
    <td align="left">身份证号：</td>
    <td align="left"><input type="text" name="identity"/></td>
    <td align="left">手机号：</td>
    <td align="left"><input type="text" name="telephone" /></td>
  </tr>
  <tr>
    <td align="left">QQ号：</td>
    <td align="left"><input type="text" name="qq"/></td>
    <td align="left">邮箱：</td>
    <td align="left"><input type="text" name="email" /></td>
  </tr>
  <tr>
    <td align="left">就读班级：</td>
    <td align="left" colspan="3">
    	类别<select><option>====选择类别====</option></select> 
    	班级<select><option>====选择班级====</option></select>
    </td>
  </tr>
  <tr>
    <td align="left">毕业学校：</td>
    <td align="left"><input type="text" name="school"/></td>
    <td align="left">学历：</td>
    <td align="left">
    	<select><option>====选择学历====</option></select> 
    	专业<input type="text" size="17" />
    </td>
  </tr>
  <tr>
    <td align="left">身份证地址：</td>
    <td align="left" colspan="3"><input name="identityAddress" size="60" /></td>
  </tr>
  <tr>
    <td align="left">在京地址：</td>
    <td align="left" colspan="3"><input name="address" size="60" /></td>
  </tr>
  <tr>
    <td align="left">学员描述：</td>
    <td align="left" colspan="3"><input name="remark" size="60" /></td>
  </tr>
  <tr>
    <td colspan="6"><br />出门在外，如果发生意外，我们将通过下面的信息跟学院的家长联系</td>
    </tr>
   <tr>
    <td align="left">家庭联系电话：</td>
    <td align="left"><input type="text" name="homeTelephone"/></td>
    <td align="left">家庭联系人：</td>
    <td align="left"><input type="text" name="homeUser" /></td>
  </tr>
  
  </form>
</table>

</body>
</html>
