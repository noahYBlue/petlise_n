//카테고리버튼
$("#ordertitle").on("click", "button", function() {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		let searchtype1 = $(this).val()

		$("#page").val(1);
		$("#searchType1").val(searchtype1);
		$("#searchType2").val("");
		$("#keyword").val("");
		$("#start_date").val("");
		$("#end_date").val("");
		$("#adminorderlist").submit();
	}
});

//Datepicker
$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
	prevText: '이전 달',
	nextText: '다음 달',
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	showMonthAfterYear: true,
	yearSuffix: '년',
	showOn: "both",
	buttonImage: "/images/shop/shopdetail/calendar.svg",
	buttonImageOnly: true,
	showButtonPanel:true
});


$("#start_date").datepicker();
$("#end_date").datepicker();

$("#start_date").on('change',function(){
	mindate = $("#start_date").val();
	$("#end_date").datepicker("option","minDate",mindate);
})

$("#end_date").on('change',function(){
	maxdate = $("#end_date").val();
	$("#start_date").datepicker("option","maxDate",maxdate);
})

$("#date_today").on('click',function(){
	const date = new Date();
	let year = date.getFullYear();
	let month = Number(date.getMonth())+1;
	month = month >= 10? month : '0' + month;
	let day = date.getDate() >= 10? date.getDate() : '0' + date.getDate();
	
	$("#start_date").val(year+"-"+month+"-"+day);
	$("#end_date").val(year+"-"+month+"-"+day);
})
$("#date_week").on('click',function(){
	const today = new Date();
	const lastweek = new Date(today.getTime()-(86400000*7));
	
	let year = today.getFullYear();
	let month = Number(today.getMonth())+1;
	month = month >= 10? month : '0' + month;
	let day = Number(today.getDate());
	day = day >= 10? day : '0' + day;

	let lastweek_month = Number(lastweek.getMonth())+1;
	lastweek_month = lastweek_month >= 10? lastweek_month : '0' + lastweek_month;
	let lastweek_day = Number(lastweek.getDate());
	lastweek_day = lastweek_day >= 10? lastweek_day : '0' + lastweek_day;
	
	$("#start_date").val(lastweek.getFullYear()+"-"+lastweek_month+"-"+lastweek_day);
	$("#end_date").val(year+"-"+month+"-"+day);
})
$("#date_month").on('click',function(){
	const today = new Date();
	const lastmonth = new Date(today.getTime()-(86400000*30));
	
	let year = today.getFullYear();
	
	let month = Number(today.getMonth())+1;
	month = month >= 10? month : '0' + month;
	let day = Number(today.getDate());
	day = day >= 10? day : '0' + day;

	let lastmonth_month = Number(lastmonth.getMonth())+1;
	lastmonth_month = lastmonth_month >= 10? lastmonth_month : '0' + lastmonth_month;
	let lastmonth_day = Number(lastmonth.getDate());
	lastmonth_day = lastmonth_day >= 10? lastmonth_day : '0' + lastmonth_day;

	$("#start_date").val(year+"-"+lastmonth_month+"-"+lastmonth_day);
	$("#end_date").val(year+"-"+month+"-"+day);
})


//드롭다운
$('#dropdown').click(function() {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		$(this).attr('tabindex', 1).focus();
		$(this).toggleClass('active');
		$(this).find('.dropdown-menu').slideToggle(300);
	}
});

$('#dropdown').focusout(function() {
	$(this).removeClass('active');
	$(this).find('.dropdown-menu').slideUp(300);
});

$('#dropdown .dropdown-menu li').click(function(e) {
	e.stopPropagation();
	let value = $(this).text();
	$(this).parents('.dropdown').find('span').text(value);
	$(this).parents('.dropdown').find('input').val(value);
	$(this).parents('.dropdown').find('.dropdown-menu').slideUp(300);
});


//검색창 엔터키 이벤트
$("#keyword").on("keyup", function(key) {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		if (key.keyCode == 13) {
			$("#searchbtn").click();
		}
	}
});

//검색 버튼
$("#searchbtn").on('click', function(e) {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		$("#page").val(1);
		$("#adminorderlist").submit();
	} else {
		e.preventdefault();
	}
});

//검색조건 초기화
$("#searchreturn").on("click", function(e) {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		$("#page").val(1);
		$("#searchType2").val("");
		$("#keyword").val("");
		$("#start_date").val("");
		$("#end_date").val("");
		$("#adminorderlist").submit();
	} else {
		e.preventdefault();
	}
});

//테이블
$(".list_tr").on("click", function() {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		if ($(this).next().is(':visible')) {
			$(this).next().hide();
		} else {
			$(this).siblings(".orderinfo").hide();
			$(this).next().show();
		}
	}
});

//숫자 페이징버튼
$(".pageNumber").on('click', function() {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		$("#page").val($(this).text());
		$("#adminorderlist").submit();
	}
});

