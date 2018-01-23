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
		<link href="css/dhtmlxwindows.css" type="text/css" rel="stylesheet" />
		<!-- 双日历 -->
		<link href="css/WdatePicker.css" rel="stylesheet" />
		<title>车票预订 | 客运服务 | 铁路客户服务中心</title>
		<script type="text/javascript" src="js/jquery-1.11.0.js" ></script>
	</head>
	<script type="text/javascript" src="js/pay.js">
		
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
		<div class="content" id="main_content">
			<!--支付提示 开始-->
			<div class="t-succ t-lock">
				<div class="pay-tips"><span class="i-lock"></span>
					<h3><span>
			            席位已锁定，请在<span class="colorA">30</span>
分钟内进行支付，完成网上购票。
			      		<span>支付剩余时间：<strong id="ShowTime" class="colorA"><span id="ShowTime1"></span></strong>
</span>
</span>
</h3>
					<!--  
            <br th:if="${tour_flag eq 'dc'}"></br>
            <br th:if="${tour_flag eq 'dc'}"></br>
           	<p style="margin-left: 700px;" th:if="${tour_flag eq 'dc'}">支付剩余时间：<strong id="ShowTime" class="colorA"></strong></p>
           	-->
					<!-- 
            <br th:if="${tour_flag eq 'fc'}"></br>
            <br th:if="${tour_flag eq 'fc'}"></br>
            <p style="margin-left: 700px;"  th:if="${tour_flag eq 'fc'}">支付剩余时间：<strong id="ShowTime" class="colorA"></strong></p>
             -->
					<!-- 
            <br th:if="${tour_flag eq 'wc'}"></br>
            <br th:if="${tour_flag eq 'wc'}"></br>
            <p style="margin-left: 700px;"  th:if="${tour_flag eq 'wc'}">支付剩余时间：<strong id="ShowTime" class="colorA"></strong></p>
             -->
				</div>
			</div>
			<!--订单信息 开始-->
			<div class="layout b-info">
				<div class="lay-hd">订单信息</div>
				<div id="show_title_ticket" class="info">
					<strong class="mr5">${trainDate}</strong>
					<strong class="mr5">${trainBook.trainNo} 次 </strong>
					<strong class="ml5">${trainBook.departure}</strong> 站
					<strong>（${trainBook.startTime}开）— ${trainBook.terminal}</strong> 站（${trainBook.endTime}到）
				</div>
				<table class="table-a" id="table_list">
					<tr>
						<th width="40" rowspan="1" colspan="1"><strong>序号</strong>
						</th>
						<th width="75" rowspan="1" colspan="1"><strong>姓名</strong>
						</th>
						<th width="120" rowspan="1" colspan="1"><strong>证件类型</strong>
						</th>
						<th width="210" rowspan="1" colspan="1"><strong>证件号码</strong>
						</th>
						<th width="140" rowspan="1" colspan="1"><strong>票种</strong>
						</th>
						<th width="70" rowspan="1" colspan="1"><strong>席别</strong>
						</th>
						<th width="70" rowspan="1" colspan="1"><strong>车厢</strong>
						</th>
						<th width="70" rowspan="1" colspan="1"><strong>席位号</strong>
						</th>
						<th rowspan="1" colspan="1"><strong>票价（元）</strong>
						</th>
					</tr>
					<tbody id="show_ticket_message">
					<c:set value="${oid}" var="oid"/>
					<c:forEach items="${orderinfos}" var="map">
                    <c:if test="${fn:containsIgnoreCase(fn:trim(map.key),fn:trim(oid))}" var="flag">
					<c:forEach items="${map.value}" var="childList" varStatus="status">
						<tr>
							<td align="center">${ status.index + 1}</td>
							<td title="${childList.realName}">${childList.realName}</td>
							<td>二代身份证</td>
							<td>${childList.card}</td>
							<td>成人票</td>
							<td>${childList.seatType}</td>
							<td>${childList.carriage}</td>
							<td>${childList.seatingOrder}</td>
							<td>${childList.price} 元</td>
						</tr>
						</c:forEach>
                        </c:if>
						</c:forEach>
						
					</tbody>
				</table>
				<div id="insurance_renderTicket_div">
					<div class="bx-box">
						<div class="bx-hd">
							<!--   铁路旅客人身意外伤害保险<label class="label-buy"><input type="checkbox" class="check" id="insurance_buy_check"/>购买</label>
                  		                 <span class="color999">（保费2元，最高赔付￥20万+医疗2份）</span>
                  		                 <span id="yesIagree" style="display: none;">
	                  		                 <label class="label-tk"> <input type="checkbox"  class="check" id="insurance_i_agree_check"/>我已阅读并同意</label>
	                  		                 <a onclick="$.showInsCntract();" href="javascript:void(0);">《中国铁路保险公司服务条款》</a>
                  		                 </span> -->
							<label class="label-tk"><input type="checkbox" class="check" id="insurance_buy_and_agree" onclick="$.clickInsBuyAndAgree(this)" />
购买铁路乘意险，已阅读并同意</label>
							<a onclick="$.showInsContract();" href="javascript:void(0);">《铁路旅客人身意外伤害保险条款（A款）》</a>
							和
							<a onclick="$.showInsNeed2Know();" href="javascript:void(0);">《铁路旅客人身意外伤害保险（指定行程）投保须知》</a>
						</div>
						<div class="bx-txt" id="insurance_tips" style="display: none;"></div>
						<table class="table-c" id="insurance_table" style="display: none;">
							<tr>
								<th width="40">序号</th>
								<th width="200">旅客信息</th>
								<th width="220">车次信息</th>
								<th class="last">购买保险产品</th>
							</tr>
							<tr class="t-ft">
								<td class="left" colspan="2"><label><input type="checkbox" class="check" id="ins_select_all" onclick="$.choseInsAll(this)" />
