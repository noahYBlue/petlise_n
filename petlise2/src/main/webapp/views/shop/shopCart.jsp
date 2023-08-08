<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="css/shop/shopCart.css" />
<link rel="stylesheet" href="css/style.css" />
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
                <span>장바구니</span>
            </div>
            <div id="second">
                <span class="second_active">01 장바구니</span>
                <span>&nbsp;> 02 주문/결제 > 03 주문완료</span>
            </div>
        </div><!--title end-->

        <div id="cart_title">
            <div style="width: 100px;">
                <input type="checkbox" id="allcheck">
                <label for="allcheck"></label>
            </div>
            <div style="width: 460px;">상품정보</div>
            <div style="width: 130px;">수량</div>
            <div style="width: 130px;">포인트</div>
            <div style="width: 130px;">소계</div>
            <div style="width: 100px;">삭제</div>
        </div><!--cart_title end-->

		<!-- 장바구니 상품목록 -->
		<div>
			<c:if test="${empty cart }">
				<div class="cart_empty">장바구니를 담아주세요 
					<button class="empty_shop" onclick="shop_button()">쇼핑하기</button>
				</div>
			</c:if>		
			<c:forEach var="cart" items="${cart }" begin="0" end="2">
				<div class="cart_product_container">
					<div>
						<p class="Else" data-user_id="${cart.user_id}">${cart.user_id}</p>
					</div>
					<div>
						<p class="Else" data-product_id="${cart.product_id }"></p>
					</div>					
					<div style="width: 100px;">
						<input type="checkbox" id="product_check_${cart }" class="product_check">
						<label for="product_check_${cart }"></label>
					</div>
					<div style="width: 460px;" class="cart_info">
						<img class="cart_product_image" src="https://storage.googleapis.com/${cart.product_image }" alt="product_img">
						<div>
							<a href="#">${cart.product_name }</a>
						</div>
					</div>
					<div style="width: 130px;" class="cart_quantity" data-quantity="${cart.quantity }">${cart.quantity }</div>
					<div style="width: 130px;" data-product_price="${cart.product_price }">
						<img src="/images/shop/shopdetail/coin2.svg" alt="cart"
							style="width: 20px; margin-top: 2px; margin-right: 5px;" /><fmt:formatNumber value="${cart.product_price }" pattern="#,###" />
					</div>
					<div style="width: 130px;" data-price_total="${cart.price_total }">
						<img src="/images/shop/shopdetail/coin2.svg" alt="cart"
							style="width: 20px; margin-top: 2px; margin-right: 5px;"/><fmt:formatNumber value="${cart.price_total }" pattern="#,###" />
					</div>
					<div style="width: 100px;">
						<button class="each_delete" data-product_name="${cart.product_name }"></button>
					</div>
				</div>
				<!-- 상품1개 -->
			</c:forEach>
			<div class="check_delete_button">
				<c:if test="${not empty cart}">
					<button id="checked_delete_button" class="checked_delete">선택삭제</button>
					<button id="all_check_button" class="all_check">모두선택</button>
				<c:if test="${empty cart }">
					<script>
			            document.getElementById("checked_delete_button").style.display = "none";
			            document.getElementById("all_check_button").style.display = "none";
	        		</script>	
				</c:if>
				</c:if>
			</div>
		</div>
		
		<div id="cart_total">
            <span>총 차감 포인트</span>
            <span id="payment"></span>
            <span id="totalPrice"></span>
            <button id="order_button">주문하러가기
                <img src="/images/shop/shopdetail/pawprint_black.svg" style="width: 25px;">
            </button>
        </div>

    </div><!--layout end-->
	<jsp:include page="../footer.jsp" />    
	<script src="/js/shop/cart/shopCart.js"></script>    
</body>    
</html>