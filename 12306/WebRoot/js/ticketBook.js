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

			$("#date_range ul li").mouseover(function() {
				$(".choice").removeClass("sel");
				$(this).addClass("sel");
			})

			$("#date_range ul li").mouseout(function() {
				$(this).removeClass("sel");
			})

			$("#date_range ul").mouseout(function() {
				$(".choice").addClass("sel");
			})
			$("#show_more").click(function() {
				if($(this).attr("class", "down")) {
					$("#show_more").attr("class", "down open");
					$("#sear-sel-bd").attr("style", "height: 45px;");
				}
				else if($("#show_more").attr("class", "down open")) {
					$("#show_more").attr("class", "down");
					$("#sear-sel-bd").attr("style", "height: 15px;");
				}

			})

		})