全选</label>
								</td>
								<td class="right" colspan="2">保险费：¥ <strong id="ins_fee_total" class="colorA">0.0</strong>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div id="insurance_contract_div" class="layout" style="display: none;">
					<div class="mark"></div>
					<div class="up-box">
						<div class="up-box-hd">保险条款
							<a href="javascript:void(0);" id="ins_cntract_div_close">关闭</a>
						</div>
						<div class="up-box-bd padding20">
							<div class="contract">
								<div class="name">铁路旅客人身意外伤害保险条款（A款）<br />
								</div>
								<h2 style="text-align:center;">总则</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一条 本保险合同由保险条款、投保单、保险单、批单和特别约定共同组成。凡涉及本保险合同的约定，均应采用书面形式。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二条 凡持铁路有效乘车凭证合法乘坐在中华人民共和国境内（不包括港、澳、台地区，下同）营运的铁路客运列车（以下简称境内列车）的自然人，可作为本保险合同的被保险人。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随同成人旅客免费乘坐境内列车的儿童，在本保险合同中视为其持有有效乘车凭证。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第三条 具有完全民事行为能力的被保险人本人、在订立本保险合同时对被保险人具有保险利益的其他个人或组织均可作为本保险合同的投保人。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投保人不得为无民事行为能力人投保本保险合同，但父母为其未成年子女投保的除外。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第四条 除父母为其未成年子女投保的以外，本保险合同应经被保险人同意并认可保险金额，<strong>否则以死亡为给付保险金条件的条款无效，保险人不承担保险责任</strong> 。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第五条 本保险合同的受益人包括:</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（一）身故保险金受益人</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订立本保险合同时，被保险人或投保人可指定一人或数人为身故保险金受益人。身故保险金受益人为数人时，应确定其受益顺序和受益份额；未确定受益份额的，各身故保险金受益人按照相等份额享有受益权。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被保险人死亡后，有下列情形之一的，保险金作为被保险人的遗产，由保险人依照《中华人民共和国继承法》的规定履行给付保险金的义务：</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）没有指定受益人，或者受益人指定不明无法确定的；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）受益人先于被保险人死亡，没有其他受益人的；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）受益人依法丧失受益权或者放弃受益权，没有其他受益人的。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受益人与被保险人在同一事件中死亡，且不能确定死亡先后顺序的，推定受益人死亡在先。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被保险人或投保人可以变更身故保险金受益人，但需书面通知保险人，由保险人在本保险合同上批注。<strong>对因身故保险金受益人变更发生的法律纠纷，保险人不承担任何责任</strong> 。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投保人指定或变更身故保险金受益人时须经被保险人同意。被保险人为无民事行为能力人或限制民事行为能力人的，应由其监护人指定或变更身故保险金受益人。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（二）其他保险金受益人</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;除另有约定外，本保险合同的伤残保险金受益人、医疗费用保险金受益人均为被保险人本人。</p>
								<h2 style="text-align:center;">保险责任</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第六条 在保险期间内，被保险人持有效乘车凭证合法乘坐境内列车遭受意外伤害，并以该意外伤害为直接且单独原因而导致被保险人本人身故、伤残或治疗的，保险人按照下列约定给付保险金。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一、意外伤害保险责任</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（一）身故保险责任</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在保险期间内，被保险人遭受意外伤害，并自该意外伤害发生之日起一百八十日内因该意外伤害身故的，保险人按保险单所载的该被保险人意外伤害保险金额给付身故保险金，对该被保险人的保险责任终止。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在保险期间内，被保险人因遭受意外伤害且自该意外伤害发生之日起下落不明，后经人民法院宣告死亡的，保险人按该被保险人意外伤害保险金额给付身故保险金。但若被保险人被宣告死亡后重新出现或身故保险金受领人确知其没有死亡的，身故保险金受领人应于知道或应当知道被保险人没有死亡后三十日内退还保险人给付的身故保险金。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被保险人身故前，保险人已按本保险合同约定给付伤残保险金的，身故保险金应扣除已给付金额。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;父母为其未成年子女投保本保险的，因被保险人身故给付的保险金总和不得超过国务院保险监督管理机构规定的限额。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（二）伤残保险责任</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在保险期间内，被保险人遭受意外伤害，并自该意外伤害发生之日起一百八十日内依据中国保险行业协会、中国法医学会联合发布的《人身保险伤残评定标准》（中保协发〔2013〕88 号）鉴定为一至十级中任一级伤残的，保险人按照《人身保险伤残评定标准》中规定的给付比例乘以该被保险人意外伤害保险金额给付伤残保险金。如第一百八十日治疗仍未结束的，按当日的身体情况进行伤残鉴定，并据此给付伤残保险金。<strong>若被保险人因遭受意外伤害事故导致的伤残不在《人身保险伤残评定标准》之列，保险人不承担给付伤残保险金责任</strong> 。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（三）在保险期间内，保险人依据本保险合同对被保险人给付身故保险金和伤残保险金的总额，以保险单所载明的该被保险人的意外伤害保险金额为限。一次或多次累计给付的身故保险金和伤残保险金总和达到意外伤害保险金额时，保险人对该被保险人的身故保险责任和伤残保险责任终止。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、意外伤害医疗费用保险责任</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在保险期间内，被保险人遭受意外伤害，在中华人民共和国境内二级及以上公立医院或保险人认可的医疗机构治疗，对被保险人实际支出的、符合当地政府颁布的社会基本医疗保险报销范围内的、合理且必要的医疗费用，保险人在扣除社会基本医疗保险或其他任何途径（包括但不限于任何商业保险机构、公费医疗、侵权责任人等）已经补偿或给付的部分以及人民币二百元的免赔额后，按其剩余部分的数额依据本保险合同的约定给付医疗费用保险金。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;若保险期间届满时被保险人治疗仍未结束的，保险人继续承担给付保险金的责任，但对住院治疗者最长不超过自该意外伤害发生之日起连续一百八十日，对门诊治疗者最长不超过自该意外伤害发生之日起连续十五日。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保险人依据本保险合同对被保险人医疗费用保险金的给付总额，以保险单所载明的该被保险人的意外伤害医疗费用保险金额为限。一次或多次累计给付医疗费用保险金总和达到意外伤害医疗费用保险金额时，保险人对该被保险人的意外伤害医疗费用保险责任终止。</p>
								<h2 style="text-align:center;">责任免除</h2>
								<strong><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第七条 因下列原因之一，造成被保险人身故、伤残或治疗的，保险人不承担给付保险金责任：</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（一）投保人的重大过失或故意行为；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（二）被保险人故意犯罪或抗拒依法采取的强制措施；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（三）被保险人自致伤害或自杀，但被保险人自杀时为无民事行为能力人的除外；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（三）被保险人自致伤害或自杀，但被保险人自杀时为无民事行为能力人的除外；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（四）因被保险人挑衅或故意行为而导致的打架、斗殴、被袭击或被谋杀；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（五）被保险人违反《中华人民共和国铁路法》、《铁路安全管理条例》等法律、法规、规章或未遵守铁路部门安全管理规定；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（六）被保险人妊娠、流产、分娩、疾病、猝死、药物过敏、食物中毒、高原病（高山病）、减压病、中暑、细菌或病毒感染，但因意外伤害事故导致流产、分娩和创伤感染的除外；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（七）被保险人接受手术或其他医疗；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（八）被保险人未遵医嘱，私自服用、涂用、注射药物；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（九）被保险人因遭受铁路交通事故以外的原因失踪而被人民法院宣告死亡的；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（十）任何生物、化学、原子能武器，原子能或核能装置、核燃料、核废料所造成的爆炸、灼伤、污染或辐射；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（十一）恐怖主义行为、恐怖袭击、绑架。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第八条 被保险人在下列期间遭受意外伤害导致身故、伤残或治疗的，保险人也不承担给付保险金责任：</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（一）被保险人精神和行为障碍（以世界卫生组织颁布的《疾病和有关健康问题的国际统计分类（ICD—10）》为准）期间；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（二）战争、军事行动、暴动、武装叛乱期间；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（三）被保险人醉酒或受毒品、管制药物的影响期间；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（四）被保险人非乘坐境内列车期间，或虽在乘坐境内列车期间但未持有与保险期间对应的有效乘车凭证；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（五）被保险人从事违法犯罪活动期间或被依法限制人身自由、在逃期间。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第九条 保险人对下列费用也不承担给付保险金责任：</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（一）非治疗与此次意外为直接且单独原因导致的身体伤害而发生的医疗费用；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（二）当地社会基本医疗保险规定的自费项目和药品费用；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（三）矫形、整容、美容、体检、验光、心理咨询和治疗、器官移植，以及修复、安装及购买残疾用具（包括但不限于轮椅、假肢、假眼、助听器、配镜）的费用；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（四）洗牙、牙齿美白、正畸、烤瓷牙、种植牙、镶牙等牙齿保健和修复费用；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（五）在境外医院、中外合资医院、民营医院、康复中心、联合诊所、特需（色）门诊、特需病房等非保险人指定或者认可的医疗机构发生的费用，但符合本条款第二十八条约定的情形的除外；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（六）营养费、食宿费、交通费、误工费、丧葬费、生活补助费以及疗养或康复治疗的费用；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（七）本保险合同中载明的免赔额。</p>
