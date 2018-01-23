<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="css/validation.css" rel="stylesheet" />
		<link href="css/ticketBook.css" rel="stylesheet" />
		<title>车票预订 | 客运服务 | 铁路客户服务中心</title>
		<!-- 双日历 -->
		<link href="css/WdatePicker.css" rel="stylesheet" />
		<link href="css/queryTicket.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	</head>
	<style>
		.Wdate {
			border: #999 1px solid;
			height: 20px;
			background: #fff url(datePicker.gif) no-repeat right;
		}
		
		.WdateFmtErr {}
	</style>
	<script type="text/javascript" src="js/ticketBook.js">
		
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
		<div id="dialog_smoker" style="display: none;">
			<div class="mark"></div>
			<div class="up-box w600">
				<div class="up-box-hd">温馨提示
					<a href="javascript:" id="dialog_smoker_close" shape="rect">关闭</a>
				</div>
				<div class="up-box-bd">
					<div class="up-con clearfix"><span class="icon i-opt"></span>
						<div class="r-txt">
							<div class="tit" id="dialog_smoker_msg"></div>
						</div>
					</div>
					<div class="lay-btn">
						<a href="javascript:" id="dialog_smoker_cancel" class="btn92" shape="rect">取消</a>
						<a href="javascript:" id="dialog_smoker_ok" class="btn92s" shape="rect">确定</a>
					</div>
				</div>
			</div>
		</div>
		<!--header end-->
		<div id="608_complain" style="display: none;">
			<div class="mark"></div>
			<div class="up-box" style="width:640px;">
				<div class="up-box-hd">举报告知确认书
					<a href="javascript:" id="608_complain_close" shape="rect">关闭</a>
				</div>
				<div class="up-box-bd" style="padding:15px 10px;border:1px solid #298CCE;">
					<table class="per-ticket" style="margin-left:0px;">
						<tr>
							<td rowspan="1" colspan="1">举报人姓名：<strong id="608_name" style="font-size:20px"></strong>
							</td>
							<td rowspan="1" colspan="1">联系电话：<strong id="608_tel" style="font-size:20px"></strong>
							</td>
						</tr>
						<tr>
							<td colspan="2" rowspan="1">身份证件号码：<strong id="608_card" style="font-size:20px"></strong>
							</td>
						</tr>
						<tr></tr>
						<tr>
							<td colspan="2" rowspan="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本人确认举报身份信息被他人冒用购买<strong id="ticketInfo" style="font-size:20px"></strong> 次车票。本人承诺本次举报及购票所提交的身份信息属实，并对虚假举报后果负责。
							</td>
						</tr>
						<tr>
							<td colspan="2" rowspan="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;铁路部门郑重提醒，将在车站和列车对该车票进行重点查验。根据国务院颁布的《铁路安全管理条例》，对该车票所记载身份信息与所持身份证件或者真实身份不符的持票人，铁路部门将拒绝其进站乘车。同时，公安机关将依法调查。</td>
						</tr>
						<tr>
							<td colspan="2" rowspan="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;铁路部门将对您的举报信息保密，谢谢您的合作！</td>
						</tr>
					</table>
					<div class="lay-btn">
						<a href="javascript:" id="608_complain_cancel" class="btn92" shape="rect">取消</a>
						<a href="javascript:" id="608_complain_ok" class="btn92s" shape="rect">确认举报</a>
					</div>
				</div>
			</div>
		</div>
		<div id="608_check" style="display: none;">
			<div class="mark"></div>
			<div class="up-box">
				<div class="up-box-hd">温馨提示
					<a href="javascript:" id="608_check_close" shape="rect">关闭</a>
				</div>
				<div class="up-box-bd">
					<div class="up-con clearfix"><span class="icon i-opt"></span>
						<div class="r-txt">
							<div class="tit" id="608_check_msg"></div>
							<div class="tit" style="color:#FB7403">是否举报？</div>
						</div>
					</div>
					<div class="lay-btn">
						<a href="javascript:" id="608_check_cancel" class="btn92" shape="rect">取消</a>
						<a href="javascript:" id="608_check_ok" class="btn92s" shape="rect">网上举报</a>
					</div>
				</div>
			</div>
		</div>
		<!--页面主体  开始-->
		<div class="content">
			<div style="display: none">
				<audio preload="auto" loop="true" src="/otn/resources/js/framework/audio/message.wav"></audio>
			</div>
			<div id="jplayerId" style="display: none"></div>
			<!--步骤 开始-->
			<!--公告 开始-->
			<div class="notice" id="scroll" style="display: none;"><strong style="width: 60px;">温馨提示：</strong>
				<div class="notice_in">
					<ul style="cursor:pointer">
						<li style="color:#FB7403">列车运行图调整，12月30日之后车票预售期调整为30天，12月29日及之前的车票正常发售。</li>
					</ul>
				</div>
				<a href="#nogo" class="i-close" shape="rect"></a>
			</div>
			<!--公告 结束-->
			<!--车票搜索框 开始-->
			<div class="sear-box quick-sear-box">
				<form id="queryLeftForm" method="post" action="TrainServlet?method=selectTrain">
					<div class="dfc" id="dfc">
						<ul>
							<li><input name="singleRoundType" type="radio" id="dc" class="radio" checked="checked" value="dc" />
								<label for="dc" id="dc_label" class="cursor">单程</label>
							</li>
							<li><input name="singleRoundType" type="radio" id="wf" class="radio" value="wc" />
								<label for="wf" id="wf_label" class="cursor">往返</label>
							</li>
						</ul>
					</div>
					<div class="s-info" id="place_area">
						<ul>
							<li><span class="label"><label id="fromStationText_label">出发地</label></span>
								<div class="inp-w">
									<input style="width: 122px; height: 28px;" type="text" value="" size="15" id="homecity_name" name="homecity_name" mod="address|notice" mod_address_source="hotel" mod_address_suggest="@Beijing|北京|53@Shanghai|上海|321@Shenzhen|深圳|91@Guangzhou|广州|80@Qingdao|青岛|292@Chengdu|成都|324@Hangzhou|杭州|383@Wuhan|武汉|192@Tianjin|天津|343@Dalian|大连|248@Xiamen|厦门|61@Chongqing|重庆|394@" mod_address_reference="cityid" mod_notice_tip="中文/拼音" />
									<input id="cityid" name="cityid" type="hidden" value="{$cityid}" />
									<span class="i-city" id="fromStation_icon_image"></span>
								</div>
							</li>
							<li class="i-change i-change2" id="change_station" style="background-position:-67px -96px"></li>
							<li><span class="label"><label id="toStationText_label"> 目的地</label></span>
								<div class="inp-w">
									<input style="width: 122px; height: 28px;" type="text" value="" size="15" id="getcity_name" name="getcity_name" mod="address|notice" mod_address_source="hotel" mod_address_suggest="@Beijing|北京|53@Shanghai|上海|321@Shenzhen|深圳|91@Guangzhou|广州|80@Qingdao|青岛|292@Chengdu|成都|324@Hangzhou|杭州|383@Wuhan|武汉|192@Tianjin|天津|343@Dalian|大连|248@Xiamen|厦门|61@Chongqing|重庆|394@" mod_address_reference="getcityid" mod_notice_tip="中文/拼音" />
									<input id="getcityid" name="getcityid" type="hidden" value="{$getcityid}" />
									<span class="i-city" id="fromStation_icon_image"></span>
								</div>
								<div id="jsContainer" class="jsContainer" style="height:0">
									<div id="tuna_alert" style="display:none;position:absolute;z-index:999;overflow:hidden;"></div>
									<div id="tuna_jmpinfo" style="visibility:hidden;position:absolute;z-index:120;"></div>
									<span class="i-city" id="fromStation_icon_image"></span>
								</div>
							</li>
							<li><span class="label"> 出发日</span>
								<div class="inp-w" style="z-index:1200"><input type="text" class="inp-txt" name="leftTicketDTO.train_date" id="train_date" value="2017-09-18 " onfocus="WdatePicker({lang:'zh-cn'})" readonly="readonly" />
									<!--	<div id="train_date_" style="position: absolute; height: 250px;z-index:1200;left:0; top:30px;"></div>-->
									<span id="date_icon_1" class="i-date"></span>
								</div>
								
							</li>
							<li><span class="label"> 返程日</span>
								<div class="inp-w" id="back_div" style="z-index:1100"><input type="text" class="inp-txt" name="back_train_date" id="back_train_date" value="2017-09-18" onfocus="WdatePicker({lang:'zh-cn'})" readonly="readonly" />
									<!--	<div id="back_train_date_" style="position: absolute; height: 250px;z-index:1100;left:0; top:30px;"></div>-->
									<span id="date_icon_2" class="i-date"></span>
								</div>
								
							</li>
						</ul>
					</div>
					<div class="quick-s">
						<ul>
							<li><input type="radio" id="sf1" class="radio" name="sf" checked="checked" />
								<label id="sf1_label" for="sf1" class="cursor">普通</label>
							</li>
							<li><input type="radio" id="sf2" class="radio" name="sf" />
								<label id="sf2_label" for="sf2" class="cursor">学生</label>
							</li>
						</ul>
						<div class="btn-area">
							<input value="查询" type="submit" id="query_ticket" class="btn92s btn-disabled" shape="rect" style="background: #FF8000; border: none;">
							<div><input id="auto_query" type="checkbox" class="check" style="margin-right:0px;" />
								<label id="autoQueryTxt">开启自动查询</label>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!--车票搜索框 开始-->
			<div class="sear-sel" id="sear-sel">

				<div id="date_range" class="sear-sel-hd clearfix">
					<ul>
						<li class="sel">
						<span>09-18</span>
						<span class="hide">09-18</span>
						</li>
						<li><span>09-19</span>
							<span class="hide">09-19</span>
						</li>
						<li><span>09-20</span>
							<span class="hide">09-20</span>
						</li>
						<li><span>09-21</span>
							<span class="hide">09-21</span>
						</li>
						<li><span>09-22</span>
							<span class="hide">09-22</span>
						</li>
						<li><span>09-23</span>
							<span class="hide">09-23</span>
						</li>
						<li><span>09-24</span>
							<span class="hide">09-24</span>
						</li>
						<li><span>09-25</span>
							<span class="hide">09-25</span>
						</li>
						<li><span>09-26</span>
							<span class="hide">09-26</span>
						</li>
						<li><span>09-27</span>
							<span class="hide">09-27</span>
						</li>
						<li><span>09-28</span>
							<span class="hide">09-28</span>
						</li>
						<li><span>09-29</span>
							<span class="hide">09-29</span>
						</li>
						<li><span>09-30</span>
							<span class="hide">09-30</span>
						</li>
						<li><span>10-01</span>
							<span class="hide">10-01</span>
						</li>
						<li><span>10-02</span>
							<span class="hide">10-02</span>
						</li>
						<li><span>10-03</span>
							<span class="hide">10-03</span>
						</li>
						<li><span>10-04</span>
							<span class="hide">10-04</span>
						</li>
						<li><span>10-05</span>
							<span class="hide">10-05</span>
						</li>
						<li><span>10-06</span>
							<span class="hide">10-06</span>
						</li>
					</ul>
					<div class="clear"></div>
				</div>
				<div class="sear-sel-bd quick-buy-sel quick-buy-open" id="sear-sel-bd" style="height: 17px">
					<!--展开式高度设置为204px，合拢时为72px-->
					<div class="pos-top" style="margin-right:20px;">发车时间：
						<select class="select-small" id="cc_start_time">
							<option value="00002400">00:00--24:00</option>
							<option value="00000600">00:00--06:00</option>
							<option value="06001200">06:00--12:00</option>
							<option value="12001800">12:00--18:00</option>
							<option value="18002400">18:00--24:00</option>
						</select>
					</div>
					<div class="section clearfix">
						<div class="section-hd">车次类型：</div>
						<div class="section-bd" id="cc_train_type_btn_all"><span class="btn-all" id="train_type_btn_all">全部</span>
							<ul id="_ul_station_train_code">
								<li><input name="cc_type" value="G" type="checkbox" class="check" id="checkbox_JeAdI6dhO9"><label for="checkbox_JeAdI6dhO9" style="cursor: pointer;">GC-高铁/城际</label></li>
								<li><input name="cc_type" value="D" type="checkbox" class="check" id="checkbox_GxLqo6tDwc"><label for="checkbox_GxLqo6tDwc" style="cursor: pointer;">D-动车</label></li>
								<li><input name="cc_type" value="Z" type="checkbox" class="check" id="checkbox_viY6ReVWhU"><label for="checkbox_viY6ReVWhU" style="cursor: pointer;">Z-直达</label></li>
								<li><input name="cc_type" value="T" type="checkbox" class="check" id="checkbox_MpwJfDbvgN"><label for="checkbox_MpwJfDbvgN" style="cursor: pointer;">T-特快</label></li>
								<li><input name="cc_type" value="K" type="checkbox" class="check" id="checkbox_phu3sdBvW4"><label for="checkbox_phu3sdBvW4" style="cursor: pointer;">K-快速</label></li>
								<li><input name="cc_type" value="QT" type="checkbox" class="check" id="checkbox_JaoifSEqve"><label for="checkbox_JaoifSEqve" style="cursor: pointer;">其他</label></li>
							</ul>
						</div>
					</div>
					<div class="section clearfix">
						<div class="section-hd">出发车站：</div>
						<div class="section-bd" id="cc_from_station_name_all"><span class="btn-all" id="from_station_name_all">全部</span>
							<ul id="from_station_ul">
								<!-- 默认初始化页面时，该过滤条件下无复选框 -->
							</ul>
						</div>
					</div>
					<div class="section clearfix">
						<div class="section-hd">到达车站：</div>
						<div class="section-bd" id="cc_to_station_name_all">
							<span class="btn-all" id="to_station_name_all">全部</span>
							<ul id="to_station_ul">
								<!-- 默认初始化页面时，该过滤条件下无复选框 -->
							</ul>
						</div>
					</div>
					<div class="section clearfix">
						<div class="section-hd">到达车站：</div>
						<div class="section-bd" id="cc_to_station_name_all"><span class="btn-all" id="to_station_name_all">全部</span>
							<ul id="to_station_ul">
								<!-- 默认初始化页面时，该过滤条件下无复选框 -->
							</ul>
						</div>
					</div>
					<div class="section pt2 clearfix">
						<div class="section-hd" id="memb">乘车人：</div>
						<div class="section-bd pt2" id="setion_postion" style="width:688px;"><span class="wrap-left"><a href="javascript:" class="btn-small" onclick="$.showSelectBuyer()" shape="rect">请选择</a></span>
						</div>
						<span style="color:red;width:auto;">您可点击“成人乘车人”添加儿童票。</span>
					</div>
					<div class="section clearfix">
						<div class="section-hd" id="train_first">优先车次：</div>
						<div class="section-bd pt2" id="prior_train"><span id="showYxTrainSpan" class="wrap-left"><a href="javascript:" class="btn-small" onclick="$.showYxTrain()" shape="rect">请选择</a></span>
							<span style="display: none;" name="prior_train-span" class="wrap-left add-cc"><input type="text" maxlength="5" class="inp-small" id="inp-train" style="text-transform:uppercase" value="  请输入" onkeypress="$.checkTrain(event,this)" />
								<a href="javascript:" class="btn-add" id="add-train" shape="rect"></a>
							</span>
						</div>
					</div>
					<div class="section clearfix">
						<div class="section-hd" id="seat_first">优先席别：</div>
						<div class="section-bd pt2" id="prior_seat"><span class="wrap-left"><a href="javascript:" class="btn-small" onclick="$.showSelectSeat()" shape="rect">请选择</a></span>
						</div>
					</div>
					<div class="section pt2 clearfix">
						<div class="section-hd" id="select_date">备选日期：</div>
						<div class="section-bd pt2" id="prior_date"><span class="wrap-left"><a href="javascript:" class="btn-small" id="train_date" onclick="$.showSelectDate()" shape="rect">请选择</a></span>
						</div>
					</div>
					<div class="section pt2 clearfix">
						<div class="section-hd" id="ad_setting">高级设置：</div>
						<div class="section-bd pt2">
							<span class="mr17">
								<select id="_prior" class="select-small" style="width:75px;margin-right:10px">
									<option value="1">席别优先</option>
									<option value="2">车次优先</option>
								</select>
							</span>
							<span class="mr17"><input type="checkbox" class="check" id="autoSubmit" />
								<label for="autoSubmit" id="autoSubmitTxt">自动提交</label>
							</span>
							<span class="mr17"><input type="checkbox" class="check" id="partSubmit" />
								<label for="partSubmit" id="partSubmitTxt">余票不足时部分提交</label>
							</span>
							<a href="javascript:" class="btn-small mr5" id="tryPlayer" shape="rect">试听提示音乐</a>
							<a href="javascript:" id="clearAll" class="btn-small" shape="rect">清空所有选项</a>
						</div>
					</div>
					<div class="section cc-pos" style="display:none">
						<div class="section-hd">车次：</div>
						<div class="section-bd" id="train_combo_box_div"><span class="inptxt w90" id="train_combo_box" style="float: left;"></span>
						</div>
					</div>
				</div>
				<div class="quick-gif" style="top:58px">
					<a href="javascript:" id="show_more" class="down" shape="rect">订票帮手</a>
				</div>
				<!--箭头方向修改<a href="#nogo" class="up"></a>-->
			</div>
			<!--车票搜索框 结束-->

			<div id="sear-result" class="sear-result" style="display: block;">
				<span class="fr">
				<input id="avail_ticket" class="check" type="checkbox">
				<label for="avail_ticket" style="cursor: pointer;">显示全部可预订车次 </label>
				</span>
				<p>
					<strong>${train.departure} --> ${train.terminal}</strong> 共计
					<strong id="trainum">${fn:length(trains)}</strong> 个车次
				</p>
			</div>
			<div class="t-list" id="t-list">
				<table>
					<thead>
						<tr class="th" id="float">
							<th width="90" colspan="1" rowspan="1">车次</th>
							<th width="100" colspan="1" rowspan="1">出发站<br clear="none" /> 到达站
							</th>
							<th id="startendtime" colspan="1" rowspan="1" width="82">
								<span id="s_time" class="b1" style="cursor: pointer;">出发时间</span>
								<br>
								<span id="r_time" class="b2" style="cursor: pointer;">到达时间</span>
							</th>
							<th width="82" colspan="1" rowspan="1"><span class="b3" id="l_s">历时</span>
							</th>
							<th width="49" colspan="1" rowspan="1">商务座<br clear="none" /> 特等座
							</th>
							<!-- <th width="49"  colspan="1" rowspan="1">特等座</th> -->
							<th width="49" colspan="1" rowspan="1">一等座</th>
							<th width="49" colspan="1" rowspan="1">二等座</th>
							<th width="49" colspan="1" rowspan="1">高级<br clear="none" /> 软卧
							</th>
							<th width="49" colspan="1" rowspan="1">软卧</th>
							<th width="49" colspan="1" rowspan="1">动卧</th>
							<th width="49" colspan="1" rowspan="1">硬卧</th>
							<th width="49" colspan="1" rowspan="1">软座</th>
							<th width="49" colspan="1" rowspan="1">硬座</th>
							<th width="49" colspan="1" rowspan="1">无座</th>
							<th width="49" colspan="1" rowspan="1">其他</th>
							<th class="last" colspan="1" rowspan="1">备注</th>
						</tr>
					</thead>
					<tbody id="queryLeftTable">
					<c:forEach var="trains" items="${trains}">
						<tr id="ticket_6500000Z1401" class="bgc">
							<td colspan="4" width="370">
								<div id="train_num_0" class="ticket-info clearfix">
									<div id="ticket_6500000Z1401_train" class="train">
										<div>
											<a id="6500000Z1401_WCN_QTP" class="number" title="点击查看停靠站信息" href="javascript:" onclick="myStopStation.open('0','6500000Z1401','WCN','QTP','20170826','3');">${trains.trainNo}</a>
										</div>
										<span id="6500000Z1401_05_11_Hi62A5S1VrYEBuviepnREjKiyswF1i8eDqcNY1L1gKkurbP8iFnlLNZzw0w%3D_1413" class="lookup" onclick="showTicketPrice(this)">
