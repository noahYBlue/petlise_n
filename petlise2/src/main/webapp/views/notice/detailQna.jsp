<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/notice/detailQna.css" />
    <script src="/js/jquery-3.6.4.min.js"></script>
    <title>Pet LiSe</title>
  </head>
  <body>
    <jsp:include page="../header.jsp" />

    <div class="container">
      <div class="topWrap">
        <div>
          <p>제목</p>
          <p>${qnaInfo.title}</p>
          <p>날짜</p>
          <p>조회수</p>
        </div>
        <div>
          <p>작성자</p>
          <p>${qnaInfo.name}</p>
          <p>
            <fmt:formatDate
              value="${qnaInfo.created_at}"
              pattern="yyyy-MM-dd"
            />
          </p>
          <p>${qnaInfo.view_count}</p>
        </div>
      </div>
      <div class="contentsWrap">
        <div class="contents">${qnaInfo.contents}</div>

        <c:if test="${user_id eq qnaInfo.user_id}">
          <div class="buttonWrap">
            <button onclick="moveToEditBtn()">수정</button>
            <button onclick="deleteQnA()">삭제</button>
          </div>
        </c:if>

        <c:if test="${role eq 'admin'}">
          <div class="line"></div>
          <div class="commentInputWrap">
            <input type="text" placeholder="답변을 등록해주세요" id="content" />
            <button onclick="addComment()">등록</button>
          </div>
        </c:if>

        <c:forEach var="comment" items="${commentList}">
          <div class="commentInfoWrap">
            <div class="commentInfo">
              <p>관리자</p>
              <c:if test="${role eq 'admin'}">
                <button onclick="deleteComment('${comment.comment_id}')">삭제</button>
              </c:if>
              <p id="date">
                <fmt:formatDate
                  value="${comment.created_at}"
                  pattern="yyyy-MM-dd a hh:mm"
                />
              </p>
            </div>
            <p>${comment.content}</p>
          </div>
        </c:forEach>
      </div>
    </div>

    <jsp:include page="../footer.jsp" />

    <script src="/js/notice/detailQna.js"></script>
  </body>
</html>