</strong>
								<h2 style="text-align:center;">保险金额和保险费</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十条 保险金额是保险人承担给付保险金责任的最高限额。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保险金额由投保人、保险人双方协商确定，并在保险单中载明，但父母为其未成年子女投保的，其意外伤害保险金额不得超过国务院保险监督管理机构规定的限额。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保险金额一经确定，不得变更。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十一条 除另有约定外，投保人应当在本保险合同成立时交清保险费。<strong>保险费交清前发生的保险事故，保险人不承担给付保险金责任</strong> 。
								</p>
								<h2 style="text-align:center;">保险期间</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十二条 本保险合同的保险期间为被保险人按保险单载明的乘车日期、列车车次和发到站（以下简称指定行程），持有效乘车凭证合法乘坐境内列车期间。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>经铁路部门同意对保险单所对应的乘车凭证进行改签、变更到站的，本保险合同继续有效，保险期间以改签、变更到站后的乘车日期、列车车次和发到站为准</strong> 。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被保险人在指定行程中途离开列车并出站的，则保险人对该被保险人的保险责任中止，直至该被保险人返回继续原指定行程。若被保险人未返回或未在指定行程结束前返回的，保险人对该被保险人的保险责任自被保险人中途离开时终止，但因当日当次列车停驶、铁路线中断等情形，被保险人按照铁路部门的安排转乘其他列车而变更原指定行程的，保险人对该被保险人变更后的行程（即变更后的乘车日期、列车车次和发到站），按本保险合同的约定继续承担保险责任。</p>
								<h2 style="text-align:center;">保险人义务</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十三条 订立保险合同时，采用保险人提供的格式条款的，保险人向投保人提供的投保单应当附格式条款，保险人应当向投保人说明保险合同的内容。对保险合同中免除保险人责任的条款，保险人在订立合同时应当在投保单、保险单或者其他保险凭证上作出足以引起投保人注意的提示，并对该条款的内容以书面或者口头形式向投保人作出明确说明；未作提示或者明确说明的，该条款不产生效力。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十四条 本保险合同成立后，保险人应当及时向投保人签发保险单或其他保险凭证。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十五条 保险人依据本条款第十九条所取得的保险合同解除权，自保险人知道有解除事由之日起，超过三十日不行使而消灭。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保险人在合同订立时已经知道投保人未如实告知的情况的，保险人不得解除合同；发生保险事故的，保险人应当承担给付保险金责任。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十六条 保险人认为保险金申请人提供的有关索赔的证明和资料不完整的，应当及时一次性通知保险金申请人补充提供。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十七条 保险人收到保险金申请人的给付保险金的请求后，应当及时作出是否属于保险责任的核定；情形复杂的，应当在三十日内作出核定，但保险合同另有约定的除外。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保险人应当将核定结果通知保险金申请人；对属于保险责任的，在与保险金申请人达成给付保险金的协议后十日内，履行给付保险金义务。保险合同对给付保险金的期限有约定的，保险人应当按照约定履行给付保险金义务。保险人依照本条约定作出核定后，对不属于保险责任的，应当自作出核定之日起三日内向保险金申请人发出拒绝给付保险金通知书，并说明理由。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十八条 保险人自收到给付保险金的请求和有关证明、资料之日起六十日内，对其给付的数额不能确定的，应当根据已有证明和资料可以确定的数额先予支付；保险人最终确定给付的数额后，应当支付相应的差额。</p>
								<h2 style="text-align:center;">投保人、被保险人义务</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第十九条 订立保险合同，保险人就被保险人的有关情况提出询问的，投保人应当如实告知。</p>
								<strong><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投保人故意或者因重大过失未履行前款规定的义务，足以影响保险人决定是否同意承保或者提高保险费率的，保险人有权解除本保险合同。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投保人故意不履行如实告知义务的，保险人对于合同解除前发生的保险事故，不承担给付保险金责任，并不退还保险费。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投保人因重大过失未履行如实告知义务，对保险事故的发生有严重影响的，保险人对于合同解除前发生的保险事故，不承担给付保险金责任，但应当退还保险费。</p>
