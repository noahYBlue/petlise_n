<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/recipe/recipeList.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="css/shop/pagination_shop.css" />
<link rel="stylesheet" href="css/recipe/modal_main.css" />

<title>PetLiSe</title>
<script src="/js/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
	});
	
	</script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="wrap">
		<div id="board_title">
			<input type="hidden" id="recipeType" value="${param.recipeType}" />
			<input type="hidden" id="searchType1" value="${param.searchType1}" />

			<div class="pet_icon">
				<div class="dog_icon">
					<img src="/images/recipe/crown.png">
				</div>
			</div>

			<div class="title_recipe">
				<c:if test="${param.recipeType == '전문가레시피'}">
					<span>전문가 레시피</span>
				</c:if>
				<c:if test="${param.recipeType == '나만의레시피'}">
					<span>나만의 레시피</span>
				</c:if>
			</div>
			<div class="subtitle_recipe">
				<span>이달의 레시피</span>
			</div>
		</div>

		<div id="search_container">

			<div id="searchdiv" style="margin-left: 1036px;">
				<c:choose>
					<c:when test="${param.keyword == '' || param.keyword eq null}">
						<input type="text" id="keyword" placeholder="'레시피제목' 검색" />
					</c:when>
					<c:otherwise>
						<input type="text" id="keyword" value="${param.keyword}" />
					</c:otherwise>
				</c:choose>
				<button id="searchbtn">
					<img src="/images/recipe/search.svg">
				</button>
			</div>
		</div>

		<div id="recipe_container">


			<div class="recipe-line">
				<c:if test="${fn:length(response.list) == 0}">
					<div id="noresult">해당하는 레시피가 없습니다.</div>
				</c:if>
				<c:forEach var="recipe" items="${response.list}">
					<c:if test="${recipe.recipe_of_the_month}">
						<div class="recipe" id="${recipe.recipe_id}">
							<div class="recipe_img"
								style="background-image: url(https://storage.googleapis.com/${recipe.image});">
								<c:if test="${!recipe.is_like}">
									<c:choose>
										<c:when test="${recipe.pet_category == '강아지'}">
											<img src="/images/recipe/dog_recipe.png">
										</c:when>
										<c:when test="${recipe.pet_category == '고양이'}">
											<img src="/images/recipe/cat_recipe.png">
										</c:when>
									</c:choose>
									<div class="recipe_cover">
										<button class="like-button"
											data-recipe-id="${recipe.recipe_id}">
											<div class="likes_num">${recipe.likes}</div>
										</button>
									</div>
								</c:if>
								<c:if test="${recipe.is_like}">
									<c:choose>
										<c:when test="${recipe.pet_category == '강아지'}">
											<img src="/images/recipe/dog_recipe.png">
										</c:when>
										<c:when test="${recipe.pet_category == '고양이'}">
											<img src="/images/recipe/cat_recipe.png">
										</c:when>
									</c:choose>
									<div class="recipe_cover">
										<button class="like-button"
											data-recipe-id="${recipe.recipe_id}">
											<div class="likes_num">${recipe.likes}</div>
										</button>
									</div>
									<div class="recipe_cover active">
										<button class="like-button"
											data-recipe-id="${recipe.recipe_id}">
											<div class="likes_num">${recipe.likes}</div>
										</button>
									</div>
								</c:if>
							</div>
							<div id="recipe_info">
								<div class="info_title">
									<span>${recipe.recipe_title}</span>
								</div>
								<div class="info_content">
									<span class="recipe_content">${recipe.limitedContent}</span>
								</div>
								<div id="info_bottom">
									<div class="info_writer">
										<span>${recipe.user.name}</span>
									</div>
									<div class="info_date">
										<span style="margin-right: 10px;"><fmt:formatDate
												value="${recipe.recipe_created_at}" pattern="yyyy.MM.dd" /></span>
										<span style="margin-right: 5px;">댓글수 ${recipe.comments}</span>	
										<span style="margin-right: 5px;">조회수 ${recipe.view_cnt}</span>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>

		</div>


		<div class="page">
			<div id="pagination">
				<c:if test="${fn:length(response.list) != 0}">
					<div class="pagefirst"
						<c:if test="${!response.pagination.existPrevPage}"> style="visibility: hidden;" </c:if>>
						<div class="prevArrow"></div>
						<div class="prevArrow" style="margin-left: -3px"></div>
					</div>
					<div class="prev" id="${response.pagination.startPage-1}"
						<c:if test="${!response.pagination.existPrevPage}"> style="visibility: hidden;" </c:if>>
						<div class="prevArrow"></div>
					</div>

					<c:choose>
						<c:when test="${param.page eq null}">
							<c:forEach begin="1" end="${response.pagination.endPage}"
								varStatus="vs">
								<c:if test="${vs.index == 1}">
									<div class="pageNumber active">${vs.index}</div>
								</c:if>
								<c:if test="${vs.index != 1}">
									<div class="pageNumber">${vs.index}</div>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach begin="${response.pagination.startPage}"
								end="${response.pagination.endPage}" varStatus="vs">
								<c:if test="${vs.index == param.page}">
									<div class="pageNumber active">${vs.index}</div>
								</c:if>
								<c:if test="${vs.index != param.page}">
									<div class="pageNumber">${vs.index}</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<div class="next" id="${response.pagination.startPage+10}"
						<c:if test="${!response.pagination.existNextPage}"> style="visibility: hidden;" </c:if>>
						<div class="nextArrow"></div>
					</div>
					<div class="pagelast" id="${response.pagination.totalPageCount}"
						<c:if test="${!response.pagination.existNextPage}"> style="visibility: hidden;" </c:if>>
						<div class="nextArrow"></div>
						<div class="nextArrow" style="margin-left: -6px"></div>
					</div>
				</c:if>
			</div>
			<!-- pagination -->
		</div>
		
	</div>
	<div class="modal" id="login_modal">
		<div class="modal_contents">
			<div class="modal_text">
			<div>
			<img src="/images/logo-icon.png" style="margin-bottom:10px; width:25px;"/><br>
			로그인이 필요한 항목입니다.<br>
			로그인 페이지로 이동하시겠습니까?
			</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button class="modal_loginbtn">이동</button>
			</div>
		</div>
	</div>
	
	<div class="modal" id="like_modal">
		<div class="modal_contents">
			<div class="modal_text">
			<div>
			<img src="/images/logo-icon.png" style="margin-bottom:10px; width:25px;"/><br>
			이 레시피에 좋아요 표시를 하시겠습니까?
			</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button class="modal_okbtn">확인</button>
			</div>
		</div>
	</div>
		<div class="modal" id="like_delete_modal">
		<div class="modal_contents">
			<div class="modal_text">
			<div>
			<img src="/images/logo-icon.png" style="margin-bottom:10px; width:25px;"/><br>
			이 레시피의 좋아요를 취소하시겠습니까?
			</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button class="modal_okbtn">확인</button>
			</div>
		</div>
	</div>	
	<jsp:include page="../footer.jsp" />
	<jsp:include page="../topButton.jsp" />	
