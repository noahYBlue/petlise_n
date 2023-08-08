<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% java.util.Date orderDate = new java.util.Date(); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Pet LiSe</title>
    <link rel="icon" href="/images/favicon.ico" />
	<link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/mypage/orderList.css" />
    <link rel="stylesheet" href="/css/mypage/myPageForm.css" />
    <link rel="stylesheet" href="/css/style.css" />
	<script src="/js/jquery-3.6.4.min.js"></script>
  </head>
  <body>
	<jsp:include page="../header.jsp" />  
    <p class="title">마이페이지</p>

    <div class="container">
      <div id="mypageMenu" class="menu"></div> 

      <div class="contents">
        <div class="contents_Title">주문목록</div>
        <div class="contents_Table">
          <div class="table">
            <div class="table_Header">
              <p id="table_Header_Date">주문날짜/주문번호</p>
              <p id="table_Header_Product">주문상품</p>
              <p id="table_Header_Price">총포인트</p>
              <p id="table_Header_Status">주문현황</p>
            </div>
			<c:if test="${fn:length(myOrder) == 0}">
				<div class="table_Column nolist">
					구매하신 상품이 없습니다.
				</div>
			</c:if>
			<c:forEach var="myOrder" items="${myOrder}">			
            <div class="table_Column">
              <div style="display: none;" class="user_id">${myOrder.user_id}</div>
              <div style="display: none;" class="order_id">${myOrder.order_id}</div>
              <div id="table_Date">
                <p><fmt:formatDate value="${myOrder.date}" pattern="yyyy.MM.dd" /></p>
	            <c:set var="truncatedOrderId" value="${fn:substring(myOrder.order_id, 0, 20)}" />
                <p>${truncatedOrderId }</p>
              <c:if test="${myOrder.status ne '주문취소' && myOrder.status ne '배송처리완료'}">
                <input type="button" class="cancel_Btn" value="주문취소" onclick="cancelOrder('${myOrder.order_id}')" />
              </c:if>
              </div>
              <div id="table_Product">
                <a href="/orderdetail?order_id=${myOrder.order_id}&user_id=${myOrder.user_id}">
                  <img src="${myOrder.product_image}" id="product_Image"/>
                  <span id="product_Name">${myOrder.product_name} 등</span>
                </a>
              </div>
              <div id="table_Price">
              	<div style="display: flex; align-items: center;">
              	<img
	                src="/images/shop/shopdetail/coin2.svg"
	                alt="coin"
	                style="width: 15px; margin-right: 5px"
	            /><fmt:formatNumber value="${myOrder.total_payment}" pattern="#,###"/></div>
              	</div>	              
              <div id="table_Status">${myOrder.status}</div>
            </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
	<jsp:include page="../footer.jsp" />
    <script src="/js/mypage/orderList.js"></script>
    <script src="/js/mypageMenu.js"></script>
  </body>
</html>
