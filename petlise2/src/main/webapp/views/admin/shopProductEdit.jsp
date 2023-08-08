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
<link rel="stylesheet" href="/css/admin/shopProductEdit.css" />
<link rel="stylesheet" href="/css/admin/jquery-ui.css" />
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet" />
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>Pet LiSe</title>
</head>
<body>
	<div class="container">
		<div id="asideMenu"></div>

		<main>
			<p>라이스샵 상품정보수정</p>
			<div id="layout">
				<div class="edit_images">
					<div class="fileWrap">
						<p>상품 대표이미지</p>
						<label for="file1">
						<img id='fileimg1' src="https://storage.googleapis.com/${product.image_main}" alt="이미지아이콘" />
						</label> <input type="file" id="file1" />
						<input type="hidden" id="imageValue1" value="${product.image_main}">
					</div>
					<div class="fileWrap">
						<p>상품 상세이미지</p>
						<label for="file2"> <img id='fileimg2'
							src="https://storage.googleapis.com/${product.image_detail}" alt="이미지아이콘" />
						</label> <input type="file" id="file2" />
						<input type="hidden" id="imageValue2" value="${product.image_detail}">
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
									<input type="hidden" id="petType" value="${product.pet_type}" />
									<ul class="dropdown-menu">
										<li>강아지(D)</li>
										<li>고양이(C)</li>
									</ul>
								</div>
							</div>

							<div class="category" id="smallCategory">
								<div id="dropdown2" class="dropdown">
									<div class="select">
										<span id="span_product">${product.category}</span>
									</div>
									<input type="hidden" id="productType"
										value="${product.category}" />
									<ul id="dropdown-menu" class="dropdown-menu">
										<li>사료(01)</li>
										<li>간식(02)</li>
										<li>영양제(03)</li>
										<li>장난감(04)</li>
									</ul>
								</div>
							</div>
						
						<input type="hidden" id="petTypeTmp" value="${product.pet_type}" />
						<input type="hidden" id="productTypeTmp" value="${product.category}" />
						<button id="returnbtn">원래대로</button>

						</div>
					</div>
					<!-- category_container -->
					
					<div class="Wrapper_container" style="margin-bottom: 0px">
						<div class="Wrapper_half" >	
							<p>상품코드 변경전</p>
							<input type="text" readonly="readonly" id="code_before" value="${product.product_code}" style="width:240px;" />
						</div>
						<div class="Wrapper_half">	
							<p>상품코드 변경후</p>
							<input type="text" readonly="readonly" id="code_after" value="${product.product_code}" style="width:240px;" />
						</div>
					</div><!-- Wrapper_container -->
					<p style="font: var(--body14); margin-top: 0px; margin-bottom: 30px">* 상품코드는 카테고리 변경시 자동 변경됩니다. 변경후 코드값을 꼭 확인해 주세요.</p>
					
					<div class="Wrapper">
						<p>상품명</p>
						<input type="text" id="product_name" value="${product.product_name}" />
					</div>
					<div class="Wrapper">
						<p>상품가격</p>
						<input type="number" id="product_price" value="${product.price}" />
					</div>
					<div class="Wrapper_container">
						<div class="Wrapper_half">
							<p>판매량</p>
							<input type="number" readonly="readonly" id="product_saled" value="${product.sales}"/>
						</div>
						<div class="Wrapper_half">
							<p>상품재고</p>
							<input type="number" id="product_quatity" min="120" value="${product.quatity}"/>
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
						<div>
							<input type="text" id="product_regtime" placeholder="날짜 선택" value="${product.reg_date}" readonly>
						</div>
						<p style="font: var(--body14); margin-top: 0px">* 상품목록에 노출되는 날짜를 의미하며 최초 등록일 이전 날짜로 변경할 수 없습니다.</p>
					</div>
				</div>
			</div>
			<!-- layout end -->
			
			<input type="hidden" id="product_number" value="${product.product_id}" />
			<div id="btndiv">
				<button id="cancelButton">취소</button>
				<button id="editButton">수정</button>
			</div>


		</main>
	</div>

	<!-- 수정취소창 -->
	<div class="modal" id="cancel_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<div>
					상품수정이 진행중입니다.<br> 작성중인 내용은 저장되지 않습니다.<br> 이전 페이지로
					돌아가시겠습니까?
				</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button class="golisthomebtn">돌아가기</button>
			</div>
		</div>
	</div>

	<!-- 수정확인창 -->
	<div class="modal" id="confirm_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<div>
					수정 이전 정보는 저장되지 않습니다.<br>
					수정 정보를 확인해 주세요.<br>
					상품정보를 수정하시겠습니까?
				</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button class="modal_editbtn">수정</button>
			</div>
		</div>
	</div>

	<!-- 등록완료창 -->
	<div class="modal" id="okaymodal">
		<div class="modal_contents">
			<div class="modal_text">
				<div>
					상품정보가 수정되었습니다.<br>상품 목록으로 이동합니다.
				</div>
			</div>
			<div class="modal_btn">
				<form action="adminshoplist" id="adminshoplist" method="post"></form>
				<button class="okaybtn">확인</button>
			</div>
		</div>
	</div>

	<!-- 경고창 -->
	<div class="modal" id="alertmodal">
		<div class="modal_contents">
			<div class="modal_text">
				<div></div>
			</div>
			<div class="modal_btn">
				<button class="okaybtn">확인</button>
			</div>
		</div>
	</div>


	<script src="/js/admin/aside.js"></script>
	<script src="/js/admin/shop/shopProductEdit.js"></script>
</body>
</html>
