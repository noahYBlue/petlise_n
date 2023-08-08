<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="/css/shop/payment.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<title>Pet LiSe</title>
<script src="/js/jquery-3.6.4.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="layout">
     <div id="title">
         <div id="first">
             <img src="/images/shop/shoplist/cart_yellow.svg" alt="cart"/>
             <span>주문/결제</span>
         </div>
         <div id="second">
         	<span> 01 장바구니 >&nbsp; </span>
             <span class="second_active">02 주문/결제</span>
             <span>&nbsp; > 03 주문완료</span>
         </div>
     </div><!--title end-->
		<div class="contents">
			<div class="contents_Table">
				<div class="table">
					<div class="table_Header">
						<p id="table_Header_Product">상품정보</p>
						<p id="table_Header_Quantity">수량</p>
						<p id="table_Header_Price">포인트</p>
						<p id="table_Header_Total">소계</p>
					</div>
				</div>
			</div>
		<div>
			<c:forEach var="products" items="${products}">
				<div class="Else">
					<div class="product_id">${products.product_id}</div>
					<div id="product_name">${products.product_name}</div>
				</div>
			</c:forEach>
			<c:forEach var="orderProduct" items="${orderProduct}">
			    <div class="table_Column">
			    	<div class="Else">
			    		<p id="product_User_Id" class="Else">${orderProduct.user_id}</p>
			    	</div>
			    	<div class="Else">
			    		<p id="product_Product_Id" class="Else">${orderProduct.product_id}</p>
			    	</div>			    	
			        <div id="table_Product_Img">
			            <p>
			                <a href="#">
			                    <img class="product_image" src="${orderProduct.product_image}">
			                </a>
			            </p>
			        </div>
			        <div id="table_Product_Info">
			            <p>
			                <a href="#">
			                    <span class="product_name">${orderProduct.product_name}</span>				
			                </a>
			            </p>
			        </div>
			        <div id="table_Quantity">
			            <p class="product_quantity">${orderProduct.quantity}</p>
			        </div>
			        <div id="table_Price">
			            <p class="product_price">
			                <img src="/images/mypage/coin2.svg" id="point_Icon">${orderProduct.product_price}
			            </p>
			        </div>
			        <div id="table_Total">
			            <p class="price_total">
			                <img src="/images/mypage/coin2.svg" id="point_Icon">${orderProduct.price_total}
			            </p>
			        </div>
			    </div>
			</c:forEach>
		</div>
			<div class="order_Detail">
				<div class="order_Info">
						<div class="member_Info_Title">회원 정보</div>
							<table class="member_Info">
								<tr class="Else">
									<td class="col_1">아이디</td>
									<td class="col_2" id="member_User_Id" data-user_id="${user_id }">${userInfo.user_id}</td>
								</tr>		
								<tr>
									<td class="col_1">이름</td>
									<td class="col_2" id="member_Name">${userInfo.name}</td>
								</tr>
								<tr>
									<td class="col_1">이메일</td>
									<td class="col_2" id="member_Email">${userInfo.email}</td>
								</tr>						
								<tr>
									<td class="col_1">주소</td>
									<td class="col_2" id="member_Address">${userInfo.address}</td>
								</tr>
								<tr class="Else">
									<td class="col_1"></td>
									<td class="col_2"></td>
								</tr>
								<tr class="Else">
									<td class="col_1"></td>
									<td class="col_2"></td>
								</tr>																
							</table>

						<div class="delivery_Info_Title">배송 정보<span id="address_Check"><input type="checkbox" id="address_CheckBox"><label for="address_CheckBox">회원 정보 동일</label></span></div>
							<table class="delivery_Info">
								<tr>
									<td class="col_1">받는분 성함</td>
									<td class="col_2" id="delivery_Name"><input type="text" id="input_Name" placeholder="실명(필수)" ></td>
								</tr>
								<tr>
									<td class="col_1">연락처</td>
									<td class="col_2" id="delivery_Phone"><input type="text" id="input_Phone" placeholder="연락처(필수)"></td>
								</tr>
								<tr>
									<td class="col_1">배송주소</td>
									<td class="col_2" id="delivery_Address">
										<input type="text" id="sample6_postcode" placeholder="우편번호(필수)" style="width:150px" />
										  <button type="button" id="find_ZipCode" onclick="sample6_execDaumPostcode()">
										    우편번호
										  </button>
										<input type="text" id="sample6_address" placeholder="주소(필수)" />
										<input type="text" id="sample6_detailAddress" placeholder="상세주소(선택)" />
									</td>
								</tr>
								<tr>
									<td class="col_1">배송 요청사항</td>
									<td class="col_2" id="delivery_Require"><input type="text" id="input_Require" placeholder="배송시 요청사항(선택)"></td>					
								</tr>
							</table>
					<p id="delivery_Caption">※ 배송지 정보는 주문 완료시 수정이 불가능하므로 정보를 꼭 확인해주시기 바랍니다.</p>
				</div>
			
				<div class="receipt">
					<div class="receipt_Detail">
						<div class="receipt_Title"><img src="/images/mypage/coin2.svg" id="receipt_Icon">주문내역</div>
						<div class="receipt_Contents">
							<div class="receipt_Col_1">
								<div class="receipt_Row_0">
									<p>주문날짜</p>
								</div>							
								<div class="receipt_Row_1">
									<p>상품 전체 Point</p>
									<p>배송 Point</p>
								</div>
								<div class="receipt_Row_2">
									<p>총 결제 Point</p>
									<p>결제 가능 Point</p>
								</div>
								<div class="receipt_Row_3">
									<p>잔여 Point</p>
								</div>									
							</div>																
							<div class="receipt_Col_2">
								<div class="receipt_Row_0">
									<p id="order_date"><fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy.MM.dd" /></p>
								</div>
								<div class="receipt_Row_1">
									<p><img src="/images/mypage/coin2.svg" id="point_Icon"><span id="totalPoint"></span></p>
									<p><img src="/images/mypage/coin2.svg" id="point_Icon">3,000</p>
								</div>
								<div class="receipt_Row_2">
									<p><img src="/images/mypage/coin2.svg" id="point_Icon"><span id="totalPayment"></span></p>
									<p><img src="/images/mypage/coin2.svg" id="point_Icon"><span id="userPoint"><fmt:formatNumber value="${userInfo.point}" pattern="#,###" /></span></p>
								</div>
								<div class="receipt_Row_3">
									<p><img src="/images/mypage/coin2.svg" id="point_Icon"><span id="change"></span></p>
								</div>
							</div>
							<div class="receipt_Check">
								<input type="checkbox" id="check_Delivery"><label for="check_Delivery">배송지 정보를 확인하였습니다.</label>
							</div>
							<div class="receipt_Check">
								<input type="checkbox" id="check_Order"><label for="check_Order">위 주문 내용을 확인 하였으며,<br>&nbsp;&nbsp;&nbsp;&nbsp; 회원 본인은 개인정보 이용 및 결제에 동의합니다.</label>
							</div>
						</div>
						<div id="logo"><img src="/images/logo.png"></div>
					</div>
				</div>
			</div>
			<div class="Btn">
				<button type="button" id="order_Btn">결제하기</button>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	
	
<script src="/js/shop/payment/payment.js"></script>
<script src="/js/postcode.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>