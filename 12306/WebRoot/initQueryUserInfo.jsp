<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<link href="css/suggest.css" rel="stylesheet" />
		<link href="css/queryUsersInfo.css" rel="stylesheet" />
		<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	</head>
		<script type="text/javascript" src="js/initQueryUser.js">
		
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
				&nbsp;>&nbsp;<strong>个人信息</strong>
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
					<form id="modifyUserForm" method="get" enctype="application/x-www-form-urlencoded">
						<div class="lay-hd">个人信息</div>
						<div class="lay-bd">
							<div class="infoblock">
								<div class="tit clearfix">
									<div class="tit-txt"><span class="required">*</span>
										<label>基本信息</label>
									</div>
									<div class="tit-btn" id="basic_info_edit_div">
										<a href="javascript:void(0);" class="btn92" id="basic_info_edit" shape="rect"><span class="i-editbtn"><label>编辑</label>
</span>
										</a>
									</div>
									<div class="tit-btn" id="basic_info_save_div" style="display: none;">
										<a href="javascript:void(0);" class="btn92" id="basic_info_save" shape="rect"><span class="i-savebtn"><label>保存</label>
</span>
										</a>
									</div>
								</div>
								<!--编辑-->
								<div class="base" id="basic_info_base">
									<div class="info-item"><span class="label"><span class="required">*</span> 用户名：
										</span>
										<input name="userDTO.loginUserDTO.user_name" style="display:none;" type="text" value="ccc810581139" />
										<div class="con">${username}</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 姓名：
										</span>
										<div class="con">${passenger.realName}</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 性别：
										</span>
										<div class="con"><span class="mr15"><input type="radio" class="radio" name="userDTO.sex_code" value="M" checked="checked" />
<label>男</label>
</span>
											<span><input type="radio" name="userDTO.sex_code" value="F" class="radio" />
<label>女</label>
</span>
										</div>
									</div>
									<div class="info-item"><span class="label">国家/地区：</span>
										<div class="con"><span><span>中国CHINA</span>
											</span>
											<input type="hidden" name="userDTO.country_code" value="CN" />
										</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 证件类型：
										</span>
										<div class="con">二代身份证</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 证件号码：
										</span>
										<div class="con">${passenger.card}</div>
									</div>
									<div class="info-item"><span class="label">出生日期：</span>
										<div class="con"><input type="text" readonly="readonly" value="1995-02-03" onfocus="WdatePicker({lang:'zh-cn'})" id="born_date" name="userDTO.born_date" class="inptxt w200 color333" />
										</div>
									</div>
									<div class="info-item"><span class="label">核验状态：</span>
										<div>
											<div class="con" style="color:#0077FF;">已通过</div>
										</div>
										<!-- <div  style="color:#FF7F00" th:text="${notice1}">测试</div> -->
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 登录密码：
										</span>
										<div class="con"><input type="password" value="" name="userDTO.password" maxlength="25" class="inptxt w200 color333" />
										</div>
										<div class="tips one-line">正确输入密码才能修改个人资料</div>
									</div>
								</div>
								<!--查看-->
								<div class="base-view" id="basic_info_view">
									<div class="info-item"><span class="label"><span class="required">*</span> 用户名：
										</span>
										<div class="con">${username}</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 姓名：
										</span>
										<div class="con">${passenger.realName}</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 性别：
										</span>
										<div class="con">男</div>
									</div>
									<div class="info-item"><span class="label">国家/地区：</span>
										<div class="con">中国CHINA</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 证件类型：
										</span>
										<div class="con">二代身份证</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 证件号码：
										</span>
										<div class="con">${passenger.card}</div>
									</div>
									<div class="info-item"><span class="label">出生日期：</span>
										<div class="con">1995-02-03</div>
									</div>
									<div class="info-item" style="height:60px;"><span class="label">核验状态：</span>
										<div class="con">
											<div style="color:#0077FF;">已通过</div>
										</div>
									</div>
								</div>
							</div>
							<div class="infoblock">
								<div class="tit clearfix">
									<div class="tit-txt"><span class="required">*</span>
										<label>联系方式</label>
									</div>
									<div class="tit-btn" id="relation_way_edit_div">
										<a href="#nogo" class="btn92" id="relation_way_edit" shape="rect"><span class="i-editbtn"><label>编辑</label>
