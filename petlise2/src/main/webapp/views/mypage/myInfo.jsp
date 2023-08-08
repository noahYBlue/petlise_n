<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/mypage/myPageForm.css" />
    <link rel="stylesheet" href="/css/mypage/myInfo.css" />
    <title>Pet LiSe</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <jsp:include page="../header.jsp" />
    
    <p class="title">마이페이지</p>

    <div class="container">
      <div id="mypageMenu" class="menu"></div>

      <div class="contentWrap">
        <div class="userInfo">
          <p>회원정보</p>

          <div class="imgBox">
            <div class="userWrap">
              <div class="imgWrap">
                <img
                  src="${fn:length(my_info.profile_image) != 0 ? ('https://storage.googleapis.com/' += my_info.profile_image) :''}"
                  onerror="this.onerror=null; this.src='/images/default-profile.svg';"
                />
              </div>
              <div class="user">
                <p>
                  ${my_info.name}<span>님</span>
                  <a href="/mypage/edit">회원정보변경</a>
                </p>
                <p>${my_info.email}</p>
                <c:if
                  test="${my_info.pet_type != '' || my_info.pet_name != '' || my_info.pet_age != ''}"
                >
                  <div class="petInfo">
                    <c:choose>
                      <c:when test="${my_info.pet_type == 'dog'}">
                        <img src="/images/dog-icon.svg" alt="강아지" />
                    	<p>${my_info.pet_name} <span>(${my_info.pet_age}살)</span></p>
                      </c:when>

                      <c:when test="${my_info.pet_type == 'cat'}">
                        <img src="/images/cat-icon.svg" alt="고양이" />
                    	<p>${my_info.pet_name} <span>(${my_info.pet_age}살)</span></p>
                      </c:when>
                    </c:choose>
                  </div>
                </c:if>
              </div>
            </div>

            <object data="/images/puppy.svg" alt="강아지"></object>
          </div>
        </div>

        <div class="info">
          <div class="infoBox">
            <object data="/images/point-icon.svg" alt="포인트아이콘"></object>
            <p>포인트</p>
            <p><fmt:formatNumber value="${my_info.point}" pattern="#,###" /></p>
          </div>
          <div class="infoBox">
            <object data="/images/gift-icon.svg" alt="상품아이콘"></object>
            <p>상품 주문 내역</p>
            <p>${my_total_info.orderCount}</p>
          </div>
          <div class="infoBox">
            <object data="/images/comment1.svg" alt="상품후기아이콘"></object>
            <p>상품 후기</p>
            <p>${my_total_info.productCommentsCount}</p>
          </div>
          <div class="infoBox">
            <object data="/images/comment2.svg" alt="작성한문의아이콘"></object>
            <p>작성한 문의</p>
            <p>${my_total_info.qnaCount}</p>
          </div>
          <div class="infoBox">
            <object
              data="/images/box-icon.svg"
              alt="작성한레시피아이콘"
            ></object>
            <p>작성한 레시피</p>
            <p>${my_total_info.recipeCount}</p>
          </div>
          <div class="infoBox">
            <object data="/images/comment3.svg" alt="레시피후기아이콘"></object>
            <p>레시피 후기</p>
            <p>${my_total_info.recipeCommentsCount}</p>
          </div>
          <div class="infoBox">
            <object
              data="/images/board2-icon.svg"
              alt="작성한게시글아이콘"
            ></object>
            <p>작성한 게시글</p>
            <p>${my_total_info.boardCount}</p>
          </div>
          <div class="infoBox">
            <object
              data="/images/keyboard-icon.svg"
              alt="작성한댓글아이콘"
            ></object>
            <p>작성한 댓글</p>
            <p>${my_total_info.boardCommentsCounts}</p>
          </div>
        </div>
      </div>
    </div>
    
    <jsp:include page="../footer.jsp" />

    <script src="/js/mypageMenu.js"></script>
  </body>
</html>
