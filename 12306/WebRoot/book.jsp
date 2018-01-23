<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>车票预订 | 客运服务 | 铁路客户服务中心</title>
		<script type="text/javascript" src="js/jquery-1.11.0.js">
</script>
		<link href="css/validation.css" rel="stylesheet">
		<link href="css/common.css" rel="stylesheet">
		<link href="css/passengerInfo_css.css" rel="stylesheet">
	</head>
	<script type="text/javascript">

$(function(){
			$("input:checkbox").click(function() {
				//if($(this).is(':checked')) {
				
				     if($("input[name='test']:checked").length == 1){
				     	$("#tr_id_2").attr("style", "display: none");
				    	//根据指定id获取设session中的常用联系人
				    	if($(this).is(':checked')){
				      	 <c:forEach var="passenger" items="${passengers}" >
				    		if($(this).val() == "${passenger.id}"){
				    			$("#passenger_name_1").val("${passenger.realName}");
				    			$("#passenger_id_no_1").val("${passenger.card}");
				    			$("#phone_no_1").val("${passenger.tel}");
				    		}
						</c:forEach>
				      	 }
				    	
				    };
				    
				      if($("input[name='test']:checked").length == 2){
				      	 $("#tr_id_2").attr("style", "display: black");
				      	 $("#tr_id_3").attr("style", "display: none");
				      	 if($(this).is(':checked')){
				      	 <c:forEach var="passenger" items="${passengers}" >
				    		if($(this).val() == "${passenger.id}"){
				    			$("#passenger_name_2").val("${passenger.realName}");
				    			$("#passenger_id_no_2").val("${passenger.card}");
				    			$("#phone_no_2").val("${passenger.tel}");
				    		}
						</c:forEach>
				      	 }
				      	 
				      }
				      
				      if($("input[name='test']:checked").length == 3){
				      	 $("#tr_id_3").attr("style", "display: black");
				      	  $("#tr_id_4").attr("style", "display: none");
				      	  if($(this).is(':checked')){
				      	  <c:forEach var="passenger" items="${passengers}" >
				    		if($(this).val() == "${passenger.id}"){
				    			$("#passenger_name_3").val("${passenger.realName}");
				    			$("#passenger_id_no_3").val("${passenger.card}");
				    			$("#phone_no_3").val("${passenger.tel}");
				    		}
						</c:forEach>
				      	  }
				      }
				      
				      if($("input[name='test']:checked").length == 4){
				      	 $("#tr_id_4").attr("style", "display: black");
				      	 $("#tr_id_5").attr("style", "display: none");
				      	if($(this).is(':checked')){
				      	<c:forEach var="passenger" items="${passengers}" >
				    		if($(this).val() == "${passenger.id}"){
				    			$("#passenger_name_4").val("${passenger.realName}");
				    			$("#passenger_id_no_4").val("${passenger.card}");
				    			$("#phone_no_4").val("${passenger.tel}");
				    		}
						</c:forEach>
				      	}

				      }
				      
				      if($("input[name='test']:checked").length == 5){
				     
				      	 $("#tr_id_5").attr("style", "display: black");
				      	  if($(this).is(':checked')){
				      	  <c:forEach var="passenger" items="${passengers}" >
				    		if($(this).val() == "${passenger.id}"){
				    			$("#passenger_name_5").val("${passenger.realName}");
				    			$("#passenger_id_no_5").val("${passenger.card}");
				    			$("#phone_no_5").val("${passenger.tel}");
				    			
				    		}
						</c:forEach>
				      	  }
				      }
				    
				//}
				
			})
			
	$("#submitOrder_id").click(function(){
			
		var checkboxArray=document.getElementsByName("test");
        var checkedIdArray=new Array();
        
        var seatArray=document.getElementsByName("seatType");
        var seatIdArray=new Array();
        
        for(i in checkboxArray){
           if(checkboxArray[i].checked){
            checkedIdArray.push(checkboxArray[i].value);
             }
          
        }
       
       for(i in seatArray){
       if(seatArray[i].selected){
            
            seatIdArray.push(seatArray[i].value);
            }
      }
         $("#checkedIdArray").val(checkedIdArray);
         $("#seatIdArray").val(seatIdArray);
			})
			
			
		})

	</script>
	<script type="text/javascript" src="js/book.js">
