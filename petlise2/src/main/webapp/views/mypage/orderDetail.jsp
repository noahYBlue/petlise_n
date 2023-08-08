<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Pet LiSe</title>
    <link rel="icon" href="/images/favicon.ico" />
	<link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/mypage/orderDetail.css" />
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
        <div class="contents_Title">주문상세</div>
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
		<c:forEach var="myOrderProduct" items="${myOrderProduct}">
        <div class="table_Column">
          <div style="display: none;">${myOrderProduct.user_id}</div>
          <div style="display: none;" class="order_id">${myOrderProduct.order_id}</div>        
          <div id="table_Product_Img">
            <p>
              <a href="#">
                <img src="${myOrderProduct.product_image}" />
              </a>
            </p>
          </div>
          <div id="table_Product_Info">
            <p>
              <a href="/shopdetail?product_id=${myOrderProduct.product_id}">
                <span>${myOrderProduct.product_name}</span>
              </a>
            </p>
          </div>
          <div id="table_Quantity">
            <p>${myOrderProduct.quantity}</p>
          </div>
          <div id="table_Price">
            <p><img src="/images/mypage/coin2.svg" id="point_Icon" /><fmt:formatNumber value="${myOrderProduct.product_price}" pattern="#,###" /></p>
          </div>
          <div id="table_Total">
            <p><img src="/images/mypage/coin2.svg" id="point_Icon" /><fmt:formatNumber value="${myOrderProduct.price_total}" pattern="#,###" /></p>
          </div>
        </div>
		</c:forEach>
        <div class="order_Detail">
          <div class="order_Info">
            <div class="member_Info_Title">회원 정보</div>
            <table class="member_Info">
              <tr id="member_Name">
			  <div style="display: none;">${myUserInfo.user_id}</div>
                <td class="col_1">닉네임</td>
                <td class="col_2">${myUserInfo.name}</td>
              </tr>
              <tr id="member_Email">
                <td class="col_1">이메일</td>
                <td class="col_2">${myUserInfo.email}</td>
              </tr>
            </table>
            <div class="delivery_Info_Title">배송 정보</div>
            
            <table class="delivery_Info">
            <div id="order_id" style="display: none;">${myDeliveryInfo.order_id}</div>
              <tr id="delivery_Name">
                <td class="col_1">받는분 성함</td>
                <td class="col_2">${myDeliveryInfo.name}</td>
              </tr>
              <tr id="delivery_Address">
                <td class="col_1">배송 주소</td>
                <td class="col_2">${myDeliveryInfo.address}</td>
              </tr>
              <tr id="delivery_Phone">
                <td class="col_1">연락처</td>
                <td class="col_2">${myDeliveryInfo.phone}</td>
              </tr>
              <tr id="delivery_Detail">
                <td class="col_1">배송 요청사항</td>
                <td class="col_2">${myDeliveryInfo.require}</td>
              </tr>
              <tr id="delivery_Status">
                <td class="col_1">배송 현황</td>
                <td class="col_2">${myDeliveryInfo.status}</td>
              </tr>
            </table>
            <p id="delivery_Caption">
              ※ 배송지 정보는 주문 완료시 수정이 불가능하므로 정보를 꼭
              확인해주시기 바랍니다.
            </p>
          </div>

          <div class="receipt">
            <div class="receipt_Detail">
              <div class="receipt_Title">
                <img src="/images/mypage/coin2.svg" id="receipt_Icon" />포인트
                영수증
              </div>
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
                    <p><fmt:formatDate value="${myDeliveryInfo.date}" pattern="yyyy.MM.dd" /></p>
                  </div>
                  <div class="receipt_Row_1">
                    <p>
                      <img src="/images/mypage/coin2.svg" id="point_Icon" />
                      <fmt:formatNumber value="${myDeliveryInfo.total_product}" pattern="#,###"/>
                    </p>
                    <p>
                      <img src="/images/mypage/coin2.svg" id="point_Icon" />
                      3,000
                    </p>
                  </div>
                  <div class="receipt_Row_2">
                    <p>
                      <img src="/images/mypage/coin2.svg" id="point_Icon" />
                      <span id="total_payment"><fmt:formatNumber value="${myDeliveryInfo.total_payment}" pattern="#,###"/></span>
                    </p>
                    <p>
                      <img src="/images/mypage/coin2.svg" id="point_Icon" />
                      <span id="affordable"><fmt:formatNumber value="${myDeliveryInfo.available_point}" pattern="#,###"/></span>
                    </p>
                  </div>
                  <div class="receipt_Row_3">
                    <p>
                      <img src="/images/mypage/coin2.svg" id="point_Icon" />
                      <span id="change"><fmt:formatNumber value="${myDeliveryInfo.available_point-myDeliveryInfo.total_payment}" pattern="#,###"/></span>
                    </p>
                  </div>
                </div>
                <div id="logo"><img src="/images/logo.png" /></div>
              </div>
            </div>
          </div>
        </div>
        <div class="Btn">
          <input type="button"  value="주문목록" id="orderList_Btn" onclick="redirectToOrderList()" />
	      <c:choose>
	      	<c:when test="${myDeliveryInfo.status eq '주문취소' || myDeliveryInfo.status eq '배송처리완료'}">
			      <input type="button" value="주문취소" id="cancel_Btn_no" />
	      	</c:when>
	      	<c:otherwise>
			      <input type="button" value="주문취소" id="cancel_Btn" onclick="cancelOrderDetail()" />
	      	</c:otherwise>
	      </c:choose>
        </div>
      </div>
    </div>
	<jsp:include page="../footer.jsp" />    
    <script src="/js/mypage/orderDetail.js"></script>
    <script src="/js/mypageMenu.js"></script>
  </body>
</html>
