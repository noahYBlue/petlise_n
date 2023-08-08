function check() {
	if (signupForm.email.value.length == 0) {
		alert('이메일 필수 입력 사항입니다.');
		signupForm.email.focus();
		return false;
	}

	if (signupForm.emailCheckButton.value == "false") {
		alert('이메일 중복 확인해주세요.');
		signupForm.email.focus();
		return false;
	}

	if (signupForm.checkNum.value == "false") {
		alert('이메일 인증 확인해주세요.');
		signupForm.number.focus();
		return false;
	}

	if ($("#pwRequired").text() !== "" || signupForm.password.value.length < 6) {
		alert('비밀번호 필수 입력 사항입니다.');
		signupForm.password.focus();
		return false;
	}

	if ($("#checkPwRequired").text() !== "" || signupForm.checkPassword.value.length < 6) {
		alert('비밀번호 확인 필수 입력 사항입니다.');
		signupForm.checkPassword.focus();
		return false;
	}

	if (signupForm.password.value != signupForm.checkPassword.value) {
		alert('비밀번호가 다릅니다.');
		signupForm.checkPassword.select();
		return false;
	}

	if ($("#nameRequired").text() !== "" && signupForm.name.value.length < 2) {
		alert('이름 필수 입력 사항입니다.');
		signupForm.name.focus();
		return false;
	}

	if (signupForm.sample6_postcode.value == "") {
		alert('주소 필수 입력 사항 입니다.');
		signupForm.sample6_postcode.focus();
		return false;
	}

	if (!signupForm.text1.checked || !signupForm.text2.checked) {
		alert('이용약관 또는 개인정보 수집 및 이용에 대한 동의는 필수 입니다.');
		signupForm.text1.focus();
		return false;
	}

	alert("회원가입이 완료되었습니다.")
}