</strong>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十条 投保人住所或通讯地址变更时，应及时以书面形式或通过客服电话通知保险人。投保人未通知的，保险人按本保险合同所载的最后住所或通讯地址发送的有关通知，均视为已发送给投保人。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十一条 投保人、被保险人或者受益人知道保险事故发生后，应当在四十八小时内通知保险人。<strong>故意或者因重大过失未及时通知，致使保险事故的性质、原因、损失程度等难以确定的，保险人对无法确定的部分，不承担给付保险金责任</strong> ，但保险人通过其他途径已经及时知道或者应当及时知道保险事故发生的除外。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上述约定，不包括因不可抗力而导致的迟延。</p>
								<h2 style="text-align:center;">保险金申请与给付</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十二条 保险金申请人向保险人申请给付保险金时，应提交以下材料。保险金申请人因特殊原因不能提供以下材料的，应提供其他合法有效的材料。<strong>保险金申请人未能提供有关材料，导致保险人无法核实该申请的真实性的，保险人对无法核实的部分不承担给付保险金责任。</strong>
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（一）身故保险金申请</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）保险金给付申请书；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）保险金申请人的有效身份证明；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）乘车证明；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）中华人民共和国境内二级及以上的公立医院或保险人认可的医疗机构出具的被保险人死亡证明，或人民法院出具的宣告死亡证明文件，以及公安部门出具的被保险人的户籍注销证明；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（5）保险金申请人所能提供的与确认保险事故的性质、原因、损失程度等有关的其他证明和资料；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（6）监护人代无民事行为能力人或者限制民事行为能力人申领保险金的，应提供监护人的有效身份证明等资料；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（7）委托他人申领保险金的，应提供授权委托书原件、委托人和受托人的有效身份证明等相关证明文件。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（二）伤残保险金申请</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）保险金给付申请书；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）保险金申请人的有效身份证明；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）乘车证明；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）中华人民共和国境内二级及以上的公立医院或保险人认可的医疗机构或司法鉴定机构出具的伤残鉴定诊断书；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（5）保险金申请人所能提供的与确认保险事故的性质、原因、损失程度等有关的其他证明和资料；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（6）监护人代无民事行为能力人或者限制民事行为能力人申领保险金的，应提供监护人的有效身份证明等资料；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（7）委托他人申领保险金的，应提供授权委托书原件、委托人和受托人的有效身份证明等相关证明文件。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（三）医疗费用保险金申请</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）保险金给付申请书；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）保险金申请人的有效身份证明；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）乘车证明；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）中华人民共和国境内二级及以上公立医院或保险人认可的医疗机构出具的入院出院证明、诊断证明、医疗费用原始收据及明细清单、病历资料；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（5）保险金申请人所能提供的与确认保险事故的性质、原因、损失程度等有关的其他证明和资料；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（6）监护人代无民事行为能力人或者限制民事行为能力人申领保险金的，应提供监护人的有效身份证明等资料；</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（7）委托他人申领保险金的，应提供授权委托书原件、委托人和受托人的有效身份证明等相关证明文件。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十三条 保险金申请人向保险人请求给付保险金的诉讼时效期间为二年，自其知道或者应当知道保险事故发生之日起计算。</p>
								<h2 style="text-align:center;">争议处理和法律适用</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十四条 因履行本保险合同发生的争议，由当事人协商解决。协商不成的，提交保险单载明的仲裁机构仲裁；保险单未载明仲裁机构或者争议发生后未达成仲裁协议的，依法向人民法院起诉。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十五条 与本保险合同有关的以及履行本保险合同产生的一切争议处理适用中华人民共和国法律（不包括港、澳、台地区法律）。</p>
								<h2 style="text-align:center;">其他事项</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十六条 在本保险合同成立后、保险责任开始前，投保人可以书面形式通知保险人解除本保险合同，本保险合同自保险人接到保险合同解除通知之时起解除。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>在本保险合同成立后、保险责任开始前，经铁路部门同意对保险单所对应的乘车凭证进行退票的，本保险合同自退票成功之时起自动解除</strong> 。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>保险责任开始后，投保人不得要求解除本保险合同</strong> 。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十七条 本保险合同依据第二十六条约定解除的，除另有约定外，<strong>保险人可以向投保人收取应交保险费20%的手续费，</strong> 并在三十日内向投保人退还保险费。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十八条 保险事故发生后，被保险人若因急诊等特殊情况未在保险人指定或认可的医疗机构治疗的，应在三日内通知保险人，并根据病情及时转入保险人指定或认可的医疗机构。若确需在非保险人指定或认可的医疗机构治疗的，应向保险人提出书面申请，保险人在接到申请后三日内给予答复。对于保险人同意在其他医疗机构治疗的，保险人对该期间发生的医疗费用按本保险合同约定承担给付医疗费用保险金责任。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二十九条 投保人、被保险人通过保险人同意或认可的网站投保或者对保险合同进行变更，视为投保人、被保险人的书面申请。投保人、被保险人、受益人向保险人在线提交的电子信息与向保险人提交的纸质文件具有相同的法律效力。</p>
								<h2 style="text-align:center;">释  义</h2>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第三十条 除另有约定外，本保险合同中的下列词语具有如下含义：</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;书面形式：指合同书、信件和数据电文（包括电报、电传、传真、电子数据交换和电子邮件）等可以有形地表现所载内容的形式。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乘车凭证：指铁路旅客运输合同凭证，包括纸质车票、电子车票及铁路部门认可的其他乘车凭证。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保险人：指与投保人签订本保险合同的中国铁路财产保险自保有限公司及各分支机构。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意外伤害：指以外来的、突发的、非本意的和非疾病的客观事件为直接且单独的原因致使身体受到的伤害。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;故意：指明知自己的行为会产生一定的结果而希望或者放任这种结果的发生。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;恐怖主义：指任何个人或集团运用武力或暴力，以达到政治上的、宗教上的或意识形态上的目的，包括意图影响政府，或致使民众或部分民众处于恐慌。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;猝死：指由于潜在的自然疾病突然发作或恶化而发生的出人意料的急骤死亡。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乘坐境内列车期间：指被保险人持有效乘车凭证通过实名制验证或检票进站时起，至被保险人到站检票出站时止，但不包括被保险人中途下车出站至重新进站期间和被保险人所乘列车在境外运行期间。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保险金申请人：指被保险人、受益人或被保险人的继承人或依法享有保险金请求权的其他人。</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;不可抗力：指不能预见、不能避免并不能克服的客观情况。</p>
							</div>
							<div class="lay-btn">
								<a href="javascript:void(0);" class="btn92s" id="ins_cntract_div_cancel">关闭</a>
							</div>
						</div>
					</div>
				</div>
				<div id="insurance_need2know_div" class="layout" style="display: none;">
					<div class="mark"></div>
					<div class="up-box">
						<div class="up-box-hd">投保须知
							<a href="javascript:void(0);" id="ins_need2know_div_close">关闭</a>
						</div>
						<div class="up-box-bd padding20">
							<div class="contract">
								<div class="name">铁路旅客人身意外伤害保险（指定行程）投保须知</div>
								<p>尊敬的旅客：</p>
								<p>为保障旅客合法权益，中国铁路财产保险自保有限公司为您提供了铁路旅客人身意外伤害保险（以下简称铁路乘意险），特将有关事项告知如下：</p>
								<p>一、旅客购买火车票时可自愿购买铁路乘意险，投保使用证件与本网站规定相同，即：中华人民共和国二代居民身份证、港澳居民来往内地通行证、台湾居民来往大陆通行证、按规定可使用的有效护照。</p>
								<p>二、每张火车票可投保1份铁路乘意险，每份保险费3元，最高保障30万元意外身故、伤残和3万元意外医疗费用；未成年人须由其父母投保，每份保险费1元，最高保障10万元意外身故、伤残和1万元意外医疗费用。</p>
								<p>三、铁路乘意险保险期间自被保险人持有效乘车凭证实名制验证或检票进站时起，至到达有效乘车凭证载明的到站检票出站时止。</p>
								<p>四、投保人不得为无民事行为能力人投保铁路乘意险，父母为其未成年子女投保的，不受此规定限制，但被保险人死亡给付的保险金总和不得超过国务院保险监督管理机构规定的限额。</p>
								<p>五、除父母为其未成年子女投保的以外，本保险合同应经被保险人同意并认可保险金额，否则以死亡为给付保险金条件的条款无效，保险人不承担保险责任。</p>
								<p>六、在12306网站购票并购保的成年父母，若其免费携带一名身高不足1.2米且不满10周岁的子女（经二代身份证核验），可在其购票账户的“我的保险”中领取一份中国铁路保险公司赠送的未成年人铁路乘意险。</p>
								<p>七、在本网站已投保旅客，可在不晚于自火车票所载乘车日期之日起31天内，凭火车票或投保时使用的有效身份证件到车站指定窗口领取保险发票。</p>
								<p>八、投保人应妥善保管火车票、保险发票，以及投保时所使用的有效身份证件，便于出险时查询和核实相关信息。</p>
								<p>九、如需退保，请在保险责任开始前办理退保手续。尚未换取纸质车票且在本网站允许的退票办理时限内的，可在本网站直接办理，否则应到车站指定窗口办理。退票、改签或变更到站时，保险合同将自动解除或批改。</p>
								<p>十、投保人投保时应履行如实告知义务，否则保险人有权依据有关规定解除保险合同并不承担给付保险金责任。</p>
								<p>十一、您可在本网站“我的保险”中查询投保信息，可拨打12306人工查询，也可登录中国铁路保险www.china-ric.com查询和下载保险条款和电子保单，请您仔细阅读并充分理解保险条款、责任免除、保险期间、合同解除等约定。</p>
							</div>
							<div class="lay-btn">
								<a href="javascript:void(0);" class="btn92s" id="ins_need2know_div_cancel">关闭</a>
							</div>
						</div>
					</div>
				</div>
				<!-- <div id="add_ins_failed_div"  style="display: none;" th:if="${canInsurance and (tour_flag=='dc' or tour_flag=='fc')}" th:include="insurance::add_ins_failed_thf"></div> -->
				<div id="renderTicket_div" style="display: none;">
					<div class="mark"></div>
					<div class="up-box">
						<div class="up-box-hd">请点击选择需要快递的车票
							<a href="javascript:void(0);" id="renderTicket_close_id">关闭</a>
						</div>
						<div class="up-box-bd padding20">
							<ul class="sel-ticket" id="sel_ticket_ul"></ul>
							<div class="lay-btn">
								<a href="javascript:void(0);" id="renderTicket_cancel_id" class="btn92">取消</a>
								<a href="javascript:void(0);" id="renderTicket_conf_id" class="btn92s">确认</a>
							</div>
						</div>
					</div>
				</div>
				<div id="renderAddress_div" style="display: none;">
					<div class="mark"></div>
					<div class="up-box">
						<div class="up-box-hd">选择收件地址
							<a href="javascript:void(0);" id="renderAddress_close_id">关闭</a>
						</div>
						<div class="up-box-bd padding20">
							<ul class="sel-place" id="ul_address"></ul>
							<div class="edit-place" id="edit_place" style="display: none;">
								<h3>使用新地址<a href="javascript:void(0);" id="close_add_a" onclick="$.close_a_add();" title="关闭" class="i-close">关闭</a>
