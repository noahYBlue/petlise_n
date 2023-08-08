<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*, java.text.*"%>
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
<link rel="stylesheet" href="/css/shop/modal.css" />
<link rel="stylesheet" href="/css/admin/aside.css" />
<link rel="stylesheet" href="/css/admin/shopProductRead.css" />
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet" />
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Pet LiSe</title>
</head>
<body>
	<div class="container">
		<div id="asideMenu"></div>

		<main>
			<p>라이스샵 상품정보</p>
			<div id="layout">
				<div class="edit_images">
					<div class="fileWrap">
						<p>상품 대표이미지</p>
						<label >
						<img id='fileimg1' src="https://storage.googleapis.com/${product.image_main}" alt="이미지아이콘" />
						</label> 
					</div>
					<div class="fileWrap">
						<p>상품 상세이미지</p>
						<label > <img id='fileimg2'
							src="https://storage.googleapis.com/${product.image_detail}" alt="이미지아이콘" />
						</label> 
					</div>
				</div>

				<div class="edit_detail">

					<div class="category">
						<span>카테고리</span>
					</div>
					<div id="category_container">
						<div class="categoryWrap">
							<div class="category" >
								<div id="dropdown" class="dropdown">
									<div class="select">
										<span id="span_pettype">${product.pet_type}</span>
									</div>
								</div>
							</div>

							<div class="category" id="smallCategory">
								<div id="dropdown2" class="dropdown">
									<div class="select">
										<span id="span_product">${product.category}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- category_container -->
					
					<div class="Wrapper" >	
						<p>상품코드</p>
						<input type="text" readonly="readonly" id="code_before" value="${product.product_code}" />
					</div>
					
					<div class="Wrapper">
						<p>상품명</p>
						<input type="text" readonly="readonly" id="product_name" value="${product.product_name}" />
					</div>
					<div class="Wrapper">
						<p>상품가격</p>
						<div> <fmt:formatNumber value="${product.price}" pattern="#,###" /> </div>
					</div>
					<div class="Wrapper_container">
						<div class="Wrapper_half">
							<p>판매량</p>
							<div> <fmt:formatNumber value="${product.sales}" pattern="#,###" /> </div>
						</div>
						<div class="Wrapper_half">
							<p>상품재고</p>
							<div> <fmt:formatNumber value="${product.quatity}" pattern="#,###" /> </div>
						</div>
						<div class="Wrapper_half">
							<p>판매여부</p>
							<c:choose>
								<c:when test="${product.isvisible}">
									<input type="text" id="isvisible" readonly="readonly" value="판매중"/>
								</c:when>
								<c:otherwise>
									<input type="text" id="isvisible" readonly="readonly" value="품절"/>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="Wrapper">
						<p>상품 등록일</p>
						<input type="date" id="product_regtime" readonly="readonly" 
							style="margin-bottom: 5px" 
							value=<fmt:parseDate value="${product.reg_date}" var="reg" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate	value="${reg}" pattern="yyyy-MM-dd" />
						 />
						<p style="font: var(--body14); margin-top: 0px">* 상품목록에 노출되는 날짜를 의미하며 최초 등록일 이전 날짜로 변경할 수 없습니다.</p>
					</div>
				</div>
			</div>
			<!-- layout end -->
			
			<input type="hidden" id="pageinput" value="${currentpage}"/>
			<input type="hidden" id="product_number" value="${product.product_id}" />
			<div id="btndiv">
				<button id="cancelButton">목록으로가기</button>
				<button id="editButton">상품정보수정</button>
				<button id="deleteButton">상품삭제</button>
			</div>


		</main>
	</div>

	<!-- 목록가기 -->
	<div class="modal" id="list_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<div>
					상품목록으로 돌아가시겠습니까?
				</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<form action="adminshoplist" id="adminshoplist" method="post">
					<input type="submit" class="golisthomebtn" value="목록가기">
				</form>
			</div>
		</div>
	</div>

	<!-- 수정확인창 -->
	<div class="modal" id="confirm_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<div>
					상품정보를 수정하시겠습니까?<br>
					수정 버튼을 누르시면 <br>
					상품 수정페이지로 이동합니다.
				</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<form action="shopproductedit" id="edit_form" method="post">
					<input type="hidden" name="product_id" value="${product.product_id}" />
					<input type="submit" class="modal_editbtn" value="수정">
				</form>
			</div>
		</div>
	</div>

	<!-- 삭제확인창 -->
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
	<!-- 삭제 후 확인창 -->
	<div class="modal" id="delete_okay_modal">
		<div class="modal_contents">
			<div class="modal_text">
			<div>상품이 삭제되었습니다.<br>
			상품목록 첫페이지로 이동합니다.</div>
			</div>
			<div class="modal_btn">
				<button class="modal_okaybtn">확인</button>
			</div>
		</div>
	</div>

	<script src="/js/admin/aside.js"></script>
	<script src="/js/admin/shop/shopProductRead.js"></script>
</body>
</html>
