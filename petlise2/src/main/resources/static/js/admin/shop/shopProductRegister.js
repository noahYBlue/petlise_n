$("#file1").change(function() {
	const file = document.getElementById("file1");
	const url = file.files[0];

	if (!url) {
		alert("파일이 없습니다");
		return;
	}

	const maxSize = 5 * 1024 * 1024;
	const fileSize = url.size;

	if (fileSize > maxSize) {
		alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
		$(this).val('');
		return false;
	}

	let formData = new FormData();
	formData.append("image", url)

	$.ajax({
		url: "/api/image-upload",
		type: "post",
		data: formData,
		enctype: 'multipart/form-data',
		contentType: false,
		processData: false,
		success: function(url) {
			$("#fileimg1").attr("src", `https://storage.googleapis.com/${url}`);
			$("#fileimg1").css('width','300px');
			$("#fileimg1").css('border','2px solid var(--light-point)');
			$("#fileimg1").css('border-radius','10px');
			$("#imageValue1").val(url);
		},
		error: function(error) {
			console.log(error);
		}
	})
});

$("#file2").change(function() {
	const file = document.getElementById("file2");
	const url = file.files[0];

	if (!url) {
		alert("파일이 없습니다");
		return;
	}

	const maxSize = 5 * 1024 * 1024;
	const fileSize = url.size;

	if (fileSize > maxSize) {
		alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
		$(this).val('');
		return false;
	}

	let formData = new FormData();
	formData.append("image", url)

	$.ajax({
		url: "/api/image-upload",
		type: "post",
		data: formData,
		enctype: 'multipart/form-data',
		contentType: false,
		processData: false,
		success: function(url) {
			$("#fileimg2").attr("src", `https://storage.googleapis.com/${url}`);
			$("#imageValue2").val(url);
		},
		error: function(error) {
			console.log(error);
		}
	})
});

$("#editButton").on("click",function(){
	if($("#imageValue1").val()==""){
		$("#alertmodal .modal_text").html("메인이미지를 확인해 주세요.");
		$("#alertmodal").css('display', 'block');
	}else if($("#imageValue2").val()==""){
		$("#alertmodal .modal_text").html("상세이미지를 확인해 주세요.");
		$("#alertmodal").css('display', 'block');
	}else if($("#pet_type").val()==""){		
		$("#alertmodal .modal_text").html("동물 카테고리를 확인해 주세요.");
		$("#alertmodal").css('display', 'block');
	}else if($("#product_categpry").val()==""){
		$("#alertmodal .modal_text").html("상품 카테고리를 확인해 주세요.");
		$("#alertmodal").css('display', 'block');		
	}else if($("#product_name").val()==""){
		$("#alertmodal .modal_text").html("상품명을 확인해 주세요.");
		$("#alertmodal").css('display', 'block');		
	}else if($("#product_price").val()==0 || $("#product_price").val()==""){
		$("#alertmodal .modal_text").html("상품가격을 확인해 주세요.");
		$("#alertmodal").css('display', 'block');
	}else if($("#product_quatity").val()==0 || $("#product_quatity").val()==""){
		$("#alertmodal .modal_text").html("상품재고수량을 확인해 주세요.");
		$("#alertmodal").css('display', 'block');
	}else if($("#product_regtime").val()==""){
		$("#alertmodal .modal_text").html("등록일자를 확인해 주세요.");
		$("#alertmodal").css('display', 'block');
	}else{
		$("#confirm_modal .modal_text").html(
			"<div>카테고리 : "+$("#pet_type").val()+" / "+$("#product_categpry").val()+"<br>"
			+"상품명 : "+$("#product_name").val()+"<br>"
			+"상품가격 : "+$("#product_price").val()+"Point <br>"
			+"상품을 등록하시겠습니까?</div>"
		);
		$("#confirm_modal").css('display', 'block');
	}
	
});

$(".createbtn").on('click', function(){
	$(this).parents(".modal").css('display', 'none');
	$.ajax({
		type : 'post',
		url : '/productsave',
		dataType : 'json',
		data : {
			image_main : $("#imageValue1").val(),
			image_detail : $("#imageValue2").val(),
			pet_type : $("#pet_type").val(),
			category : $("#product_categpry").val(),
			reg_date : $("#product_regtime").val(),
			product_name : $("#product_name").val(),
			price : $("#product_price").val(),
			quatity :$("#product_quatity").val()
		},
		success : function(result) { // 결과 성공 콜백함수
		   	$("#okaymodal #pageinput").val(result.page);
		   	$("#okaymodal").css('display', 'block');
    	},
	    error : function(request, status, error) { // 결과 에러 콜백함수
	        console.log(error)
	    }
	});//ajax end
});

//달력
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

$("#product_regtime").datepicker();



//등록취소버튼
$("#cancelButton").on("click",function(){
	$("#cancel_modal").css('display', 'block');
	
	$(".golisthomebtn").on("click",function(){
		location.href = "/adminshoplist";
	});
});

//모달창 내의 취소버튼
$(".cancelbtn").on('click', function(){
	$(this).parents(".modal").css('display', 'none');
});

//등록 후 완료 버튼
$("#okaymodal .okaybtn").on('click', function(){
	$(this).parents(".modal").css('display', 'none');
	location.href = "/adminshoplist?page="+$("#okaymodal #pageinput").val();
});

//경고창 확인 버튼
$("#alertmodal .okaybtn").on('click', function(){
	$(this).parents(".modal").css('display', 'none');
});