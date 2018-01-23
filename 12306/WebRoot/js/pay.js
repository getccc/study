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

	var m=29;
    var s=59;
    setInterval(function(){
        if(s<10){
            $('#ShowTime1').html(m+'分0'+s+'秒');
        }else{
            $('#ShowTime1').html(m+'分'+s+'秒');
        }
        s--;
        if(s<0){
            s=59;
            m--;
        }
    },1000)

})