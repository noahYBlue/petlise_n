let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
let regPW = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;

function EmailReg() {
	var email = $('#email').val();

	if (!regEmail.test(email)) {
		$("#emailRequired").text("이메일 형식을 지켜주세요.");
		$("#emailRequired").addClass("required");
	}
	else {
		$('#emailRequired').text('');
		$("#emailRequired").removeClass("required");
	}
};


$(document).ready(function() {
	$('#emailCheckButton').on('click', function() {
		var email = $('#email').val();

		if (regEmail.test(email)) {
			$.ajax({
				url: "/checkemail",
				type: "post",
				data: {
					email: email
				},
				success: function(data) {
					if (data == 0) {
						alert("가입 가능한 이메일 입니다.")
						$('#emailCheckButton').val("true");
					} else {
						alert("등록된 이메일 입니다.")
						$('#emailCheckButton').val("false");
					}
				},
				error: function(error) {
					console.log(error);
				}
			});
		} else {
			alert("이메일을 입력해주세요")
		}
	});
})