<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<link href="css/WdatePicker.css" rel="stylesheet" />
		<link href="css/addPassenger.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
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
			
			.emailist .on,
			.emailist li:hover {
				background-color: #eee;
			}
		</style>
	</head>
	<script type="text/javascript" src="js/addPassenger.js">
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
					<div class="lay-hd">添加常用联系人</div>
					<form action="PassengerServlet?method=addPassenger" id="_addForm" method="post" >
						<div class="lay-bd">
							<div class="infoblock linkman">
								<div class="tit clearfix">
									<div class="tit-txt">基本信息<span class="tips-red">（*为必填项）</span>
									</div>
								</div>
								<!--编辑-->
								<div class="base">
									<div class="info-item"><span class="label"><span class="required">*</span> 姓 名：</span>
										<div class="con"><input name="passenger_name" id="name" type="text" class="inptxt w200 color333" maxlength="30" />
										</div>
										
										<div class="tips" id="name_rule">(姓名填写规则)</div>
										
									</div>
									<label for="passenger_name" id="rn" class="error" style="display: none;margin-left: 270px;">允许输入的字符串在3-30个字符之间！</label>
									<div class="info-item"><span class="label"><span class="required">*</span> 性别：
										</span>
										<div class="con"><span class="mr15"><input name="sex_code" id="man" checked="checked" value="男" type="radio" class="radio" />
<label for="man">男</label>
</span>
											<span><input id="female" value="女" name="sex_code" type="radio" class="radio" />
