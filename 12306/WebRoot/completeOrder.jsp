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
		<script type="text/javascript" src="js/jquery-1.11.0.js" ></script>
		<link href="css/sidebar.css" rel="stylesheet" />
		<link href="css/9.css" type="text/css" rel="stylesheet" />
		<link href="css/10.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
		<script src="laydate/laydate.js"></script>
	    <script type="text/javascript" src="js/completeOrder.js"></script>
	</head>
	<script type="text/javascript">
	$(function(){
	$(".btn92s").click(function () {
		
		var checkboxArray = document.getElementsByName("testc");
		var checkedIdArray = new Array();

		for (i in checkboxArray) {
			if (checkboxArray[i].checked) {
				alert(checkboxArray[i].value);
				checkedIdArray.push(checkboxArray[i].value);
			}
		}
		$("input[id*='checkedIdArray']").val(checkedIdArray);
	})
	
	})
	</script>
	
	<body>
		<!-- 查看改签详情 开始-->
		<div class="up-box w600" style="display:none;" id="cancel_resign_id">
			<div class="up-box-hd">退票详情
				<a href="javascript:" id="cancel_resign_close" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd" style="padding-left: 30px;font-size: 14px;">
				<p>车票:<span id="resign_details"></span>
				</p>
				<br clear="none" />
				<P>状态:<span class="colorA">已改签</span>
				</P>
				<br clear="none" />
			</div>
		</div>
		<!-- 查看改签详情 结束 -->
		<!-- 查看退票详情 开始 -->
		<div class="up-box w600" style="display:none;" id="cancel_return_id">
			<div class="up-box-hd">改签详情
				<a href="javascript:" id="cancel_return_close" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd" style="padding-left: 30px;font-size: 14px;">
				<p>车票:<span id="return_details"></span>
				</p>
				<P>状态:<span class="colorA">已退票，已成功退至银行。</span>
				</P>
				<P style="margin-left: 60px">如已超过15个工作日尚未到账，请持银行交易流水号ZS34538596至</P>
				<p>发卡银行查询</p>
				<p>交易详细信息:</p>
				<table class="table-c">
					<tr>
						<th rowspan="1" colspan="1">交易时间</th>
						<th rowspan="1" colspan="1">交易信息</th>
					</tr>
					<tr>
						<td rowspan="1" colspan="1">2013-10-26 10:23</td>
						<td rowspan="1" colspan="1">购票成功</td>
					</tr>
					<tr>
						<td rowspan="1" colspan="1">2013-10-27 08:23</td>
						<td rowspan="1" colspan="1">退票成功，应退金额30.5元</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 查看退票详情 结束 -->
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
		<!--页面主体  开始-->
		<div class="content clearfix">
			<!--当前位置 开始-->
			<div class="crumbs">
				您现在的位置：
				<a href="#" shape="rect">客运首页</a>
				&nbsp;>&nbsp;
				<a href="myMenu.jsp" shape="rect">我的12306</a>
				&nbsp;>&nbsp;<strong>已完成订单</strong>
			</div>
			<!--当前位置 结束-->
			<!--左侧导航 开始-->
			<div class="sidebar">
				<div class="layout my">
					<div class="lay-hd">我的12306</div>
					<div class="lay-bd" id="js-my12306">
						<div class="nav-label" style="display: black;"><span></span>
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
					<div class="lay-hd">已完成订单</div>
					<div class="lay-bd">
						<form id="queryOrderForm" method="get" enctype="application/x-www-form-urlencoded">
							<div class="order-tab">
								<div class="order-tab-hd">
									<ul>
										<li class="active" id="query_G">
											<a href="#" shape="rect">未出行订单</a>
										</li>
										<li id="query_H">
											<a href="#" shape="rect">历史订单</a>
										</li>
									</ul>
								</div>
								<div class="order-tab-bd">
									<div style="display:block" class="item">
										<a id="querymyorderbutton" class="btn92s fr" href="OrderServlet?method=refreshCompleteOrder" shape="rect"><label style="cursor:pointer;" for="querybutton">查询</label>
										</a>
										<span id="use_G"><select name="queryType"><option value="1">按订票日期查询</option>
<option value="2">按乘车日期查询</option>
</select>
</span>
										<span><label for="orderdate">查询日期</label>
