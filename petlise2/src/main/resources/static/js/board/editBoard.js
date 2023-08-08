

function edit() {
	let board_title = document.getElementsByName('board_title')[0].value;
	let board_contents = quill.root.innerHTML;



	if (board_title === '') {
		alert('제목을 입력해주세요.');
		return false;
	}



	if (board_contents === '<p><br></p>') {
		alert('내용을 입력해주세요.');
		return false;
	}
	let formData = new FormData();
	formData.append("board_title", board_title);

	formData.append("board_contents", board_contents);




	$.ajax({
		url: "boardWriteform",
		type: "post",
		data: formData,
		contentType: false,
		processData: false,
		success: function(data) {
			var seq = data;

			if (seq) {
				// 서버 응답으로부터 받은 place_id를 이용하여 리다이렉션합니다.
				alert('등록이 완료되었습니다.');
				window.location.href = "/getboard?seq=" + seq;
			} else {
				alert('죄송합니다. 잠시후 다시 시도 해 주세요.');
				// 만약 서버 응답에서 place_id가 없다면 경고 메시지만 표시할 수 있습니다.
			}
		},
		error: function(xhr, status, error) {
			alert('등록이 실패했습니다.');
		}
	});
}
