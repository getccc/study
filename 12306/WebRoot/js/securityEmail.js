$(function() {
	$(".menu-bd").mouseover(function() {
		$($(".menu-list")).attr("style", "display: block;");
	})
	$(".menu-bd").mouseout(function() {
		$($(".menu-list")).attr("style", "display: none;");
	})
	$(".menu-list").mouseover(function() {
		$($(".menu-list")).attr("style", "display: block;");
	})
	$(".menu-list").mouseout(function() {
		$($(".menu-list")).attr("style", "display: none;");
	})

	$(".nav-guide").mouseover(function() {
		$($(".nav-list")).attr("style", "display: block;");
	})
	$(".nav-guide").mouseout(function() {
		$($(".nav-list")).attr("style", "display: none;");
	})
	$(".nav-list").mouseover(function() {
		$($(".nav-list")).attr("style", "display: block;");
	})
	$(".nav-list").mouseout(function() {
		$($(".nav-list")).attr("style", "display: none;");
	})

	$(".label-y").mouseover(function(e) {
		$($(".nav-label")).attr("style", "display: block;");
		$(".nav-label").css("top", $(this).position().top);
	})
	$("#sidebar_menu").mouseout(function(e) {
		$($(".nav-label")).attr("style", "display: none;");
	})

	$("#_email").blur(function() {
		$regex = /^[\w]{6,18}@[a-zA-Z0-9]{2,6}(\.com)(\.cn)?$/;
		if ($regex.test($(this).val())) {
			$("#em").css("display", "none");
		} else {
			$("#em").css("display", "block");
		}
	});

	$("#randCode").click(function() {
		//先获取包含有汉字的href=newurl
			var newurl = $(this).attr("href");
			//alert(newurl)
			//异步请求
			$.ajax( {
				url : newurl,
				type : 'POST',
				data : {},
				success : function(data) {
					alert('成功：' + data)
				},
				error : function(xhr) {
					alert('服务器出错，返回内容：' + xhr.responseText)
				}
			});
			time1 = 120;
			$("#randCode").html( "重新获取("+time1 +")");
			setTime = setInterval(timeout, 1000);// 注意函数名没有引号和括弧！
			$("#randCode").attr( {
				"disabled" : "disabled"
			});
			return false;//加上这个就会阻止向cccc.asp跳转，但是我是希望既向cccc.asp跳转，同时又可以通过ajax向bbbb.asp传递参数，两个页面的参数一样，都在原链接的基础上带上hanzi=可获取汉字的超链接1111111。

		});

	function timeout() {
		time1--;
		$("#randCode").html("重新获取("+time1 +")");
		if (time1 < 0) {
			$("#randCode").html("重新发送验证码");
			$("#randCode").removeAttr("disabled");
			clearInterval(setTime);
		}
	}
})