</span>
										<span><input type="text" name="queryStartDate" id="queryStartDate"  value="2017-09-01" onchange="laydate(this)" onclick="WdatePicker({minDate:'%y-%M-%d',maxDate:'%y-%M-{%d+20}'})" readonly="readonly" />
-<input type="text" name="queryEndDate" readonly="readonly" value="2017-09-30" id="queryEndDate" onchange="laydate(this)" onclick="WdatePicker({minDate:'%y-%M-%d',maxDate:'%y-%M-{%d+20}'})"  />
</span>
										<span class="inp-s"><input type="text" id="sequeue_train_nameText" class="inpA" value="订单号/车次/乘客姓名" />
<span class="i-clear" id="clear_input_txt" title="清除"></span>
										</span>
									</div>
									<input type="hidden" name="come_from_flag" id="come_from_flag" value="" />
									<input type="hidden" name="pageSize" id="pageSize" value="8" />
									<input type="hidden" name="pageIndex" id="pageIndex" value="0" />
									<input type="hidden" name="query_where" id="query_where" value="" />
								</div>
							</div>
							<div class="order-line"></div>
							<div class="sear-lay" id="query_what_order">
								<div class="sear-bot">
									<a class="cur" id="queryAllMyOrders" href="OrderServlet?method=refreshCompleteOrder" shape="rect">全部</a>
									<a  id="queryResginOrders" href="OrderServlet?method=canChangeOrder" shape="rect">可改签</a>
									<a id="queryCSOrders" href="javascript:void(0);" shape="rect">可变更到站</a>
									<a href="javascript:void(0);" id="OrderServlet?method=canChangeOrder" shape="rect">可退票</a>
								</div>
							</div>
						</form>
						<div id="loading"></div>
						<!-- 未查询出数据开始   -->
						<div class="no-ticket-w" id="noticketlist" style="display:none;">
							<div class="no-ticket"><span class="i-no"></span>
								<p>您没有对应的订单内容，您可以通过<br clear="none" />
									<a href="#nogo" id="book_ticket_id" shape="rect">车票预订</a>
									功能，来制定出行计划。</p>
							</div>
						</div>
						<!-- 未查询出数据结束   -->
						<!-- 查询出数据开始  -->
						<div id="orderinfobodyTable" style="display:black;">
						<c:forEach items="${completeOrder}" var="selectOrder" varStatus="st">
						 
							<div class="order-item">
								<div class="order-item-hd"><span class="icon-btn"></span>
									<div class="time">订单日期：<strong>${selectOrder.orderTime}</strong>
									</div>
									
									<div class="per-s">
									<c:forEach items="${completeOrderinfos}" var="map">
                                    <c:if test="${fn:containsIgnoreCase(fn:trim(map.key),fn:trim(selectOrder.id))}" var="flag">
						            <c:forEach items="${map.value}" var="childList" varStatus="status">
									
										<span>${childList.realName}</span>
									</c:forEach>
									</c:if>
								 </c:forEach>
									
									</div>
									
									
									<div class="place"><strong>${selectOrder.departure} -</strong>
										<b class="dc"></b>
										<strong>${selectOrder.terminal}</strong>
									</div>
									<div class="time2">乘车日期：<strong>${trainDate}</strong>
									</div>
									<a class="dispatch" href="#nogo" title="配送信息" shape="rect">配送信息</a>
									<a class="print" target="_blank" href="#nogo" shape="rect">打印</a>
									<i class="new"></i>
								</div>
								<div class="order-item-bd">
									<table class="table-c">
										<tr>
											<th width="37" rowspan="1" colspan="1">序号</th>
											<th width="145" rowspan="1" colspan="1">车次信息</th>
											<th width="120" rowspan="1" colspan="1">席位信息</th>
											<th width="100" rowspan="1" colspan="1">旅客信息</th>
											<th width="110" rowspan="1" colspan="1">票款金额</th>
											<th width="100" rowspan="1" colspan="1">车票状态</th>
											<th rowspan="1" colspan="1">操作</th>
										</tr>
										<c:forEach items="${completeOrderinfos}" var="map">
                                        <c:if test="${fn:containsIgnoreCase(fn:trim(map.key),fn:trim(selectOrder.id))}" var="flag">
						                <c:forEach items="${map.value}" var="childList" varStatus="status">
										<tr>
											<td rowspan="1" colspan="1"><input type="checkbox" class="check" value="${childList.realName}" name="testc" />
												<label>${ status.index + 1}</label>
											</td>
											<td rowspan="1" colspan="1">
												<div class="ccxx">${trainDate} ${selectOrder.startTime}开<br clear="none" /> ${selectOrder.trainNo} ${selectOrder.departure} -- ${selectOrder.terminal}</div>
											</td>
											<td rowspan="1" colspan="1">${childList.seatType} ${childList.carriage}车厢<br clear="none" /> ${childList.seatingOrder}号  </td>
											<td rowspan="1" colspan="1">${childList.realName}<br clear="none" /> 二代身份证
											</td>
											<td rowspan="1" colspan="1">成人票<span class="colorA"> ${childList.price}元  </span>
											</td>
											<td rowspan="1" colspan="1">${childList.payState}</td>
											<td rowspan="1" colspan="1">
											<c:if test="${childList.payState eq '已支付'}">
												<a href="OrderServlet?method=outTicket&id=${selectOrder.id}&realName=${childList.realName}" class="btn92" shape="rect">退票 </a>
											</c:if>
											</td>
										</tr>
								</c:forEach>
                                </c:if>
								</c:forEach>
									</table>
									
									<div class="t-foot"><span>订单号：<strong>E${selectOrder.id}</strong></span>									
                                       <c:forEach items="${completeOrderinfos}" var="map">
                                        <c:set var="sum" value="0"/>
                                        <c:if test="${fn:containsIgnoreCase(fn:trim(map.key),fn:trim(selectOrder.id))}" var="flag">
						                <c:forEach items="${map.value}" var="childList" varStatus="status">
										<c:set var="sum" value="${sum+childList.price}"/>
									   </c:forEach>
										<span>总金额：<strong class="colorA">${sum}元</strong></span>
										</c:if>
									 </c:forEach>
	                              
									</div>
									
									<div class="t-btn"><span class="fl"><input type="checkbox" class="check" />