</h3>
								<ul>
									<li><span class="label w70">所在地址：</span>
										<select id="select_sf" style="width:75px;">
											<option>请选择省</option>
										</select>
										<select id="select_sq" style="width:75px;">>
											<option>请选择市</option>
										</select>
										<select id="select_xc" style="width:90px;">
											<option>请选择区/县</option>
										</select>
										<select id="select_town" value="" disabled="disabled" style="color: #999;">
											<option>请选择乡镇（周边地区）</option>
										</select>
										<select id="select_area" value="" disabled="disabled" style="color: #999;width:110px;">
											<option>请选择附近区域</option>
										</select>
									</li>
									<li style="display: none;"><span class="tips-text-errow" style="margin-left:70px" id="select_sf_err"></span>
									</li>
									<li><span class="label w70">详细地址：</span>
										<input type="text" id="detail_address" class="inptxt xxdz" style="width: 380px;" />
										<span id="name_rule" style="color:#FF7F00;">(地址填写规则)</span>
									</li>
									<li style="display: none;"><span class="tips-text-errow" style="margin-left:70px" id="detail_address_err"></span>
									</li>
									<li><span class="label w70">收件人：</span>
										<input type="text" id="user_name" class="inptxt" />
										<span style="display: none;" class="tips-text-errow" id="user_name_err"></span>
									</li>
									<li><span class="label w70">手机号码：</span>
										<input type="text" id="user_tel" class="inptxt" />
										<span style="display: none;" class="tips-text-errow" id="user_tel_err"></span>
									</li>
									<li class="check-item"><input type="checkbox" class="check" id="default_address" />
										<label for="default_address" style="cursor: pointer;">设为默认地址</label>
									</li>
								</ul>
							</div>
							<div class="place-tool">
								<div class="place-tool-in">
									<a href="/otn/address/init">维护车票快递地址</a>
									|
									<a id="a_show_b" href="javascript:void(0);" onclick="$.page(&#39;b&#39;);" showmor="0">上一页</a>

									|
									<a id="a_show_a" href="javascript:void(0);" onclick="$.page(&#39;a&#39;);" showmor="0">下一页</a>
									<a onclick="$.checkHasLoad(&#39;reload&#39;,false,true)" href="javascript:void(0);" class="i-re" title="刷新"></a>
								</div>
							</div>
							<div class="lay-btn">
								<a href="javascript:void(0);" id="renderAddress_conf_id" class="btn92s" style="margin-left: 60px;">确定</a>
							</div>
						</div>
					</div>
					<div id="address_tips" class="name-tips" style="z-index:30000;">
						<ul>
							<li>例如您的地址为：北京市海淀区学院南路中国铁道科学研究院A号楼1109室；</li>
							<li>依次选择省：北京；选择市：北京市；选择区/县：海淀区；选择乡镇（周边地区）：学院南路；选择附近区域：铁科院；</li>
							<li>详细地址只需填写：A号楼1109室</li>
							<li>注意事项：周边地区、附近区域依照就近原则选择；详细地址不需重复填写已选的省市区等信息</li>
						</ul>
					</div>
				</div>
				<div id="datetime_div" class="up-box up-sel-time" style="display: none;z-index: 2000; position: absolute;">
					<div class="up-box-hd">
						<a href="javascript:void(0);" onclick="$(&#39;#datetime_div&#39;).hide();">关闭</a>
						<ul class="hd-item">
							<li class="on" id="head_time" onclick="$.switch_time_hour(true,1)">选择时间段</li>
							<!-- li id="head_hour" onclick="$.switch_time_hour(false,1)">设置时间点</li -->
						</ul>
					</div>
					<div class="up-box-bd">
						<div class="bd-item" style="display:block;">
							<ul class="sel-time" id="hour_choose">
								<li onclick="$.chooseHour(this);" class="odd" cvalue="上午 08:00~12:00">
									<!-- a href="javascript:void(0);" class="ico"></a -->
									上午（08:00~12:00）</li>
								<li onclick="$.chooseHour(this);" cvalue="下午 13:00~18:00">
									<!--a href="javascript:void(0);" class="ico"></a -->
									下午（13:00~18:00）</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="dialog_prompt_ps" style="display: none;">
					<div class="mark"></div>
					<div class="up-box">
						<div class="up-box-hd">温馨提示
							<a href="javascript:" id="dialog_prompt_ps_close">关闭</a>
						</div>
						<div class="up-box-bd">
							<div class="up-con clearfix"><span class="icon i-opt"></span>
								<div class="r-txt">
									<div class="tit">确认取消该条配送信息吗?</div>
									<P></P>
								</div>
							</div>
							<div class="lay-btn">
								<a href="javascript:" id="dialog_prompt_ps_cancel" class="btn92">取消</a>
								<a href="javascript:" id="dialog_prompt_ps_ok" class="btn92s">确认</a>
							</div>
						</div>
					</div>
				</div>
				<div id="cntract_div" class="layout" style="display: none;">
					<div class="mark"></div>
					<div class="up-box">
						<div class="up-box-hd">车票快递服务协议
							<a href="javascript:void(0);" id="cntract_div_close">关闭</a>
						</div>
						<div class="up-box-bd padding20">
							<div class="contract">
								<div class="name">甲方：中国铁路客户服务中心网站注册用户&nbsp;&nbsp;&nbsp;&nbsp;乙方：中铁快运股份有限公司</div>
								<div class="name"></div>
								<h2>1．约定事项</h2>
								<p>甲方在铁路客户服务中心网站购票后，委托乙方将所购车票换取纸质车票，在订单日期的次日，送达至甲方指定的收件人、地址，并支付车票快递服务费。</p>
								<h2>2．适用车票</h2>
								<p>对票面记载开车时间为订单日期的第三日及其以后，且乘车人身份证件为有效的可识读二代居民身份证购买的全价票（含“折”字票）和随行儿童票办理快递业务。</p>
								<h2>3．费用及支付</h2>
								<p>车票快递服务按件收费，每件一个地址，不超过5张车票。</p>
								<p>车票快递服务费由乙方依据国家有关规定确定。甲方在网站上与购票票款一并支付，乙方在送达车票时提供服车票快递务费的发票。</p>
								<h2>4．签收</h2>
								<p>车票送达时，甲方指定的收件人应出示本人有效身份证件原件，并与快递员共同核对车票记载车次、发车日期、乘车人等信息。核对正确后，收件人应在配送标签上签字确认。收件人未签字确认的，乙方将车票回收，待乙方恢复电子客票状态后，乘车人可自行办理改签、退票、换取纸质车票等业务。</p>
								<p>甲方未成功签收的，乙方将退还快递服务费。</p>
								<h2>5．甲方的权利和义务</h2>
								<p>（1）甲方有权在双方约定时间内收到快递的车票；</p>
								<p>（2）甲方应正确、完整、规范地填写收件地址、收件人姓名、手机号码等信息，并确保收件人在约定时间、地址接收车票，接收完毕在配送标签上签字确认；</p>
								<p>（3）甲方有权在预定车票快递服务时起至票面记载乘车日期30天内获得免费的信息查询服务；</p>
								<p>（4）甲方有权取消快递服务。</p>
								<h2>6．乙方的权利和义务</h2>
								<p>（1）乙方应根据约定提供安全、及时的车票快递服务；</p>
								<p>（2）除车票快递及相应的代办换取纸质车票服务外，乙方不办理关于车票的其他业务；</p>
								<p>（3）保证甲方个人信息安全、不外泄。</p>
								<h2>7．责任免除条款</h2>
								<p>对以下损失，乙方不负赔偿责任：（1）因不可抗力造成延误派送、无法派送的；（2）因甲方收件信息填写错误、地址无人签收、电话无人接听、收件人拒收等原因造成车票未能及时送达的；（3）不承担因车票快递服务带来的延迟办理退票手续可能造成手续费增加的责任；（4）甲方自预定车票快递服务起满一年未提出异议的；（5）基于车票可能获得的收益、利润、实际用途、商业机会、商业价值等任何直接、间接损失。</p>
								<h2>8．争议解决：因履行本协议发生的争议，由当事人协商解决，协商不成的，可以向乙方所在地法院提起诉讼。</h2>
								<h2>9．《铁路车票快递服务须知》为本协议一部分，乙方保留修改、解释的权利。</h2>
								<h2>10．本协议条款未作规定的，或者本协议条款与法律法规相冲突的，按照法律法规执行。</h2>
							</div>
							<div class="lay-btn">
								<a href="javascript:void(0);" class="btn92s" id="cntract_div_cancel">关闭</a>
								<!--  
        	<a href="javascript:void(0);" class="btn92" id="cntract_div_cancel">不同意</a>
        	<a href="javascript:void(0);" class="btn92s" id="cntract_div_conf">同意</a>
        	-->
							</div>
						</div>
					</div>
				</div>
				<div id="cntract_div_b" class="layout" style="display: none;">
					<div class="mark"></div>
					<div class="up-box">
						<div class="up-box-hd">铁路车票快递服务协议
							<a href="javascript:void(0);" id="cntract_div_close_b">关闭</a>
						</div>
						<div class="up-box-bd padding20">
							<div class="contract">
								<div class="name">甲方：中国铁路客户服务中心网站注册用户（购票人）&nbsp;乙方：京铁物流有限公司</div>
								<div class="name"></div>
								<h2>一、约定事项</h2>
								<p>1.甲方在铁路客户服务中心网站购票后，委托乙方将所购车票换取纸质车票，按双方约定时间，由乙方的客户代表送达至甲方指定的地址交付给收件人，并支付车票快递服务费。</p>
								<p>2.甲方在铁路客户服务中心网站购票，没有如实、正确填写乘车人使用的有效身份证件等信息，致使乘车人持送达的车票无法进站、乘车等所引起的一切后果由甲方承担。</p>
								<p><strong>3.甲方已经阅读《铁路车票快递服务须知》，并作为本协议一部分共同执行。</strong>
								</p>
								<h2>二、适用车票</h2>
								<p>由于网络购票至送达收件人车票期间需要换取纸质车票及分拣等多项作业过程，甲方对本协议和<strong>《铁路车票快递服务须知》</strong> 确定的送票服务均认可为车票快递服务,购票人在网站购票时，符合以下条件的，可自愿选择车票快递服务。
								</p>
								<p>1．购票人应保证在铁路客户服务中心网站购票填写的乘车人有效身份证件真实有效，中华人民共和国公民须使用身份证购票乘车，港、澳居民须使用来往内地通行证购票乘车，台湾居民须使用来往大陆通行证购票乘车，外籍人员须使用护照购票乘车。</p>
								<p>2．使用有效证件在网站购买的全价票（含“折”字票）和儿童票、残疾军人<strong>（伤残警察）</strong> 优惠票，不含学生票。
								</p>
								<p>3．购票人选择车票快递，通过与快递企业订立本协议予以确认。</p>
								<h2>三、送达时限</h2>
								<p>车票快递的服务时间为<strong>6：00-22：00</strong> ，凡购买当日和次日开车的车票不配送，购买第三日及以后开车的车票可以配送：
								</p>
								<p>a)开车时间为第三日<strong>0:00-12:00</strong> 间的车票，于第二日
									<strong>20:00</strong> 以前送达（交付凭证用特殊标记标识）；
								</p>
								<p>b)开车时间为第三日<strong>12:01-24:00</strong> 间的车票，于开车前5小时送达；
								</p>
								<p>c)开车时间为第四日<strong>0:00-12:00</strong> 之间开车的车票，于第三日
									<strong>20:00</strong> 前送达。
								</p>
								<p>d)其他车票，自购票日3日内送达。</p>
								<h2>四、快递服务费及支付</h2>
								<p>车票快递服务按件收费，同一地址同一收件人（乘车人），不超过5张车票，按17元收取；超出数量为1-5张时，按2件收费；以此类推。甲方成功签收任意一张车票，即应按件向乙方支付快递服务费。</p>
								<p>快递服务费由甲方在网站上与购票票款一并支付，乙方在送达车票时提供相应发票；整单未交付时，退还车票快递服务费。</p>
								<h2>五、签收</h2>
								<p>车票送达时，甲方要提供收件人（乘车人）有效身份证件原件，当乘车人使用有效证件为港、澳居民来往内地通行证、台湾居民来往大陆通行证、外籍人员护照时须查看证件原件后交付；购买车票为残疾军人<strong>（伤残警察）</strong> 优惠车票时须查看《中华人民共和国残疾军人证》或《中华人民共和国伤残人民警察证》
									<strong>原件</strong> 后交付。对于交付的车票，收件人核对车票无误后签字确认。
								</p>
								<p>收件人委托他人代收（简称代收人）时，客户代表需要通过电话与登记的收件人进行核实，由收件人向客户代表发送手机短信明示代收人姓名、性别、年龄和特此代收授权等内容。客户代表同时要查验代收人有效身份证件原件并由代收人在签收联签字，客户代表登记代收人证件号码后交付车票。</p>
								<p>因甲方原因造成车票无法交付时，待网站恢复车票状态后，甲方可自行办理改签、退票、换取纸质车票等相关业务。</p>
								<h2>六、甲方的权利和义务</h2>
								<p>1.甲方保证在铁路客户服务中心网站购票使用的身份证件真实有效。</p>
								<p>2.甲方有权在双方约定时间内收到快递的车票。</p>
								<p>3.甲方应正确、完整、规范地填写详细的收件地址、收件人姓名、手机号码等信息，并确保收件人持有效身份证件原件在约定时间期限、地址接收车票。</p>
								<p>4. 甲方有权在预定车票快递服务日起至车票载明开车日后30日内获得免费信息查询服务；包括物流信息、12306网站购票信息。</p>
								<p>5. 甲方在乙方换取纸质车票前有权取消车票快递服务，并由乙方返还车票快递服务费。</p>
								<h2>七、乙方的权利和义务</h2>
								<p>1.乙方快递服务客户代表应佩戴规定“车票快递服务客户代表”证件上门服务。</p>
								<p>2.乙方应保证在约定时间内将车票送达收件人。</p>
								<p>3.车票送达时，乙方有权按本协议第五条核验收件人（乘车人）有效身份证件原件。</p>
								<p>4.保证甲方个人信息安全、不外泄。</p>
								<p>5.对未送达车票，及时恢复车票的原始状态。</p>
								<h2>八、责任免除条款</h2>
								<p>1.因不可抗力造成延误派送、无法派送的，双方均不承担责任。</p>
								<p>2.因甲方收件信息填写错误、无人签收、电话无人接听、收件人拒收等原因造成车票未能适时送达的，及引发的延迟办理退票和产生的相关损失，乙方不承担相应责任。</p>
								<p>3.整单未交付时，甲方不承担车票快递服务费。</p>
								<p>4.基于车票可能获得的收益、利润、商业机会、商业价值等任何直接、间接损失，乙方不承担任何责任。</p>
								<h2>九、双方共同声明</h2>
								<p>甲、乙双方均承诺依法购票和履行本协议，共同谴责倒卖火车票的不法行为。</p>
								<h2>十、争议解决</h2>
								<p>因履行本协议发生的争议，由当事人协商解决。协商不成的，须向有管辖权的法院提起诉讼。</p>
							</div>
							<div class="lay-btn">
								<a href="javascript:void(0);" class="btn92s" id="cntract_div_cancel_b">关闭</a>
								<!--  
        	<a href="javascript:void(0);" class="btn92" id="cntract_div_cancel_b">不同意</a>
        	<a href="javascript:void(0);" class="btn92s" id="cntract_div_conf_b">同意</a>
        	-->
							</div>
						</div>
					</div>
				</div>
				<div class="qp-info" id="qp_info">
					<div class="hd">取票方式：<span class="mr15"><input type="radio" checked="checked" name="qp" id="qpfs_zq" />