</span>
										</a>
									</div>
									<div class="tit-btn" id="relation_way_save_div" style="display: none;">
										<a href="#nogo" class="btn92" id="relation_way_save" shape="rect"><span class="i-savebtn"><label>保存</label>
</span>
										</a>
									</div>
								</div>
								<!--编辑-->
								<div class="base" id="relation_way_base">
									<div class="info-item"><span class="label"><span class="required">*</span> 手机号码：
										</span>
										<div class="con">${passenger.tel}</div>
										<input type="text" name="userDTO.mobile_no" maxlength="30" style="display:none;" value="15527093197" />
										<div class="tips one-line">去
											<a href="javascript:void(0);" id="phone_binding_href" shape="rect"><span>手机核验</span>
											</a>
											修改</div>
									</div>
									<div class="info-item"><span class="label">固定电话：</span>
										<div class="con"><input type="text" maxlength="30" name="userDTO.phone_no" class="inptxt w200 color333" value="" />
										</div>
									</div>
									<div class="info-item"><span class="label">电子邮件：</span>
										<div class="con">${passenger.email}</div>
										<input type="text" name="userDTO.email" style="display:none;" value="810581139@qq.com" />
										<div class="tips one-line">去
											<a href="#nogo" id="security_email_href" shape="rect">安全邮箱</a>
											修改</div>
									</div>
									<div class="info-item"><span class="label">地址：</span>
										<div class="con"><input name="userDTO.address" type="text" value="" class="inptxt w200 color333" />
										</div>
									</div>
									<div class="info-item"><span class="label">邮编：</span>
										<div class="con"><input name="userDTO.postalcode" type="text" value="" class="inptxt w200 color333" />
										</div>
									</div>
								</div>
								<!--查看-->
								<div class="base-view" id="relation_way_view">
									<div class="info-item"><span class="label"><span class="required">*</span> 手机号码：
										</span>
										<div class="con">${passenger.tel}</div>
										<div class="tips one-line" style="left:350px;color: #0077FF;">已通过核验</div>
									</div>
									<div class="info-item"><span class="label">固定电话：</span>
										<div class="con"></div>
									</div>
									<div class="info-item"><span class="label">电子邮件：</span>
										<div class="con">${passenger.email}</div>
									</div>
									<div class="info-item"><span class="label">地址：</span>
										<div class="con" style="height:30px;max-width: 470px;overflow:hidden;"></div>
									</div>
									<div class="info-item"><span class="label">邮编：</span>
										<div class="con"></div>
									</div>
								</div>
							</div>
							<div class="infoblock">
								<div class="tit clearfix">
									<div class="tit-txt"><span class="required">*</span>
										<label>附加信息</label>
									</div>
									<div class="tit-btn" id="append_info_edit_div">
										<a href="#nogo" class="btn92" id="append_info_edit" shape="rect"><span class="i-editbtn"><label>编辑</label>
</span>
										</a>
									</div>
									<div class="tit-btn" id="append_info_save_div" style="display: none;">
										<a href="#nogo" class="btn92" id="append_info_save" shape="rect"><span class="i-savebtn"><label>保存</label>