<label>全选</label>
</span>
										
										<form action="OrderServlet?method=changeTrain" method="post">
										<input type="hidden" name="checkedIdArray" value="" id="checkedIdArray${ status.index + 1}">
										<input type="hidden" name="departure" value="${selectOrder.departure}" id="departureId">
						                <input type="hidden" name="terminal" value="${selectOrder.terminal}" id="terminalId">
										<input type="hidden" name="oid" value="${selectOrder.id}" id="orderId">
										
										<div class="btn">
											<input value="批量改签" style="border: none"  type="submit" id="vochange" class="btn92s" >
										</div>
										</form>
									
									</div>
								</div>
							</div>
							   
                                </c:forEach>
						</div>
						<!-- 查询出数据结束 -->
						<!--翻页  开始-->
						<div class="page" id="pagination" style="display:none;">
							<a href="#nogo" class="btn92" shape="rect">客运首页</a>
							<a href="#nogo" class="btn92" shape="rect">上一页</a>
							<a href="#nogo" class="btn30s" shape="rect">1</a>
							<a href="#nogo" class="btn30" shape="rect">2</a>
							<a href="#nogo" class="btn30" shape="rect">3</a>
							<a href="#nogo" class="btn30" shape="rect">4</a>
							<span class="btn30">...</span>
							<a href="#nogo" class="btn30" shape="rect">16</a>
							<a href="#nogo" class="btn92" shape="rect">下一页</a>
							<a href="#nogo" class="btn92" shape="rect">末页</a>
						</div>
						<!--翻页  结束-->
					</div>
				</div>
				<!--已完成订单 结束-->
				<div class="tips-txt mt10">
					<h2>温馨提示：</h2>
					<P>1.订单信息在本网站保存期限为30日。</P>
					<P>2.在本网站购票后，没有换取纸质车票的，可不晚于开车前30分钟在本网站办理改签、退票业务，或不晚于开车前48小时在本网站办理“变更到站”业务。</P>
					<P>3.在本网站办理退票，只能逐次单张办理。</P>
					<P>4. 车票改签、变更到站均只能办理一次。已经改签或变更到站的车票不再办理改签；对已改签车票、团体票暂不提供“变更到站”服务。</P>
					<P>5.退票、改签、变更到站后，如有应退票款，按购票时所使用的在线支付工具相关规定，将在规定时间内退还至原在线支付工具账户，请及时查询。如有疑问，请致电12306人工客服查询。</P>
					<p>6.如需取消或查看车票快递状态，请点击“快递详情”。</p>
					<p>7.投保、退保或查看电子保单状态，请点击“我的保险”或“购/赠/退保险”。</p>
					<!--  
            <a href="#nogo" id="show_more_titel_info">更多内容...</a>
            -->
					<div id="hide_info_id">
						<!--  <a href="#nogo" id="hide_more_titel_info" class='hide'>隐藏...</a> -->
					</div>
				</div>
			</div>
			<!--右侧主体 结束-->
		</div>
		<!--页面主体  结束-->
		<!-- 餐饮、联程票提示页面弹出层 开始    -->
		<div class="up-box w600" style="display:none;border: solid rgb(245, 234, 240) 1px" id="lc_msg_confirm_id">
			<div class="up-box-hd">提示
				<a href="#nogo" id="lc_msg_confirm_close" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<!--  <div class="tit">您要改签（变更到站）的车票有关联该订单中的其它车票，您确定要改签（变更到站）吗？</div>-->
						<div class="tit">您确定要改签（变更到站）吗？如有订餐，请按规定到网站自行办理退餐。</div>
					</div>
				</div>
				<div class="lay-btn">
					<a href="#nogo" id="lc_msg_confirm_ok" class="btn92s" shape="rect">确认</a>
				</div>
			</div>
		</div>
		<!-- 联程票提示页面弹出层 结束   -->
		<!-- 退票页面弹出层 开始    -->
		<div class="up-box w600" style="display:none;border: solid rgb(245, 234, 240) 1px" id="return_ticket_id">
			<div class="up-box-hd">交易提示
				<a href="#nogo" id="close_trade_notice_return" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit">您确认要退票吗？如有订餐，请按规定到网站自行办理退餐。</div>
						<!--  	<P id="refundTicketRate">退票按每张车票面额的<span class="colorA">5%</span>收退票费</P>
            	<p>退票费不足2元的按2元收取等</p>-->
						<div id="returnTicketInfo">
							<p>票款原价：<strong class="mr5">100.0元</strong> 退票费：

								<strong class="mr5">5.0元</strong> 共计退款：
								<strong class="colorA">95.0元</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="lay-btn">
					<a href="#nogo" id="cacel_return_ticket" class="btn92" shape="rect">取消</a>
					<a href="#nogo" id="return_ticket_ok" class="btn92s" shape="rect">确认</a>
				</div>
				<p class="tips">
					1. 退票费按如下规则核收：票面乘车站开车时间前15天（不含）以上不收取退票费，48小时以上的按票价5%计，24小时以上、不足48小时的 按票价10%计，不足24小时的按票价20%计。改签或变更到站后的车票乘车日期在春运期间的，退票时一律按开车时间前不足24小时标准核收退票费。<br clear="none" /> 2. 应退款项按银行规定时限退还至购票时所使用的网上支付工具账户，请注意查询，如有疑问请致电12306 人工客服查询。<br clear="none" /> 3. 2016年春运期间为1月24日至3月3日。

				</p>
			</div>
		</div>
		<!-- 退票页面弹出层 结束   -->
		<!-- 加载中开始 -->
		<div class="up-box w600" id="dataLoad" style="display:none">
			<div>
				<tr>
					<td rowspan="1" colspan="1"><img src="/otn/resources/images/bg_login2.jpg" />
					</td>
				</tr>
				<tr>
					<td rowspan="1" colspan="1">数据载入中，请稍候......</td>
				</tr>
				<tr>
					<td rowspan="1" colspan="1">&nbsp;</td>
				</tr>
			</div>
		</div>
		<!-- 加载中结束 -->
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
		<!-- /wrap -->
		<form id="_es_hiddenform" method="post" enctype="application/x-www-form-urlencoded"><input type="hidden" name="_json_att" value="" />
		</form>
		<div class="mask" id="detail_mask" style="display: none;"></div>
		<div class="new-tips" style="display: none;" id="detail_f_content"><i></i>
			<a href="javascript:void(0);" class="close" id="detail_f_close" shape="rect">关闭</a>
			<img src="/otn/resources/images/bg09.png" width="387" height="143" />
		</div>
	</body>

</html>
