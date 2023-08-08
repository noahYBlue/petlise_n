<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/recipe/recipeEdit.css" /> 
    <link rel="stylesheet" href="/css/recipe/modal.css" />
    <link rel="stylesheet" href="/css/admin/expertRecipeCategory.css" />
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet"/>
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <title>PetLiSe</title>
</head>
<body>
<script>
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const recipe_id = urlParams.get('recipe_id');
</script>
<jsp:include page="../header.jsp" />
<div class="wrap">
    <div id="board_title">
        <div class="title_recipe">
            <span>${recipeEdit.recipe_category}</span>
        </div>
        <div class="subtitle_recipe">
            <span>레시피 수정</span>
        </div>
    </div>
    <div class="title_input">
        <input type="text" name="recipe_title" id="recipeTitle" placeholder="레시피 제목" value="${recipeEdit.recipe_title}">
    </div>
    <div class="thumbnail">
        <p>대표이미지</p>
        <label for="file"> 
            <img src="https://storage.googleapis.com/${recipeEdit.image}"
                onerror="this.onerror=null; this.src='/images/image-icon.svg';" alt="대표이미지" id="fileimg" /> 
            <input type="hidden" id="imageValue" name="image" value="${recipeEdit.image}" />
        </label> 			
        <input type="file" id="file" accept="image/*" onchange="imageUpload()" />
    </div>
    <div class="dog_cat">
        <span>어떤 반려동물을 위한 레시피인가요?</span>
    </div>
    <div class="pet_choose">
        <label class="dog">
            <input type="radio" name="pet_category" value="강아지" ${recipeEdit.pet_category == '강아지' ? 'checked' : ''}>
            <img src="/images/recipe/dog_icon.svg">
            <span>강아지</span>
        </label>
        <label class="cat">
            <input type="radio" name="pet_category" value="고양이" ${recipeEdit.pet_category == '고양이' ? 'checked' : ''}>
            <img src="/images/recipe/cat_icon.svg">
            <span>고양이</span>
        </label>
    </div>
    <div class="category">
        <span>카테고리</span>
    </div>
    <div class="categoryWrap">
        <div class="category">
            <div id="dropdown" class="dropdown" name="main_category"></div>
        </div>
        <div class="category" id="smallCategory">
            <div id="dropdown2" class="dropdown">
                <div class="select">
                    <span>${recipeEdit.sub_category}</span>
                </div>
                <input type="hidden" name="sub_category" value="${recipeEdit.sub_category}" />
                <ul id="dropdown-menu" class="dropdown-menu"></ul>
            </div>
        </div>
    </div>
    <div id="editor">${recipeEdit.recipe_contents}</div>  					 
    <div class="createButton">				
        <button type="button" id="submitButton" onclick="edit()">수정하기</button>
    </div>
</div>
<input type="hidden" id="recipe_id" value="${recipeEdit.recipe_id}">


<div class="modal" id="alertmodal">
    <div class="modal_contents">
        <div class="modal_text">
            <div></div>
        </div>
        <div class="modal_btn"><button class="okaybtn">확인</button></div>
    </div>
</div>
<div class="modal" id="edit_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<div>
					<img src="/images/logo-icon.png"
						style="margin-bottom: 10px; width: 25px;" />
						<br> 레시피 수정이 완료되었습니다. 						
				</div>
			</div>
			<div class="modal_btn">
				<button class="edit_modal_okbtn">확인</button>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp" />
<jsp:include page="../topButton.jsp" />	

<script>    
    function setMainCategoryAndSubCategory(mainCategory, subCategory) {
        const mainCategoryDropdown = document.getElementById('dropdown');
        const subCategoryDropdown = document.getElementById('dropdown2');
               
        mainCategoryDropdown.querySelector('span').textContent = mainCategory;
        mainCategoryDropdown.querySelector('input[name="main_category"]').value = mainCategory;
                
        if (subCategory !== '') {
            subCategoryDropdown.querySelector('span').textContent = subCategory;
            subCategoryDropdown.querySelector('input[name="sub_category"]').value = subCategory;
            subCategoryDropdown.style.display = 'block';
        } else {
            subCategoryDropdown.style.display = 'none';
        }
    }
    document.addEventListener("DOMContentLoaded", function() {
        const recipeEditData = {
            main_category: "${recipeEdit.main_category}",
            sub_category: "${recipeEdit.sub_category}"
        };
        setMainCategoryAndSubCategory(recipeEditData.main_category, recipeEditData.sub_category);
  });
</script>
		<script src="/js/editor.js"></script>
		<script src="/js/recipe/recipeEditCategory.js"></script>		
		<script src="/js/imageUpload.js"></script>
		<script src="/js/recipe/recipeEdit.js"></script>

</body>
</html>
