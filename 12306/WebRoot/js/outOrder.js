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
				$(".nav-label").css("top", $(this).position().top);
			})
			$(".label-y").mouseout(function(e) {
				$(".nav-label").css("top", $("#dd_4_NonComOrder").position().top);
			})

		})