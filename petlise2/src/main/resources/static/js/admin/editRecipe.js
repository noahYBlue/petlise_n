function create() {
	let recipe_title = document.getElementsByName('recipe_title')[0].value
	let imageValue = $('#imageValue').val();
	let profile_image = imageValue.length == 0 ? '' : imageValue;
	let recipe_contents = quill.root.innerHTML
	let pet_category = title == "강아지" ? "강아지" : "고양이"
	let main_category = document.getElementsByName('main_category')[0].value
	let sub_category = document.getElementsByName('sub_category')[0].value

	if (recipe_title === '') {
		alert('제목을 입력해주세요.')
		return false;
	}
	if (profile_image === '') {
		alert('대표 이미지가 없습니다.')
		return false;
	}
	if (main_category.length === 0 || main_category !== '다이어트식' && main_category !== '기타' && sub_category.length == 0) {
		alert('카테고리를 선택해주세요.')
		return false;
	}
	if (recipe_contents === '<p><br></p>') {
		alert('내용을 입력해주세요.')
		return false;
	}

	let formData = new FormData();
	formData.append("recipe_title", recipe_title)
	formData.append("recipe_contents", recipe_contents)
	formData.append("image", profile_image)
	formData.append("recipe_category", "전문가레시피")
	formData.append("pet_category", pet_category)
	formData.append("main_category", main_category)
	formData.append("sub_category", sub_category)

	const url = `/admin/${title == "강아지" ? 'createexpertrecipe' : 'createexpertrecipe-cat'}`;

	$.ajax({
		url: url,
		type: "post",
		data: formData,
		contentType: false,
		processData: false,
		success: function(data) {
			alert("등록이 완료되었습니다.")
			location.href = `/admin/${title == "강아지" ? 'expertrecipemanagement' : 'expertrecipemanagement-cat'}`;
		},
		error: function(error) {
			console.log(error);
		}
	});

}


function edit() {
	let recipe_title = document.getElementsByName('recipe_title')[0].value
	let imageValue = $('#imageValue').val();
	let profile_image = imageValue.length == 0 ? '' : imageValue;
	let recipe_contents = quill.root.innerHTML
	let main_category = document.getElementsByName('main_category')[0].value
	let sub_category = document.getElementsByName('sub_category')[0].value

	if (recipe_title === '') {
		alert('제목을 입력해주세요.')
		return false;
	}
	if (profile_image === '') {
		alert('대표 이미지가 없습니다.')
		return false;
	}
	if (main_category.length === 0 || main_category !== '다이어트식' && main_category !== '기타' && sub_category.length == 0) {
		alert('카테고리를 선택해주세요.')
		return false;
	}
	if (recipe_contents === '<p><br></p>') {
		alert('내용을 입력해주세요.')
		return false;
	}
	
	let param = document.location.href.split("id=");

	let formData = new FormData();
	formData.append("recipe_id", param[1])
	formData.append("recipe_title", recipe_title)
	formData.append("recipe_contents", recipe_contents)
	formData.append("image", profile_image)
	formData.append("main_category", main_category)
	formData.append("sub_category", sub_category)

	const url = `/admin/editexpertrecipe`;

	$.ajax({
		url: url,
		type: "post",
		data: formData,
		contentType: false,
		processData: false,
		success: function(data) {
			alert("수정이 완료되었습니다.")
			location.href = `/admin/${title == "강아지" ? 'expertrecipemanagement' : 'expertrecipemanagement-cat'}`;
		},
		error: function(error) {
			console.log(error);
		}
	});
	
}