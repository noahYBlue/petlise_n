const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
const nameReg = /^[가-힣a-zA-Z]{2,20}$/;

function regEmail() {
	let email = $('#email').val();

	if (!emailReg.test(email)) {
		$("#emailRequired").text("이메일 형식을 지켜주세요.");
		$("#emailRequired").addClass("required");
	}
	else {
		$('#emailRequired').text('');
		$("#emailRequired").removeClass("required");
	}
};


$(document).ready(function() {
	$('#emailCheckButton').on('click', function(e) {
		var email = $('#email').val();
		
		if (emailReg.test(email)) {
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

function regPw() {
	let pw = $('#password').val();

	if (!pwReg.test(pw)) {
		$("#pwRequired").text("비밀번호는 영문과 숫자를 포함한 6~12자리 입니다.");
		$("#pwRequired").addClass("required");
	}
	else {
		$('#pwRequired').text('');
		$("#pwRequired").removeClass("required");
	}
};

function checkPw() {
	let pw = $('#password').val();
	let checkpw = $('#checkPassword').val()

	if (pw !== checkpw) {
		$("#checkPwRequired").text("비밀번호가 일치하지 않습니다.");
		$("#checkPwRequired").addClass("required");
	}
	else {
		$('#checkPwRequired').text('');
		$("#checkPwRequired").removeClass("required");
	}
};

function regName() {
	let name = $('#name').val();

	if (!nameReg.test(name)) {
		$("#nameRequired").text("한글 또는 영문 이름 2글자 이상 20자 이내 입니다.");
		$("#nameRequired").addClass("required");
	}
	else {
		$('#nameRequired').text('');
		$("#nameRequired").removeClass("required");
	}
};