</script>
	<body id="body_id"
		class="dhtmlx_winviewport dhtmlx_winviewport dhtmlx_skin_dhx_terrace">
		<div class="header">
			<div style="z-index: 2000" class="header-bd">
				<a href="http://www.12306.cn/">
					<h1 class="logo">
						中国铁路客户服务中心-客运中心
					</h1> </a>
				<div class="login-info">
					<div class="phone-link">
						<a href="#" target="true">手机版</a>
					</div>
					<div class="menu">
						<a href="myMenu.jsp" class="menu-bd" id="js-my">我的12306<b></b>
						</a>
						<div class="menu-list">
							<b></b>
							<ul>
								<li>
									<a href="outOrder.jsp">未完成订单</a>
								</li>
								<li>
									<a href="completeOrder.jsp">已完成订单(改/退)</a>
								</li>
								<li class="line"></li>
								<li>
									<a href="https://exservice.12306.cn/excater/queryMyOrder.html"
										target="_blank">我的餐饮</a>
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
					<span class="login-txt" style="color: #666666;"><span>意见反馈:<a
							class="cursor colorA" href="mailto:12306yjfk@rails.com.cn">12306yjfk@rails.com.cn</a>
							您好，</span> <a id="login_user" href="myMenu.jsp" class="colorA"
						style="margin-left: -0.5px;"><span style="width: 50px;">${passenger.realName}</span>
					</a> | <a id="regist_out" href="UserServlet?method=outUser">退出</a> </span>
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
							<a href="https://exservice.12306.cn/excater/index.html"
								target="_blank">订餐服务</a>
						</li>
						<li style="width: 71px;" id="js-xd" class="nav-guide">
							<a href="javascript:">出行向导</a>
							<div class="nav-list">
								<ul style="font-weight: normal">
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
		<div class="content" style="min-height: 421px;">
			<div class="layout t-info">
				<div class="lay-hd">
					列车信息
					<span class="small">（以下余票信息仅供参考）</span>
				</div>
				<div class="lay-bd">
					<p id="ticket_tit_id" class="t-tit">
						<strong class="mr5">${trainDate}</strong>
						<strong class="ml5">${trainBook.trainNo}</strong> 次
						<strong class="ml5">${trainBook.departure}</strong> 站
						<strong>（${trainBook.startTime}开）—${trainBook.terminal}</strong>
						站（${trainBook.endTime}到）
					</p>
					<p id="ticket_con_id" class="t-con">
						<c:forEach var="seat" items="${seat}">

							<span id="ticket_status_id" class="s1"> ${seat.seatType}（
								<span class="colorA">￥${seat.price}</span> ）${seat.num }张票 </span>
						</c:forEach>
					</p>
				</div>
			</div>
			<div style="display: none;">
				<input id="fczk" style="display: none;" type="checkbox">
			</div>
			<div class="layout person">
				<div class="lay-hd">
					乘客信息
					<span id="psInfo" class="small">（填写说明）</span>
					<div class="s-box">
						<input id="quickQueryPassenger_id" class="txt" value="输入乘客姓名"
							type="text">
						<input id="submit_quickQueryPassenger" class="sub" type="submit">
					</div>
				</div>
				<div class="lay-bd">
					<div class="per-sel">
						<div class="item clearfix">
							<h2 id="dg_passenger_image_id" class="srr" title="受让人"
								style="display: none;">
								受让人
							</h2>
							<ul id="dj_passenger_id"></ul>
						</div>
						<div class="item clearfix">
							<h2 id="normal_passenger_image_id" class="cy" title="常用联系人"
								style="">
								常用联系人
							</h2>
							<ul id="normal_passenger_id">
								<c:forEach var="passengers" items="${passengers}">
									<li>
										<input id="normalPassenger_0" name="test"
											value="${passengers.id}" class="check" totaltimes="99"
											typeflag="1" type="checkbox">
										<label class="colorA" for="normalPassenger_0"
											style="cursor: pointer">
											${passengers.realName}
										</label>
									</li>
								</c:forEach>
							</ul>
							<div id="btnAll" class="btn-all" style="display: none;">
								<a id="show_more_passenger_id" title="展开" href="javascript:"
									style="" shape="rect"> <label id="gd">
										更多
									</label> <b></b> </a>
							</div>
						</div>
					</div>
					<form id="form_select" action="OrderServlet?method=inserOrder"
						method="post">
						<input type="hidden" name="checkedIdArray" value=""
							id="checkedIdArray">
						<input type="hidden" name="seatIdArray" value="" id="seatIdArray">
						<table class="per-ticket">
							<tbody>
								<tr>
									<th rowspan="1" colspan="1" width="28">
										序号
									</th>
									<th rowspan="1" colspan="1">
										席别
									</th>
									<th rowspan="1" colspan="1">
										票种
									</th>
									<th rowspan="1" colspan="1">
										姓名
									</th>
									<th rowspan="1" colspan="1">
										证件类型
									</th>
									<th rowspan="1" colspan="1">
										证件号码
									</th>
									<th rowspan="1" colspan="1">
										手机号码
									</th>
									<th rowspan="1" colspan="1" width="70"></th>
									<th rowspan="1" colspan="1" width="30"></th>
								</tr>
							</tbody>
							<tbody id="ticketInfo_id">


								<tr id="tr_id_1">
									<td align="left">
										1
									</td>
									<td>
										<select id="seatType_1" name="seatType_select"
											onclick="javascript:stepFirValidatorTicketInfo(true);">
											<c:forEach var="seat" items="${seat}">
												<option value="${seat.seatType}" name="seatType">
													${seat.seatType}（￥${seat.price}）
												</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select id="ticketType_1"
											onchange="javascript:updateSeatTypeByeTickeType(this);">
											<option value="1">
												成人票
											</option>
											<option value="2">
												儿童票
											</option>
											<option name="ticket_type_option" value="3"
												selected="selected">
												学生票
											</option>
											<option value="4">
												残军票
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_name_1" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="12"
												maxlength="20">
												<div id="passenger_name_1_notice" class="w110-focus"></div>
										</div>
									</td>
									<td>
										<select id="passenger_id_type_1" disabled="disabled"
											title="不允许变更乘车人信息" style="color: #999999">
											<option value="1" selected="selected">
												二代身份证
											</option>
											<option value="C">
												港澳通行证
											</option>
											<option value="G">
												台湾通行证
											</option>
											<option value="B">
												护照
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_id_no_1" name="passenger_id_card_1"
												class="inptxt w160"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="20"
												maxlength="35" style="border: 1px solid rgb(207, 205, 199);">
												<div id="passenger_id_no_1_notice" class="w160-focus"
													style="display: none;"></div>
										</div>
									</td>
									<td>
										<div class="pos-rel">
											<input id="phone_no_1" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												title="不允许变更乘车人信息" disabled="disabled" size="11"
												maxlength="20">
												<div id="phone_no_1_notice" class="w160-focus"></div>
										</div>
									</td>
									<td style="width: 40;">
										<a id="addchild_1" href="javascript:"
											name="addchild_normalPassenger_0"></a>
									</td>
									<td title="删除常用联系人">
										<span id="del_1_normalPassenger_0" class="i-del"
											onclick="javascript:delPassengerInfo(this);"></span>
									</td>
								</tr>


								<tr id="tr_id_1_check" class="tips" style="display: none">
									<td colspan="1">
									</td>
									<td colspan="2">
										<span id="seatType_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="2">
										<span id="passenger_name_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="1">
										<span id="passenger_id_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="3">
										<span id="phone_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
								</tr>


								<tr id="tr_id_2" style="display: none;">
									<td align="left">
										2
									</td>
									<td>
										<select id="seatType_1" name="seatType_select"
											onclick="javascript:stepFirValidatorTicketInfo(true);">
											<c:forEach var="seat" items="${seat}">
												<option value="${seat.seatType}" name="seatType">
													${seat.seatType}（￥${seat.price}）
												</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select id="ticketType_1"
											onchange="javascript:updateSeatTypeByeTickeType(this);">
											<option value="1">
												成人票
											</option>
											<option value="2">
												儿童票
											</option>
											<option name="ticket_type_option" value="3"
												selected="selected">
												学生票
											</option>
											<option value="4">
												残军票
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_name_2" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="12"
												maxlength="20">
												<div id="passenger_name_1_notice" class="w110-focus"></div>
										</div>
									</td>
									<td>
										<select id="passenger_id_type_1" disabled="disabled"
											title="不允许变更乘车人信息" style="color: #999999">
											<option value="1" selected="selected">
												二代身份证
											</option>
											<option value="C">
												港澳通行证
											</option>
											<option value="G">
												台湾通行证
											</option>
											<option value="B">
												护照
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_id_no_2" name="passenger_id_card_2"
												class="inptxt w160"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="20"
												maxlength="35" style="border: 1px solid rgb(207, 205, 199);">
												<div id="passenger_id_no_1_notice" class="w160-focus"
													style="display: none;"></div>
										</div>
									</td>
									<td>
										<div class="pos-rel">
											<input id="phone_no_2" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												title="不允许变更乘车人信息" disabled="disabled" size="11"
												maxlength="20">
												<div id="phone_no_1_notice" class="w160-focus"></div>
										</div>
									</td>
									<td style="width: 40;">
										<a id="addchild_1" href="javascript:"
											name="addchild_normalPassenger_0"></a>
									</td>
									<td title="删除常用联系人">
										<span id="del_1_normalPassenger_0" class="i-del"
											onclick="javascript:delPassengerInfo(this);"></span>
									</td>
								</tr>


								<tr id="tr_id_2_check" class="tips" style="display: none">
									<td colspan="1">
									</td>
									<td colspan="2">
										<span id="seatType_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="2">
										<span id="passenger_name_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="1">
										<span id="passenger_id_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="3">
										<span id="phone_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
								</tr>


								<tr id="tr_id_3" style="display: none;">
									<td align="left">
										3
									</td>
									<td>
										<select id="seatType_1" name="seatType_select"
											onclick="javascript:stepFirValidatorTicketInfo(true);">
											<c:forEach var="seat" items="${seat}">
												<option value="${seat.seatType}" name="seatType">
													${seat.seatType}（￥${seat.price}）
												</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select id="ticketType_1"
											onchange="javascript:updateSeatTypeByeTickeType(this);">
											<option value="1">
												成人票
											</option>
											<option value="2">
												儿童票
											</option>
											<option name="ticket_type_option" value="3"
												selected="selected">
												学生票
											</option>
											<option value="4">
												残军票
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_name_3" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="12"
												maxlength="20">
												<div id="passenger_name_1_notice" class="w110-focus"></div>
										</div>
									</td>
									<td>
										<select id="passenger_id_type_1" disabled="disabled"
											title="不允许变更乘车人信息" style="color: #999999">
											<option value="1" selected="selected">
												二代身份证
											</option>
											<option value="C">
												港澳通行证
											</option>
											<option value="G">
												台湾通行证
											</option>
											<option value="B">
												护照
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_id_no_3" name="passenger_id_card_1"
												class="inptxt w160"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="20"
												maxlength="35" style="border: 1px solid rgb(207, 205, 199);">
												<div id="passenger_id_no_1_notice" class="w160-focus"
													style="display: none;"></div>
										</div>
									</td>
									<td>
										<div class="pos-rel">
											<input id="phone_no_3" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												title="不允许变更乘车人信息" disabled="disabled" size="11"
												maxlength="20">
												<div id="phone_no_1_notice" class="w160-focus"></div>
										</div>
									</td>
									<td style="width: 40;">
										<a id="addchild_1" href="javascript:"
											name="addchild_normalPassenger_0"></a>
									</td>
									<td title="删除常用联系人">
										<span id="del_1_normalPassenger_0" class="i-del"
											onclick="javascript:delPassengerInfo(this);"></span>
									</td>
								</tr>


								<tr id="tr_id_3_check" class="tips" style="display: none">
									<td colspan="1">
									</td>
									<td colspan="2">
										<span id="seatType_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="2">
										<span id="passenger_name_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="1">
										<span id="passenger_id_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="3">
										<span id="phone_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
								</tr>


								<tr id="tr_id_4" style="display: none;">
									<td align="left">
										4
									</td>
									<td>
										<select id="seatType_1" name="seatType_select"
											onclick="javascript:stepFirValidatorTicketInfo(true);">
											<c:forEach var="seat" items="${seat}">
												<option value="${seat.seatType}" name="seatType">
													${seat.seatType}（￥${seat.price}）
												</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select id="ticketType_1"
											onchange="javascript:updateSeatTypeByeTickeType(this);">
											<option value="1">
												成人票
											</option>
											<option value="2">
												儿童票
											</option>
											<option name="ticket_type_option" value="3"
												selected="selected">
												学生票
											</option>
											<option value="4">
												残军票
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_name_4" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="12"
												maxlength="20">
												<div id="passenger_name_1_notice" class="w110-focus"></div>
										</div>
									</td>
									<td>
										<select id="passenger_id_type_1" disabled="disabled"
											title="不允许变更乘车人信息" style="color: #999999">
											<option value="1" selected="selected">
												二代身份证
											</option>
											<option value="C">
												港澳通行证
											</option>
											<option value="G">
												台湾通行证
											</option>
											<option value="B">
												护照
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_id_no_4" name="passenger_id_card_1"
												class="inptxt w160"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="20"
												maxlength="35" style="border: 1px solid rgb(207, 205, 199);">
												<div id="passenger_id_no_1_notice" class="w160-focus"
													style="display: none;"></div>
										</div>
									</td>
									<td>
										<div class="pos-rel">
											<input id="phone_no_4" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												title="不允许变更乘车人信息" disabled="disabled" size="11"
												maxlength="20">
												<div id="phone_no_1_notice" class="w160-focus"></div>
										</div>
									</td>
									<td style="width: 40;">
										<a id="addchild_1" href="javascript:"
											name="addchild_normalPassenger_0"></a>
									</td>
									<td title="删除常用联系人">
										<span id="del_1_normalPassenger_0" class="i-del"
											onclick="javascript:delPassengerInfo(this);"></span>
									</td>
								</tr>


								<tr id="tr_id_4_check" class="tips" style="display: none">
									<td colspan="1">
									</td>
									<td colspan="2">
										<span id="seatType_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="2">
										<span id="passenger_name_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="1">
										<span id="passenger_id_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="3">
										<span id="phone_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
								</tr>


								<tr id="tr_id_5" style="display: none;">
									<td align="left">
										5
									</td>
									<td>
										<select id="seatType_1" name="seatType_select"
											onclick="javascript:stepFirValidatorTicketInfo(true);">
											<c:forEach var="seat" items="${seat}">
												<option value="${seat.seatType}" name="seatType">
													${seat.seatType}（￥${seat.price}）
												</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select id="ticketType_1"
											onchange="javascript:updateSeatTypeByeTickeType(this);">
											<option value="1">
												成人票
											</option>
											<option value="2">
												儿童票
											</option>
											<option name="ticket_type_option" value="3"
												selected="selected">
												学生票
											</option>
											<option value="4">
												残军票
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_name_5" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="12"
												maxlength="20">
												<div id="passenger_name_1_notice" class="w110-focus"></div>
										</div>
									</td>
									<td>
										<select id="passenger_id_type_1" disabled="disabled"
											title="不允许变更乘车人信息" style="color: #999999">
											<option value="1" selected="selected">
												二代身份证
											</option>
											<option value="C">
												港澳通行证
											</option>
											<option value="G">
												台湾通行证
											</option>
											<option value="B">
												护照
											</option>
										</select>
									</td>
									<td>
										<div class="pos-rel">
											<input id="passenger_id_no_5" name="passenger_id_card_1"
												class="inptxt w160"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												disabled="disabled" title="不允许变更乘车人信息" size="20"
												maxlength="35" style="border: 1px solid rgb(207, 205, 199);">
												<div id="passenger_id_no_1_notice" class="w160-focus"
													style="display: none;"></div>
										</div>
									</td>
									<td>
										<div class="pos-rel">
											<input id="phone_no_5" class="inptxt w110"
												onkeyup="javascript:elemOnkeyupNotice(this);"
												title="不允许变更乘车人信息" disabled="disabled" size="11"
												maxlength="20">
												<div id="phone_no_1_notice" class="w160-focus"></div>
										</div>
									</td>
									<td style="width: 40;">
										<a id="addchild_1" href="javascript:"
											name="addchild_normalPassenger_0"></a>
									</td>
									<td title="删除常用联系人">
										<span id="del_1_normalPassenger_0" class="i-del"
											onclick="javascript:delPassengerInfo(this);"></span>
									</td>
								</tr>


								<tr id="tr_id_5_check" class="tips" style="display: none">
									<td colspan="1">
									</td>
									<td colspan="2">
										<span id="seatType_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="2">
										<span id="passenger_name_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="1">
										<span id="passenger_id_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
									<td colspan="3">
										<span id="phone_no_1_check" class="txt-wrong"
											style="display: none">请输入旅客姓名</span>
									</td>
								</tr>



							</tbody>
						</table>
						<div>
							<div class="add-per">
								<span onclick="javascript:showAddPassengerWin();">新增乘客</span>
							</div>
						</div>
						<div>
							<img src="/otn/resources/images/ins_ad2.png" alt="">
						</div>
				</div>
			</div>
			<div class="lay-btn">
				<a id="preStep_id" class="btn92" href="ticketBook.jsp" shape="rect">上一步</a>
				<input id="submitOrder_id" style="border: none" class="btn92s" value="提交订单" type="submit"
					shape="rect">
			</div>
			</form>
			<div class="tips-txt">
				<h2>
					温馨提示：
				</h2>
				<p>
					1. 一张有效身份证件同一乘车日期同一车次只能购买一张车票，高铁动卧列车除外。
				</p>
				<p>
					2.
					购票时可使用的有效身份证件包括：中华人民共和国居民身份证、港澳居民来往内地通行证、台湾居民来往大陆通行证和按规定可使用的有效护照。
				</p>
				<p>
					3.
					购买儿童票时，乘车儿童有有效身份证件的，请填写本人有效身份证件信息。乘车儿童没有有效身份证件的，应使用同行成年人的有效身份证件信息；购票时不受第一条限制，但购票后、开车前须办理换票手续方可进站乘车。
				</p>

				<p>
					5.
					购买残疾军人（伤残警察）优待票的，须在购票后、开车前办理换票手续方可进站乘车。换票时，不符合规定的减价优待条件，没有有效"中华人民共和国残疾军人证"或"中华人民共和国伤残人民警察证"的，不予换票，所购车票按规定办理退票手续。
				</p>

			</div>
		</div>
		<div class="footer">
			<p>
				<a href="http://www.12306.cn/mormhweb/gljd/gywm" target="true">关于我们</a>
				|
				<a href="http://www.12306.cn/mormhweb/gljd/wzls/" target="true">网站声明</a>
			</p>
			<p>
				版权所有 © 2008-2017 中国铁路信息技术中心 中国铁道科学研究院
			</p>
			<p>
				京ICP备15003716号-3 | 京ICP证150437号
			</p>
		</div>

	</body>

</html>