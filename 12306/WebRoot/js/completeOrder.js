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
		$(".nav-label").css("top", $("#dd_4_comOrder").position().top);
	})

	$("#query_H").click(function() {
		$("#query_H").attr("class", "active");
		$("#query_G").attr("class", "");
		$("#query_what_order").attr("style", "display: none;");
		$("#use_G").attr("style", "display: none;");
	})
	$("#query_G").click(function() {
		$("#query_G").attr("class", "active");
		$("#query_H").attr("class", "");
		$("#query_what_order").attr("style", "display: block;");
		$("#use_G").attr("style", "display: inline;");
	})

	$("#queryAllMyOrders").click(function() {
		$("#queryAllMyOrders").attr("class", "cur");
		$("#queryResginOrders").attr("class", "");
		$("#queryCSOrders").attr("class", "");
		$("#queryReturnOrders").attr("class", "");
	})
	$("#queryResginOrders").click(function() {
		$("#queryAllMyOrders").attr("class", "");
		$("#queryResginOrders").attr("class", "cur");
		$("#queryCSOrders").attr("class", "");
		$("#queryReturnOrders").attr("class", "");
	})
	$("#queryCSOrders").click(function() {
		$("#queryAllMyOrders").attr("class", "");
		$("#queryResginOrders").attr("class", "");
		$("#queryCSOrders").attr("class", "cur");
		$("#queryReturnOrders").attr("class", "");
	})
	$("#queryReturnOrders").click(function() {
		$("#queryAllMyOrders").attr("class", "");
		$("#queryResginOrders").attr("class", "");
		$("#queryCSOrders").attr("class", "");
		$("#queryReturnOrders").attr("class", "cur");
	})
	$("#queryStartDate").click(
			"WdatePicker({minDate:'%y-%M-%d',maxDate:'%y-%M-{%d+20}'})")

	

})