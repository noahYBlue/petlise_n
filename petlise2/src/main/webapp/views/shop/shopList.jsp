<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html style="height: auto;">
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/shop/shopList.css" />
<link rel="stylesheet" href="css/shop/pagination_shop.css" />
<link rel="stylesheet" href="css/shop/modal_main.css" />
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<title>Pet LiSe</title>
<script src="/js/jquery-3.6.4.min.js"></script>
</head>
<body style="height: auto;">
	<jsp:include page="../header.jsp" />
	<div id='layout' >
		<div id="titlediv">
			<input type="hidden" id="searchType1" value="${param.searchType1}" />
			<input type="hidden" id="searchType2" value="${param.searchType2}" />
			<input type="hidden" id="sortType" value="${param.sortType}" />
			<!-- 메인샵버튼 -->
			<div id="shopTitle">
				<div></div>
				<span style="font: var(--heading24);">라이스샵</span> <span
					style="font: var(--highlight14);">LiSe Shop</span>
			</div>

			<!--강아지 카테고리-->
			<div class="petTitle">
				<div class="titleimg">
					<img src="/images/shop/shoplist/category_dog.svg" /> <span>강아지</span>
				</div>
				<div class="category" id="category_dog">
					<!--강아지 상품 카테고리-->
					<!-- 사료 -->
					<div class="product" id="D01">
						<img src="/images/shop/shoplist/food_dog.svg" alt="사료_강아지" />
						<p>사료</p>
					</div>
					<!-- 간식 -->
					<div class="product" id="D02">
						<img src="/images/shop/shoplist/snack_dog.svg" alt="간식_강아지" />
						<p>간식</p>
					</div>
					<!-- 영양제 -->
					<div class="product" id="D03">
						<img src="/images/shop/shoplist/tonic.svg" alt="영양제" />
						<p>영양제</p>
					</div>
					<!-- 장난감 -->
					<div class="product" id="D04">
						<img src="/images/shop/shoplist/toy_dog.svg" alt="장난감_강아지" />
						<p>장난감</p>
					</div>
				</div>
			</div>

			<!--고양이 카테고리-->
			<div class="petTitle">
				<div class="titleimg">
					<img src="/images/shop/shoplist/category_cat.svg" /> <span>고양이</span>
				</div>
				<div class="category"  id="category_cat">
					<!--고양이 상품 카테고리-->
					<!-- 사료 -->
					<div class="product" id="C01">
						<img src="/images/shop/shoplist/food_cat.svg" alt="사료_고양이" />
						<p>사료</p>
					</div>
					<!-- 간식 -->
					<div class="product" id="C02">
						<img src="/images/shop/shoplist/snack_cat.svg" alt="간식_고양이" />
						<p>간식</p>
					</div>
					<!-- 영양제 -->
					<div class="product" id="C03">
						<img src="/images/shop/shoplist/tonic.svg" alt="영양제" />
						<p>영양제</p>
					</div>
					<!-- 장난감 -->
					<div class="product" id="C04">
						<img src="/images/shop/shoplist/toy_cat.svg" alt="장난감_고양이" />
						<p>장난감</p>
					</div>
				</div>
			</div>
		</div>

		<div id="textTitle"></div>

		<div id="filterhead">
			<div id="filterbtns">
				<button class="filterbtn"
					<c:if test="${param.sortType eq '판매량순' || param.sortType eq null || param.sortType eq ''}">id="filterbtn_active"</c:if>>판매량순</button>
				<button class="filterbtn"
					<c:if test="${param.sortType eq '신상품순'}">id="filterbtn_active"</c:if>>신상품순</button>
				<button class="filterbtn"
					<c:if test="${param.sortType eq '고가순'}">id="filterbtn_active"</c:if>>고가순</button>
				<button class="filterbtn"
					<c:if test="${param.sortType eq '저가순'}">id="filterbtn_active"</c:if>>저가순</button>
			</div>
			<div id="filtertail">
				<div style="margin-right: 10px">
					<input type="checkbox" id="issoldout"
						<c:if test="${param.searchType3 eq '판매중'}"> checked </c:if> /> 
					<label for="issoldout"><span></span>품절상품제외</label>
				</div>
				<!-- checkboxdiv -->
				<div id="searchdiv">
					<img id="searchimg" src="/images/shop/shoplist/search_main.svg">
					<c:choose>
						<c:when test="${param.keyword == '' || param.keyword eq null}">
							<input type="text" id="keyword" placeholder="상품명 검색" />
						</c:when>
						<c:otherwise>
							<input type="text" id="keyword" value="${param.keyword}" />
						</c:otherwise>
					</c:choose>
				</div>
				<!-- searchdiv -->
				<button id="searchbtn">검색</button>

			</div>
		</div>

		<div id="product_container">
			<c:if test="${fn:length(response.list) == 0}">
				<div id="noresult">
				해당되는 검색결과가 없습니다.
				
				<button>LiSe Shop 메인으로 가기</button>
				</div>
			</c:if>
		
			<c:forEach var="product" items="${response.list}">
				<!-- 판매상품 -->
				<c:if test="${product.isvisible}">
					<div class="products" id="${product.product_id}">
						<div class="product_img"
							style="background-image: url(https://storage.googleapis.com/${product.image_main});">
						</div>
						<div id="product_info">
							<span> ${product.product_name} </span> 
							<span> <img
								id="coinimg" src="/images/shop/shoplist/coin2.svg" alt="coin" />
								<fmt:formatNumber value="${product.price}" pattern="#,###" />
							</span>
						</div>
					</div>
				</c:if>
				<!-- 품절상품 -->
				<c:if test="${!product.isvisible}">
					<div class="products_soldout" id="${product.product_id}">
						<div class="product_img_soldout"
							style="background-image: url(https://storage.googleapis.com/${product.image_main});">
							<div class="product_img_cover_soldout">
								<div>SOLD<br>OUT</div>
							</div>
						</div>
						<div id="product_info_soldout">
							<span> ${product.product_name} </span>
							<span> <img
								id="coinimg" src="/images/shop/shopdetail/coin_brown.svg" alt="coin" />
								<fmt:formatNumber value="${product.price}" pattern="#,###" />
							</span>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<!-- 상품목록 -->

		<div id="pagination" style="margin-top: 10px;">
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
	<!-- layout -->
	<jsp:include page="../footer.jsp" />
	
	<script src="/js/shop/shopList.js"></script>
</body>
</html>