//첫페이지버튼 
$(".pagefirst").on('click', function() {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		$("#page").val(1);
		$("#adminorderlist").submit();
	}
});

//이전페이지버튼
$(".prev").on('click', function() {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		$("#page").val($(this).attr("id"));
		$("#adminorderlist").submit();
	}
});

//다음페이지버튼
$(".next").on('click', function() {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		$("#page").val($(this).attr("id"));
		$("#adminorderlist").submit();
	}
});

//마지막페이지버튼
$(".pagelast").on('click', function() {
	if (!$(".editdeliverybtn").hasClass('editactive')) {
		$("#page").val($(this).attr("id"));
		$("#adminorderlist").submit();
	}
});

//모달 취소버튼
$(".modal_cancelbtn").on("click", function() {
	$(this).parents(".modal").css('display', 'none');
});


//모달 확인버튼
$(".modal_okaybtn").on("click", function() {
	$(this).parents(".modal").css('display', 'none');
	$("#adminorderlist").submit();
});

//운송장번호 등록
$(".griditem.last").on('click', '.insertdeliverybtn', function() {
	let pattern_eng = /[a-z]/;	// 소문자 불가 (대문자가능)
	let pattern_spc = /[~!@#$%^&*()+|<>?:{}]/; // 특수문자 불가(-,_ 제외)
	let pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글 불가
	let pattern_kor_letter = /[ㄱ-ㅎ|ㅏ-ㅣ]/; // 택배사명 자모음 불가

	let orderid = $(this).parents().siblings("#grid_orderid").text();
	let deliverycom = $(this).parents().prev().prev().children("input").val();
	let deliveryid = $(this).prev().val();

	let ispossible_com = pattern_kor_letter.test(deliverycom);
	let ispossible_id = pattern_eng.test(deliveryid) || pattern_spc.test(deliveryid) || pattern_kor.test(deliveryid);

	if ($("#delivery_com").val() == '' || ispossible_com) {
		$("#alert_modal .modal_text").html("택배사명을 확인해 주세요.");
		$("#alert_modal").css("top", $(window).scrollTop() + "px");
		$("#alert_modal").css('display', 'block');
		$('#alert_modal').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	}
	else if ($("#delivery_id").val() == '' || ispossible_id) {
		$("#alert_modal .modal_text").html(
			"운송장번호를 확인해 주세요."
		);
		$("#alert_modal").css("top", $(window).scrollTop() + "px");
		$("#alert_modal").css('display', 'block');
		$('#alert_modal').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	}
	else {
		$.ajax({
			type: 'post',
			url: '/insertdelivery',
			dataType: 'json',
			data: {
				order_id: orderid,
				delivery_com: deliverycom,
				delivery_id: deliveryid
			},
			success: function(result) { // 결과 성공 콜백함수
				$("#okay_modal .modal_text").html("배송정보 등록이 완료되었습니다.");
				$("#okay_modal").css("top", $(window).scrollTop() + "px");
				$("#okay_modal").css('display', 'block');
				$('#okay_modal').on('scroll touchmove mousewheel', function(event) {
					event.preventDefault();
					event.stopPropagation();
					return false;
				});
			},
			error: function(request, status, error) { // 결과 에러 콜백함수
				console.log(error);
			}
		});//ajax end
	}//else
});

//정보 수정버튼
$(".editdeliverybtn").on('click', function() {
	if ($(this).prev().attr('readonly') == 'readonly') {
		$(this).parents().prev().prev().children("input").removeClass('exist').removeAttr('readonly').addClass('editactive');
		$(this).prev().removeClass('exist').removeAttr('readonly').addClass('editactive');
		$(this).val('수정완료');
		$(this).css({
			"background-color": "var(--light-point)",
			"color": "white"
		});
		$(this).addClass('editactive');
	} else {
		$(this).removeClass('editdeliverybtn').removeClass('editactive').addClass('insertdeliverybtn');
	}
});

$('html').on('click', function(e) {
	if ($(".editdeliverybtn").hasClass('editactive')) {
		if (!$(e.target).hasClass('editactive')) {
			$("#alert_modal .modal_text").html("배송정보 수정중입니다.<br>배송정보 수정을 완료해주세요.");
			$("#alert_modal").css("top", $(window).scrollTop() + "px");
			$("#alert_modal").css('display', 'block');
			$('#alert_modal').on('scroll touchmove mousewheel', function(event) {
				event.preventDefault();
				event.stopPropagation();
				return false;
			});
			$(".modal_alertokaybtn").addClass('editactive');
		}
	}
});

//alert모달 확인버튼
$("#alert_modal").on("click", '.modal_alertokaybtn', function(event) {
	$(this).parents(".modal").css('display', 'none');
	event.preventDefault();
	event.stopPropagation();
	return false;
});