<label for="qpfs_zq" style="cursor: pointer;">自取</label>
</span>
						<span><input type="radio" name="qp" id="qpfs_sp" />
<label for="qpfs_sp" style="cursor: pointer;">车票快递</label>
<span id="contract_agree_id" style="margin-left: 15px;display: none;"><input id="_agree_id" name="_agree_name" type="checkbox" value="0" />

 	     		本人已阅读并同意网站公布的
 	     		<a href="javascript:void(0);" onclick="$.showCntract(&#39;b&#39;);">《京铁物流快递车票协议》</a>
和
 	     		<a href="javascript:void(0);" onclick="$.showCntract();">《中铁快运快递车票协议》</a>
。
 	     	</span>
						</span>

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="display: none;" id="deliver_msg"></span>
					</div>
					<div class="bd" id="detail_logistics" style="display: none;">
						<table class="table-c">
							<colgroup>
								<col width="40" />
								<col />
								<col width="200" />
								<col width="70" />
								<col width="235" />
								<col width="70" />
							</colgroup>
							<tbody id="ps_body">
								<tr>
									<th>序号</th>
									<th>快递车票信息</th>
									<th>收件地址</th>
									<th>物流企业</th>
									<th>配送规则</th>
									<th>快递确认</th>
								</tr>
								<tr id="wl_tr_1">
									<td>第1件</td>
									<td id="addTicket_1"><span class="sel-sp sel-add" onclick="$.renderTicket(this)">请点击选择需要快递的车票</span>
									</td>
									<td id="addAddress_1"><span class="sel-sp sel-add" onclick="$.checkHasLoad(this,false,false)">选择配送地址</span>
									</td>
									<td id="price_1"></td>
									<td id="rule_1" style="text-align:left;padding-left:5px;"></td>
									<td id="operate_1">
										<div>
											<a href="javascript:void(0);" onclick="$.preCancel(this,true);" class="btn72" style="width:55px;">取消</a>
										</div>
										<div>
											<a href="javascript:void(0);" onclick="$.saveInfo(this,true);" class="btn72" style="width:55px;margin-top: 10px;">保存</a>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="side-left">
										<a href="javascript:void(0);" class="add" onclick="$.addPSXX();">增加配送件数</a>
									</td>
									<td colspan="3" class="side-right">
										<div class="total-box">
											<div class="item"><strong>快递费：</strong>
												<span class="price" id="total_kdf"></span>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="total-box">
				   
					<c:forEach items="${orderinfos}" var="map">
                     <c:set var="sum" value="0"/>
                    <c:if test="${fn:containsIgnoreCase(fn:trim(map.key),fn:trim(oid))}" var="flag">
					<c:forEach items="${map.value}" var="childList" varStatus="status">
					<c:set var="sum" value="${sum+childList.price}"/>
					 </c:forEach>
					<div class="item">总票价：<span class="price" id="total_ticket_price">${sum} 元</span>
					</div>
						
					
					<div class="item" style="display: none;">快递费：<span class="price" id="total_wl_price">-</span>
					</div>
					<div class="item" style="display: none;">保险费：<span class="price" id="total_ins_price">-</span>
					</div>
					<div class="item" style="display: none;">付款总额：<span class="price" id="total_all_price">${orderSeat.price} 元</span>
					</div>
				</div>
				<div class="notice" style="width: 910px;" id="scroll"><strong>公告：</strong>
					<div class="notice_in">
						<ul>
							<li>
								<a href="#nogo" style="color: red;" shape="rect">铁路12306网站已在北京铁路局、昆明铁路局、广州铁路（集团）公司、成都铁路局管辖范围内开展车票快递服务，如您有需要，请点选上方的“车票快递”。</a>
							</li>
						</ul>
					</div>
					<a href="#nogo" class="i-close" shape="rect"></a>
				</div>
				<div class="lay-btn bt_blue">
					<!-- th:if="${tour_flag eq 'wc'}"  -->
					<!-- 往返车次按钮 -->
					<!-- 往返车次按钮 -->
					<!-- 单程车次按钮 -->
					<p>
						<a href="OrderServlet?method=outOrder&oid=${oid}" class="btn92" id="cancelButton" shape="rect">取消订单</a>
						<span><a href="OrderServlet?method=payMoney&oid=${oid}&money=${sum}" class="btn92s" id="payButton" shape="rect">网上支付</a>
