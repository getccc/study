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
		<link href="css/sidebar.css" rel="stylesheet" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>我的12306 | 客运服务 | 铁路客户服务中心</title>
		<link href="css/queryPassengers.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.11.0.js" ></script>
	</head>
		<script type="text/javascript" src="js/queryPassenger.js">
		
	</script>
	<body>
		<!--header start-->
		<div class="header">
			<div style="z-index: 2000" class="header-bd">
				<a href="http://www.12306.cn/">
					<h1 class="logo">中国铁路客户服务中心-客运中心</h1>
				</a>
				<div class="login-info">
					<div class="phone-link">
						<a href="#" target="true">手机版</a>
					</div>
					<div class="menu">
						<a href="myMenu.jsp" class="menu-bd" id="js-my">我的12306<b></b>
						</a>
						<div class="menu-list"><b></b>
							<ul>
								<li>
									<a href="outOrder.jsp">未完成订单</a>
								</li>
								<li>
									<a href="completeOrder.jsp">已完成订单(改/退)</a>
								</li>
								<li class="line"></li>
								<li>
									<a href="https://exservice.12306.cn/excater/queryMyOrder.html" target="_blank">我的餐饮</a>
								</li>
								<li>
									<a href="http://www.baidu.com">我的保险</a>
								</li>
								<li class="line"></li>
								<li>
									<a href="initQueryUserInfo.jsp">查看个人信息</a>
								</li>
								<li>
									<a href="security.jsp">账户安全</a>
								</li>
								<li class="line"></li>
								<li>
									<a href="queryPassengers.jsp">常用联系人</a>
								</li>
								<li>
									<a href="#">车票快递地址</a>
								</li>
								<li class="line"></li>
								<li>
									<a href="#">温馨服务查询</a>
								</li>
							</ul>
						</div>
					</div>
					<span class="login-txt" style="color: #666666;"><span>意见反馈:<a class="cursor colorA" href="mailto:12306yjfk@rails.com.cn">12306yjfk@rails.com.cn</a>
          您好，</span>
					<a id="login_user" href="myMenu.jsp" class="colorA" style="margin-left:-0.5px;"><span style="width:50px;">${passenger.realName}</span>
					</a>
					|
					<a id="regist_out" href="UserServlet?method=outUser">退出</a>
					</span>
				</div>
				<div class="nav">
					<ul>
						<li>
							<a href="#">客运首页</a>
						</li>
						<li id="selectYuding">
							<a href="ticketBook.jsp">车票预订</a>
						</li>
						<li>
							<a href="https://exservice.12306.cn/excater/index.html" target="_blank">订餐服务</a>
						</li>
						<li style="width: 71px;" id="js-xd" class="nav-guide">
							<a href="javascript:">出行向导</a>
							<div class="nav-list">
								<ul style="font-weight:normal">
									<li>
										<a href="ticketBook.jsp">车次查询</a>
									</li>
									<li>
										<a href="ticketBook.jsp">票价查询</a>
									</li>
									<li>
										<a href="ticketBook.jsp">公布票价查询</a>
									</li>
									<li>
										<a href="ticketBook.jsp">车站车次查询</a>
									</li>
									<li>
										<a href="ticketBook.jsp">中转查询</a>
									</li>
									<li>
										<a href="ticketBook.jsp">正晚点查询</a>
									</li>
									<li>
										<a href="#">代售点查询</a>
									</li>
								</ul>
							</div>
						</li>
						<li id="selectHelp">
							<a href="#">信息服务</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--header end-->
		<div id="dialog_del" style="display: none;">
			<div class="mark"></div>
			<div class="up-box w600">
				<div class="up-box-hd">删除常用联系人
					<a id="dialog_del_close" shape="rect">关闭</a>
				</div>
				<div class="up-box-bd">
					<div class="up-con clearfix"><span class="icon i-opt"></span>
						<div class="r-txt">
							<div class="tit">您确定要删除选中的常用联系人吗？</div>
						</div>
					</div>
					<div class="lay-btn">
						<a id="dialog_del_cancel" href="javascript:" class="btn92" shape="rect">取消</a>
						<a href="javascript:" id="dialog_del_ok" class="btn92s" shape="rect">确认</a>
					</div>
				</div>
			</div>
		</div>
		<!--页面主体  开始-->
		<div class="content clearfix">
			<!--当前位置 开始-->
			<div class="crumbs">
				您现在的位置：
				<a href="#" shape="rect">客运首页</a>
				&nbsp;>&nbsp;
				<a href="myMenu.jsp" shape="rect">我的12306</a>
				&nbsp;>&nbsp;
				<a href="queryPassengers.jsp" shape="rect">常用信息管理</a>
				&nbsp;>&nbsp;<strong>常用联系人</strong>
			</div>
			<!--当前位置 结束-->
			<!--左侧导航 开始-->
			<div class="sidebar">
				<div class="layout my">
					<div class="lay-hd">我的12306</div>
					<div class="lay-bd" id="js-my12306">
						<div class="nav-label" style="display: black"><span></span>
						</div>
						<dl id="sidebar_menu"><dt class="label-y"><a  href="javascript:void(0);" id="link_4_myTicket">我的火车票</a>