<span style="display:none;">查看票价</span>
										<b title="查看票价"></b>
										</span>
									</div>
									<div class="cdz">
										<strong>${trains.departure}</strong>
										<strong>${trains.terminal}</strong>
									</div>
									<div class="cds">
										<strong class="start-t">${trains.startTime}</strong>
										<strong class="color999">${trains.endTime}</strong>
									</div>
									<div id="6500000Z1401_ls" class="ls">
										<strong>${trains.estimatedTime}</strong>
										<span>次日到达</span>
									</div>
								</div>
							</td>
							<td id="TZ_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.businesssSeat}</td>
							<td id="ZY_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.firstSeat}</td>
							<td id="ZE_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.secondSeat}</td>
							<td id="GR_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.advancedSleeper}</td>
							<td id="RW_6500000Z1401" class="t-num" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.softSleeper}</td>
							<td id="SRRB_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.sleeper}</td>
							<td id="YW_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.hardSleeper}</td>
							<td id="RZ_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.softSeat}</td>
							<td id="YZ_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.hardSeat}</td>
							<td id="WZ_6500000Z1401" class="yes" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.noSeat}</td>
							<td id="QT_6500000Z1401" style="cursor: pointer;" onclick="showTicketPrice(this)" width="46" align="center">${trains.other}</td>
							<td class="no-br" width="80" align="center">
								<a class="btn72" href="TrainServlet?method=selectTrainInfo&trainNo=${trains.trainNo}" >预订</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="t-list-bd" id="t-list-bd">
					<div class="no-ticket" id="no_filter_ticket" style="display: none"><span class="i-no"></span>
						<p>
							<!-- 没有符合筛选条件的车次，请修改筛选条件！<br />您可以<a href="#" id="show_all_query_result">显示全部</a>或<a href="/otsweb/zzzcx/init">使用中转查询功能</a>查询换乘车次。-->

							没有符合筛选条件的车次，请修改筛选条件<br clear="none" /> 或
							<a href="#" id="show_all_query_result" shape="rect">显示全部车次</a>
							！
						</p>
					</div>
					<div class="no-ticket" id="no_filter_ticket_3" style="display: none"><span class="i-no"></span>
						<p>
							没有查询到符合条件的车次，5秒后继续查询，请稍后！
						</p>
					</div>
					<div class="no-ticket" id="no_filter_ticket_4" style="display: none"><span class="i-no"></span>
						<p>
							没有符合筛选条件的车次，5秒后开始查询备选日期，请稍后！
						</p>
					</div>
				</div>
			</div>
			<div class="no-ticket" id="no_filter_ticket_2" style="display: none"><span class="i-no"></span>
				<p>
					很抱歉，按您的查询条件，当前未找到从<span id="no_filter_ticket_fromstation"></span> 到
					<span id="no_filter_ticket_tostation"></span> 的列车。您可以使用出行向导中的
					<a href="/otn/zzzcx/init" shape="rect">中转查询功能</a>
					查询换乘车次。
				</p>
			</div>
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
		<!-- 检索车站下拉框 -->
		<div id="search_div" style="z-index: 1000; position: absolute;">
			<div id="form_cities">
				<div id="top_cities">操作提示</div>
				<div id="panel_cities"></div>
				<div id="flip_cities">翻页控制区</div>
			</div>
		</div>
		<!-- 选择车站下拉框 -->
		<div id="choice_div" style="z-index: 2000; position: absolute;">
			<div id="form_cities2">
				<div id="panel_cities2"></div>
			</div>
		</div>
		<!--页面底部  结束-->
		<!-- 选择乘车人 -->
		<div id="sel-buyer" class="quick-box sel-rank" style="display:none;width: 515px;">
			<div class="quick-box-hd">
				<a onclick="$.closeSelectBuyer()" href="javascript:void(0);" shape="rect">关闭</a>
				<a onclick="$.reloadPassenger()" href="javascript:void(0);" shape="rect">刷新</a>
				<div class="inp-wrap"><input id="searchPassenger" type="text" class="inp-txt" placeholder="输入乘客姓名" />
					<a href="javascript:void(0);" id="passenger_a_close" class="del" shape="rect"></a>
				</div>

				常用联系人
			</div>
			<div class="first-train-list">
				<ul id="buyer-list"></ul>
				<div id="passenger_page" class="train-page" style="display: none;"></div>
			</div>
		</div>
		<!-- 选择乘车人结束 -->
		<!-- 选择优先席别 -->
		<div id="sel-seat" class="quick-box sel-rank" style="display:none;width: 350px;">
			<div class="quick-box-hd">
				<a onclick="$.closeSelectSeat()" href="javascript:void(0);" shape="rect">关闭</a>

				选择席别（最多选择五个优先席别）
			</div>
			<div class="first-train-list">
				<ul id="seat-list">
					<li name="商务座" scode="SWZ">商务座</li>
					<li name="特等座" scode="TZ">特等座</li>
					<li name="一等座" scode="ZY">一等座</li>
					<li name="二等座" scode="ZE">二等座</li>
					<li name="高级软卧" scode="GR">高级软卧</li>
					<li name="软卧" scode="RW">软卧</li>
					<li name="硬卧" scode="YW">硬卧</li>
					<li name="动卧" scode="SRRB">动卧</li>
					<li name="高级动卧" scode="YYRW">高级动卧</li>
					<li name="软座" scode="RZ">软座</li>
					<li name="硬座" scode="YZ">硬座</li>
					<li name="无座" scode="WZ">无座</li>
				</ul>
			</div>
		</div>
		<!-- 选择优先席别结束 -->
		<!-- 选择优先日期-->
		<div id="sel-date" class="quick-box sel-rank" style="display:none;width: 710px;">
			<div class="quick-box-hd">
				<a onclick="$.closeSelectDate()" href="javascript:void(0);" shape="rect">关闭</a>

				选择日期（最多选择5个备选日期）
			</div>
			<div class="first-train-list">
				<ul id="date-list">
					<li name="2017-08-26">2017-08-26</li>
					<li name="2017-08-27">2017-08-27</li>
					<li name="2017-08-28">2017-08-28</li>
					<li name="2017-08-29">2017-08-29</li>
					<li name="2017-08-30">2017-08-30</li>
					<li name="2017-08-31">2017-08-31</li>
					<li name="2017-09-01">2017-09-01</li>
					<li name="2017-09-02">2017-09-02</li>
					<li name="2017-09-03">2017-09-03</li>
					<li name="2017-09-04">2017-09-04</li>
					<li name="2017-09-05">2017-09-05</li>
					<li name="2017-09-06">2017-09-06</li>
					<li name="2017-09-07">2017-09-07</li>
					<li name="2017-09-08">2017-09-08</li>
					<li name="2017-09-09">2017-09-09</li>
					<li name="2017-09-10">2017-09-10</li>
					<li name="2017-09-11">2017-09-11</li>
					<li name="2017-09-12">2017-09-12</li>
					<li name="2017-09-13">2017-09-13</li>
					<li name="2017-09-14">2017-09-14</li>
					<li name="2017-09-15">2017-09-15</li>
					<li name="2017-09-16">2017-09-16</li>
					<li name="2017-09-17">2017-09-17</li>
					<li name="2017-09-18">2017-09-18</li>
					<li name="2017-09-19">2017-09-19</li>
					<li name="2017-09-20">2017-09-20</li>
					<li name="2017-09-21">2017-09-21</li>
					<li name="2017-09-22">2017-09-22</li>
					<li name="2017-09-23">2017-09-23</li>
					<li name="2017-09-24">2017-09-24</li>
				</ul>
			</div>
		</div>
		<!-- 选择优先席别结束 -->
		<!-- 快捷购票提示信息 -->
		<div class="quick-tips" id="showquick1" style="display: none;width:200px;z-index:4000;"><span style="line-height:22px; color:#666;">选中后，在点击“查询”按钮时，系统将按您设置的查询条件自动、持续查询车票。当查询到满足条件的车票时，查询将自动停止。</span>
		</div>
		<div class="quick-tips" id="showquick2" style="display: none">
			<!--<span style="line-height:22px; color:#666;">闪购高级选项。选中后，“自动提交”默认选中，当系统查询到满足闪购选项的车票但票额少于选定的乘车人时，允许系统按票额数量忽略排在后面的乘车人，自动提交订单。</span> -->
			<span style="line-height:22px; color:#666;">如果网站查询同一车次只有部分符合您设定条件的车票时，将按您设定的乘车人和席别优先顺序进行提交。</span>
		</div>
		<div class="quick-tips" id="showquick3" style="display: none;">
			<!-- <span style="line-height:22px; color:#666;">闪购高级选项。选中后，在点击“查询”按钮时系统将自动、持续查询车票，并在查询到满足闪购选项的车票时自动提交订单。</span>-->
			<span style="line-height:22px; color:#666;">勾选本选项并点击查询后，网站将自动查询符合设定条件的车票信息，如有符合条件的车次，将自动提交订单信息。</span>
		</div>
		<div class="quick-tips" id="showquick4" style="display: none"><span style="line-height:22px; color:#666;">您可以从常用联系人中选择最多5个乘车人，网站将按您设定的先后顺序自动选择。</span>
		</div>
		<div class="quick-tips" id="showquick6" style="display: none"><span style="line-height:22px; color:#666;">您可以设定最多5个席别，网站将根据您设定的席别先后顺序和同一车次的余票情况自动选择。</span>
		</div>
		<div class="quick-tips" id="showquick5" style="display: none"><span style="line-height:22px; color:#666;">您可以设定最多5个车次，网站将根据您设定的车次先后顺序和同一车次的余票情况自动选择。</span>
		</div>
		<div class="quick-tips" id="showquick8" style="display: none"><span style="line-height:22px; color:#666;">您可以在当前日期外另行设定最多5个出发日，网站将根据您设定的先后顺序和余票情况自动选择。</span>
		</div>
		<div id="getTicket" style="display: none;margin-right: 1px;margin-bottom: 1px;height: 140px">
			<div class="mark" style="height: 20px"></div>
			<div class="up-box" style="height: 140px">
				<div class="up-box-hd">恭喜您，查到有票车次了
					<a href="javascript:$jpopup.startOrHiden()" shape="rect">关闭</a>
				</div>
				<div class="up-box-bd" style="height: 140px">
					<div class="tit" id="filterRes"></div>
					<div class="lay-btn" style="margin-left: -245px">
						<a href="javascript:" class="btn92s" id="showOnlyTicA" shape="rect">仅显示选定车次</a>
						<a href="javascript:$jpopup.startOrHiden()" class="btn92" shape="rect">关闭</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 快捷购票提示信息结束 -->
		<!-- 提交订单核对车票信息弹出层 start -->
		<div id="autosubmitcheckticketinfo" style="display: none; top:600px;left:200px;">
			<div class="mark"></div>
			<div class="up-box w664" id="content_autosubmitcheckticketinfo">
				<div class="up-box-hd">
					已查到车票，请核对以下信息
				</div>
				<div class="up-box-bd ticket-check">
					<div class="info2" id="autosubmit_check_ticket_tit" style="width:550px;"></div>
					<table class="table-a">
						<tr>
							<th width="28" rowspan="1" colspan="1">序号</th>
							<th rowspan="1" colspan="1">席别</th>
							<th id="bed_show" style="display: none;" rowspan="1" colspan="1">铺别</th>
							<th rowspan="1" colspan="1">票种</th>
							<th rowspan="1" colspan="1">姓名</th>
							<th rowspan="1" colspan="1">证件类型</th>
							<th rowspan="1" colspan="1">证件号码</th>
							<th rowspan="1" colspan="1">手机号码</th>
						</tr>
						<tbody id="autosubmit_check_ticketInfo"></tbody>
					</table>
					<!-- <p style="color: #3177BF;" id="notice_1_id">

					  注：1.系统将随机为您申请席位，暂不支持自选席位。

				</p>
				
				
				<div class="seat-sel seat-sel-round" id="id-seat-sel" style="display: none;">
		            <div class="seat-sel-hd"><div class="tips-xz">选座喽</div>已选座<span id='selectNo'>1/4</span></div>
		            <div class="seat-sel-bd">
		                第一排
		                <div class="sel-item" id="yideng1"  style="display: none;">
		                	一等座
		                    <div class="txt">窗</div>
		                    <ul class="seat-list">
		                        <li><a href="javascript:" id="1A">A</a></li>
		                        <li><a href="javascript:" id="1C">C</a></li>
		                    </ul>
		                    <div class="txt">过道</div>
		                     <ul class="seat-list">
		                        <li><a href="javascript:" id="1D">D</a></li>
		                        <li><a href="javascript:" id="1F">F</a></li>
		                    </ul>
		                    <div class="txt txt-last">窗</div>
		                </div>
		                <div class="sel-item" id="erdeng1"  style="display: none;">
		               		 二等座
		                    <div class="txt">窗</div>
		                    <ul class="seat-list">
		                        <li><a href="javascript:" id="1A">A</a></li>
		                        <li><a href="javascript:" id="1B">B</a></li>
		                        <li><a href="javascript:" id="1C">C</a></li>
		                    </ul>
		                    <div class="txt">过道</div>
		                     <ul class="seat-list">
		                        <li><a href="javascript:" id="1D">D</a></li>
		                        <li><a href="javascript:" id="1F">F</a></li>
		                    </ul>
		                    <div class="txt txt-last">窗</div>
		                </div>
		                <div class="sel-item" id="tedeng1"  style="display: none;">
		                	特等座
		                    <div class="txt">窗</div>
		                    <ul class="seat-list">
		                        <li><a href="javascript:" id="1A">A</a></li>
		                        <li><a href="javascript:" id="1C">C</a></li>
		                    </ul>
		                    <div class="txt">过道</div>
		                     <ul class="seat-list">
		                        <li><a href="javascript:" id="1F">F</a></li>
		                    </ul>
		                    <div class="txt txt-last">窗</div>
		                </div>
		                
		                第二排
		                <div class="sel-item"   id="yideng2"  style="display: none;">
		                	一等座
		                    <div class="txt">窗</div>
		                    <ul class="seat-list">
		                        <li><a href="javascript:" id="2A">A</a></li>
		                        <li><a href="javascript:" id="2C">C</a></li>
		                        
		                    </ul>
		                    <div class="txt">过道</div>
		                     <ul class="seat-list">
		                        <li><a href="javascript:" id="2D">D</a></li>
		                        <li><a href="javascript:" id="2F">F</a></li>
		                    </ul>
		                    <div class="txt txt-last">窗</div>
		                </div>
		                <div class="sel-item"    id="erdeng2"  style="display: none;">
		                	二等座
		                    <div class="txt">窗</div>
		                    <ul class="seat-list">
		                        <li><a href="javascript:" id="2A">A</a></li>
		                        <li><a href="javascript:" id="2B">B</a></li>
		                        <li><a href="javascript:" id="2C">C</a></li>
		                    </ul>
		                    <div class="txt">过道</div>
		                     <ul class="seat-list">
		                        <li><a href="javascript:" id="2D">D</a></li>
		                        <li><a href="javascript:" id="2F">F</a></li>
		                    </ul>
		                    <div class="txt txt-last">窗</div>
		                </div>
		                <div class="sel-item"   id="tedeng2"  style="display: none;">
		                	特等座
		                    <div class="txt">窗</div>
		                    <ul class="seat-list">
		                        <li><a href="javascript:" id="2A">A</a></li>
		                        <li><a href="javascript:" id="2C">C</a></li>
		                    </ul>
		                    <div class="txt">过道</div>
		                     <ul class="seat-list">
		                        <li><a href="javascript:" id="2F">F</a></li>
		                    </ul>
		                    <div class="txt txt-last">窗</div>
		                </div>
		               
		            </div>
		        </div>
		        
		        
		        <div class="seat-sel seat-sel-round" id="id-bed-sel" style="display: none;">
		            <div class="seat-sel-hd">
		                <div class="tips-xz">选铺喽</div>
		               	 已选铺<span  id='selectBedNo'>1/4</span>
		            </div>
		            <div class="seat-sel-bd">
		                <div class="sel-item">
		                    <div class="bed-yw">硬卧</div>
		                    <div class="bed-item">
		                        <div class="txt">下铺</div>
		                        <div class="number-control-mini">
		                            <a href="javascript:" class="num-reduce" onclick="javascript:numSet('reduce','x_no');">-</a>
		                            <span class="num" id="x_no">1</span>
		                            <a href="javascript:" class="num-increase" onclick="javascript:numSet('add','x_no');">+</a>
		                        </div>
		                    </div>
		                    <div class="bed-item" style="display: none;" id="mid_bed">
		                        <div class="txt">中铺</div>
		                        <div class="number-control-mini">
		                            <a href="javascript:" class="num-reduce" onclick="javascript:numSet('reduce','z_no');">-</a>
		                            <span class="num"  id="z_no">0</span>
		                            <a href="javascript:" class="num-increase" onclick="javascript:numSet('add','z_no');">+</a>
		                        </div>
		                    </div>
		                    <div class="bed-item">
		                        <div class="txt">上铺</div>
		                        <div class="number-control-mini">
		                            <a href="javascript:" class="num-reduce" onclick="javascript:numSet('reduce','s_no');">-</a>
		                            <span class="num" id="s_no">0</span>
		                            <a href="javascript:" class="num-increase" onclick="javascript:numSet('add','s_no');">+</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div> -->
					<p id="sy_ticket_num_id">
						<!--  尊敬的旅客，本次列车您选择的席别尚有余票<strong>1135</strong>张，无座<strong>840</strong>张。特此提醒。<br /> 请确认信息是否正确。如正确请点击“确定”，系统将为您分配席位。-->
					</p>
					<p id="orange_msg" style="color: orange;">
						请确认以上信息是否正确，稍后系统将自动提交...
					</p>
					<div class="yzm" style="display: none;">
						<form id="randCodeForm_id" onsubmit="javascript:return false;" method="get" enctype="application/x-www-form-urlencoded">
							<ul>
								<div id="mypasscode2" data-code_type="passenger" data-touclick-type="inside"></div>
							</ul>
						</form>
					</div>
					<div class="lay-btn captchaButton passengerInfo-inside" data-touclick-name="other"></div>
					<div class="lay-btn">
						<a id="back_edit" href="javascript:" class="btn92" shape="rect">返回修改</a>
						<a style="display: none;" href="javascript:" class="btn92s" id="qr_submit1" shape="rect">确认</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 提交订单核对车票信息弹出层 end -->
		<!-- 交易提示框 start  -->
		<div id="transforNotice_id" style="display: none; margin-left: 30%; margin-top: 30%;">
			<div class="mark"></div>
			<div class="up-box" id="content_transforNotice_id">
				<div class="up-box-hd" id="up-box-hd_id">
					<!--  <a id="closeTranforDialog_id" style="display: none;" href="javascript:">关闭</a>-->

					提示

				</div>
				<div class="up-box-bd">
					<div class="up-con clearfix"><span class="icon i-work" id="iamge_status_id"></span>
						<div class="r-txt" id="orderResultInfo_id">
							<!--  信息提示 -->
						</div>
					</div>
					<div class="lay-btn" id="lay-btn_id">
						<!-- <a href="javascript:" id="qr_closeTranforDialog_id" style="display: none;" class="btn92s">确认</a> -->
					</div>
				</div>
			</div>
		</div>
		<!-- 无验证码用户未登录弹出登录层 -->
		<!-- 无验证码用户未登录弹出登录层 -->
		<!-- 用户未登录弹出登录层 -->
		<div id="relogin" style="display: none; z-index: 100px;margin: 0px auto 110px;">
			<div class="mark"></div>
			<div class="up-box up-box-login" id="content">
				<div class="up-box-hd">请登录
					<a id="relogin_close" href="javascript:" shape="rect">关闭</a>
				</div>
				<form id="loginForm" method="get" enctype="application/x-www-form-urlencoded">
					<div class="up-box-bd">
						<div class="login">
							<ul>
								<li><span class="formCont" style="float: left;"><span class="label">登录名：</span>
									<input id="username" name="loginUserDTO.user_name" type="text" class="inptxt w200" tabindex="1" />
									</span>
								</li>
								<li><span class="formCont" style="float: left;"><span class="label">密码：</span>
									<input id="password" name="userDTO.password" type="password" class="inptxt w200" tabindex="2" />
									<a href="javascript:" id="forget_my_password_id" shape="rect">忘记用户名/密码？</a>
									</span>
								</li>
								<li id="mypasscode1" data-code_type="login" data-touclick-type="inside" data-page-identity="leftTicket-login" style="display: none">
									<!--要引入的验证码标签 -->
									<script>
										var targettype = ['Z', 'Z'];
										var targetdiv = ['mypasscode1', 'mypasscode2'];
										var targetelement = ['', 'other'];
									</script>
									<script src="/otn/resources/js/newpasscode/new.js" xml:space="preserve"></script>
								</li>
								<!-- 
						//inside: class="dl  captchaButton leftTicket-login-button-inside"
						//float: class="dl  captchaButton captchaFloatButton leftTicket-login-button-float" 
						-->
								<li class="dl  captchaButton leftTicket-login-button-float" data-touclick-name="" style="margin-top:6px">
									<a href="javascript:" class="btn200s" id="loginSubAsyn" tabindex="4" shape="rect">登录</a>
								</li>
								<li class="zc">
									<a href="/otn/regist/init" class="btn200" shape="rect">快速注册</a>
								</li>
								<li class="txt" style="height:4px"></li>
								<li style="margin-top: -4px;"><span><h2 style="height: 25px;line-height: 25px;font-size: 14px;">温馨提示：</h2>
