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
<link rel="stylesheet" href="/css/mypage/myReview.css" />
<link rel="stylesheet" href="/css/mypage/myPageForm.css" />
<link rel="stylesheet" href="/css/mypage/mypageshop_dropdown.css" />
<link rel="stylesheet" href="/css/mypage/jquery-ui_shop.css" />
<link rel="stylesheet" href="/css/shop/pagination_shop.css" />
<link rel="stylesheet" href="/css/shop/modal_main.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<p class="title">마이페이지</p>

	<div class="container">
		<div id="mypageMenu" class="menu"></div>

		<div class="contents">
			<div class="contents_Title">구매상품 후기</div>
			
			<div id="contents_Category">
				<div class="categoryWrap">
					<div class="category">
						<div id="dropdown" class="dropdown">
							<div class="select">
								<span> ${param.searchType2 eq null || param.searchType2 ==''?'전체':param.searchType2}	</span>
							</div>
							<input type="hidden" id="searchType2" value="${param.searchType2 eq null || param.searchType2 ==''?'전체':param.searchType2}" />
							<ul class="dropdown-menu">
								<li>전체</li>
								<li>후기작성상품</li>
								<li>후기미작성상품</li>
							</ul>
						</div>
					</div><!-- category -->
				</div><!-- categoryWrap -->
				
				<div id="periodWrap">
					<span>기간별 검색</span>
					<input type="button" id="date_today" value="오늘">
					<input type="button" id="date_week" value="1주일">
					<input type="button" id="date_month" value="1달">
					<div><input type="text" id="start_date" name="startDate" placeholder="검색 시작일 선택" value="${param.startDate}" readonly ></div>
					<span style="width:20px">~</span>
					<div><input type="text" id="end_date" name="endDate" placeholder="검색 종료일 선택" value="${param.endDate}" readonly></div>
					<input type="button" id="searchbtn" value="조회">
					<input type="button" id="clearbtn" value="기간초기화">
				</div>
			</div>
			
			<div id="outer_container">
				<c:if test="${fn:length(response.list) == 0}">
					<div id="nolist">
						구매하신 상품이 없습니다.
					</div>
				</c:if>
			
				<c:forEach items="${response.list}" var="op">
					<div class="orderProduct_container">
						<div class="logo_img">
							<img src="/images/mypage/logo_rotate.svg">
						</div>
						<div class="product_img">
							<img src="${op.product_image}">
						</div>
						<div class="orderproduct_info">
							<div><span>상품명</span><span>${op.product_name}</span></div>
							<div><span>구매일</span><span>
							<fmt:parseDate value = "${op.orderdto.date}" pattern = "yyyy-MM-dd HH:mm:ss" var = "date"/>
							<fmt:formatDate value="${date}" pattern="yyyy.MM.dd HH:mm" />
							</span></div>
							<div><span>주문현황</span><span>${op.orderdto.status}</span></div>
						</div>
						<div class="review_btns">
							<c:choose>
								<c:when test="${op.reviewdto eq null}">
									<c:choose>
										<c:when test="${op.orderdto.status == '주문완료'}">
											<img src="/images/logo-icon-gray.svg">
											<button class="hidebtn">배송대기중</button>
										</c:when>
										<c:otherwise>
											<img src="/images/mypage/pen.svg">
											<button class="editbtn">후기작성하기</button>
											<input type="hidden" class="di" value="${op.order_detail_id}"/>
											<input type="hidden" class="pi" value="${op.product_id}"/>
											<input type="hidden" class="pn" value="${op.product_name}"/>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
									<c:when test="${op.reviewdto.deleted_at eq null}">
										<img src="/images/logo-icon.png">
										<button class="showbtn">후기확인하기</button>
									</c:when>
									<c:otherwise>
										<img src="/images/logo-icon-gray.svg">
										<button class="hidebtn">삭제된 후기입니다.</button>
									</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<c:if test="${op.reviewdto eq null?false:true}">
						<div class="review_container">
							<div class="review_contents">
								<div class="review_score first">평점</div>
								<div class="review_score">
									<c:forEach begin="1" end="${op.reviewdto.score}">
										<img class="score_fill"
											src="/images/shop/shopdetail/bone_fill.svg">
									</c:forEach>
									<c:forEach begin="${op.reviewdto.score+1}" end="5">
										<img class="score_fill"
											src="/images/shop/shopdetail/bone_line.svg">
									</c:forEach>
									<span>${op.reviewdto.score}점</span>
								</div>
								<div class="review_inner_contents first">후기</div>
								<div class="review_inner_contents">
									<c:if test="${op.reviewdto.review_img != '' && op.reviewdto.review_img != null}">
										<div class="review_img_box">
											<img class="review_img" src="https://storage.googleapis.com/${op.reviewdto.review_img}">
										</div>
									</c:if>
									<div class="review_texts" <c:if test="${op.reviewdto.review_img != '' && op.reviewdto.review_img != null}">style="margin-top:5px;"</c:if>>
										${op.reviewdto.contents}
									</div>
								</div>
							</div>
							<div class="reviewdetail_btns">
								<button class="review_updatebtn"><span></span>수정하기</button>
								<button class="review_deletebtn"><span></span>삭제하기</button>
								<input type="hidden" class="di" value="${op.order_detail_id}"/>
								<input type="hidden" class="pi" value="${op.product_id}"/>
								<input type="hidden" class="pn" value="${op.product_name}"/>
								<input type="hidden" class="review_id" value="${op.reviewdto.review_id}"/>
							</div>
							<div class="container_bottom">
								<button><img src="/images/mypage/uparrow.svg"></button>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			
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
				후기 삭제 시 후기 복구 및 <br>
				해당 상품 후기 재작성이 불가합니다.<br>
				정말 후기를 삭제하시겠습니까?
				</div>
				<div class="modal_btn">
					<button class="modal_cancelbtn">취소</button>
					<button class="modal_deletebtn">삭제</button>
					<input type="hidden" id="delete_review_id" value=""/>
				</div>
			</div>
		</div>

		<div class="modal" id="delete_okay_modal">
		<div class="modal_contents">
			<div class="modal_text">
			후기가 삭제되었습니다.
			</div>
			<div class="modal_btn">
				<button class="modal_okaybtn">확인</button>
			</div>
		</div>
	</div>
	</div>
	
	<jsp:include page="../footer.jsp" />

	<script src="/js/mypageMenu.js"></script>
	<script src="/js/mypage/myReview.js"></script>
	
	<script>
		//dropbox
		$('#dropdown').click(function() {
			$(this).attr('tabindex', 1).focus();
			$(this).toggleClass('active');
			$(this).find('.dropdown-menu').slideToggle(300);
		});
	
		$('#dropdown').focusout(function() {
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').slideUp(300);
		});
	
		$('#dropdown .dropdown-menu li').click(function(e) {
			e.stopPropagation();
			const queryparamsPage = {
					page: 1,
					searchType1: "${user_id}",
					searchType2: $(this).text(),
					startDate : $("#start_date").val(),
					endDate : $("#end_date").val()
				}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
	
		//기간조회버튼 
		$("#searchbtn").on('click', function() {
			const queryparamsPage = {
				page: 1,
				searchType1: "${user_id}",
				startDate : $("#start_date").val(),
				endDate : $("#end_date").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		//숫자 페이징버튼 
		$(".pageNumber").on('click', function() {
			const queryparamsPage = {
				page: $(this).text(),
				searchType1: "${user_id}",
				startDate : $("#start_date").val(),
				endDate : $("#end_date").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//첫페이지버튼 
		$(".pagefirst").on('click', function() {
			const queryparamsPage = {
				page: 1,
				searchType1: "${user_id}",
				startDate : $("#start_date").val(),
				endDate : $("#end_date").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//이전페이지버튼
		$(".prev").on('click', function() {
			const queryparamsPage = {
		    	page: $(this).attr("id"),
		    	searchType1: "${user_id}",
				startDate : $("#start_date").val(),
				endDate : $("#end_date").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//다음페이지버튼
		$(".next").on('click', function() {
			const queryparamsPage = {
				page: $(this).attr("id"),
				searchType1: "${user_id}",
				startDate : $("#start_date").val(),
				endDate : $("#end_date").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
		
		//마지막페이지버튼
		$(".pagelast").on('click', function() {
			const queryparamsPage = {
				page: $(this).attr("id"),
				searchType1: "${user_id}",
				startDate : $("#start_date").val(),
				endDate : $("#end_date").val()
			}
			location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
		});
	</script>
</body>
</html>
