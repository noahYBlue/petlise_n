$(".review_container").hide();

//리뷰창열기
$(".editbtn").on('click',function(){
	let di = $(this).siblings(".di").val();
	let pi = $(this).siblings(".pi").val();
	let pn = $(this).siblings(".pn").val();
	window.open("/editreview?di="+di+"&pi="+pi+"&pn="+pn, "Pet LiSe", "width=615px,height=815px");
});

$(".review_updatebtn").on('click',function(){
	let di = $(this).siblings(".di").val();
	let pi = $(this).siblings(".pi").val();
	let pn = $(this).siblings(".pn").val();
	window.open("/editreview?di="+di+"&pi="+pi+"&pn="+pn, "Pet LiSe", "width=615px,height=815px");
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
	buttonImage: "/images/mypage/calendar_sub.svg",
	buttonWidth:30,
	buttonImageOnly: true,
	showButtonPanel:true
});

$("#start_date").datepicker();
$("#end_date").datepicker();

$("#start_date").on('change',function(){
	mindate = $("#start_date").val();
	$("#end_date").datepicker("option","minDate",mindate);
});

$("#end_date").on('change',function(){
	maxdate = $("#end_date").val();
	$("#start_date").datepicker("option","maxDate",maxdate);
});

$("#date_today").on('click',function(){
	const date = new Date();
	let year = date.getFullYear();
	let month = Number(date.getMonth())+1;
	month = month >= 10? month : '0' + month;
	let day = date.getDate() >= 10? date.getDate() : '0' + date.getDate();
	
	$("#start_date").val(year+"-"+month+"-"+day);
	$("#end_date").val(year+"-"+month+"-"+day);
});

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
});

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
});

$("#clearbtn").click(function(){
	$("#start_date").val("");
	$("#end_date").val("");
});

//slideToggle
$(".showbtn").click(function(){
	$(this).parents(".orderProduct_container").next().slideToggle(300);
});

$(".container_bottom>button").click(function(){
	$(this).parents(".review_container").slideToggle(300);
});

//update_deleteat
$(".review_deletebtn").on('click',function(){
	$("#delete_alert_modal input[type='hidden']").val($(this).siblings(".review_id").val());
	$("#delete_alert_modal").css("top", $(window).scrollTop() + "px");
	$("#delete_alert_modal").css('display', 'block');
	$('#delete_alert_modal').on('scroll touchmove mousewheel', function(event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
});

$("#delete_alert_modal").on('click',".modal_cancelbtn",function(){
	$(this).parents(".modal").css('display', 'none');
});

$("#delete_alert_modal").on('click',".modal_deletebtn",function(){
	$(this).parents(".modal").css('display', 'none');
	$.ajax({
		type: 'post',
		url: '/updatedeletedat',
		dataType: 'json',
		data: {
			review_id: $(this).next().val()
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