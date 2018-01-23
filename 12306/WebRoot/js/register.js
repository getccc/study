$(function() {
	$("#cardType").change(function() {
		if($(this).val() == "C" || $(this).val() == "G") {
			$($(".cardLi")).attr("style", "display:black");
			$(".gjLi").css("display", "none");
		}
		if($(this).val() == "B") {
			$(".cardLi").css("display", "block");
			$(".gjLi").css("display", "block");
		}
		if($(this).val() == "1") {
			$(".cardLi").css("display", "none");
			$(".gjLi").css("display", "none");
		}
	})

	$("#passengerType").change(function() {
		if($(this).val() == "3") {
			$($(".studentType")).attr("style", "display: block;");

		} else {
			$($(".studentType")).attr("style", "display: none;");

		}
	})

	$("#userName").blur(function() {
		$regex = /^[A-Za-z0-9-_]{6,20}$/;
		if($regex.test($(this).val())) {
			$("#eus").css("display", "none");
		} else {
			$("#eus").css("display", "block");
		}
	});

	$("#passWord").blur(function() {
		$regex = /^([\w]{6,20})$/;
		if($regex.test($(this).val())) {
			$("#pw").css("display", "none");
		} else {
			$("#pw").css("display", "block");
		}
	});

	$("#confirmPassWord").blur(function() {
		if($(this).val() == $("#passWord").val()) {
			$("#rp").css("display", "none");
		} else {
			$("#rp").css("display", "block");
		}
	});

	$("#rname").blur(function() {
		$regex = /^([a-zA-Z\u4e00-\u9fa5]{1,3})$/;
		if($regex.test($(this).val())) {
			$("#rn").css("display", "none");
		} else {
			$("#rn").css("display", "block");
		}
	});

	$("#cardCode").blur(function() {
		$regex = /^[4][2][0][0-9]{14}[0-9X]$/;
		if($regex.test($(this).val())) {
			$("#cac").css("display", "none");
		} else {
			$("#cac").css("display", "block");
		}
	});

	$("#email").blur(function() {
		$regex = /^[\w]{6,18}@[a-zA-Z0-9]{2,6}(\.com)(\.cn)?$/;
		if($regex.test($(this).val())) {
			$("#em").css("display", "none");
		} else {
			$("#em").css("display", "block");
		}
	});

	$("#mobileNo").blur(function() {
		$regex = /^[1][5873][0-9]{9}$/;
		if($regex.test($(this).val())) {
			$("#tel").css("display", "none");
		} else {
			$("#tel").css("display", "block");
		}
	});

	$("#name_rule").mouseover(function() {
		$(".name-tips").css("display", "block");
	})
	$("#name_rule").mouseout(function() {
		$(".name-tips").css("display", "none");
	})

	$(".menu-bd").mouseover(function() {
		$(".menu-list").css("display", "block");
	})
	$(".menu-bd").mouseout(function() {
		$(".menu-list").css("display", "none");
	})

	$(".menu-list").mouseover(function() {
		$(".menu-list").css("display", "block");
	})
	$(".menu-list").mouseout(function() {
		$(".menu-list").css("display", "none");
	})

	$(".nav-guide").mouseover(function() {
		$(".nav-list").css("display", "block");
	})
	$(".nav-guide").mouseout(function() {
		$(".nav-list").css("display", "none");
	})

	qwer = function() {
		
		var cardtype = $("#cardType").val();
		var passengertype =$("#passengerType").val();

		if($("#userName").val() != "") {
			$("#eus").css("display", "none");
			var username = $("#userName").val();
		} else {
			$("#eus").css("display", "block");
		}
		if($("#passWord").val() != "") {
			$("#pw").css("display", "none");
			var pass =$("#passWord").val();
		} else {
			$("#pw").css("display", "block");
		}
		if($("#confirmPassWord").val() != "") {
			$("#rp").css("display", "none");
		} else {
			$("#rp").css("display", "block");
		}

		if($("#rname").val() != "") {
			$("#rn").css("display", "none");
			var realname = $("#rname").val();
		}else{
			$("#rn").css("display", "block");
		}
		
		if($("#cardCode").val() != "") {
			$("#cac").css("display", "none");
			var card = $("#cardCode").val();
		} else {
			$("#cac").css("display", "block");
		}
		if($("#email").val() != "") {
			$("#em").css("display", "none");
			var email = $("#email").val();
		} else {
			$("#em").css("display", "block");
		}
		if($("#mobileNo").val() != "") {
			$("#tel").css("display", "none");
			var tel = $("#mobileNo").val();
		} else {
			$("#tel").css("display", "block");
		}
		if($("#userName").val() != "" && $("#passWord").val() != "" &&$("#rname").val() != "" &&$("#cardCode").val() != "" && $("#email").val() != "" &&$("#mobileNo").val() != ""){
//			$("#nextBtn").attr("href", "UserServlet?method=addUser&username=username&pass=pass&realname=realname&cardtype=cardtype&card=card&email=email&tel=tel&passengertype=passengertype");
		}else{
			return false;
		}

		
	}
})