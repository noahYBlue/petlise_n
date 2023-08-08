$(".modal_cancelbtn").on('click',function(){
	$(this).parents(".modal").css('display', 'none');
});

$(".deletebtns").on('click',function(){
	$("#delete_id").val($(this).attr('id'));
	$("#delete_alert_modal").css("top", $(window).scrollTop()+"px");
	$("#delete_alert_modal").css('display', 'block');
	
	$('#delete_alert_modal').on('scroll touchmove mousewheel', function(event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
});

$(".modal_deletebtn").on('click',function(){
	$(this).parents(".modal").css('display', 'none');
	$.ajax({
		type: 'post',
		url: '/mypage/deletemyboard',
		dataType: 'json',
		data: {
			board_id: $(this).next().val()
		},
		success: function(result) { // 결과 성공 콜백함수
			$("#delete_okay_modal").css("top", $(window).scrollTop() + "px");
			$("#delete_okay_modal").css('display', 'block');
			$('#delete_okay_modal').on('scroll touchmove mousewheel', function(event) {
				event.preventDefault();
				event.stopPropagation();
				return false;
			});
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error);
		}
	});//ajax end
});

$("#delete_okay_modal").on('click',".modal_okaybtn",function(){
	$(this).parents(".modal").css('display', 'none');
	location.replace(location.href);
});