</span>
					</p>
					</c:if>
					</c:forEach>
					<!-- 改签车次按钮 -->
					<!-- 积分支付成功form表单 -->
				</div>
				<div class="tips-box">
					<p><code id="dcfc_wxts_1"><span style="font-size: 14px;font-weight:bold;color:black">温馨提示：</span>
<br clear="none" />

	        	1. 请在指定时间内完成网上支付。<br clear="none" />
 
        		2. 逾期未支付，系统将取消本次交易。<br clear="none" />

        		3. 在完成支付或取消本订单之前，您将无法购买其他车票。<br clear="none" />

        		4. 退票费如下核收：开车前15天（不含）以上退票的，不收取退票费；票面乘车站开车时间前48小时以上的按票价5%计，24小时以上、不足48小时的按票价10%计，不足24小时的按票价20%计。  开车前48小时～15天期间内，改签或变更到站至距开车15天以上的其他列车，又在距开车15天前退票的，仍核收5%的退票费。 办理车票改签或“变更到站”时，新车票票价低于原车票的，退还差额，对差额部分核收退票费并执行现行退票费标准。上述计算的尾数以5角为单位，尾数小于2.5角的舍去、2.5角以上且小于7.5角的计为5角、7.5角以上的进为1元。退票费最低按2元计收。 改签或变更到站后的车票乘车日期在春运期间的，退票时一律按开车时间前不足24小时标准核收退票费。2017年春运期间为1月13日至2月21日。<br clear="none" />

        		5. 保险费3元，最高保障30万元意外身故、伤残和3万元意外医疗。未成年人须由其父母投保，保险费1元，最高保障10万元意外身故、伤残和1万元意外医疗。<br clear="none" />

        		6. 请您充分理解保险责任、责任免除、保险期间、合同解除等约定，凭电子保单查询号登陆<a shape="rect" href="http://www.china-ric.com" target="_blank">www.china-ric.com</a>
查看电子保单。
        	</code>
						<code id="dcfc_wxts_2" style="display: none;"><span style="font-size: 14px;font-weight:bold;color:black">温馨提示：</span>
