// 대표이미지 썸네일
$("#file").change(function() {
  if (this.files && this.files[0]) {
    var reader = new FileReader();
    reader.onload = function(data) {
      $("#fileimg").attr("src", data.target.result).width(100).height(100).css('border','2px solid var(--light-sub)').css('border-radius','10px');
    };
    reader.readAsDataURL(this.files[0]);
  }
});

// 모달
function showModal() {
  var modal = document.getElementById("alertmodal");
  modal.style.display = "block";
}

function hideModal() {
  var modal = document.getElementById("alertmodal");
  modal.style.display = "none";
}



// 모달 확인 버튼 클릭 시 모달 닫기
$("#alertmodal .okaybtn").on('click', function() {
  hideModal();
});

function edit() {
  // 등록 전 유효성 검사
  let recipe_title = document.getElementById("recipeTitle").value;
  let pet_category = document.querySelector("input[name='pet_category']:checked");
  let main_category = document.querySelector("#dropdown .select span").textContent; 
  let sub_category = document.querySelector("#dropdown2 .select span").textContent; 
  let recipe_contents = quill.root.innerHTML;
  let imageValue = $('#imageValue').val();
  let image = imageValue.length == 0 ? '' : imageValue;

  // 유효성 검사 추가
  if (recipe_title === "") {
    document.querySelector(".modal_text div").textContent = "레시피 제목을 입력해주세요.";
    showModal();
    return false;
  }
  
  if (image === "") {
    document.querySelector(".modal_text div").textContent = "레시피 대표이미지를 등록해주세요.";
    showModal();
    return false;
  }

  if (!pet_category) {
    document.querySelector(".modal_text div").textContent = "어떤 반려동물을 위한 레시피인지 선택해주세요.";
    showModal();
    return false;
  }

  if (main_category === "카테고리 선택" && main_category !== "기타") {
  document.querySelector(".modal_text div").textContent = "메인 카테고리를 선택해주세요.";
  showModal();
  return false;
  }

  if (main_category === "기타") {
  // main_category가 '기타'일 때는 sub_category 검사를 제외  
} else if (sub_category === "카테고리 선택") {
  document.querySelector(".modal_text div").textContent = "서브 카테고리를 선택해주세요.";
  showModal();
  return false;
}


  if (recipe_contents === '<p><br></p>') {
    document.querySelector(".modal_text div").textContent = "레시피 내용을 입력해주세요.";
    showModal();
    return false;
  }

  // 유효성 검사 통과 시, 모달 닫기
  hideModal();

  // 데이터 서버로 전송
  let formData = new FormData();
  formData.append("recipe_id", $("#recipe_id").val());
  formData.append("recipe_title", recipe_title);
  formData.append("recipe_contents", recipe_contents);
  formData.append("main_category", main_category);
  formData.append("pet_category", pet_category.value);
  formData.append("sub_category", sub_category);
  formData.append("image", imageValue);

  $.ajax({
    url: "/recipeupdate",
    type: "post",
    data: formData,
    contentType: false,
    processData: false,
    success: function(data) {
      // 성공적으로 저장되었을 때 처리
      console.log("레시피가 성공적으로 저장되었습니다.");
      

       // 모달 띄우기
      showEditModal(pet_category, main_category);
    },    
    error: function(error) {
      // 저장 중 오류가 발생했을 때 처리
      console.log(error);
      // 등록 버튼 다시 활성화
      document.getElementById("submitButton").disabled = false;
    }
  });

}

// 모달 띄우기
function showEditModal(pet_category, main_category) {
  var modal = document.getElementById("edit_modal");
  modal.style.display = "block";

  // 모달 확인 버튼 클릭 시 리다이렉션 처리
  $("#edit_modal .edit_modal_okbtn").on('click', function() {
    let petCategory = "강아지";
    if (pet_category && pet_category.value === "고양이") {
      petCategory = "고양이";
    }
    let redirectUrl;
    if (main_category === "일반식") {
      redirectUrl = "recipelist";
    } else if (main_category === "건강식") {
      redirectUrl = "recipelist";
    } else if (main_category === "간식") {
      redirectUrl = "recipelist";
    } else {
      redirectUrl = "recipelist";
    }
    redirectUrl = `recipelist?recipeType=나만의레시피&searchType1=${petCategory}&searchType2=${main_category}&searchType3=전체`;
    window.location.replace(redirectUrl);

    // 모달 닫기
    modal.style.display = "none";
  });
}

//-----제목 글자 수 제한-----
document.addEventListener("DOMContentLoaded", function() {
	 var inputElement = document.getElementById("recipeTitle");
	 var maxLength = 45;

	 inputElement.addEventListener("input", function() {
     if (this.value.length > maxLength) {
     this.value = this.value.substring(0, maxLength);
     }
	});
});