<label for="female">女</label>
</span>
										</div>
									</div>
									<div class="info-item"><span class="label">国家/地区：</span>
										<div class="con">
											<select name="country_code" id="nation">
												<option value="CN"><span>中国CHINA</span>
												</option>
												<option value="US"><span>美国UNITEDSTATES</span>
												</option>
												<option value="AF"><span>阿富汗AFGHANISTANA</span>
												</option>
												<option value="AL"><span>阿尔巴尼亚ALBANIA</span>
												</option>
												<option value="DZ"><span>阿尔及利亚ALGERIA</span>
												</option>
												<option value="AD"><span>安道尔ANDORRA</span>
												</option>
												<option value="AO"><span>安哥拉ANGOLA</span>
												</option>
												<option value="AG"><span>安提瓜和巴布达ANTIGUABARBUDA</span>
												</option>
												<option value="AE"><span>阿拉伯联合酋长国ARAB</span>
												</option>
												<option value="AR"><span>阿根廷ARGENTINA</span>
												</option>
												<option value="AM"><span>亚美尼亚ARMENIA</span>
												</option>
												<option value="AW"><span>阿鲁巴ARUBA</span>
												</option>
												<option value="AU"><span>澳大利亚AUSTRALIA</span>
												</option>
												<option value="AT"><span>奥地利AUSTRIA</span>
												</option>
												<option value="AZ"><span>阿塞拜疆共和国AZERBAIJAN</span>
												</option>
												<option value="BS"><span>巴哈马BAHAMAS</span>
												</option>
												<option value="BH"><span>巴林BAHRAIN</span>
												</option>
												<option value="BD"><span>孟加拉国BANGLADESH</span>
												</option>
												<option value="BB"><span>巴巴多斯BARBADOS</span>
												</option>
												<option value="BY"><span>白俄罗斯BELARUS</span>
												</option>
												<option value="BE"><span>比利时BELGIUM</span>
												</option>
												<option value="BZ"><span>伯里兹BELIZE</span>
												</option>
												<option value="BZ"><span>伯利兹BELIZE</span>
												</option>
												<option value="BJ"><span>贝宁BENIN</span>
												</option>
												<option value="BT"><span>不丹BHUTAN</span>
												</option>
												<option value="BO"><span>玻利维亚BOLIVIA</span>
												</option>
												<option value="BA"><span>波斯尼亚和黑塞哥维那BOSNIA</span>
												</option>
												<option value="BW"><span>博茨瓦纳BOTSWANA</span>
												</option>
												<option value="BR"><span>巴西BRAZIL</span>
												</option>
												<option value="BG"><span>保加利亚BULGARIA</span>
												</option>
												<option value="BF"><span>布基纳法索BURKINAFASO</span>
												</option>
												<option value="BI"><span>布隆迪BURUNDI</span>
												</option>
												<option value="BN"><span>文莱BruneiDarussalam</span>
												</option>
												<option value="KH"><span>柬埔寨CAMBODIA</span>
												</option>
												<option value="CM"><span>喀麦隆CAMEROON</span>
												</option>
												<option value="CA"><span>加拿大CANADA</span>
												</option>
												<option value="KY"><span>佛得角CAPEVERDE</span>
												</option>
												<option value="TD"><span>乍得CHAD</span>
												</option>
												<option value="CL"><span>智利CHILE</span>
												</option>
												<option value="CO"><span>哥伦比亚COLOMBIA</span>
												</option>
												<option value="KM"><span>科摩罗COMOROS</span>
												</option>
												<option value="CG"><span>刚果（布）CONGO</span>
												</option>
												<option value="CK"><span>库克群岛COOKISLANDS</span>
												</option>
												<option value="CI"><span>科特迪瓦COTEDLVOIRE</span>
												</option>
												<option value="HR"><span>克罗地亚CROATIA</span>
												</option>
												<option value="CU"><span>古巴共和国CUBA</span>
												</option>
												<option value="CY"><span>塞浦路斯CYPRUS</span>
												</option>
												<option value="CZ"><span>捷克共和国CZECHREPUBLIC</span>
												</option>
												<option value="CF"><span>中非共和国Central Africa Republic</span>
												</option>
												<option value="CRC"><span>哥斯达黎加CostaRica</span>
												</option>
												<option value="CD"><span>刚果（金）DEMOCRATIC REPUBLIC OF CONGO</span>
												</option>
												<option value="YD"><span>也门民主人民共和国DEMOCRATICYEMEN</span>
												</option>
												<option value="DK"><span>丹麦DENMARK</span>
												</option>
												<option value="DJ"><span>吉布提DJIBOUTI</span>
												</option>
												<option value="DM"><span>多米尼克DOMINICA</span>
												</option>
												<option value="DO"><span>多米尼加DOMINICAN REPUBLIC</span>
												</option>
												<option value="EC"><span>厄瓜多尔ECUADOR</span>
												</option>
												<option value="EG"><span>埃及EGYPT</span>
												</option>
												<option value="EV"><span>萨尔瓦多EL SALVADOR</span>
												</option>
												<option value="GQ"><span>赤道几内亚EQUATORIALGUINEA</span>
												</option>
												<option value="ER"><span>厄立特里亚ERITREA</span>
												</option>
												<option value="EE"><span>爱沙尼亚ESTONIA</span>
												</option>
												<option value="ET"><span>埃塞俄比亚ETHIOPIA</span>
												</option>
												<option value="FJ"><span>斐济FIJI</span>
												</option>
												<option value="FI"><span>芬兰FINLAND</span>
												</option>
												<option value="FR"><span>法国FRANCE</span>
												</option>
												<option value="GA"><span>加蓬GABON</span>
												</option>
												<option value="GM"><span>冈比亚GAMBIA</span>
												</option>
												<option value="CE"><span>格鲁吉亚GEORGIA</span>
												</option>
												<option value="DE"><span>德国GERMANY</span>
												</option>
												<option value="GH"><span>加纳GHANA</span>
												</option>
												<option value="GR"><span>希腊GREECE</span>
												</option>
												<option value="GL"><span>格林纳达GRENADA</span>
												</option>
												<option value="GN"><span>几内亚GUINEA</span>
												</option>
												<option value="GW"><span>几内亚比绍GUINEA-BISSAU</span>
												</option>
												<option value="GW"><span>几内亚比绍GUINEABISSAU</span>
												</option>
												<option value="GY"><span>圭亚那GUYANA</span>
												</option>
												<option value="GT"><span>危地马拉Guatemala</span>
												</option>
												<option value="HT"><span>海地HAITI</span>
												</option>
												<option value="NL"><span>荷兰HOLLAND</span>
												</option>
												<option value="HN"><span>洪都拉斯HONDURAS</span>
												</option>
												<option value="HU"><span>匈牙利HUNGARY</span>
												</option>
												<option value="IS"><span>冰岛ICELAND</span>
												</option>
												<option value="IN"><span>印度INDIA</span>
												</option>
												<option value="ID"><span>印度尼西亚INDONESIA</span>
												</option>
												<option value="IR"><span>伊朗IRAN</span>
												</option>
												<option value="IQ"><span>伊拉克IRAQ</span>
												</option>
												<option value="IE"><span>爱尔兰IRELAND</span>
												</option>
												<option value="IL"><span>以色列ISRAEL</span>
												</option>
												<option value="IT"><span>意大利ITALY</span>
												</option>
												<option value="JM"><span>牙买加JAMAICA</span>
												</option>
												<option value="JP"><span>日本JAPAN</span>
												</option>
												<option value="JO"><span>约旦JORDAN</span>
												</option>
												<option value="KZ"><span>哈萨克斯坦KAZAKHSTAN</span>
												</option>
												<option value="KE"><span>肯尼亚KENYA</span>
												</option>
												<option value="KG"><span>吉尔吉斯共和国KIRGIZSTAN</span>
												</option>
												<option value="KI"><span>基里巴斯KIRIBATI</span>
												</option>
												<option value="KR"><span>韩国KOREA</span>
												</option>
												<option value="KW"><span>科威特KUWAIT</span>
												</option>
												<option value="DPR"><span>朝鲜Korea</span>
												</option>
												<option value="LA"><span>老挝LAOS</span>
												</option>
												<option value="LV"><span>拉脱维亚LATVIA</span>
												</option>
												<option value="LB"><span>黎巴嫩LEBANON</span>
												</option>
												<option value="LS"><span>莱索托LESOTHO</span>
												</option>
												<option value="LR"><span>利比里亚LIBERIA</span>
												</option>
												<option value="LY"><span>利比亚LIBYA</span>
												</option>
												<option value="LI"><span>列支敦士登LIECHTENSTEIN</span>
												</option>
												<option value="LT"><span>立陶宛LITHUANIA</span>
												</option>
												<option value="LU"><span>卢森堡LUXEMBOURG</span>
												</option>
												<option value="MK"><span>马其顿MACEDONIA</span>
												</option>
												<option value="MG"><span>马达加斯加MADAGASCAR</span>
												</option>
												<option value="MW"><span>马拉维MALAWI</span>
												</option>
												<option value="MY"><span>马来西亚MALAYSIA</span>
												</option>
												<option value="MV"><span>马尔代夫MALDIVES</span>
												</option>
												<option value="ML"><span>马里MALI</span>
												</option>
												<option value="MT"><span>马耳他MALTA</span>
												</option>
												<option value="MH"><span>马绍尔群岛MARSHALL ISLANDS</span>
												</option>
												<option value="MR"><span>毛里塔尼亚MAURITANIA</span>
												</option>
												<option value="MU"><span>毛里求斯MAURITIUS</span>
												</option>
												<option value="MX"><span>墨西哥MEXICO</span>
												</option>
												<option value="FM"><span>密克罗尼西亚联邦MICRONESIA</span>
												</option>
												<option value="MD"><span>摩尔多瓦MOLDOVA</span>
												</option>
												<option value="MC"><span>摩纳哥MONACO</span>
												</option>
												<option value="MN"><span>蒙古MONGOLIA</span>
												</option>
												<option value="ME"><span>黑山MONTENEGRO</span>
												</option>
												<option value="MA"><span>摩洛哥MOROCCO</span>
												</option>
												<option value="MZ"><span>莫桑比克MOZAMBIQUE</span>
												</option>
												<option value="MM"><span>缅甸MYANMAR</span>
												</option>
												<option value="NA"><span>纳米比亚NAMIBIA</span>
												</option>
												<option value="NR"><span>瑙鲁NAURU</span>
												</option>
												<option value="NP"><span>尼泊尔NEPAL</span>
												</option>
												<option value="NZ"><span>新西兰NEWZEALAND</span>
												</option>
												<option value="NI"><span>尼加拉瓜NICARAGUA</span>
												</option>
												<option value="NE"><span>尼日尔NIGER</span>
												</option>
												<option value="NG"><span>尼日利亚NIGERIA</span>
												</option>
												<option value="NO"><span>挪威NORWAY</span>
												</option>
												<option value="OM"><span>阿曼OMAN</span>
												</option>
												<option value="PK"><span>巴基斯坦PAKISTAN</span>
												</option>
												<option value="PW"><span>帕劳PALAU</span>
												</option>
												<option value="BL"><span>巴勒斯坦PALESTINE</span>
												</option>
												<option value="PA"><span>巴拿马PANAMA</span>
												</option>
												<option value="PG"><span>巴布亚新几内亚PAPUANEWGUINEA</span>
												</option>
												<option value="PY"><span>巴拉圭PARAGUAY</span>
												</option>
												<option value="PE"><span>秘鲁PERU</span>
												</option>
												<option value="PH"><span>菲律宾PHILIPPINES</span>
												</option>
												<option value="PL"><span>波兰POLAND</span>
												</option>
												<option value="PT"><span>葡萄牙PORTUGAL</span>
												</option>
												<option value="PR"><span>波多黎各PUERTO RICO</span>
												</option>
												<option value="QA"><span>卡塔尔QATAR</span>
												</option>
												<option value="RO"><span>罗马尼亚ROMANIA</span>
												</option>
												<option value="RU"><span>俄罗斯RUSSIA</span>
												</option>
												<option value="RW"><span>卢旺达RWANDA</span>
												</option>
												<option value="KNA"><span>圣基茨和尼维斯SAINT KITTS</span>
												</option>
												<option value="VC"><span>圣文森特和格林纳丁斯SAINT VINCENT AND THE GRENADIN</span>
												</option>
												<option value="LC"><span>圣卢西亚SAINTLUCIA</span>
												</option>
												<option value="WS"><span>美属萨摩亚SAMOA</span>
												</option>
												<option value="SM"><span>圣马力诺SANMARINO</span>
												</option>
												<option value="ST"><span>圣多美和普林西比SAOTOMEPRINCIPE</span>
												</option>
												<option value="SA"><span>沙特阿拉伯SAUDIARABIA</span>
												</option>
												<option value="SN"><span>塞内加尔SENEGAL</span>
												</option>
												<option value="CS"><span>塞尔维亚SERBIA</span>
												</option>
												<option value="SC"><span>塞舌尔SEYCHELLES</span>
												</option>
												<option value="SL"><span>塞拉利昂SIERRALEONE</span>
												</option>
												<option value="SG"><span>新加坡SINGAPORE</span>
												</option>
												<option value="SK"><span>斯洛伐克SLOVAKIA</span>
												</option>
												<option value="SK"><span>斯洛伐克共和国SLOVAKREPUBLIC</span>
												</option>
												<option value="SI"><span>斯洛文尼亚SLOVENIA</span>
												</option>
												<option value="SB"><span>所罗门群岛SOLOMON ISLANDS</span>
												</option>
												<option value="SO"><span>索马里SOMALI</span>
												</option>
												<option value="SO"><span>索马里SOMALIA</span>
												</option>
												<option value="ZA"><span>南非SOUTHAFRICA</span>
												</option>
												<option value="ES"><span>西班牙SPAIN</span>
												</option>
												<option value="LK"><span>斯里兰卡SRILANKA</span>
												</option>
												<option value="SD"><span>苏丹SUDAN</span>
												</option>
												<option value="SR"><span>苏里南SURINAM</span>
												</option>
												<option value="SZ"><span>斯威士兰SWAZILAND</span>
												</option>
												<option value="SE"><span>瑞典SWEDEN</span>
												</option>
												<option value="CH"><span>瑞士SWITZERLAND</span>
												</option>
												<option value="SY"><span>叙利亚SYRIA</span>
												</option>
												<option value="TJ"><span>塔吉克斯坦TAJIKISTAN</span>
												</option>
												<option value="TZ"><span>坦桑尼亚TANZANIA</span>
												</option>
												<option value="TH"><span>泰国THAILAND</span>
												</option>
												<option value="SS"><span>南苏丹共和国THE REPBLIC OF SOUTH SUDAN</span>
												</option>
												<option value="UGA"><span>乌干达THE REPUBLIC OF UGANDA</span>
												</option>
												<option value="TL"><span>东帝汶TIMOR</span>
												</option>
												<option value="TG"><span>多哥TOGO</span>
												</option>
												<option value="TO"><span>汤加TONGA</span>
												</option>
												<option value="TT"><span>特立尼达和多巴哥TRINIDADANDTOBAGO</span>
												</option>
												<option value="TN"><span>突尼斯TUNISIA</span>
												</option>
												<option value="TR"><span>土耳其TURKEY</span>
												</option>
												<option value="TM"><span>土库曼斯坦TURKMENISTAN</span>
												</option>
												<option value="UKR"><span>乌克兰UKRAINE</span>
												</option>
												<option value="GB"><span>英国UNITED KINGDOM</span>
												</option>
												<option value="UZB"><span>乌兹别克斯坦UZBEKISTAN</span>
												</option>
												<option value="UY"><span>乌拉圭Uruguay</span>
												</option>
												<option value="VU"><span>瓦努阿图VANUATU</span>
												</option>
												<option value="VA"><span>梵蒂冈VATICAN</span>
												</option>
												<option value="VIE"><span>越南VIETNAM</span>
												</option>
												<option value="VE"><span>委内瑞拉Venezuela</span>
												</option>
												<option value="ZM"><span>赞比亚ZAMBIA</span>
												</option>
												<option value="ZW"><span>津巴布韦ZIMBABWE</span>
												</option>
											</select>
										</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 证件类型：
										</span>
										<div class="con">
											<select name="passenger_id_type_code" id="cardType">
												<option value="1"><span>二代身份证</span>
												</option>
												<option value="C"><span>港澳通行证</span>
												</option>
												<option value="G"><span>台湾通行证</span>
												</option>
												<option value="B"><span>护照</span>
												</option>
											</select>
										</div>
									</div>
									<div class="info-item"><span class="label"><span class="required">*</span> 证件号码：
										</span>
										<div class="con"><input maxlength="18" name="passenger_id_no" id="cardCode" type="text" class="inptxt w200 color333" />
											<div id="passenger_id_no_div" class="inp-focus card" style="display:none">329 193 1984 0316 3782</div>
									        	
										</div>
										<label for="passenger_id_no" id="cac" class="error" style="display: none;margin-left: 270px;">请正确输入18位的身份证号！</label>
									</div>
									
								</div>
							</div>
							<div class="infoblock linkman">
								<div class="tit clearfix">
									<div class="tit-txt">联系方式</div>
								</div>
								<!--编辑-->
								<div class="base">
									<div class="info-item"><span class="label">手机号码：</span>
										<div class="con"><input name="mobile_no" id="mobileNo" type="text" maxlength="11" class="inptxt w200 color333" />
											<div id="mobile_no_div" class="inp-focus tel" style="display:none">139 9191 1991</div>
											<!--<label for="mobileNo" class="error" style="margin-left: 2px; line-height: 30px; ">您输入的手机号码不是有效的格式！</label>-->
											
										</div>
										<label for="mobile_no" class="error" id="tel" style="display: none;margin-left: 270px;">您输入的手机号码不是有效的格式！</label>
									</div>
									
									<div class="info-item"><span class="label">固定电话：</span>
										<div class="con"><input name="phone_no" id="phoneNo" type="text" value="" maxlength="30" class="inptxt w200 color333" />
										</div>
									</div>
									<div class="info-item"><span class="label">电子邮件：</span>
										<div class="con"><input name="email" id="email" type="text" class="inptxt w200 color333  inp-transform" autocomplete="off" />
										</div>
										<!--<label for="email" class="error" style="margin-left: 2px; line-height: 30px; ">请输入有效的电子邮件地址！</label>-->
										<label for="email" class="error" id="em" style="display: none;margin-left: 270px;">请输入有效的电子邮件地址！</label>
									</div>

									<div class="info-item"><span class="label">地址：</span>
										<div class="con"><input name="address" id="address" type="text" value="" class="inptxt w200 color333" />
										</div>
									</div>
									<div class="info-item"><span class="label">邮编：</span>
										<div class="con"><input name="postalcode" id="zipCode" type="text" value="" maxlength="30" class="inptxt w200 color333" />
										</div>
									</div>
								</div>
							</div>
							<div class="infoblock linkman">
								<div class="tit clearfix">
									<div class="tit-txt">附加信息</div>
								</div>
								<!--编辑-->
								<div class="base">
									<div class="info-item"><span class="label"><span class="required">*</span> 旅客类型：
										</span>
										<div class="con">
											<select name="passenger_type" id="passengerType">
												<option value="1">成人</option>
												<option value="2">儿童</option>
												<option value="3">学生</option>
												<option value="4">残疾军人、伤残人民警察</option>
											</select>
										</div>
									</div>
									<div id="_stu_infor" style="display: none;">
										<div class="info-item"><span class="label"><span class="required">*</span> 学校所在省份：
											</span>
											<div class="con">
												<select id="province_code" name="studentInfoDTO.province_code">
													<option value="11"><span>北京</span>
													</option>
													<option value="12"><span>天津</span>
													</option>
													<option value="13"><span>河北</span>
													</option>
													<option value="14"><span>山西</span>
													</option>
													<option value="15"><span>内蒙古</span>
													</option>
													<option value="21"><span>辽宁</span>
													</option>
													<option value="22"><span>吉林</span>
													</option>
													<option value="23"><span>黑龙江</span>
													</option>
													<option value="31"><span>上海</span>
													</option>
													<option value="32"><span>江苏</span>
													</option>
													<option value="33"><span>浙江</span>
													</option>
													<option value="34"><span>安徽</span>
													</option>
													<option value="35"><span>福建</span>
													</option>
													<option value="36"><span>江西</span>
													</option>
													<option value="37"><span>山东</span>
													</option>
													<option value="41"><span>河南</span>
													</option>
													<option value="42"><span>湖北</span>
													</option>
													<option value="43"><span>湖南</span>
													</option>
													<option value="44"><span>广东</span>
													</option>
													<option value="45"><span>广西</span>
													</option>
													<option value="46"><span>海南</span>
													</option>
													<option value="50"><span>重庆</span>
													</option>
													<option value="51"><span>四川</span>
													</option>
													<option value="52"><span>贵州</span>
													</option>
													<option value="53"><span>云南</span>
													</option>
													<option value="54"><span>西藏</span>
													</option>
													<option value="61"><span>陕西</span>
													</option>
													<option value="62"><span>甘肃</span>
													</option>
													<option value="63"><span>青海</span>
													</option>
													<option value="64"><span>宁夏</span>
													</option>
													<option value="65"><span>新疆</span>
													</option>
												</select>
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 学校名称：
											</span>
											<div class="con"><input id="schoolNameText" name="studentInfoDTO.school_name" type="text" value="" class="inptxt w200 color333" />
												<div id="schoolNameSuggest" class="ac_results_school"></div>
												<input name="studentInfoDTO.school_code" id="schoolCode" type="hidden" />
											</div>
										</div>
										<div class="info-item"><span class="label">院系：</span>
											<div class="con"><input id="department" name="studentInfoDTO.department" type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item"><span class="label">班级：</span>
											<div class="con"><input id="school_class" name="studentInfoDTO.school_class" type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 学号：
											</span>
											<div class="con"><input id="student_no" name="studentInfoDTO.student_no" maxlength="30" type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 学制：
											</span>
											<div class="con">
												<select name="studentInfoDTO.school_system" id="school_system">
													<option value="1"><span>1</span>
													</option>
													<option value="2"><span>2</span>
													</option>
													<option value="3"><span>3</span>
													</option>
													<option value="4"><span>4</span>
													</option>
													<option value="5"><span>5</span>
													</option>
													<option value="6"><span>6</span>
													</option>
													<option value="7"><span>7</span>
													</option>
													<option value="8"><span>8</span>
													</option>
													<option value="9"><span>9</span>
													</option>
												</select>
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 入学年份：
											</span>
											<div class="con">
												<select id="enter_year" name="studentInfoDTO.enter_year">
													<option value="2017"><span>2017</span>
													</option>
													<option value="2016"><span>2016</span>
													</option>
													<option value="2015"><span>2015</span>
													</option>
													<option value="2014"><span>2014</span>
													</option>
													<option value="2013"><span>2013</span>
													</option>
													<option value="2012"><span>2012</span>
													</option>
													<option value="2011"><span>2011</span>
													</option>
													<option value="2010"><span>2010</span>
													</option>
													<option value="2009"><span>2009</span>
													</option>
													<option value="2008"><span>2008</span>
													</option>
												</select>
											</div>
										</div>
										<div class="info-item"><span class="label">优惠卡号：</span>
											<div class="con"><input id="preference_card_no" name="studentInfoDTO.preference_card_no" type="text" value="" class="inptxt w200 color333" />
											</div>
										</div>
										<div class="info-item"><span class="label"><span class="required">*</span> 优惠区间：
											</span>
											<div class="con"><input id="preference_from_station_name" name="studentInfoDTO.preference_from_station_name" type="text" value="" class="inptxt w90 color333" />
												<input name="studentInfoDTO.preference_from_station_code" id="preferenceFromStationCode" type="hidden" />
												<div id="preferenceFromStationNameSuggest" class="ac_results"></div>
												<span class="fg-line">--</span>
												<input id="preference_to_station_name" name="studentInfoDTO.preference_to_station_name" type="text" value="" class="inptxt w90 color333" />
												<div id="preferenceToStationNameSuggest" class="ac_results"></div>
												<input name="studentInfoDTO.preference_to_station_code" id="preferenceToStationCode" type="hidden" />
												<span class="fg-line"></span>
											</div>
											<div class="tips">填写与学生证一致的优惠区间（选择车站所在城市）</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lay-btn line-top">
								<input value="取消" type="reset" class="btn92" shape="rect">
								<input value="保存" type="submit" class="btn92s" shape="rect">
							</div>
						</div>
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
	</body>

</html>