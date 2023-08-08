//홈버튼
$("#listhome").on("click", function() {
	$("#page").val(1);
	$("#petType").val("");
	$("#productType").val("");
	$("#saleType").val("");
	$("#sortType").val("");
	$("#adminshoplist").submit();
});

//검색창 엔터키 이벤트
$("#keyword").on("keyup", function(key) {
	if (key.keyCode == 13) {
		$("#searchbtn").click();
	}
});

//검색 버튼
$("#searchbtn").on('click', function() {
	$("#page").val(1);
	$("#adminshoplist").submit();
});

//숫자 페이징버튼
$(".pageNumber").on('click', function() {
	$("#page").val($(this).text());
	$("#adminshoplist").submit();
});

//첫페이지버튼 
$(".pagefirst").on('click', function() {
	$("#page").val(1);
	$("#adminshoplist").submit();
});

//이전페이지버튼
$(".prev").on('click', function() {
	$("#page").val($(this).attr("id"));
	$("#adminshoplist").submit();
});

//다음페이지버튼
$(".next").on('click', function() {
	$("#page").val($(this).attr("id"));
	$("#adminshoplist").submit();
});

//마지막페이지버튼
$(".pagelast").on('click', function() {
	$("#page").val($(this).attr("id"));
	$("#adminshoplist").submit();
});

//상품수정버튼(확인모달 팝업)
$("tbody .editbtn").on("click", function() {
	$("#edit_modal .modal_text").html(
		"<div>" +
		"상품번호 : " + $(this).parents().siblings(".productid").text() + "<br>" +
		"상품명 : " + $(this).parents().siblings(".productname").children().children("input[type='submit']").val() + "<br>" +
		"해당 상품정보를 수정하시겠습니까?</div>"
	);
	$("#edit_modal input[type='hidden']").val($(this).parents().siblings(".productid").text());
	$("#edit_modal").css("top", $(window).scrollTop()+"px");
	$("#edit_modal").css('display', 'block');
	
	$('#edit_modal').on('scroll touchmove mousewheel', function(event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
});

//상품 수정 확인모달 수정버튼 -- 수정페이지 이동
$("#modal_editbtn").on("click", function() {
	$(this).parents(".modal").css('display', 'none');
	$("#edit_form").submit();
});

//상품삭제버튼(확인모달 팝업)
$("tbody .deletebtn").on("click", function() {
	$("#delete_modal .modal_text").html(
		"<div>" +
		"상품 삭제 후 복구할 수 없습니다.<br>" +
		"상품번호 : " + $(this).parents().siblings(".productid").text() + "<br>" +
		"상품명 : " + $(this).parents().siblings(".productname").children().children("input[type='submit']").val() + "<br>" +
		"해당 상품을 삭제하시겠습니까?</div>"
	);
	$("#delete_modal input[type='hidden']").val($(this).parents().siblings(".productid").text());
	$("#delete_modal").css('display', 'block');
});

//상품 수정/삭제 확인모달 취소버튼
$(".modal_cancelbtn").on("click", function() {
	$(this).parents(".modal").css('display', 'none');
});

//상품삭제 확인모달 삭제버튼 -- db삭제 진행 버튼
$("#delete_modal .modal_deletebtn").on("click", function() {
	$(this).parents(".modal").css('display', 'none');
	$.ajax({
		type: 'post',
		url: '/deleteproduct',
		dataType: 'json',
		data: {
			product_id: $("#delete_modal input[type='hidden']").val()
		},
		success: function(result) { // 결과 성공 콜백함수
			$("#delete_okay_modal .modal_text").html(
				"<div>" +
				"상품이 삭제되었습니다." +
				"</div>");
			$("#delete_okay_modal").css('display', 'block');

			$(".modal_okaybtn").on("click", function() {
				$(this).parents(".modal").css('display', 'none');
				location.href = $(location).attr('href');
			});
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error);
		}
	});//ajax end

});