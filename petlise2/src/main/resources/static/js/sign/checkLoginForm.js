function onSubmit(event) {
	event.preventDefault(); 
}

function checkLogin() {
	if (loginform.email.value == "") {
		alert('이메일 필수 입력 사항입니다.');
		loginform.email.focus();
		return false;
	}

	if (loginform.password.value == "") {
		alert('비밀번호 필수 입력 사항입니다.');
		loginform.password.focus();
		return false;
	}
}