</body>

<script>
$("#recipe_container").on('click', '.like-button', function () {
    var button = $(this);
    var likesNum = button.find(".likes_num");
    var isIs_Like = button.parents().hasClass('active');
    var recipeId = button.attr('data-recipe-id'); // 해당 레시피의 ID

    if ("${user_id}" == "") {
        // 로그인되지 않은 경우 로그인 모달을 보여줍니다.
        $("#login_modal").css("top", $(window).scrollTop() + "px");
        $("#login_modal").css('display', 'block');

        $('#login_modal').on('scroll touchmove mousewheel', function (event) {
            event.preventDefault();
            event.stopPropagation();
            return false;
        });
    } else {
        if (!isIs_Like) {
            // 모달 창을 보여줍니다.
            $("#like_modal").css('display', 'block');

            // 확인 버튼을 누를 때 좋아요 추가 함수를 실행하는 이벤트 핸들러 등록
            $(".modal_okbtn").off("click").on("click", function () {
                $("#like_modal").css('display', 'none'); // 모달 창 닫기
                button.parents().addClass("active");
                button.css("background-image", "url('/images/recipe/hit_f.svg')");
                likesNum.text(Number(likesNum.text()) + 1);

                // 좋아요 추가 함수 실행
                $.ajax({
                    type: 'post',
                    url: '/recipe/likeup',
                    dataType: 'json',
                    data: {
                        user_id: "${sessionScope.user_id}",
                        recipe_id: recipeId
                    },
                    success: function (result) { // 결과 성공 콜백함수
                        // 변경된 좋아요 수를 업데이트합니다.
                        likesNum.text(result.likes);
                    },
                    error: function (request, status, error) { // 결과 에러 콜백함수
                        console.log(error);
                    }
                }); // ajax end
            });
        } else {
            // 모달 창을 보여줍니다.
            $("#like_delete_modal").css('display', 'block');

            // 확인 버튼을 누를 때 좋아요 취소 함수를 실행하는 이벤트 핸들러 등록
            $(".modal_okbtn").off("click").on("click", function () {
                $("#like_delete_modal").css('display', 'none'); // 모달 창 닫기
                button.parents().removeClass("active");
                button.css("background-image", "url('/images/recipe/hit.svg')");
                likesNum.text(Number(likesNum.text()) - 1);

                // 좋아요 취소 함수 실행
                $.ajax({
                    type: 'post',
                    url: '/recipe/likedown',
                    dataType: 'json',
                    data: {
                        user_id: "${sessionScope.user_id}",
                        recipe_id: recipeId
                    },
                    success: function (result) { // 결과 성공 콜백함수
                        // 변경된 좋아요 수를 업데이트합니다.
                        likesNum.text(result.likes);
                    },
                    error: function (request, status, error) { // 결과 에러 콜백함수
                        console.log(error);
                    }
                }); // ajax end
            });
        }
    }
});


//----- 모달이벤트(모달 내 취소버튼) -----
$(".modal_cancelbtn").on('click',function(){
	$(this).parents(".modal").css('display', 'none');
});

//----- 모달창 로그인 이동 버튼 -----
$(".modal_loginbtn").on('click',function(){
	location.href = "/signin";
});
</script>
<script src="/js/recipe/recipeList.js"></script>

</html>
