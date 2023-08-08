const pwReg = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;

function regPw() {
	let pw = $('#password').val();

	if (!pwReg.test(pw)) {
		$('#pwRequired').text('비밀번호는 영문과 숫자를 포함한 6~12자리 입니다.');
		$('#pwRequired').addClass('required');
	} else {
		$('#pwRequired').text('');
		$('#pwRequired').removeClass('required');
	}
}

function checkPw() {
	let pw = $('#password').val();
	let checkpw = $('#checkPassword').val();

	if (pw !== checkpw) {
		$('#checkPwRequired').text('비밀번호가 일치하지 않습니다.');
		$('#checkPwRequired').addClass('required');
	} else {
		$('#checkPwRequired').text('');
		$('#checkPwRequired').removeClass('required');
	}
}

function check() {
	if ($("#pwRequired").text() !== "" || searchform.password.value.length < 6) {
		alert('비밀번호 필수 입력 사항입니다.');
		searchform.password.focus();
		return false;
	}

	if ($("#checkPwRequired").text() !== "" || searchform.checkPassword.value.length < 6) {
		alert('비밀번호 확인 필수 입력 사항입니다.');
		searchform.checkPassword.focus();
		return false;
	}

	if (searchform.password.value != searchform.checkPassword.value) {
		alert('비밀번호가 다릅니다.');
		searchform.checkPassword.select();
		return false;
	}
	
	alert("새로운 비밀번호 등록이 완료되었습니다.")
}
