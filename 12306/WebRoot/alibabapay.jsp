<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>在线支付</title>
		<script type="text/javascript" src="js/jquery-1.11.0.js">
</script>
	</head>
	<script type="text/javascript">
$(function(){


    var s=179;
    setInterval(function(){
        if(s<10){
            $('#aqrc-expires').html('0'+s);
        }else{
        	$('#aqrc-expires').html(s);
        }
        s--;
    },1000)
    
    var b = setInterval(function(){
    $.ajax({
    url:'CheckServlet',
    type:'POST',
    async:true,
    data:{ono:'${param.outTradeNo}'},
    dataType:'json',
    success:function(data){
   
    if(data.success){
     clearInterval(b);
     window.location="success.jsp";
    }
    }
    })
    },1000);
    
  
    
})

</script>

	<style type="text/css">
#head {
	position: absolute;
	top: 30px;
	left: 560px;
	font-size: 40px;
	color: blue;
}

#aibaba {
	position: absolute;
	top: 100px;
	left: 300px;
}

#imasg {
	position: absolute;
	top: 100px;
	left: 700px;
}

#wwwwpo {
	position: absolute;
	top: 550px;
	left: 520px;
}
</style>
	<body>

		<div class="window-wrapper" id="alqrcode-pay-window">
			<div class="window">
				<div class="window-opt">
				</div>
				<div id="head" class="window-header">
					支付宝扫码支付
				</div>
				<div class="window-body" style="height: 490px;">
					<div id="aibaba"
						style="display: inline-block; padding: 20px 20 50 10px; width: 330px;">
						<p style="margin-bottom: 15px; text-align: center;">
							还剩
							<span id="aqrc-expires" class="red" style="color: red;"></span>秒，二维码将自动刷新
						</p>
						<p>
							<img src="${param.fileName}" id="alipay-qrcode"
								style="border: 1px solid #b2b2b2; width: 328px; height: 328px" />
						</p>
					</div>
					<div id="imasg" class="clear"
						style="float: right; padding-right: 25px;">
						<div>
							<img
								src="http://cdn.orayimg.com/payment/img/alipay_exp_160215.jpg" />
						</div>
					</div>
					<div id="wwwwpo">
						<div class="gray"
							style="margin-top: 20px; clear: both; text-align: center">
							若支付完成后，长时间未跳转请
							<a href="http://service.oray.com/contact/" target="_blank"
								class="red" style="color: #e7003c;">联系客服</a>
						</div>
						<div class="gray"
							style="margin-top: 5px; clear: both; text-align: center">
							<a href="javascript:void(0)" class="close"
								style="color: #6a6a6a;">返回重新选择银行</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
