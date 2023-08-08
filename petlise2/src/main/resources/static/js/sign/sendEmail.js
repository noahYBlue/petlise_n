function sendNumber() {
	let email = $("#email").val();
	
	if ($('#emailCheckButton').val() == "true") {
		$.ajax({
			url: "/sendemail",
			type: "post",
			dataType: "json",
			data: { email: email },
			success: function(data) {
				alert("인증번호가 발송되었습니다.");
				$("#sendNum").attr("value", data);
				$("#sendNum").css("display", "none");
				$("#checkNum").css("display", "block");
			},
		});
	} else {
		alert("이메일 중복확인 해주세요.")
	}
}

function findUser() {
	const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let email = $("#email").val();
	
	if (emailReg.test(email)) {
		$.ajax({
			url: "/sendemail",
			type: "post",
			dataType: "json",
			data: {
				email: $("#email").val(),
			},
			success: function(data) {
				alert("인증번호가 발송되었습니다.");
				$("#sendNum").attr("value", data);
				$("#sendNum").attr("disabled",true);
				$("#checkNum").attr("disabled",false);
			},
		});
	} else {
		alert("이메일 형식을 지켜주세요.");
	}
}

function confirmNumber() {
	var number1 = $("#number").val();
	var number2 = $("#sendNum").val();

	if (number1 == number2) {
		alert("인증되었습니다.");
		$("#checkNum").attr("value", "true");
	} else {
		alert("번호가 다릅니다.");
	}
}