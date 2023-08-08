<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/admin/aside.css" />
<link rel="stylesheet" href="/css/admin/pagination_new.css" />
<link rel="stylesheet" href="/css/admin/shopManagement.css" />
<link rel="stylesheet" href="/css/shop/modal.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Pet LiSe</title>
</head>
<body>
	<div class="container">
		<div id="asideMenu"></div>

		<main>
			<p id="listhome">라이스샵 등록상품관리</p>

			<div class="tabMenu">
				<div class="tabWrap">
					<form action="adminshoplist" id="adminshoplist" method="post">
					<input type="hidden" id="page" name="page" value="1"/>
					<div class="categoryWrap">
						<div class="category">
							<div id="dropdown" class="dropdown">
								<div class="select">
									<span> <c:if
											test="${param.searchType1 == '' || param.searchType1 eq null}">동물구분</c:if>
										${param.searchType1}
									</span>
								</div>
								<input type="hidden" id="petType" name="searchType1" value="${param.searchType1}" />
								<ul class="dropdown-menu">
									<li>전체</li>
									<li>강아지</li>
									<li>고양이</li>
								</ul>
							</div>
						</div>

						<div class="category" id="smallCategory">
							<div id="dropdown2" class="dropdown">
								<div class="select">
									<span> <c:if
											test="${param.searchType2 == '' || param.searchType2 eq null }">상품구분</c:if>
										${param.searchType2}
									</span>
								</div>
								<input type="hidden" id="productType" name="searchType2"
									value="${param.searchType2}" />
								<ul id="dropdown-menu" class="dropdown-menu">
									<li>전체</li>
									<li>사료</li>
									<li>간식</li>
									<li>영양제</li>
									<li>장난감</li>
								</ul>
							</div>
						</div>

						<div class="category" id="Category3">
							<div id="dropdown3" class="dropdown">
								<div class="select">
									<span> <c:if test="${param.searchType3 == '' || param.searchType3 eq null }">판매구분</c:if>
										${param.searchType3}
									</span>
								</div>
								<input type="hidden" id="saleType" name="searchType3" value="${param.searchType3}" />
								<ul id="dropdown-menu" class="dropdown-menu">
									<li>전체</li>
									<li>판매중</li>
									<li>품절</li>
								</ul>
							</div>
						</div>
						
						<div class="category" id="sortcategory">
							<div id="dropdown4" class="dropdown">
								<div class="select">
									<span> <c:if test="${param.sortType == '' || param.sortType eq null }">정렬기준</c:if>
										${param.sortType}
									</span>
								</div>
								<input type="hidden" id="sortType" name="sortType" value="${param.sortType}" />
								<ul id="dropdown-menu" class="dropdown-menu">
									<li>상품번호순</li>
									<li>판매량순</li>
									<li>신상품순</li>
									<li>고가순</li>
									<li>저가순</li>
								</ul>
							</div>
						</div>

						<div id="searchdiv">
							<img id="searchimg" src="/images/admin/search.svg">
							<c:choose>
								<c:when test="${param.keyword == '' || param.keyword eq null}">
									<input type="text" id="keyword" name="keyword" placeholder="상품명 검색" />
								</c:when>
								<c:otherwise>
									<input type="text" id="keyword" name="keyword" value="${param.keyword}" />
								</c:otherwise>
							</c:choose>
						</div>
						<button id="searchbtn">조회</button>
						<!-- searchdiv -->
					</div> <!-- categoryWrap -->
					</form>
					
					<form action="/shopproductregister" method="post">
						<input type="submit" class="createbtn" value="신규 상품 등록"/>
					</form>
				</div>

				<div class="tableWrap">
					<table class="table" style="display: block">
						<thead>
							<tr>
								<th>번호</th>
								<th>동물구분</th>
								<th>상품구분</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>상품재고</th>
								<th>금액</th>
								<th>등록일</th>
								<th>판매구분</th>
								<th>판매량</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>

						<tbody>
							<c:if test="${fn:length(response.list) == 0}">
								<tr>
									<td class="no_data_msg">
										<div>
											검색된 결과가 없습니다.<br> 카테고리 및 상품명을 확인해 주세요.
										</div>
									</td>
								</tr>
							</c:if>

							<c:forEach var="product" items="${response.list}">
								<tr>
									<td class="productid">${product.product_id}</td>
									<td>${product.pet_type}</td>
									<td>${product.category}</td>
									<td>${product.product_code}</td>
									<td class="productname">
										<form action="shopproductread" method="post">
											<input type="hidden" name="product_id" value="${product.product_id}">
											<input type="hidden" name="page" value="${param.page eq null?1:param.page}">
											<input type="submit" value="${product.product_name}">
										</form>
									</td>
									<td><fmt:formatNumber value="${product.quatity}" pattern="#,###" />개</td>
									<td><fmt:formatNumber value="${product.price}" pattern="#,###" />p</td>
									<td><fmt:parseDate value="${product.reg_date}" var="reg"
											pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
											value="${reg}" pattern="yyyy-MM-dd" /></td>
									<td>
									<c:if test="${product.isvisible}">판매중</c:if>
									<c:if test="${!product.isvisible}">품절</c:if>									
									</td>
									<td><fmt:formatNumber value="${product.sales}" pattern="#,###" />개</td>
									<td class="table_btnbox"><button class="editbtn">수정</button></td>
									<td class="table_btnbox"><button class="deletebtn">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
								<c:forEach begin="1" end="${response.pagination.endPage}" varStatus="vs">
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
				</div><!-- pagination -->
			</div>
		</main>
	</div>
	
	<div class="modal" id="edit_modal">
		<div class="modal_contents">
			<form action="shopproductedit" id="edit_form" method="post">
			<input type="hidden" name="product_id" value="" />
			</form>
			<div class="modal_text"></div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button id="modal_editbtn">수정하기</button>
			</div>
		</div>
	</div>
	<div class="modal" id="delete_modal">
		<div class="modal_contents">
			<input type="hidden" value="" />
			<div class="modal_text"></div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button class="modal_deletebtn">삭제</button>
			</div>
		</div>
	</div>
	<div class="modal" id="delete_okay_modal">
		<div class="modal_contents">
			<div class="modal_text"></div>
			<div class="modal_btn">
				<button class="modal_okaybtn">확인</button>
			</div>
		</div>
	</div>

	<script src="/js/admin/aside.js"></script>
	<script src="/js/admin/shop/shopManagement.js"></script>
	<script src="/js/admin/shop/shopCategory_list.js"></script>
</body>
</html>
