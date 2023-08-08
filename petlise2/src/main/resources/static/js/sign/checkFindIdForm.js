function check() {
	if (searchform.name.value.length < 2) {
		alert('이름 필수 입력 사항입니다.');
		searchform.name.focus();
		return false;
	}
	
	if (searchform.email.value == "") {
		alert('이메일 필수 입력 사항입니다.');
		searchform.email.focus();
		return false;
	}

	if (searchform.checkNum.value == "false") {
		alert('이메일 인증 확인해주세요.');
		searchform.number.focus();
		return false;
	}

}
