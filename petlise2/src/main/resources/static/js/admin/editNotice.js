function edit() {
	let title = document.getElementsByName('title')[0].value
	let contents = quill.root.innerHTML
	let category = document.getElementsByName('category')[0].value

	if (category.length === 0) {
		alert('카테고리를 선택해주세요.')
		return false;
	}
	if (title === '') {
		alert('제목을 입력해주세요.')
		return false;
	}
	if (contents === '<p><br></p>') {
		alert('내용을 입력해주세요.')
		return false;
	}
	
	let param = document.location.href.split("id=");

	let formData = new FormData();
	formData.append("title", title)
	formData.append("contents", contents)
	formData.append("category", category)
	if(param) formData.append("notice_id", param[1])

	$.ajax({
		url: `${check == '등록' ? 'createnotice' : 'editnotice'}`,
		type: "post",
		data: formData,
		contentType: false,
		processData: false,
		success: function(data) {
			alert(`${check}이 완료되었습니다.`)
			location.href = `/admin/noticemanagement`;
		},
		error: function(error) {
			console.log(error);
		}
	});

}