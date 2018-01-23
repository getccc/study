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
<script type="text/javascript" src="js/jquery-1.3.1.js"></script>
</head>

<c:if test="${sdepartments == null}">
	<jsp:forward page="/staff/AllDepts.action"></jsp:forward>
</c:if>
	
 <script type="text/javascript">
  	window.onload = function(){
    document.getElementById("dept").onchange = function(){
  
	var obj = document.getElementById("dept"); 
    var index = obj.selectedIndex; 
	var dept = obj.options[index].value; 
	
	
	 $.ajax({  
                type:"post",  
                url:"<%=basePath%>staff/listPost?depId="+dept,
                dataType:"json", 
                async:false, 
                success: function(data){    
                 
                obj=eval("(" + data + ")"); 
               	var count =obj.length;
               	alert(count);
               	$("#post option").remove();  
            	$("#post").append("<option value=0>----请--选--择----</option>"); 
				for(i=0;i<count;i++){
				  
               	 $("#post").append("<option value="+ obj[i].postId +">"
               	 + obj[i].postName +"</option>");  
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

<body >
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="images/tleft.gif"/></td>
    <td width="39%" align="left">[员工管理]</td>
   
    <td width="57%"align="right">
    	<!-- 添加员工 -->
    	<a href="html/staff/addOrEditStaff.jsp"><img src="images/button/tianjia.gif" /></a>
    	<!-- 高级查询-->
		<a href="javascript:document:search_form.submit();"><img src="images/button/gaojichaxun.gif" /></a>
    </td>
    <td width="3%" align="right"><img src="images/tright.gif"/></td>
  </tr>
</table>

<!-- 查询条件：添加或选择马上查询 -->
<form action="<%=basePath%>staff/listStaff" id="search_form" method="post" >
	
	<table width="88%" border="0" style="margin: 20px;" >
	  <tr>
	    <td width="80px">部门：</td>
	    <td width="200px">
	    	<select id="dept" >
				<option>
						----请--选--择----
					</option>
				<c:forEach var="departments" items="${sdepartments}">
					<option value="${departments.depId}">
						${departments.depName}
					</option>
				</c:forEach>
			</select>
	    </td>
	    <td width="80px" >职务：</td>
	    <td width="200px" >
	    	<select name="postId" id="post" name="post" >
				<option>
					----请--选--择----
				</option>
			</select>
	    </td>
	    <td width="80px">姓名：</td>
	    <td width="200px" ><input name="staffName" type="text" size="12"/></td>
	    <td ></td>
	  </tr>
	</table>
</form>

<table border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
  <tr>
    <td ><img src="images/result.gif"/></td>
  </tr>
</table>


<table width="100%" border="1" >
  <tr class="henglan" style="font-weight:bold;">
    <td width="10%" align="center">员工姓名</td>
    <td width="6%" align="center">性别</td>
    <td width="12%" align="center">入职时间</td>
    <td width="15%" align="center">所属部门</td>
    <td width="10%" align="center">职务</td>
    <td width="10%" align="center">编辑</td>
  </tr>
  <c:if test="${stafflist != null}">
  <c:forEach var="stafflist" items="${stafflist}">
  <tr class="tabtd2">
    <td align="center">${stafflist.staffName}</td>
    <td align="center">${stafflist.gender}</td>
    <td align="center">${stafflist.onDutyDate}</td>
    <td align="center">${stafflist.post.department.depName}</td>
    <td align="center">${stafflist.post.postName}</td>
  	<td width="7%" align="center"><a href="<%=basePath%>staff/updateStaff?loginName=${stafflist.loginName}"><img src="images/button/modify.gif" class="img"/></a></td>
  </tr>
</c:forEach>
</c:if>

<c:if test="${staffByName != null}">
 <tr class="tabtd2">
    <td align="center">${staffByName.staffName}</td>
    <td align="center">${staffByName.gender}</td>
    <td align="center">${staffByName.onDutyDate}</td>
    <td align="center">${staffByName.post.department.depName}</td>
    <td align="center">${staffByName.post.postName}</td>
  	<td width="7%" align="center"><a href="<%=basePath%>staff/updateStaff?loginName=${staffByName.loginName}"><img src="images/button/modify.gif" class="img"/></a></td>
  </tr>
 </c:if>

</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第1/3页</span>
        <span>
        	<a href="#">[首页]</a>&nbsp;&nbsp;
            <a href="#">[上一页]</a>&nbsp;&nbsp;
            <a href="#">[下一页]</a>&nbsp;&nbsp;
            <a href="#">[尾页]</a>
        </span>
    </td>
  </tr>
</table>
</body>
</html>
