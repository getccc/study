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
			

			$("#passengerType").change(function() {
				if($(this).val() == "3") {
					$($("#_stu_infor")).attr("style", "display: block;");

				} else {
					$($("#_stu_infor")).attr("style", "display: none;");
				}
			})

			$("#name").blur(function() {
				$regex = /^[\u4E00-\u9FA5]{2,6}$/;
				if($regex.test($(this).val())) {
					$("#rn").css("display", "none");
				} else {
					$("#rn").css("display", "block");
				}
			});

			$("#cardCode").blur(function() {
				$regex = /^[4][2][0-9]{15}[0-9X]$/;
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

		})