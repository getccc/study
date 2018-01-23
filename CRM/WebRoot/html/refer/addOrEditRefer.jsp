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
<script type="text/javascript" src="../../js/jquery-1.3.1.js"></script>
</head>

<c:if test="${listCourseType == null}">
     <jsp:forward page="/courseType/listCourseType.action"></jsp:forward>
</c:if>

<script type="text/javascript">
  	window.onload = function(){
    document.getElementById("courseTypeId").onchange = function(){
  
	var obj = document.getElementById("courseTypeId"); 
    var index = obj.selectedIndex; 
	var courseTypeId = obj.options[index].value; 
	alert(courseTypeId);
	
	 $.ajax({  
                type:"post",  
                url:"<%=basePath%>classes/listClasses?courseTypeId="+courseTypeId,
                dataType:"json", 
                async:false, 
                success: function(data){    
                alert(data);  
                obj=eval("(" + data + ")"); 
               	var count =obj.length;
               	alert(count);
               	$("#classId option").remove();  
            	$("#classId").append("<option value=0>----请--选--择----</option>"); 
				for(i=0;i<count;i++){
				  
               	 $("#classId").append("<option value="+ obj[i].classId +">"
               	 + obj[i].name +"</option>");  
               	}
                },  
                error: function(json){  
                    alert("json=" + json);  
                 return false;  
                }  
                });      
	}
	}
	</script>

<body class="emp_body">
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="../../images/tleft.gif"/></td>
    <td width="44%" align="left">[添加/编辑咨询学生]</td>
   
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
<table width="89%" class="emp_table"    style="" align="left" cellspacing="0">
 <form id="search_form" action="<%=basePath%>refer/addRefer" method="post">
  <tr>
    <td width="120px" height="35" align="left" >姓名：</td>
    <td width="300px" align="left"><input name="name" type="text" /></td>
    <td>状态：咨询中</td>
  </tr>
  <tr>
    <td>电话：</td>
    <td><input name="telephone" type="text" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>QQ：</td>
    <td><input name="qq" type="text" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>咨询人：</td>
    <td>xxxx (只有编辑才显示)</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>意向级别：</td>
    <td>
    	<select name="intentionLevel">
    		<option>--请选择--</option>
    		<option>A</option>
    		<option>b</option>
    		<option>c</option>
    		<option>d</option>
    	</select>
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>意向课程：</td>
    <td>
    	<select id="courseTypeId" name="courseTypeId">
    	<option>--请选择--</option>
    	 <c:forEach var="courseTypes" items="${listCourseType}">
    	<option value="${courseTypes.courseTypeId}">${courseTypes.courseName}</option>
    	</c:forEach>
    	</select>
    	&nbsp;&nbsp;&nbsp;意向班级：
    	<select id="classId" name="classId">
    	<option>--请选择--</option>
    	
    	</select>
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="41" align="left">来源：</td>
    <td align="left">
    	<select name="source">
    		<option>--请选择--</option>
    		<option>上门</option>
    		<option>网络</option>
    		<option>电话</option>
    		<option>其他</option>
    	</select>
    	
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="left">备注：</td>
    <td align="left"><textarea name="remark" cols="60" rows="5"></textarea></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  </form>
</table>



</body>
</html>
