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

	$("#username").blur(function() {
		var reg = /^[A-z0-9_]{6,30}$/;
		if ($("#username").val() == "") {
			$("#error_msgmypasscode1").css("display", "none");
			$("#error_msgmypasscode2").css("display", "block");
		} else if (reg.test($("#username").val())) {
			$("#error_msgmypasscode1").css("display", "none");
			$("#error_msgmypasscode2").css("display", "none");
		} else {
			$("#error_msgmypasscode2").css("display", "none");
			$("#error_msgmypasscode1").css("display", "block");
		}
	});
	$("#passWord").blur(function() {
		$regex = /^([\w]{6,20})$/;
		if ($regex.test($(this).val())) {
			$("#error_msgmypasscode3").css("display", "none");
		} else {
			$("#error_msgmypasscode3").css("display", "block");
		}
	});

	//			$("#password").blur(function() {
	//				var reg = /^[A-z0-9]{6,20}$/;
	//				if($("#password").val() == "" && $("#username").val() != "") {
	//					if($("#error_msgmypasscode1").css("display") == "none" && $("#error_msgmypasscode2").css("display") == "none") {
	//						$("#error_msgmypasscode3").css("display", "block");
	//					}
	//				} else if(reg.test($("#password").val())) {
	//					$("#error_msgmypasscode3").css("display", "none");
	//				} else if($("#username").val() != "") {
	//					if($("#error_msgmypasscode1").css("display") == "none" && $("#error_msgmypasscode2").css("display") == "none") {
	//						$("#error_msgmypasscode3").css("display", "block");
	//
	//					}
	//				}
	//			});
})