</span>
								</li>
								<li style="margin-top: -12px;line-height: 20px;color: #666666"><span>1、12306.cn网站每日06:00~23:00提供服务</span>
								</li>
								<li style="margin-top: -12px;line-height: 20px;color: #666666"><span>2、在12306.cn网站购票、改签和退票须不晚于开车前30分钟；办理“变更到站”业务时，请不晚于开车前48小时。</span>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 用户未登录弹出层 end -->
		<form id="_es_hiddenform" method="post" enctype="application/x-www-form-urlencoded"><input type="hidden" name="_json_att" value="" />
		</form>
		<div class="station" style="display:none;" id="train_stop"><b></b>
			<div class="station-info" id="stationinfo"></div>
			<div class="station-hd"><span class="zx">站序</span>
				<span class="zm">站名</span>
				<span class="dzsj">到站时间</span>
				<span class="cfsj">出发时间</span>
				<span class="tlsj">停留时间</span>
				<a class="close" title="关闭" href="##" onclick="closeTrainStop()" shape="rect"></a>
			</div>
			<div class="station-bd">
				<table>
					<tbody id="train_table"></tbody>
				</table>
			</div>
		</div>
		<div id="floatTable" class="t-list" style="display: none;width: 978px;">
			<table>
				<tr class="th">
					<th width="90" rowspan="1" colspan="1">车次</th>
					<th width="100" rowspan="1" colspan="1">
						<div class="two-line"><span>出发站</span>
							<br clear="none" />
							<span>到达站</span>
						</div>
					</th>
					<th width="82" rowspan="1" colspan="1">
						<div class="two-line" id="floatstartendtime"></div>
					</th>
					<th width="82" rowspan="1" colspan="1"><span class="b3" id="other_span_lishi">历时</span>
					</th>
					<th width="49" rowspan="1" colspan="1">商务座<br clear="none" /> 特等座
					</th>
					<!-- <th width="49">特等座</th> -->
					<th width="49" rowspan="1" colspan="1">一等座</th>
					<th width="49" rowspan="1" colspan="1">二等座</th>
					<th width="49" rowspan="1" colspan="1">高级<br clear="none" /> 软卧
					</th>
					<th width="49" rowspan="1" colspan="1">软卧</th>
					<th width="49" rowspan="1" colspan="1">动卧</th>
					<th width="49" rowspan="1" colspan="1">硬卧</th>
					<th width="49" rowspan="1" colspan="1">软座</th>
					<th width="49" rowspan="1" colspan="1">硬座</th>
					<th width="49" rowspan="1" colspan="1">无座</th>
					<th width="49" rowspan="1" colspan="1">其它</th>
					<th class="last" rowspan="1" colspan="1">备注</th>
				</tr>
			</table>
		</div>
		<div class="station" style="display:none;" id="train_div_"><b></b>
			<div class="station-info" id="train_span_"><span class="item1">T69</span>
				<span class="item2">北京南<em>--></em>
