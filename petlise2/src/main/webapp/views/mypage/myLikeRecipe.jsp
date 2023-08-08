<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Pet LiSe</title>
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/mypage/myLikeRecipe.css" />
<link rel="stylesheet" href="/css/mypage/myPageForm.css" />
<link rel="stylesheet" href="/css/shop/pagination_shop.css" />
<link rel="stylesheet" href="/css/shop/modal_main.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<p class="title">마이페이지</p>

	<div class="container">
		<div id="mypageMenu" class="menu"></div>

		<div class="contents">
			<div class="contents_Title">좋아요 레시피</div>
			
			<div class="categoryWrap">
				<div class="category">
					<div id="dropdown2" class="dropdown">
						<div class="select">
							<span> <c:if
									test="${param.searchType2 == '' || param.searchType2 eq null }">동물구분</c:if>
								${param.searchType2}
							</span>
						</div>
						<input type="hidden" id="searchType2" name="searchType2"
							value="${param.searchType2}" />
						<ul id="dropdown-menu" class="dropdown-menu">
							<li>전체</li>
							<li>강아지</li>
							<li>고양이</li>
						</ul>
					</div>
				</div>

				<div class="category" id="Category3">
					<div id="dropdown3" class="dropdown">
						<div class="select">
							<span> <c:if test="${param.searchType3 == '' || param.searchType3 eq null }">대분류</c:if>
								${param.searchType3}
							</span>
						</div>
						<input type="hidden" id="searchType3" name="searchType3" value="${param.searchType3}" />
						<ul id="dropdown-menu" class="dropdown-menu">
							<li>전체</li>
							<li>건강식</li>
							<li>일반식</li>
							<li>간식</li>
							<li>기타</li>
						</ul>
					</div>
				</div>

				<div id="searchdiv">
					<img id="searchimg" src="/images/shop/shoplist/search_main.svg">
					<c:choose>
						<c:when test="${param.keyword == '' || param.keyword eq null}">
							<input type="text" id="keyword" name="keyword" placeholder="레시피 제목 검색" />
						</c:when>
						<c:otherwise>
							<input type="text" id="keyword" name="keyword" value="${param.keyword}" />
						</c:otherwise>
					</c:choose>
				</div>
				<button id="searchbtn">검색</button>
				<!-- searchdiv -->
			</div> <!-- categoryWrap -->
			
			
			<div id="boardlist">
				<table id="boardtable">
					<thead>
						<tr>
							<th>동물구분</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>좋아요수</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(response.list) < 1}">
							<tr class="no_data_msg">
								<td>
									<div>
										해당 조건의 좋아요한 레시피가 없습니다.
									</div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${response.list}" var="myrecipelike">
							<tr class="list_tr">
								<td>${myrecipelike.recipe.pet_category}</td>
								<td>${myrecipelike.recipe.main_category}</td>
								<td>${myrecipelike.recipe.sub_category}</td>
								<td><a href="/recipedetail?recipe_id=${myrecipelike.recipe.recipe_id}">${myrecipelike.recipe.recipe_title}</a></td>
								<td><fmt:formatDate	value="${myrecipelike.recipe.recipe_created_at}" pattern="yyyy.MM.dd H:mm" /></td>
								<td>${myrecipelike.recipe.view_cnt}</td>
								<td><fmt:formatNumber value="${myrecipelike.recipe.likes}" pattern="#,###"/></td>
								<td class="recipedelete" id="${myrecipelike.recipe.recipe_id}">삭제</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div> <!-- boardlist -->
			
			
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

				<div class="next" id="${response.pagination.endPage+1}"
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
	</div><!-- contents -->

		<div class="modal" id="delete_alert_modal">
			<div class="modal_contents">
				<div class="modal_text">
				<img src="/images/mypage/warning.svg">
				좋아요를 삭제하시겠습니까?
				</div>
				<div class="modal_btn">
					<button class="modal_cancelbtn">취소</button>
					<button class="modal_deletebtn">삭제</button>
					<input type="hidden" id="delete_user_id" value="${user_id}"/>
					<input type="hidden" id="delete_recipe_id" value=""/>
				</div>
			</div>
		</div>

		<div class="modal" id="delete_okay_modal">
			<div class="modal_contents">
				<div class="modal_text">
				좋아요가 취소되었습니다.
				</div>
				<div class="modal_btn">
					<button class="modal_okaybtn">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />

	<script src="/js/mypageMenu.js"></script>
	<script src="/js/mypage/myLikeRecipe.js"></script>
	<script src="/js/admin/shop/shopCategory_list.js"></script>
	
	<script>
		//검색버튼
		$("#searchbtn").on('click', function() {
			const queryparamsPage = {
				page: 1,
				searchType2:$("#searchType2").val(),
				searchType3:$("#searchType3").val(),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
	
		//숫자 페이징버튼 
		$(".pageNumber").on('click', function() {
			const queryparamsPage = {
				page: $(this).text(),
				searchType2:$("#searchType2").val(),
				searchType3:$("#searchType3").val(),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//첫페이지버튼 
		$(".pagefirst").on('click', function() {
			const queryparamsPage = {
				page: 1,
				searchType2:$("#searchType2").val(),
				searchType3:$("#searchType3").val(),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//이전페이지버튼
		$(".prev").on('click', function() {
			const queryparamsPage = {
		    	page: $(this).attr("id"),
		    	searchType2:$("#searchType2").val(),
				searchType3:$("#searchType3").val(),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//다음페이지버튼
		$(".next").on('click', function() {
			const queryparamsPage = {
				page: $(this).attr("id"),
				searchType2:$("#searchType2").val(),
				searchType3:$("#searchType3").val(),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//마지막페이지버튼
		$(".pagelast").on('click', function() {
			const queryparamsPage = {
				page: $(this).attr("id"),
				searchType2:$("#searchType2").val(),
				searchType3:$("#searchType3").val(),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
	</script>
</body>
</html>
