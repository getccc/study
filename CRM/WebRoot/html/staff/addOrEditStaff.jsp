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
		<script type="text/javascript" src="../../js/jquery-1.3.1.js"></script>
	</head>
	
	<c:if test="${sdepartments == null}">
		<jsp:forward page="/staff/AllDept.action"></jsp:forward>
	</c:if>
	
  <script type="text/javascript">
  	window.onload = function(){
    document.getElementById("dept").onchange = function(){
  
	var obj = document.getElementById("dept"); 
    var index = obj.selectedIndex; 
	var dept = obj.options[index].value; 
	alert(dept);
	
	 $.ajax({  
                type:"post",  
                url:"<%=basePath%>staff/listPost?depId="+dept,
                dataType:"json", 
                async:false, 
                success: function(data){    
                alert(data);  
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
					[添加/编辑员工]
				</td>

				<td width="52%" align="right">
					<a href="javascript:document:search_form.submit();"><img src="../../images/button/save.gif" />
					</a>
					<a href="javascript:history.go(-1);"><img src="../../images/button/tuihui.gif" />
					</a>

				</td>
				<td width="3%" align="right">
					<img src="../../images/tright.gif" />
				</td>
			</tr>
		</table>

		<table width="88%" border="0" class="emp_table" style="width: 80%;">
		<form id="search_form" method="post" action="<%=basePath%>staff/addStaff">
			<tr>
				<td>
					登录名：
				</td>
				<td>
					<input name="loginName" type="text" />
				</td>
				<td>
					登陆密码：
				</td>
				<td>
					<input name="loginPwd" type="password" />
				</td>
			</tr>
			<tr>
				<td>
					姓名：
				</td>
				<td>
					<input name="staffName" type="text" />
				</td>
				<td>
					性别：
				</td>
				<td>
					<input value="男" name="gender" type="radio" />
					男
					<input value="女" name="gender" type="radio" />
					女
				</td>
			</tr>
			<tr>

				<td width="10%">
					所属部门：
				</td>
				<td width="20%">
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
				<td width="8%">
					职务：
				</td>
				<td width="62%">
					<select name="postId" id="post" name="post" >
						<option>
							----请--选--择----
						</option>
					
					</select>
				</td>


			</tr>
			<tr>
				<td width="10%">
					入职时间：
				</td>
				<td width="20%">
					<input name="onDutyDate" type="text" />
				</td>
				<td width="8%"></td>
				<td width="62%"></td>
			</tr>
			</form>
		</table>
	</body>
</html>
