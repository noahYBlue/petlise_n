<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/board/petplaceMain.css">
<link rel="stylesheet" href="/css/style.css" />

<title>펫플레이스메인</title>
<script src="/js/jquery-3.6.4.min.js"></script>


</head>
<header>
	<jsp:include page="../header.jsp" />
</header>
<body>

	<div class="container">
		<!-- 본문 -->
		<div class="board_wrap">
			<div class="board_title">
				<a href="petplaceMain">펫플레이스</a> <img
					src="/images/board/petplaceLogo.png" style="margin-left: -7px;"
					alt="펫플레이스이미지">
			</div>

			<div class="search-container">
				<div class="searchbox">
					<button id="searchbtn">
						<img src="/images/board/Vector.png" alt="검색">
					</button>
					<c:choose>
						<c:when test="${param.keyword == '' || param.keyword eq null}">
							<input type="text" id="keyword" placeholder="검색">
						</c:when>
						<c:otherwise>
							<input type="text" id="keyword" value="${param.keyword}" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- searchdiv -->
			<div class="btnline">
				<div class="board_main_category_btn1">
					<button>
						<a href="boardMain">자유게시판</a>
					</button>
				</div>
				<div class="board_main_category_btn2">
					<button>
						<a href="petplaceMain">펫플레이스</a>
					</button>
				</div>
			</div>
			<div class="petplace_category">
				<div>
					<a class="${param.searchType1 == '카페' ? 'on' : ''}"
						href="petplaceMain?page=1&searchType1=카페${param.keyword ? '&keyword=' + param.keyword : ''}">동반카페</a>
				</div>
				<div>
					<a class="${param.searchType1 == '식당' ? 'on' : ''}"
						href="petplaceMain?page=1&searchType1=식당${param.keyword ? '&keyword=' + param.keyword : ''}">동반식당</a>
				</div>
				<div>
					<a class="${param.searchType1 == '산책' ? 'on' : ''}"
						href="petplaceMain?page=1&searchType1=산책${param.keyword ? '&keyword=' + param.keyword : ''}">동반산책</a>
				</div>
				<div>
					<a class="${param.searchType1 == '숙소' ? 'on' : ''}"
						href="petplaceMain?page=1&searchType1=숙소${param.keyword ? '&keyword=' + param.keyword : ''}">동반숙소</a>
				</div>
			</div>


			<script>
  // 세션에서 user_id 값을 가져와서 JavaScript 변수에 할당
  var user_id = '<%=session.getAttribute("user_id")%>';

				function checkLoginAndGoToWrite() {
					if (user_id == 'null') {
						alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
						window.location.href = '/signin'; // 로그인 페이지로 이동
						// 글쓰기 기능 막기
						return; // 이동을 막기 위해 return 추가
					}

					else {// user_id가 존재하면 글쓰기 페이지로 이동
						window.location.href = '/petplaceWrite';
					}
				}
			</script>


			<div class="bt_wrap">
				<a onclick="checkLoginAndGoToWrite()">글쓰기</a>
			</div>


			<div class="board_list">
				<div class="top">
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date" style="padding-left: 45px">날짜</div>
					<div class="view" style="padding-left: 53px">조회</div>
					<div class="like" style="padding-left: 70px">추천</div>
				</div>

				<table style="width: 1240px; margin-top: -14px;">
					<c:if test="${empty response.list}">
						<tr>
							<td colspan="9" class="no_data_msg">
								<div>
									검색된 결과가 없습니다.<br> 검색어를 다시 입력해 주세요.
								</div>
							</td>
						</tr>
					</c:if>

					<c:forEach var="petPlace" items="${response.list}">
						<tr>
							<td class="title"><a href="/getpetplace?seq=${petPlace.seq}">
									${petPlace.title} </a></td>
							<td class="writer">${petPlace.user.name}</td>
							<td class="date"><fmt:formatDate
									value="${petPlace.petplace_created}" pattern="yyyy-MM-dd H:mm" />
							</td>
							<td class="view">${petPlace.view_count}</td>
							<td class="like">
								<%-- ${petPlace.like_count} --%>
							</td>
						</tr>
					</c:forEach>
				</table>

				<div id="pagination" style="visibility: visible;">
					<c:if test="${not empty response.list}">
						<div class="pagefirst"
							<c:if test="${not response.pagination.existPrevPage}">style="visibility: hidden;"</c:if>>
							<div class="prevArrow"></div>
							<div class="prevArrow" style="margin-left: -3px"></div>
						</div>
						<div class="prev" id="${response.pagination.startPage-1}"
							<c:if test="${not response.pagination.existPrevPage}">style="visibility: hidden;"</c:if>>
							<div class="prevArrow"></div>
						</div>

						<c:choose>
							<c:when test="${empty param.page}">
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
							<c:if test="${not response.pagination.existNextPage}">style="visibility: hidden;"</c:if>>
							<div class="nextArrow"></div>
						</div>
						<div class="pagelast" id="${response.pagination.totalPageCount}"
							<c:if test="${not response.pagination.existNextPage}">style="visibility: hidden;"</c:if>>
							<div class="nextArrow"></div>
							<div class="nextArrow" style="margin-left: -6px"></div>
						</div>
					</c:if>
				</div>
			</div>

		</div>
		<!-- 강아지 이미지 부분-->
		<div class="dogImg_F">
			<img src="/images/board/dogthird.png" alt="dogImg_F">
		</div>
		<div class="dogImg_S">
			<img src="/images/board/dogfourth.png" alt="dogImg_S">
		</div>
		<div class="dogImg_Up" style="pointer-events: none;">
			<img src="/images/board/searchdog.png" alt="dogImg_up">
		</div>


	</div>
<footer>
	<div>

		<jsp:include page="../footer.jsp" />
	</div>
	</footer>
	<!-- pagination -->
	<script src="/js/board/PetPlace.js"></script>




</body>
</html>
