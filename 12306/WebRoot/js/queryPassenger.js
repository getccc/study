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
		$(".nav-label").css("top", $("#dd_4_passengerIns").position().top);
	})

	$("#_search_name").focus(function() {
		$($("#_search_name")).attr("value", "");
	})
	$("#_search_name").blur(function() {
		$($("#_search_name")).attr("value", "输入乘客姓名");
	})

//	function checkbox_selectedAll() {
//		var chk = window.document.getElementsByName("chkUserInfos");
//		for ( var i = 0; i < chk.length; i++) {
//			chk[i].checked = window.document.getElementById("chkFile").checked;
//		}
//	}
//
//	function checkbox_selected() {
//		var chkvalue = "";
//		var chk = window.document.getElementsByName("passengerAllTable");
//		for ( var i = 0; i < chk.length; i++) {
//			if (chk[i].checked) {
//				chkvalue = chkvalue + "," + chk[i].value + "";
//			}
//		}
//		return chkvalue;
//	}

})