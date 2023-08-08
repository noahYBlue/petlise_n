// ----- 페이지 영역별 스크롤 ------
$('#tab1_2').on('click',function(){
	var offset = $('#tab2_2').offset();
	$('html').animate({scrollTop : offset.top}, 400);
});

$('#tab1_3').on('click',function(){
	var offset = $('#tab3_3').offset();
	$('html').animate({scrollTop : offset.top}, 400);
});

$('#tab2_1').on('click',function(){
	var offset = $('#tab1_1').offset();
	$('html').animate({scrollTop : offset.top}, 400);
});

$('#tab2_3').on('click',function(){
	var offset = $('#tab3_3').offset();
	$('html').animate({scrollTop : offset.top}, 400);
});

$('#tab3_1').on('click',function(){
	var offset = $('#tab1_1').offset();
	$('html').animate({scrollTop : offset.top}, 400);
});

$('#tab3_2').on('click',function(){
	var offset = $('#tab2_2').offset();
	$('html').animate({scrollTop : offset.top}, 400);
});

// ----- 수량선택 -----
$("#num_minus").on('click',function(){
	let number = $("#number").text();
	
	if(number>1){
		$("#number").text(number-1);
		$("#num_plus").next().text("");
	}
});

$("#num_plus").on('click',function(){
	let number = $("#number").text();
	let quantity = $(this).siblings("input[type='hidden']").val();
	let maxnumber = 5;
	
	if(quantity<5){
		maxnumber = quantity;
	}
	
	if(number<maxnumber){
		$("#number").text(Number(number)+1);
	}else if(number==5){
		$(this).next().text("1회 최대 주문 수량은 5개입니다.")
	}else if(number==quantity){
		$(this).next().text("현재 주문 가능한 최대 수량입니다.")
	}
});

// ----- 장바구니버튼 -----
$(".modal_gocartbtn").on('click',function(){
	location.href = "/shopcart";
});

// ----- 주문페이지 이동버튼 -----
$(".modal_goorderbtn").on('click',function(){
	location.href = "/payment";
});

// ----- 모달이벤트(모달 내 취소버튼) -----
$(".modal_cancelbtn").on('click',function(){
	$(this).parents(".modal").css('display', 'none');
});

// ----- 후기 삭제 버튼 클릭 ( 모달 팝업 ) -----
$("#product_review").on('click','.review_deletebtn',function(){
	$("#delete_confirm_modal input[type='hidden']").val($(this).siblings("input[type='hidden']").val());
	$("#delete_confirm_modal").css("top", $(window).scrollTop()+"px");
	$("#delete_confirm_modal").css('display', 'block');
	
	$('#delete_confirm_modal').on('scroll touchmove mousewheel', function(event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
});

// ----- 삭제 버튼 클릭 ( 후기삭제버튼 ) -----
$("#delete_confirm_modal").on('click','.modal_deletebtn',function(){
	$(this).parents(".modal").css('display', 'none');
	$.ajax({
		type : 'post',
		url : '/deletereview',
		dataType : 'json',
		data : {
			review_id : $(this).siblings("input[type='hidden']").val()
		},
		success : function(result) { // 결과 성공 콜백함수
			$("#delete_okay_modal").css("top", $(window).scrollTop()+"px");
			$("#delete_okay_modal").css('display', 'block');
			
			$('#delete_okay_modal').on('scroll touchmove mousewheel', function(event) {
				event.preventDefault();
				event.stopPropagation();
				return false;
			});

			$('#delete_okay_modal').on('click','.modal_okaybtn', function() {
				const queryparamsPage = {
	   				product_id : $(this).siblings("input[type='hidden']").val(),
	   				page: 1,
	   				searchType2: "review"
	    		}
	    		location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
			});
		},
	    error : function(request, status, error) { // 결과 에러 콜백함수
	        console.log(error)
	    }
	});//ajax end
});