</dt>
							<dd class="label-y" id="dd_4_NonComOrder" url="completeOrder">
								<a href="outOrder.jsp" id="link_4_NonComOrder">未完成订单</a>
							</dd>
							<dd class="label-y" id="dd_4_comOrder" url="12306/completeOrder.html">
								<a href="completeOrder.jsp" id="link_4_comOrder">已完成订单</a>
							</dd>
							<dt class="label-y"><a  href="https://exservice.12306.cn/excater/queryMyOrder.html" target="_blank">我的餐饮</a>
</dt>
							<dt class="label-y" id="link_4_ticketInfo" url="insurance/init"><a  href="javascript:void(0);">我的保险</a>
</dt>
							<dt class="label-y"><a  href="javascript:void(0);" id="link_4_myInfor">个人信息</a>
</dt>
							<dd class="label-y" id="dd_4_showMyInfor" url="modifyUser/initQueryUserInfo">
								<a href="initQueryUserInfo.jsp" id="link_4_showMyInfor">查看个人信息</a>
							</dd>
							<dd class="label-y" id="dd_4_showSafe" url="userSecurity/init">
								<a href="security.jsp" id="link_4_showSafe">账号安全</a>
							</dd>
							<dd class="label-y" id="dd_4_sjhy" url="userSecurity/bindTel">
								<a href="securityTel.jsp" id="link_4_sjhy">手机核验</a>
							</dd>
							<dt class="label-y"><a  href="javascript:void(0);" id="link_4_passengerInfor">常用信息管理</a>
</dt>
							<dd class="label-y" id="dd_4_passengerIns" url="passengers/init">
								<a href="queryPassengers.jsp" id="link_4_passengerIns">常用联系人</a>
							</dd>
							<dd class="label-y" id="dd_4_address" url="address/init">
								<a href="javascript:void(0);" id="dd_4_address">车票快递地址</a>
							</dd>
							<dt class="label-y"><a  href="javascript:void(0);">温馨服务</a>
</dt>
							<dd class="label-y" id="dd_4_qxyy" url="icentre/qxyyInfo" class="last" otherUrl="icentre/qxyy">
								<a href="javascript:void(0);">重点旅客预约</a>
							</dd>
							<dd class="label-y" id="dd_4_lostitems" url="icentre/lostInfo" otherUrl="icentre/lostItems">
								<a href="javascript:void(0);">遗失物品查找</a>
							</dd>
							<dd class="label-y" id="dd_4_serviceQuery" url="icentre/serviceQuery">
								<a href="javascript:void(0);">服务查询</a>
							</dd>
							<dt class="label-y"><a  href="javascript:void(0);">投诉和建议</a>
