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
<link rel="stylesheet" href="/css/mypage/myPetPlace.css" />
<link rel="stylesheet" href="/css/mypage/myPageForm.css" />
<link rel="stylesheet" href="/css/mypage/mypageshop_dropdown.css" />
<link rel="stylesheet" href="/css/mypage/jquery-ui_shop.css" />
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
			<div class="contents_Title">내가 쓴 게시글</div>
			
			<div id="searchWrap">
				<div id="categorybtns">
					<a href="/mypage/board">자유게시판</a>
					<a href="/mypage/petplace" style="background-color: var(--light-sub, #FBC252);">펫플레이스</a>
				</div>
				<div id="searchbox">
					<div id="searchinput">
					<img src="/images/shop/shoplist/search_main.svg">
					<c:choose>
						<c:when test="${param.keyword == '' || param.keyword eq null}">
							<input type="text" id="keyword" name="keyword" placeholder="제목으로 검색" />
						</c:when>
						<c:otherwise>
							<input type="text" id="keyword" name="keyword" value="${param.keyword}" />
						</c:otherwise>
					</c:choose>
					</div>
					<input type="button" id="searchbtn" value="검색" />
				</div>
			</div>
			
			<div id="boardlist">
				<table id="boardtable">
					<thead>
						<tr>
							<th>글번호</th>
							<th>카테고리</th>
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
										작성된 게시물이 없습니다.
									</div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${response.list}" var="petplace">
							<tr class="list_tr">
								<td>${petplace.seq}</td>
								<td>${petplace.category}</td>
								<td><a href="/getpetplace?seq=${petplace.seq}">${petplace.title}</a></td>
								<td><fmt:formatDate	value="${petplace.petplace_created}" pattern="yyyy.MM.dd H:mm" /></td>
								<td>${petplace.view_count}</td>
								<td><fmt:formatNumber value="${petplace.likes}" pattern="#,###"/></td>
								<td class="deletebtns" id="${petplace.place_id}">삭제</td>
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
				게시글 삭제 시 복구가 불가하며<br>
				게시글 작성 포인트는 회수됩니다.<br>
				정말 게시글을 삭제하시겠습니까?
				</div>
				<div class="modal_btn">
					<button class="modal_cancelbtn">취소</button>
					<button class="modal_deletebtn">삭제</button>
					<input type="hidden" id="delete_id" value=""/>
				</div>
			</div>
		</div>

		<div class="modal" id="delete_okay_modal">
		<div class="modal_contents">
			<div class="modal_text">
			게시글이 삭제되었습니다.
			</div>
			<div class="modal_btn">
				<button class="modal_okaybtn">확인</button>
			</div>
		</div>
	</div>
	</div>
	
	<jsp:include page="../footer.jsp" />

	<script src="/js/mypageMenu.js"></script>
	<script src="/js/mypage/myPetPlace.js"></script>
	
	<script>
		//검색버튼
		$("#searchbtn").on('click', function() {
			const queryparamsPage = {
				page: 1,
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
	
		//숫자 페이징버튼 
		$(".pageNumber").on('click', function() {
			const queryparamsPage = {
				page: $(this).text(),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//첫페이지버튼 
		$(".pagefirst").on('click', function() {
			const queryparamsPage = {
				page: 1,
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//이전페이지버튼
		$(".prev").on('click', function() {
			const queryparamsPage = {
		    	page: $(this).attr("id"),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//다음페이지버튼
		$(".next").on('click', function() {
			const queryparamsPage = {
				page: $(this).attr("id"),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//마지막페이지버튼
		$(".pagelast").on('click', function() {
			const queryparamsPage = {
				page: $(this).attr("id"),
				keyword:$("#keyword").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
	</script>
</body>
</html>
