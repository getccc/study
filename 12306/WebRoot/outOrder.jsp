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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="css/validation.css" rel="stylesheet" />
		<link href="css/common.css" rel="stylesheet" />
		<title>我的12306 | 客运服务 | 铁路客户服务中心</title>
		<link href="css/sidebar.css" rel="stylesheet" />
		<link href="css/9.css" type="text/css" rel="stylesheet" />
		<link href="css/10.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.11.0.js" ></script>
	</head>
		<script type="text/javascript" src="js/outOrder.js">
		
	</script>
	<body>
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
		<!--页面主体  开始-->
		<div class="content clearfix">
			<!--当前位置 开始-->
			<div class="crumbs">
				您现在的位置：
				<a href="#" shape="rect">客运首页</a>
				&nbsp;>&nbsp;
				<a href="myMenu.jsp" shape="rect">我的12306</a>
				&nbsp;>&nbsp;<strong>未完成订单</strong>
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
				<!--已完成订单 开始-->
				<div class="layout order">
					<div class="lay-hd">未完成订单</div>
					<div class="lay-bd">
						<!-- 未查询出数据开始   -->
						<div class="no-ticket-w" id="noticketlistid" style="display:none;">
							<div class="no-ticket"><span class="i-no"></span>
								<p>您没有未完成订单，可以通过<br clear="none" />
									<a href="#nogo" id="tain_code_yuding" shape="rect">车票预订</a>
									功能，来制定出行计划。</p>
							</div>
						</div>
						<!-- 未查询出数据 结束  -->
						<div class="order-item" id="orderinfobodyTable" style="display:black;">
							<c:forEach items="${selectOrder}" var="selectOrder">
								<div class="order-item-hd">
									<div class="time">
										订单日期：
										<strong>${selectOrder.orderTime}</strong>
									</div>
									<div class="per-s">
										<c:forEach items="${orderinfos}" var="map">
											<c:if
												test="${fn:containsIgnoreCase(fn:trim(map.key),fn:trim(selectOrder.id))}"
												var="flag">
												<c:forEach items="${map.value}" var="childList"
													varStatus="status">
													<span>${childList.realName}</span>
												</c:forEach>
											</c:if>
										</c:forEach>
									</div>
									<div class="place">
										<strong>${selectOrder.departure}</strong>
										<b class="dc"></b>
										<strong>${selectOrder.terminal}</strong>
									</div>
									<div class="time2">
										乘车日期：
										<strong>${trainDate}</strong>
									</div>
								</div>
								<div class="order-item-bd">
									<table class="table-c">
										<tr>
											<th width="37" rowspan="1" colspan="1">
												序号
											</th>
											<th width="150" rowspan="1" colspan="1">
												车次信息
											</th>
											<th width="120" rowspan="1" colspan="1">
												席位信息
											</th>
											<th width="100" rowspan="1" colspan="1">
												旅客信息
											</th>
											<th width="150" rowspan="1" colspan="1">
												票款金额
											</th>
											<th rowspan="1" colspan="1">
												车票状态
											</th>
										</tr>

										<c:forEach items="${orderinfos}" var="map">
											<c:if
												test="${fn:containsIgnoreCase(fn:trim(map.key),fn:trim(selectOrder.id))}"
												var="flag">
												<c:forEach items="${map.value}" var="childList"
													varStatus="status">
													<tr>
														<td rowspan="1" colspan="1">
															${ status.index + 1}
														</td>
														<td rowspan="1" colspan="1">
															<div class="ccxx">
																${trainDate} ${selectOrder.startTime}开
																<br clear="none" />
																${selectOrder.trainNo} ${selectOrder.departure} --
																${selectOrder.terminal}
															</div>
														</td>
														<td rowspan="1" colspan="1">
															${childList.seatType} ${childList.carriage}车厢
															<br clear="none" />
															${childList.seatingOrder}号
														</td>
														<td rowspan="1" colspan="1">
															${childList.realName}
															<br clear="none" />
															二代身份证
														</td>
														<td rowspan="1" colspan="1">
															成人票
															<span class="colorA">${childList.price}元</span>
														</td>
														 <c:if test="${status.index==0}"> 
														 	<td rowspan="${fn:length(map.value)}">${selectOrder.orderState}</td>
														 </c:if>
														
													</tr>
									
                                				</c:forEach>
											</c:if>
										</c:forEach>
									</table>
								<div class="t-foot" >
								 
								 <c:forEach items="${orderinfos}" var="map">
								 <c:set var="sum" value="0"/>
								 <c:if test="${fn:containsIgnoreCase(fn:trim(map.key),fn:trim(selectOrder.id))}" var="flag">
								<c:forEach items="${map.value}" var="childList" varStatus="status">
								<c:set var="sum" value="${sum+childList.price}"/>
									</c:forEach>
									
										<span>总张数：${fn:length(map.value)}<strong></strong>
										</span>
										
										<span>待支付金额：<strong class="colorA">${sum}元</strong> </span>
									
									
									</div>
									
									<div class="t-btn">
										<div class="btn">
											<a href="OrderServlet?method=outOrder&oid=${selectOrder.id}"
												class="btn92" shape="rect">取消订单</a>
											<a href="OrderServlet?method=payMoney&oid=${selectOrder.id}&money=${sum}"
												class="btn92s" shape="rect">立即支付</a>
										</div>
									</div>
									</c:if>
									</c:forEach>
							</c:forEach>
						</div>
						</div>
					</div>
				</div>
				<!--已完成订单 结束-->
				<div class="tips-txt mt10">
					<h2>温馨提示：</h2>
					<P id="noticeShow">1.席位已锁定，请在指定时间内完成网上支付。</P>
					<P>2.逾期未支付，系统将取消本次交易。</P>
					<P>3.在完成支付或取消本订单之前，您将无法购买其他车票。</P>
				</div>
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
		<!-- 取消改签提示 开始 -->
		<div class="up-box w600" style="display:none;" id="cancel_resign_id">
			<div class="up-box-hd">交易提示
				<a href="#nogo" id="cancel_resign_close" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit">您是否要取消改签？</div>
						<P class="colorA">一天内<span style="font-size:20px;">3</span> 次申请车票成功后取消改签，
							<span style="font-size:20px;">当天</span> 将不能在网站购票。
						</P>
					</div>
				</div>
				<div class="lay-btn">
					<a href="#nogo" class="btn92" id="cancel_resign_co" shape="rect">取消</a>
					<a href="#nogo" class="btn92s" id="cancel_resign_ok" shape="rect">确认</a>
				</div>
			</div>
		</div>
		<!-- 取消改签提示 结束 -->
		<!-- 取消订单提示 开始 -->
		<div class="up-box w600" style="display:none;" id="cancel_order_id">
			<div class="up-box-hd">交易提示
				<a href="#nogo" id="cancel_order_close" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit">您确认取消订单吗？</div>
						<P>一天内3次申请车票成功后取消订单，当日将不能在网站购票。</P>
					</div>
				</div>
				<div class="lay-btn">
					<a href="#nogo" class="btn92" id="cancel_order_co" shape="rect">取消</a>
					<a href="#nogo" class="btn92s" id="cancel_order_ok" shape="rect">确认</a>
				</div>
			</div>
		</div>
		<!-- 取消订单提示 结束 -->
		<!-- /wrap -->
		<form id="_es_hiddenform" method="post" enctype="application/x-www-form-urlencoded"><input type="hidden" name="_json_att" value="" />
		</form>
		<input id="sequeue_no_hide" style="display:none;" type="text" />
		<input id="operation_flag_hide" style="display:none;" type="text" />
	</body>

</html>
