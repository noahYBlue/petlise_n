//상품목록버튼
$("#cancelButton").on("click",function(){
	$("#list_modal").css('display', 'block');
	
	$(".golisthomebtn").on("click",function(){
		$("#adminshoplist").submit();
	});
});

//모달창 내의 취소버튼(공통)
$(".modal_cancelbtn").on('click', function(){
	$(this).parents(".modal").css('display', 'none');
});

//상품정보수정버튼--모달 확인창 팝업
$("#editButton").on("click",function(){
	$("#confirm_modal").css('display', 'block');
});

//모달-수정버튼 (수정창 이동)
$(".modal_editbtn").on('click', function(){
	$(this).parents(".modal").css('display', 'none');
});

//상품삭제 버튼--모달 확인창 팝업
$("#deleteButton").on('click', function(){
	$("#delete_modal .modal_text").html(
		"<div>상품 삭제 후 복구할 수 없습니다.<br>" +
		"상품번호 : " + $("#product_number").val() + "<br>" +
		"상품명 : " + $("#product_name").val() + "<br>" +
		"해당 상품을 삭제하시겠습니까?</div>"
	);
	$("#delete_modal input[type='hidden']").val($("#product_number").val());
	$("#delete_modal").css('display', 'block');
});

//상품삭제 버튼--모달 삭제버튼 (삭제후 목록이동)
$("#delete_modal .modal_deletebtn").on('click', function(){
	$(this).parents(".modal").css('display', 'none');
	$.ajax({
		type: 'post',
		url: '/deleteproduct',
		dataType: 'json',
		data: {
			product_id: $("#delete_modal input[type='hidden']").val()
		},
		success: function(result) { // 결과 성공 콜백함수
			$("#delete_okay_modal").css('display', 'block');
			$("#delete_okay_modal .modal_okaybtn").on("click", function() {
				$(this).parents(".modal").css('display', 'none');
				$("#adminshoplist").submit();
			});
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error);
		}
	});//ajax end
});