</span>
										</a>
									</div>
								</div>
								<!--编辑-->
								<div class="base" id="append_info_base">
									<div class="info-item"><span class="label"><span class="required">*</span> 旅客类型：
										</span>
										<div class="con">
											<select name="userDTO.loginUserDTO.user_type" id="user_type_change" value="1">
												<option selected="selected" value="1">成人</option>
												<option value="2">儿童</option>
												<option value="3">学生</option>
												<option value="4">残疾军人、伤残人民警察</option>
											</select>
										</div>
									</div>
									<div id="student_id_edit" style="display:none;">
										<div class="info-item"><span class="label"><span class="required">*</span> 学校所在省份：
											</span>
											<div class="con"><input type="text" id="province_name" name="userDTO.studentInfoDTO.province_name" style="display: none;" value="" />
												<select name="userDTO.studentInfoDTO.province_code" id="province_code">
													<option value="11">北京</option>
													<option value="12">天津</option>
													<option value="13">河北</option>
													<option value="14">山西</option>
													<option value="15">内蒙古</option>
													<option value="21">辽宁</option>
													<option value="22">吉林</option>
													<option value="23">黑龙江</option>
													<option value="31">上海</option>
													<option value="32">江苏</option>
													<option value="33">浙江</option>
													<option value="34">安徽</option>
													<option value="35">福建</option>
													<option value="36">江西</option>
													<option value="37">山东</option>
													<option value="41">河南</option>
													<option value="42">湖北</option>
													<option value="43">湖南</option>
													<option value="44">广东</option>
													<option value="45">广西</option>
													<option value="46">海南</option>
													<option value="50">重庆</option>
													<option value="51">四川</option>
													<option value="52">贵州</option>
													<option value="53">云南</option>
													<option value="54">西藏</option>
													<option value="61">陕西</option>
													<option value="62">甘肃</option>
													<option value="63">青海</option>
													<option value="64">宁夏</option>
													<option value="65">新疆</option>
												</select>
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 学校名称：
											</span>
											<div class="con"><input id="schoolNameText" name="userDTO.studentInfoDTO.school_name" type="text" value="" class="inptxt w200 color333" />
												<input type="text" id="schoolCode" name="userDTO.studentInfoDTO.school_code" style="display: none;" value="" />
												<div id="schoolNameSuggest" class="ac_results"></div>
											</div>
										</div>
										<div class="info-item"><span class="label">院系：</span>
											<div class="con"><input name="userDTO.studentInfoDTO.department" type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item"><span class="label">班级：</span>
											<div class="con"><input name="userDTO.studentInfoDTO.school_class" type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 学号：
											</span>
											<div class="con"><input name="userDTO.studentInfoDTO.student_no" type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 学制：
											</span>
											<div class="con">
												<select name="userDTO.studentInfoDTO.school_system">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
												</select>
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 入学年份：
											</span>
											<div class="con">
												<select name="userDTO.studentInfoDTO.enter_year">
													<option value="2017">2017</option>
													<option value="2016">2016</option>
													<option value="2015">2015</option>
													<option value="2014">2014</option>
													<option value="2013">2013</option>
													<option value="2012">2012</option>
													<option value="2011">2011</option>
													<option value="2010">2010</option>
													<option value="2009">2009</option>
													<option value="2008">2008</option>
													<option value="2007">2007</option>
												</select>
											</div>
										</div>
										<div class="info-item"><span class="label">优惠卡号：</span>
											<div class="con"><input name="userDTO.studentInfoDTO.preference_card_no" type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 优惠区间：
											</span>
											<div class="con"><input type="text" id="preference_from_province_code_id" name="userDTO.studentInfoDTO.preference_from_province_code" style="display: none;" value="" />
												<input type="text" id="preference_to_province_code_id" name="userDTO.studentInfoDTO.preference_to_province_code" style="display: none;" value="" />
												<input name="userDTO.studentInfoDTO.preference_from_station_name" type="text" id="preference_from_station_name" value="" class="inptxt w90 color333" />
												<input type="text" id="preferenceFromStationCode" name="userDTO.studentInfoDTO.preference_from_station_code" style="display: none;" value="" />
												<div id="preferenceFromStationNameSuggest" class="ac_results"></div>
												<span class="fg-line">--</span>
												<input id="preference_to_station_name" name="userDTO.studentInfoDTO.preference_to_station_name" type="text" value="" class="inptxt w90 color333" />
												<input type="text" id="preferenceToStationCode" name="userDTO.studentInfoDTO.preference_to_station_code" style="display: none;" value="" />
												<div id="preferenceToStationNameSuggest" class="ac_results"></div>
											</div>
											<div class="tips">填写与学生证一致的优惠区间（选择车站所在城市）</div>
										</div>
									</div>
								</div>
								<!--查看-->
								<div class="base-view" id="append_info_view">
									<div class="info-item"><span class="label">旅客类型：</span>
										<div class="con">成人</div>
									</div>
									<div id="student_id_view" style="display: none;">
										<div class="info-item"><span class="label">学校所在省份：</span>
											<div class="con"></div>
										</div>
										<div class="info-item"><span class="label">学校名称：</span>
											<div class="con"></div>
										</div>
										<div class="info-item"><span class="label">院系：</span>
											<div class="con"></div>
										</div>
										<div class="info-item"><span class="label">班级：</span>
											<div class="con"></div>
										</div>
										<div class="info-item"><span class="label">学号：</span>
											<div class="con"></div>
										</div>
										<div class="info-item"><span class="label">学制：</span>
											<div class="con"></div>
										</div>
										<div class="info-item"><span class="label">入学年份：</span>
											<div class="con"></div>
										</div>
										<div class="info-item"><span class="label">优惠卡号：</span>
											<div class="con"></div>
										</div>
										<div class="info-item"><span class="label">优惠区间：</span>
											<div class="con"><span></span>
												<span class="fg-line">--</span>
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<input type="text" name="userDTO.is_active" style="display: none;" value="Y" />
						<input type="text" name="userDTO.check_code" style="display: none;" value="" />
						<input type="text" name="userDTO.revSm_code" style="display: none;" value="Y" />
						<input type="text" name="userDTO.flag" style="display: none;" value="" />
						<input type="text" name="userDTO.last_login_time" style="display: none;" value="20170824201322600" />
						<input type="text" name="userDTO.first_letter" style="display: none;" value="" />
						<input type="text" name="userDTO.user_id" style="display: none;" value="5000048499605" />
						<input type="text" name="userDTO.phone_flag" style="display: none;" value="*" />
						<input type="text" name="userDTO.encourage_flag" style="display: none;" value="*" />
						<input type="text" name="userDTO.needModifyPassword" style="display: none;" value="" />
						<input type="text" name="userDTO.needModifyEmail" style="display: none;" value="N" />
						<input type="text" name="userDTO.flag_member" style="display: none;" value="N" />
						<input type="text" name="userDTO.loginUserDTO.channel" style="display: none;" value="" />
						<input type="text" name="userDTO.loginUserDTO.agent_contact" style="display: none;" value="15527093197" />
						<input type="text" name="userDTO.loginUserDTO.user_id" style="display: none;" value="" />
						<input type="text" name="userDTO.loginUserDTO.refundLogin" style="display: none;" value="" />
						<input type="text" name="userDTO.studentInfoDTO.student_name" style="display: none;" value="" />
						<input type="text" name="userDTO.studentInfoDTO.city_name" style="display: none;" value="" />
						<input type="text" name="userDTO.studentInfoDTO.city_code" style="display: none;" value="" />
					</form>
				</div>
				<!--系统信息 结束-->
				<div class="tips-txt hide mt10">
					<h2>温馨提示：</h2>
					<P>在互联网购买学生票后，须携带购票时所使用的有效身份证件、附有“学生火车票优惠卡”的学生证（均为原件）和订单号码于列车开车前到安装有学生火车票优惠卡识别器的车站售票窗口或铁路客票代售点换取纸质车票后乘车。 </P>
				</div>
			</div>
			<!--右侧主体 结束-->
		</div>
		<div class="name-tips">
			<ul>
				<li>确认姓名中生僻字无法输入时，可用生僻字拼音或同音字替代。</li>
				<li>输入姓名保存后，遇有系统无法正确显示的汉字，可用该汉字的拼音或同音字重新修改后保存。
				</li>
				<li>姓名中有繁体字无法输入时，可用简体替代。</li>
				<li>姓名较长，汉字与英文字符合计超过30个（1个汉字算2个字符）的，需按姓名中第一个汉字或英文字符开始按顺序连续输入30个字符（空格字符不输入），其中英文字符输入时不区别大小写。</li>
				<li>姓名中有“.”或“• ”时，请仔细辨析身份证件原件上的“.”或“• ”，准确输入。</li>
			</ul>
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
		<!-- /wrap -->
		<form id="_es_hiddenform" method="post" enctype="application/x-www-form-urlencoded"><input type="hidden" name="_json_att" value="" />
		</form>
	</body>

</html>
