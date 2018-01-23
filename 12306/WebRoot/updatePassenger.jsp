<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<link href="css/showPassenger.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.11.0.js">
</script>
		<script type="text/javascript" src="js/updatePassenger.js">
</script>
		<style type="text/css" xml:space="preserve">
.emailist {
	border: 1px solid #bdbdbd;
	border-radius: 4px;
	background-color: #fff;
	color: #666;
	font-size: 14px;
	list-style-type: 0;
	padding: 0;
	margin: 0;
	overflow: hidden;
}

.emailist li {
	padding: 2px 11px;
	cursor: pointer;
}

.emailist .on,.emailist li:hover {
	background-color: #eee;
}
</style>
	</head>

	<body>
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
		<!--header end-->
		<!--页面主体  开始-->
		<div class="content clearfix">
			<!--当前位置 开始-->
			<div class="crumbs">
				您现在的位置：
				<a href="#" shape="rect">客运首页</a> &nbsp;>&nbsp;
				<a href="myMenu.jsp" shape="rect">我的12306</a> &nbsp;>&nbsp;
				<a href="queryPassengers.jsp" shape="rect">常用信息管理</a> &nbsp;>&nbsp;
				<strong>常用联系人</strong>
			</div>
			<!--当前位置 结束-->
			<!--左侧导航 开始-->
			<div class="sidebar">
				<div class="layout my">
					<div class="lay-hd">
						我的12306
					</div>
					<div class="lay-bd" id="js-my12306">
						<div class="nav-label" style="display: black">
							<span></span>
						</div>
						<dl id="sidebar_menu">
							<dt class="label-y">
								<a href="javascript:void(0);" id="link_4_myTicket">我的火车票</a>
							</dt>
							<dd class="label-y" id="dd_4_NonComOrder" url="completeOrder">
								<a href="outOrder.jsp" id="link_4_NonComOrder">未完成订单</a>
							</dd>
							<dd class="label-y" id="dd_4_comOrder"
								url="12306/completeOrder.html">
								<a href="completeOrder.jsp" id="link_4_comOrder">已完成订单</a>
							</dd>
							<dt class="label-y">
								<a href="https://exservice.12306.cn/excater/queryMyOrder.html"
									target="_blank">我的餐饮</a>
							</dt>
							<dt class="label-y" id="link_4_ticketInfo" url="insurance/init">
								<a href="javascript:void(0);">我的保险</a>
							</dt>
							<dt class="label-y">
								<a href="javascript:void(0);" id="link_4_myInfor">个人信息</a>
							</dt>
							<dd class="label-y" id="dd_4_showMyInfor"
								url="modifyUser/initQueryUserInfo">
								<a href="initQueryUserInfo.jsp" id="link_4_showMyInfor">查看个人信息</a>
							</dd>
							<dd class="label-y" id="dd_4_showSafe" url="userSecurity/init">
								<a href="security.jsp" id="link_4_showSafe">账号安全</a>
							</dd>
							<dd class="label-y" id="dd_4_sjhy" url="userSecurity/bindTel">
								<a href="securityTel.jsp" id="link_4_sjhy">手机核验</a>
							</dd>
							<dt class="label-y">
								<a href="javascript:void(0);" id="link_4_passengerInfor">常用信息管理</a>
							</dt>
							<dd class="label-y" id="dd_4_passengerIns" url="passengers/init">
								<a href="queryPassengers.jsp" id="link_4_passengerIns">常用联系人</a>
							</dd>
							<dd class="label-y" id="dd_4_address" url="address/init">
								<a href="javascript:void(0);" id="dd_4_address">车票快递地址</a>
							</dd>
							<dt class="label-y">
								<a href="javascript:void(0);">温馨服务</a>
							</dt>
							<dd class="label-y" id="dd_4_qxyy" url="icentre/qxyyInfo"
								class="last" otherUrl="icentre/qxyy">
								<a href="javascript:void(0);">重点旅客预约</a>
							</dd>
							<dd class="label-y" id="dd_4_lostitems" url="icentre/lostInfo"
								otherUrl="icentre/lostItems">
								<a href="javascript:void(0);">遗失物品查找</a>
							</dd>
							<dd class="label-y" id="dd_4_serviceQuery"
								url="icentre/serviceQuery">
								<a href="javascript:void(0);">服务查询</a>
							</dd>
							<dt class="label-y">
								<a href="javascript:void(0);">投诉和建议</a>
							</dt>
							<dd class="label-y" id="dd_4_complaint"
								url="advice/complaintInfo" otherUrl="advice/complaint">
								<a href="javascript:void(0);">投诉</a>
							</dd>
							<dd class="label-y" id="dd_4_advice" url="advice/adviceInfo"
								otherUrl="advice/advice">
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
				<form id="_editForm" method="post"
					action="PassengerServlet?method=updPassenger">
					<div class="layout order">
						<div class="lay-hd">
							编辑常用联系人
						</div>
						<div class="lay-bd">
							<div class="infoblock linkman">
								<div class="tit clearfix">
									<div class="tit-txt">
										基本信息
										<span class="tips-red">（*为必填项）</span>
									</div>
								</div>
								<!--编辑-->
								<div class="base">
									<div class="info-item">
										<span class="label"><span class="required">*</span> 姓
											名：</span>
										<div class="con">
											<span>${oldpassenger.realName}</span>
											<input name="passenger_name" id="name" type="hidden"
												maxlength="30" value="${oldpassenger.realName}" />
										</div>
										<input name="old_passenger_name" id="oldName" type="hidden"
											maxlength="30" value="蔡国平" />
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span> 性别：
										</span>
										<div class="con">
											<span class="mr15"><input name="sex_code" id="man"
													value="M" type="radio" class="radio" checked="checked" />
												<label for="man">
													男
												</label> </span>
											<span><input id="female" value="F" name="sex_code"
													type="radio" class="radio" /> <label for="female">
													女
												</label> </span>
										</div>
									</div>
									<div class="info-item">
										<span class="label">国家/地区：</span>
										<div class="con">
											<span><span>中国CHINA</span> </span>
											<input type="hidden" name="country_code" id="nation"
												value="CN" />
										</div>
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span>
											证件类型： </span>
										<div class="con">
											<span>二代身份证</span>
											<input type="hidden" name="passenger_id_type_code"
												id="cardType" value="1" />
										</div>
										<input type="hidden" name="old_passenger_id_type_code"
											id="oldCardType" value="1" />
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span>
											证件号码： </span>
										<div class="con">
											<span>${oldpassenger.card}</span>
											<input type="hidden" name="passenger_id_no" id="cardCode"
												value="${oldpassenger.card}" />
										</div>
										<input type="hidden" name="old_passenger_id_no"
											id="oldCardCode" value="422201196104103456" />
									</div>
									<div class="info-item">
										<span class="label">添加日期：</span>
										<div class="con">
											<span>2017-02-08</span>
											<input name="born_date" id="bornDate" type="hidden"
												value="2017-02-08" />
										</div>
									</div>
									<div class="info-item">
										<span class="label">核验状态：</span>
										<div class="con">
											<span style="color: #0077FF;">已通过</span>
											<span style="color: #FF7F00"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="infoblock linkman">
								<div class="tit clearfix">
									<div class="tit-txt">
										联系方式
									</div>
								</div>
								<!--编辑-->
								<div class="base">
									<div class="info-item">
										<span class="label">手机号码：</span>
										<div class="con">
											<input maxlength="11" name="mobile_no" id="mobileNo"
												type="text" value="" class="inptxt w200 color333" />
											<div id="mobile_no_div" class="inp-focus tel"
												style="display: none"></div>

										</div>
										<label for="mobile_no" class="error" id="tel"
											style="display: none; margin-left: 270px;">
											请输入有效的手机号！
										</label>
									</div>
									<div class="info-item">
										<span class="label">固定电话：</span>
										<div class="con">
											<input name="phone_no" id="phoneNo" maxlength="30"
												type="text" value="" class="inptxt w200 color333" />
										</div>
									</div>
									<div class="info-item">
										<span class="label">电子邮件：</span>
										<div class="con">
											<input name="email" id="email" type="text" value=""
												class="inptxt w200 color333  inp-transform"
												autocomplete="off" />
										</div>
										<label for="_email" class="error" id="em"
											style="display: none; margin-left: 270px;">
											请输入有效的电子邮件地址！
										</label>
									</div>
									<div class="info-item">
										<span class="label">地址：</span>
										<div class="con">
											<input name="address" id="address" type="text" value=""
												class="inptxt w200 color333" />
										</div>
									</div>
									<div class="info-item">
										<span class="label">邮编：</span>
										<div class="con">
											<input name="postalcode" id="zipCode" maxlength="30"
												type="text" value="" class="inptxt w200 color333" />
										</div>
									</div>
								</div>
							</div>
							<div class="infoblock linkman">
								<div class="tit clearfix">
									<div class="tit-txt">
										附加信息
									</div>
								</div>
								<!--编辑-->
								<div class="base">
									<div class="info-item">
										<span class="label"><span class="required">*</span>
											旅客类型： </span>
										<div class="con">
											<select name="passenger_type" id="passengerType">
												<option value="1" selected="selected">
													成人
												</option>
												<option value="2">
													儿童
												</option>
												<option value="3">
													学生
												</option>
												<option value="4">
													残疾军人、伤残人民警察
												</option>
											</select>
										</div>
									</div>
									<div id="_stu_infor" style="display: none;">
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												学校所在省份： </span>
											<div class="con">
												<select id="province_code"
													name="studentInfoDTO.province_code">
													<option value="11">
														<span>北京</span>
													</option>
													<option value="12">
														<span>天津</span>
													</option>
													<option value="13">
														<span>河北</span>
													</option>
													<option value="14">
														<span>山西</span>
													</option>
													<option value="15">
														<span>内蒙古</span>
													</option>
													<option value="21">
														<span>辽宁</span>
													</option>
													<option value="22">
														<span>吉林</span>
													</option>
													<option value="23">
														<span>黑龙江</span>
													</option>
													<option value="31">
														<span>上海</span>
													</option>
													<option value="32">
														<span>江苏</span>
													</option>
													<option value="33">
														<span>浙江</span>
													</option>
													<option value="34">
														<span>安徽</span>
													</option>
													<option value="35">
														<span>福建</span>
													</option>
													<option value="36">
														<span>江西</span>
													</option>
													<option value="37">
														<span>山东</span>
													</option>
													<option value="41">
														<span>河南</span>
													</option>
													<option value="42">
														<span>湖北</span>
													</option>
													<option value="43">
														<span>湖南</span>
													</option>
													<option value="44">
														<span>广东</span>
													</option>
													<option value="45">
														<span>广西</span>
													</option>
													<option value="46">
														<span>海南</span>
													</option>
													<option value="50">
														<span>重庆</span>
													</option>
													<option value="51">
														<span>四川</span>
													</option>
													<option value="52">
														<span>贵州</span>
													</option>
													<option value="53">
														<span>云南</span>
													</option>
													<option value="54">
														<span>西藏</span>
													</option>
													<option value="61">
														<span>陕西</span>
													</option>
													<option value="62">
														<span>甘肃</span>
													</option>
													<option value="63">
														<span>青海</span>
													</option>
													<option value="64">
														<span>宁夏</span>
													</option>
													<option value="65">
														<span>新疆</span>
													</option>
												</select>
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												学校名称： </span>
											<div class="con">
												<input id="schoolNameText" name="studentInfoDTO.school_name"
													type="text" value="" class="inptxt w200 color333" />
												<div id="schoolNameSuggest" class="ac_results_school"></div>
												<input name="studentInfoDTO.school_code" id="schoolCode"
													type="hidden" value="" />
											</div>
										</div>
										<div class="info-item">
											<span class="label">院系：</span>
											<div class="con">
												<input id="department" name="studentInfoDTO.department"
													type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item">
											<span class="label">班级：</span>
											<div class="con">
												<input id="school_class" name="studentInfoDTO.school_class"
													type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												学号： </span>
											<div class="con">
												<input id="student_no" name="studentInfoDTO.student_no"
													maxlength="30" type="text" value=""
													class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												学制： </span>
											<div class="con">
												<select name="studentInfoDTO.school_system"
													id="school_system">
													<option value="1">
														<span>1</span>
													</option>
													<option value="2">
														<span>2</span>
													</option>
													<option value="3">
														<span>3</span>
													</option>
													<option value="4">
														<span>4</span>
													</option>
													<option value="5">
														<span>5</span>
													</option>
													<option value="6">
														<span>6</span>
													</option>
													<option value="7">
														<span>7</span>
													</option>
													<option value="8">
														<span>8</span>
													</option>
													<option value="9">
														<span>9</span>
													</option>
												</select>
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												入学年份： </span>
											<div class="con">
												<select id="enter_year" name="studentInfoDTO.enter_year">
													<option value="2017">
														<span>2017</span>
													</option>
													<option value="2016">
														<span>2016</span>
													</option>
													<option value="2015">
														<span>2015</span>
													</option>
													<option value="2014">
														<span>2014</span>
													</option>
													<option value="2013">
														<span>2013</span>
													</option>
													<option value="2012">
														<span>2012</span>
													</option>
													<option value="2011">
														<span>2011</span>
													</option>
													<option value="2010">
														<span>2010</span>
													</option>
													<option value="2009">
														<span>2009</span>
													</option>
													<option value="2008">
														<span>2008</span>
													</option>
												</select>
											</div>
										</div>
										<div class="info-item">
											<span class="label">优惠卡号：</span>
											<div class="con">
												<input id="preference_card_no"
													name="studentInfoDTO.preference_card_no" type="text"
													value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												优惠区间： </span>
											<div class="con">
												<input id="preference_from_station_name"
													name="studentInfoDTO.preference_from_station_name"
													type="text" value="" class="inptxt w90 color333" />
												<input name="studentInfoDTO.preference_from_station_code"
													id="preferenceFromStationCode" type="hidden" value="" />
												<div id="preferenceFromStationNameSuggest"
													class="ac_results"></div>
												<span class="fg-line">--</span>
												<input id="preference_to_station_name"
													name="studentInfoDTO.preference_to_station_name"
													type="text" value="" class="inptxt w90 color333" />
												<div id="preferenceToStationNameSuggest" class="ac_results"></div>
												<input name="studentInfoDTO.preference_to_station_code"
													id="preferenceToStationCode" type="hidden" value="" />
												<span class="fg-line"></span>
											</div>
											<div class="tips">
												填写与学生证一致的优惠区间（选择车站所在城市）
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lay-btn line-top">
								<input value="取消" style="border: none" type="reset" class="btn92" shape="rect">
								<input value="保存" style="border: none" type="submit" class="btn92s" shape="rect">
							</div>
						</div>
					</div>
				</form>
				<!--系统信息 结束-->
				<div class="tips-txt hide mt10">
					<h2>
						温馨提示：
					</h2>
					<P>
						在互联网购买学生票后，须携带购票时所使用的有效身份证件、附有“学生火车票优惠卡”的学生证（均为原件）和订单号码于列车开车前到安装有学生火车票优惠卡识别器的车站售票窗口或铁路客票代售点换取纸质车票后乘车。
					</P>
				</div>
			</div>
			<!--右侧主体 结束-->
		</div>
		<div class="name-tips">
			<ul>
				<li>
					确认姓名中生僻字无法输入时，可用生僻字拼音或同音字替代。
				</li>
				<li>
					输入姓名保存后，遇有系统无法正确显示的汉字，可用该汉字的拼音或同音字重新修改后保存。
				</li>
				<li>
					姓名中有繁体字无法输入时，可用简体替代。
				</li>
				<li>
					姓名较长，汉字与英文字符合计超过30个（1个汉字算2个字符）的，需按姓名中第一个汉字或英文字符开始按顺序连续输入30个字符（空格字符不输入），其中英文字符输入时不区别大小写。
				</li>
				<li>
					姓名中有“.”或“• ”时，请仔细辨析身份证件原件上的“.”或“• ”，准确输入。
				</li>
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
			<p>
				版权所有 © 2008-2017 中国铁路信息技术中心 中国铁道科学研究院
			</p>
			<p>
				京ICP备15003716号-3&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证150437号
			</p>
		</div>
		<!--页面底部  结束-->
	</body>

</html>