</dt>
							<dd class="label-y" id="dd_4_complaint" url="advice/complaintInfo" otherUrl="advice/complaint">
								<a href="javascript:void(0);">投诉</a>
							</dd>
							<dd class="label-y" id="dd_4_advice" url="advice/adviceInfo" otherUrl="advice/advice">
								<a href="javascript:void(0);">建议</a>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<!--左侧导航 结束-->
			<!--右侧主体 开始-->
			<div class="main">
				<!--系统信息 开始-->
				<div class="layout order">
					<div class="lay-hd">常用联系人</div>
					<div class="lay-bd">
						<div class="lay-per">
							<div class="lay-perhd">
								<div class="s-box"><input id="_search_name" type="text" value="输入乘客姓名" class="txt" />
									<input id="_search_butn" type="submit" class="sub" />
								</div>
								<a class="add" href="addPassengers.jsp" shape="rect">增加</a>
								<a class="del" onclick="alert($('#passengerAllTable').val())" href="#" shape="rect">删除</a>
							</div>
							<div class="lay-perbd">
								<table>
									<thead>
										<tr>
											<th rowspan="1" colspan="1"><input id="_checkAll" type="checkbox" class="check" />
												<label>序号</label>
											</th>
											<th rowspan="1" colspan="1">姓名</th>
											<th rowspan="1" colspan="1">证件类型</th>
											<th width="175" rowspan="1" colspan="1">证件号码</th>
											<th rowspan="1" colspan="1">手机/电话</th>
											<th rowspan="1" colspan="1">旅客类型</th>
											<th rowspan="1" colspan="1">核验状态</th>
											<th class="tc" width="50" rowspan="1" colspan="1">操作</th>
										</tr>
									</thead>
									<tbody id="passengerAllTable">
									<c:forEach var="passengers" items="${passengers}" varStatus="status" >
									 <tr>
									 <td>
									 <input value="${passengers.card}" type="checkbox" class="check" style="cursor: pointer" />
									 <label>${status.index+1}</label>
									 </td>
									 <td>${passengers.realName}</td>
									 <td>二代身份证</td>
									 <td>${passengers.card}</td>
									 <td>${passengers.tel}</td>
									 <td>成人</td>
									 <td style="color: #0077FF;">已通过</td>
									 <td class="tc"> 
									 <a class="i-del" href="PassengerServlet?method=delPassenger&card=${passengers.card}"></a>
									 <a class="i-edit" href="PassengerServlet?method=updMess&realName=${passengers.realName}&card=${passengers.card}"></a>
									 </td>
									</tr>
									</c:forEach>
									
									</tbody>
								</table>
							</div>
						</div>
						<!--翻页  开始-->
						<div class="page gigantic pagination" id="pagination">
							<a href="#nogo" class="btn92 first" data-action="first">首页</a>
							<a href="#nogo" class="btn92 previous" data-action="previous">上一页</a>
							<span class="pageItems"></span>
							<a href="#nogo" class="btn92 next" data-action="next">下一页</a>
							<a href="#nogo" class="btn92 last" data-action="last">末页</a>
						</div>
						<!--翻页  结束-->
					</div>
				</div>
				<!--系统信息 结束-->
			</div>
			<!--右侧主体 结束-->
		</div>
		<!--页面主体  结束-->
		<!--页面底部  开始-->
		<div class="footer">
			<p>
				<a href="http://www.12306.cn/mormhweb/gljd/gywm" target="true">关于我们</a>
				|
				<a href="http://www.12306.cn/mormhweb/gljd/wzls/" target="true">网站声明</a>
			</p>
			<p>版权所有 © 2008-2017 中国铁路信息技术中心 中国铁道科学研究院</p>
			<p>京ICP备15003716号-3&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证150437号</p>
		</div>
		<!--页面底部  结束-->
	</body>

</html>
