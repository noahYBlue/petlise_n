function imageUpload() {
	const file = document.getElementById("file");
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
			$("#imgUrl").attr("src", `https://storage.googleapis.com/${url}`);
			$("#imageValue").val(url);
		},
		error: function(error) {
			console.log(error);
		}
	})
};