乌鲁木齐</span>
				<span class="item3">特快</span>
				<span class="item4">空调</span>
			</div>
			<div class="station-hd"><span class="zx">站序</span>
				<span class="zm">站名</span>
				<span class="dzsj">到站时间</span>
				<span class="cfsj">出发时间</span>
				<span class="tlsj">停留时间</span>
				<a class="close" title="关闭" href="javascript:" onclick="myStopStation.close()"></a>
			</div>
			<div class="station-bd">
				<table>
					<tbody id="train_table_"></tbody>
				</table>
			</div>
		</div>
		<div class="up-box w600" style="display: none;" id="confirmG1234">
			<div class="up-box-hd">继续预定
				<a id="close_conifrmdialog_G1234" href="javascript:" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit">您购买的G1234次列车需在到达“天津西”站后换乘，车厢号、席位号不变，是否继续购票？</div>
					</div>
				</div>
				<div class="lay-btn">
					<a id="cancel_dialog_G1234" href="javascript:" class="btn92" shape="rect">取消</a>
					<a href="javascript:" class="btn92s" id="goto_integration_G1234" shape="rect">继续</a>
				</div>
			</div>
		</div>
		<div class="up-box" id="notifysession" style="display: none;">
			<div class="up-box-hd">温馨提示
				<a href="#nogo" id="close_notifysession" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-win"></span>
					<div class="r-txt">
						<div class="tit">本次登录成功！该用户已在其他地点登录，前次登录将被强制退出！</div>
					</div>
				</div>
				<div class="lay-btn">
					<a href="#" class="btn92s" id="goto_notifysession" shape="rect">确定</a>
				</div>
			</div>
		</div>
		<div class="up-box w600" style="display: none;" id="confirmChangeStudentToAdult">
			<div class="up-box-hd">选择乘车人
				<a id="close_conifrmdialog_student_to_adult" href="javascript:" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit" id="conifrmdialog_student_to_adult_context">当前选择的优先席别有不支持学生票的，是否选择购买成人票？</div>
					</div>
				</div>
				<div class="lay-btn">
					<a id="cancel_dialog_student_to_adult" href="javascript:" class="btn92" shape="rect">否</a>
					<a href="javascript:" class="btn92s" id="goto_student_to_adult" shape="rect">是</a>
				</div>
			</div>
		</div>
		<!-- 优先车次开始 -->
		<div id="yxtraindiv" class="quick-box sel-rank" style="display:none;width: 485px;">
			<div class="quick-box-hd">
				<a id="yxtrain_close" href="javascript:void(0);" shape="rect">关闭</a>
				<div class="inp-wrap"><input id="yxtraininput" type="text" class="inp-txt" placeholder="请输入车次" />
					<a href="javascript:void(0);" id="yxtrain_a_close" class="del" shape="rect"></a>
				</div>

				选择车次（最多选择5个车次）
			</div>
			<div class="first-train-list">
				<ul id="yxtrain_code"></ul>
				<div id="yxtrain_loading" class="train-loading"><img src="/otn/resources/images/loading.gif" alt="" />
				</div>
				<div id="yxtrain_empty" class="train-empty">没有查询到车次</div>
				<div id="yxTrain_page" class="train-page" style="display: none;"></div>
			</div>
		</div>
		<!-- 优先车次结束 -->
		<script type="text/javascript" src="js/fixdiv.js"></script>
		<script type="text/javascript" src="js/address.js"></script>
	</body>

</html>