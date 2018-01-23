<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>在线支付</title>
	</head>
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
	<link rel="stylesheet" href="css/onlinepay.css" />
	<script type="text/javascript">
		function formsubmit(){
			//提交到servelt
			$("#form1").submit()
		}
		function form2submit(){
			//提交到servelt
			$("#form2").submit()
		}
	
	</script>
	<body>

		<div class="box1">
			<!--<iframe marginheight="0" src="pages/web/mb.html" frameborder="0" width="100%" scrolling="no" height="147"></iframe>-->
			<table border="0" align="center" cellpadding="0" cellspacing="0" width="963">
				<tr>
					<td><img src="img/3_r1_c1.jpg" width="186" height="151" /></td>
					<td><img src="img/3_r1_c2.jpg" width="456" height="151" /></td>
					<td><img src="img/3_r1_c5.jpg" width="321" height="151" /></td>
				</tr>
			</table>
		</div>

		<div class="box1">

			<div class="nav1">
				<div class="nav3"><span class="nav3_1">&gt;&gt; 应付金额：</span><span class="nav3_5">${money}元</span></div>
				<!--div class="nav5">请选择支付方式</div-->
			</div>
			<div class="nav1">
				<div class="bank1">

					<form id="form1" action="PayServlet" method="post" name="myform">
						<input type="hidden" value="" name="tranData">
						<input type="hidden" value="01" name="transType">
						<input type="hidden" value="1" name="channelId">
						<input type="hidden" value="0001" name="appId">
						<input type="hidden" value="" name="merSignMsg">
						<input type="hidden" value="122.190.94.106" name="merCustomIp">
						<input type="hidden" value="20170826110310" name="orderTimeoutDate">
						<input type="hidden" name="bankId">
						<input type="hidden" name="businessType">
						<input type="hidden" name="p2_Order" value="${payid}"/><br/>
						<input type="hidden" name="p3_Amt" value="${money}"/><br/>
						

						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"/>
								<img src="img/bank_gsyh2.gif" width="130" height="52" title="工商银行" onclick="formsubmit()" style="cursor:pointer;">
							</div>
						</div>

						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" style=""/>
								<img src="img/bank_nyyh2.gif" width="130" height="52" title="农业银行" onclick="formsubmit()" style="cursor:pointer;">
							</div>
						</div>

						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" style=""/>
								<img src="img/bank_zgyh2.gif" width="130" height="52" title="中国银行" onclick="formsubmit()" style="cursor:pointer;">
							</div>
						</div>

						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" style=""/>
								<img src="img/bank_jsyh2.gif" width="130" height="52" title="建设银行" onclick="formsubmit()" style="cursor:pointer;">
							</div>
						</div>

						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" style=""/>
								<img src="img/bank_zsyh2.gif" width="130" height="52" title="招商银行" onclick="formsubmit()" style="cursor:pointer;">
							</div>
						</div>

						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="POST-NET-B2C" style=""/>
								<img src="img/bank_ycyh.gif" width="130" height="52" title="邮储银行" onclick="formsubmit()" style="cursor:pointer;">
							</div>
						</div>

						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="" style=""/>
								<img src="img/bank_zgyl.gif" width="130" height="52" title="中国银联" onclick="formsubmit()" style="cursor:pointer;">
							</div>
						</div>

						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="" style=""/>
								<img src="img/bank_ztytk.gif" width="130" height="52" title="中铁银通卡" onclick="javascript:formsubmit('00011001','1');" style="cursor:pointer;">
							</div>
						</div>
						</form>
						
						<form id="form2" action="AlibabaPayServlet" method="post">
						<input type="hidden" name="outTradeNo" value="${payid}"/><br/>
						<input type="hidden" name="totalAmount" value="${money}"/><br/>
						<input type="hidden" name="subject" value="火车票"/><br/>
						<div class="bank3">
							<div class="bank3_5">
								<input type="radio" name="pd_FrpId" value="" style=""/>
								<img src="img/bank_zfb.gif" width="130" height="52" title="支付宝" onclick="javascript:form2submit('33000010','1');" style="cursor:pointer;">
							</div>
						</div>			
					</form>
				</div>

				<font color="red" style="font-size:16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
			</div>
			<!-- div class="nav1">
    <div class="btn1"></div>
    <div class="btn3"><a href="#" onclick="formsubmit();"><img src="pages/web/img/btn3.gif" /></a></div>
  </div-->
		</div>

		<div class="box1">
			<div class="footer1">
				<div class="f_desc">
					<ul>
						<li>请您选择支付方式。建议使用中国工商银行、中国农业银行、中国银行、中国建设银行、招商银行、中国邮政储蓄银行的银行卡，支付请直接点击相应银行的按钮；如果您使用其他银行的银行卡，请点击“中国银联”按钮；如果您使用支付宝账户支付，请点击“支付宝”按钮。</li>
						<li>如果您选择银行卡或支付宝账户支付时，请遵守相关银行或支付宝的规定进行操作。您在银行或支付宝页面上进行的任何操作及其产生的任何法律后果，将按照您与银行或支付宝之间签订的合同处理。本网站不承担任何责任。</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="box1">
			<div class="f_ver"><br>
				<a target="_blank" href="http://www.12306.cn/mormhweb/gljd/gywm/">关于我们</a> |
				<a target="_blank" href="http://www.12306.cn/mormhweb/gljd/wzls/">网站声明</a><br> 版权所有 © 2008-2015 中国铁路信息技术中心 中国铁道科学研究院<br> 京ICP备15003716号-3 | 京ICP证150437号</div>
		</div>

	</body>

</html>