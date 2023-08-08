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
    	<link rel="stylesheet" href="/css/recipe/recipeCreate.css" /> 
    	<link rel="stylesheet" href="/css/recipe/modal.css" />
    	<link rel="stylesheet" href="/css/admin/expertRecipeCategory.css" />
    	<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet"/>
    	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    	
		<title>PetLiSe</title>
	</head>
	<body>
	<jsp:include page="../header.jsp" />
		<div class="wrap">
		
			<div id="board_title">
				<div class="title_recipe">
					<span>나만의 레시피</span>
				</div>
				<div class="subtitle_recipe">
					<span>레시피 등록</span>
				</div>
			</div>
				<div class="title_input">
					<input type="text" name="recipe_title" id="recipeTitle" placeholder="레시피 제목">
				</div>
				
		<div class="thumbnail">
			<p>대표이미지</p>
			<label for="file"> 
				<img
				src="${recipe.image == '' ? ('https://storage.googleapis.com/' + recipe.image) :''}"
				onerror="this.onerror=null; this.src='/images/image-icon.svg';"
				alt="대표이미지" id="fileimg" /> 
				<input type="hidden" id="imageValue" name="image" value="${recipe.image}" />
			</label> 			
			<input type="file" id="file" accept="image/*" onchange="imageUpload()" />
		</div>
		

		<div class="dog_cat"><span>어떤 반려동물을 위한 레시피인가요?</span></div>
				<div class="pet_choose">
					<label class="dog">
						<input type="radio" name="pet_category" value="강아지">
						<img src="/images/recipe/dog_icon.svg">
						<span>강아지</span>
					</label>
					<label class="cat">
						<input type="radio" name="pet_category" value="고양이">
						<img src="/images/recipe/cat_icon.svg">
						<span>고양이</span>
					</label>
				</div>

				<div class="category">
					<span>카테고리</span>
				</div>

				<div class="categoryWrap">
					<div class="category" >
						<div id="dropdown" class="dropdown" name="main_category" ></div>
					</div>

					<div class="category" id="smallCategory" >
						<div id="dropdown2" class="dropdown">
							<div class="select">
								<span>카테고리 선택</span>
							</div>
							<input type="hidden" name="sub_category" />
							<ul id="dropdown-menu" class="dropdown-menu"></ul>
						</div>
					</div><!-- 서브카테고리 -->
				</div>

				 <div id="editor">${recipe.recipe_contents}</div>  					 
				<div class="createButton">				
 					 <button type="button" id="submitButton" onclick="edit()">등록하기</button>
				</div>

				
		</div>

	<!-- 경고창 -->
	<div class="modal" id="alertmodal">
		<div class="modal_contents">
			<div class="modal_text">
				<div>
					<img src="/images/logo-icon.png"
						style="margin-bottom: 10px; width: 25px;" /><br>
				</div>
			</div>
			<div class="modal_btn">
				<button class="okaybtn">확인</button>
			</div>
		</div>
	</div>

	<div class="modal" id="success_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<div>
					<img src="/images/logo-icon.png"
						style="margin-bottom: 10px; width: 25px;" />
						<br> 소중한 레시피 공유 감사합니다. <br>100 point를 획득하셨습니다.<br>
						<div class="alert">※등록한 레시피를 삭제할 시 100 point가 차감됩니다.<br>
						※이달의 레시피 선정시 해당 레시피는 삭제가 불가합니다.</div>
				</div>
			</div>
			<div class="modal_btn">
				<button class="success_modal_okbtn">확인</button>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	<jsp:include page="../topButton.jsp" />	
		
		<script src="/js/editor.js"></script>
		<script src="/js/recipe/recipeCategory.js"></script>		
		<script src="/js/imageUpload.js"></script>
		<script src="/js/recipe/recipeCreate.js"></script>
		

		
	</body>
	
</html>