<br clear="none" />

        		1. 请点击车票，选择/取消配送的车票。<br clear="none" />

                2. 车票快递服务按件收费，每件限一个地址，且不超过5张车票。<br clear="none" />

	        	3. 车票快递服务费由快递（物流）企业按照国家有关规定确定，网站代为收取。<br clear="none" />
 
        		4. 除购买当日和次日开车的车票不提供快递服务外，其他均可选择快递服务。<br clear="none" />

        		5. 车票快递城市和地址范围以12306网站公布为准，超出区域暂不提供快递服务。<br clear="none" />
 
        		6. 您最多可添加20个车票配送地址，对已支付的地址30天内不可再删除与修改。 <br clear="none" />
 
        		7. 车票快递的服务时间为6：00-22：00。<br clear="none" />
 
        		8. 请您先选择省、市、区/县、街道/镇信息，然后在填写框中填写具体地址、门牌号码、单位等信息，并请准确填写收件人姓名和手机号码。<br clear="none" />
 
        		9. 开车时间为第三日0:00-12:00的车票，于第二日20:00以前送达；开车时间为第三日12:01-24:00的车票，于开车前5小时送达；开车时间为第四日0:00-12:00的车票，于第三日20:00前送达；其他车票，自购票日3日内送达。<br clear="none" />
 
        		10. 填写快递信息完毕后，请您点击“网上支付”完成快递费与购票票款的一并支付，快递（物流）企业送票人员在送达车票时提供车票快递服务费的发票。<br clear="none" />
 
        		11. 请在指定时间内完成网上支付； 逾期未支付，系统将取消本次交易；在完成支付或取消本订单之前，您将无法购买其他车票。<br clear="none" />

        		12. 退票费如下核收：开车前15天（不含）以上退票的，不收取退票费；票面乘车站开车时间前48小时以上的按票价5%计，24小时以上、不足48小时的按票价10%计，不足24小时的按票价20%计。  开车前48小时～15天期间内，改签或变更到站至距开车15天以上的其他列车，又在距开车15天前退票的，仍核收5%的退票费。 办理车票改签或“变更到站”时，新车票票价低于原车票的，退还差额，对差额部分核收退票费并执行现行退票费标准。上述计算的尾数以5角为单位，尾数小于2.5角的舍去、2.5角以上且小于7.5角的计为5角、7.5角以上的进为1元。退票费最低按2元计收。 改签或变更到站后的车票乘车日期在春运期间的，退票时一律按开车时间前不足24小时标准核收退票费。2017年春运期间为1月13日至2月21日。
        	</code>
					</p>
				</div>
			</div>
		</div>
		<!--订单信息 结束-->

		<!-- 彈出警告框 -->
		<div class="up-box w600" style="display: none;" id="confirmPrice">
			<div class="up-box-hd">交易提示
				<a id="close_conifrmdialog_id" href="javascript:" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit">您所选的车票中有低于50元的车票</div>
						<P>所兑车票票价低于50元时，每张车票将扣除5000积分。</P>
						<p>如您同意支付，请按“确认”按钮。</p>
					</div>
				</div>
				<div class="lay-btn">
					<a id="cancel_dialog" href="javascript:" class="btn92" shape="rect">取消</a>
					<a href="javascript:" class="btn92s" id="goto_integration" shape="rect">确认</a>
				</div>
			</div>
		</div>
		<!-- 彈出警告框 -->
		<div class="up-box w600" style="display: none;" id="confirmToPay">
			<div class="up-box-hd">支付提示
				<a id="close_confirmToPay" href="javascript:" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit">您包含未保存的物流单信息</div>
						<p>如您继续支付，请按“确定”按钮。</p>
					</div>
				</div>
				<div class="lay-btn">
					<a id="cancel_confirmToPay" href="javascript:" class="btn92" shape="rect">取消</a>
					<a href="javascript:" class="btn92s" id="conf_confirmToPay" shape="rect">确认</a>
				</div>
			</div>
		</div>
		<!-- 网上支付提示信息 开始  <a href="javascript:" id="online_dialog_close">关闭</a>-->
		<div class="up-box w600" style="display:none;" id="waitpay_online">
			<div class="up-box-hd">网上支付提示</div>
			<div class="up-box-bd">
				<div class="up-con clearfix">
					<!-- <span class="icon i-work"></span> -->
					<span class="icon"><img src="/otn/resources/images/working.gif" />
</span>
					<div class="r-txt">
						<P class="ft14">支付完成前，请不要关闭此支付验证窗口。<br clear="none" /> 支付完成后，请根据您支付的情况点击下面按钮。
						</P>
					</div>
				</div>
				<div class="lay-btn">
					<a href="javascript:" class="btn92" id="online_have_question" shape="rect">支付遇到问题</a>
					<a href="javascript:" class="btn92s" id="finish_pay_order" shape="rect">支付完成</a>
				</div>
			</div>
		</div>
		<!-- 网上支付提示 结束 -->
		<!-- 取消改签提示 开始 -->
		<div class="up-box w600" style="display:none;" id="cancel_resign_id">
			<div class="up-box-hd">交易提示
				<a href="javascript:" id="cancel_resign_close" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit"></div>
						<P class="colorA">一天内<strong>3次</strong> 申请车票成功后取消 ，
							<strong>当天</strong> 将不能在网站购票。
						</P>
					</div>
				</div>
				<div class="lay-btn">
					<a href="javascript:" class="btn92" id="cancel_resign_cr" shape="rect">取消</a>
					<a href="javascript:" class="btn92s" id="cancel_resign_ok" shape="rect">确认</a>
				</div>
			</div>
		</div>
		<!-- 取消改签提示 结束 -->
		<!-- 取消订单提示 开始 -->
		<div class="up-box w600" style="display:none;" id="cancel_order_id">
			<div class="up-box-hd">交易提示
				<a href="javascript:" id="cancel_order_close" shape="rect">关闭</a>
			</div>
			<div class="up-box-bd" id="content">
				<div class="up-con clearfix"><span class="icon i-opt"></span>
					<div class="r-txt">
						<div class="tit">您确认取消订单吗？</div>
						<P>一天内3次申请车票成功后取消订单，当日将不能在网站购票！</P>
					</div>
				</div>
				<div class="lay-btn">
					<a href="javascript:" class="btn92" id="cancel_order_co" shape="rect">取消</a>
					<a href="javascript:" class="btn92s" id="cancel_order_ok" shape="rect">确认</a>
				</div>
			</div>
		</div>
		<!-- 取消订单提示 结束 -->
		<form id="_es_hiddenform" method="post" enctype="application/x-www-form-urlencoded"><input type="hidden" name="_json_att" value="" />
		</form>
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
		<div class="mask" id="ztky_mask" style="display: none;"></div>
		<div class="new-tips" style="left: 330px; top: 400px;display: none;" id="ztky_f_content"><i></i>
			<a href="javascript:void(0);" class="close" id="ztky_f_close" shape="rect">关闭</a>
			<img src="/otn/resources/images/bg08.png" width="387" height="143" />
		</div>
		<!-- 保险mask -->
		<div class="mask" id="ins_mask" style="display: none;"></div>
		<div class="new-tips" style="left: 330px; top: 400px;display: none;height:160px;width:217px;" id="ins_f_content"><i style="left:-43px;top:-20px;"></i>
			<a href="javascript:void(0);" class="close" id="ins_f_close" style="top:10px;" shape="rect">关闭</a>
			<img src="/otn/resources/images/ins_tip.jpg" width="217px" height="160px" />
		</div>
		<!-- 保存保险提示信息弹出层 开始    -->
		<div id="ins_failed_div_2" style="display: none;">
			<div class="mark"></div>
			<div class="up-box">
				<div class="up-box-hd">保存保险提示</div>
				<div class="up-box-bd">
					<div class="up-con clearfix"><span class="icon i-warn"></span>
						<div class="r-txt">
							<div class="tit"></div>
							<P></P>
						</div>
					</div>
					<div class="lay-btn">
						<a href="javascript:" id="ins_return_to_modify" class="btn92" shape="rect">返回修改</a>
						<a href="javascript:" id="pay_order_without_ins" class="btn92s" shape="rect">忽略保险</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 保存保险提示信息弹出层 结束    -->
	</body>

</html>
