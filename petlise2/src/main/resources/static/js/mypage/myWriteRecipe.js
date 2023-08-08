$(".modal_cancelbtn").on('click',function(){
	$(this).parents(".modal").css('display', 'none');
});

$(".recipedelete").on('click',function(){
	if($("#isbest").val() != '0'){
		$("#delete_no_modal").css("top", $(window).scrollTop()+"px");
		$("#delete_no_modal").css('display', 'block');
		
		$('#delete_no_modal').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	}else{
		$("#delete_recipe_id").val($(this).attr('id'));
		$("#delete_alert_modal").css("top", $(window).scrollTop()+"px");
		$("#delete_alert_modal").css('display', 'block');
		
		$('#delete_alert_modal').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	}
});

$(".modal_deletebtn").on('click',function(){
	$(this).parents(".modal").css('display', 'none');
	$.ajax({
		type: 'post',
		url: '/mypage/deletemywriterecipe',
		dataType: 'json',
		data: {
			recipe_id: $(this).next().val()
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

$("#delete_no_modal").on('click',".modal_okaybtn",function(){
	$(this).parents(".modal").css('display', 'none');
});

