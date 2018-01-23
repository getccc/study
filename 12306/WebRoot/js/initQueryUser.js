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
				$(".nav-label").css("top", $("#dd_4_showMyInfor").position().top);
			})
			
			
			$("#basic_info_edit_div").click(function(){
				$("#basic_info_edit_div").attr("style", "display: none;");
				$("#basic_info_save_div").attr("style", "display: block;");
				$("#basic_info_base").attr("style", "display: block;");
				$("#basic_info_view").attr("style", "display: none;");
			})
			
			$("#basic_info_save_div").click(function(){
				$("#basic_info_edit_div").attr("style", "display: block;");
				$("#basic_info_save_div").attr("style", "display: none;");
				$("#basic_info_base").attr("style", "display: none;");
				$("#basic_info_view").attr("style", "display: block;");
			})
			
			$("#relation_way_edit_div").click(function(){
				$("#relation_way_edit_div").attr("style", "display: none;");
				$("#relation_way_save_div").attr("style", "display: block;");
				$("#relation_way_base").attr("style", "display: block;");
				$("#relation_way_view").attr("style", "display: none;");
			})
			
			$("#relation_way_save_div").click(function(){
				$("#relation_way_edit_div").attr("style", "display: block;");
				$("#relation_way_save_div").attr("style", "display: none;");
				$("#relation_way_base").attr("style", "display: none;");
				$("#relation_way_view").attr("style", "display: block;");
			})
			
			$("#append_info_edit_div").click(function(){
				$("#append_info_edit_div").attr("style", "display: none;");
				$("#append_info_save_div").attr("style", "display: block;");
				$("#append_info_base").attr("style", "display: block;");
				$("#append_info_view").attr("style", "display: none;");
			})
			$("#append_info_save_div").click(function(){
				$("#append_info_edit_div").attr("style", "display: block;");
				$("#append_info_save_div").attr("style", "display: none;");
				$("#append_info_base").attr("style", "display: none;");
				$("#append_info_view").attr("style", "display: block;");
			})
			
			$("#user_type_change").change(function(){
			if($(this).val() == "3"){
				$($("#student_id_edit")).attr("style", "display: block;");
				
			}else{
				$($("#student_id_edit")).attr("style", "display: none;");
			}
		})

		})