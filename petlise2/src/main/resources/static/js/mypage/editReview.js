if($("input[type='range']").val()>0){
	let val = $("input[type='range']").val();
	let str = val * 20 + "%";

	$('#fillscore').css("width", str);
}

//창닫기
$(".closebtn").on('click',function(){
	window.close();
});

//평점
$("#score_box input").on("input", function() {
	let val = $(this).val();
	let str = val * 20 + "%";

	$('#fillscore').css("width", str);
	$('#score').text(val + "점");
});

//후기 입력시 길이제한
$('#reviewcontents textarea').keyup(function() {
	let txtlen = $(this).val().length;
	$('#textlength').text(txtlen);
	if (txtlen > 500) {
		$(this).val($(this).val().substring(0, 500));
		$('#textlength').text("500");
	}
});

//이미지 업로드 & 미리보기
$("#reviewcontents #review_img").on('change',function(){
	const file = document.getElementById("review_img");
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
			$("#previewimg").attr("src", `https://storage.googleapis.com/${url}`);
			$("#imageValue").val(url);
			
			$("#previewbox").css("display","flex");
		},
		error: function(error) {
			console.log(error);
		}
	})
});
//이미지 수정 업로드 & 미리보기
$("#reviewcontents_review").on('change',"input[type='file']",function(){
	const file = document.getElementById("review_img");
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
			$("#previewimg_review").attr("src", `https://storage.googleapis.com/${url}`);
			$("#imageValue").val(url);
			$("#previewbox_review").css("display","flex");
		},
		error: function(error) {
			console.log(error);
		}
	})
});

$("#previewimg,#previewimg_review").on({
	"mouseover" : function(){
		$("#imgcover").show();
	},
	"mouseout" : function(){
		$("#imgcover").hide();
	},
});

$("#imgcover").on('click',function(){
	$("#imageValue").val("");
	$("#previewimg,#previewimg_review").attr("src","");
	$("#previewbox,#previewbox_review").hide();
});

$("#savebtn").on('click',function(){
	if($("#score").text()=="0점"){
		$("#alert_modal .modal_text").html(
			"<div>만족도를 표시해 주세요</div>"
		);
		$("#alert_modal").css("top", $(window).scrollTop() + "px");
		$("#alert_modal").css('display', 'block');
		$('#alert_modal').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	}else if($("textarea").val()==""){
		$("#alert_modal .modal_text").html(
			"<div>상품후기를 작성해 주세요</div>"
		);
		$("#alert_modal").css("top", $(window).scrollTop() + "px");
		$("#alert_modal").css('display', 'block');
		$('#alert_modal').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	}else{
		let textarea = $("textarea").val().replace("\n","<br>");
		let istextreview = $("#imageValue").val() == "";
		
		$.ajax({
			type: 'post',
			url: '/insertreview',
			dataType: 'json',
			data: {
				product_id: $("#product_id").val(),
				order_detail_id: $("#order_detail_id").val(),
				user_id: $("#user_id").val(),
				contents: textarea,
				score:Number($("input[type='range']").val()),
				review_img:$("#imageValue").val(),
				point:istextreview?50:100
			},
			success: function(result) { // 결과 성공 콜백함수
				if(istextreview){
					$("#insert_modal .modal_text").append(
						"<div>후기가 등록되었습니다!<br>기본후기 작성보상 50point가 지급됩니다.</div>"
					);
				}else{
					$("#insert_modal .modal_text").append(
						"<div>후기가 등록되었습니다!<br>사진후기 작성보상 100point가 지급됩니다.</div>"
					);
				}
				$("#insert_modal").css("top", $(window).scrollTop() + "px");
				$("#insert_modal").css('display', 'block');
				$('#insert_modal').on('scroll touchmove mousewheel', function(event) {
					event.preventDefault();
					event.stopPropagation();
					return false;
				});
			},
			error: function(request, status, error) { // 결과 에러 콜백함수
				console.log(error);
			}
		});//ajax end
	}
});

$("#alert_modal").on("click", '.modal_okaybtn', function(event) {
	$(this).parents(".modal").css('display', 'none');
	event.preventDefault();
	event.stopPropagation();
	return false;
});

$("#insert_modal").on("click", '.modal_okaybtn', function() {
	opener.parent.location.reload();
	window.close();
});

$("#updatebtn").on('click',function(){
	if($("#score").text()=="0점"){
		$("#alert_modal .modal_text").html(
			"<div>만족도를 표시해 주세요</div>"
		);
		$("#alert_modal").css("top", $(window).scrollTop() + "px");
		$("#alert_modal").css('display', 'block');
		$('#alert_modal').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	}else if($("textarea").val()==""){
		$("#alert_modal .modal_text").html(
			"<div>상품후기를 작성해 주세요</div>"
		);
		$("#alert_modal").css("top", $(window).scrollTop() + "px");
		$("#alert_modal").css('display', 'block');
		$('#alert_modal').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	}else{
		let textarea = $("textarea").val().replace("\n","<br>");
		let istextreview = $("#imageValue").val() == "";
		
		$.ajax({
			type: 'post',
			url: '/updatereview',
			dataType: 'json',
			data: {
				product_id: $("#product_id").val(),
				order_detail_id: $("#order_detail_id").val(),
				user_id: $("#user_id").val(),
				contents: textarea,
				score:Number($("input[type='range']").val()),
				review_img:$("#imageValue").val(),
				review_id:$("#review_id").val()
			},
			success: function(result) { // 결과 성공 콜백함수
				$("#insert_modal .modal_text").append(
					"<div>후기 수정이 완료되었습니다</div>"
				);
				$("#insert_modal").css("top", $(window).scrollTop() + "px");
				$("#insert_modal").css('display', 'block');
				$('#insert_modal').on('scroll touchmove mousewheel', function(event) {
					event.preventDefault();
					event.stopPropagation();
					return false;
				});
			},
			error: function(request, status, error) { // 결과 에러 콜백함수
				console.log(error);
			}
		});//ajax end
	}
});