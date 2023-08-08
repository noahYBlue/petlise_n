<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/notice/category.css" />
    <link rel="stylesheet" href="/css/notice/qna.css" />
    <link rel="stylesheet" href="/css/notice/pagination.css" />
    <script src="/js/jquery-3.6.4.min.js"></script>
    <title>Pet LiSe</title>
  </head>
  <body>
    <jsp:include page="../header.jsp" />

    <div class="container">
      <div class="title">${title}</div>

      <div class="topWrap">
        <div class="categoryWrap">
          <div class="category">
            <a href="/noticeMain">공지사항</a>
          </div>
          <div class="category">
            <a href="/eventMain">이벤트</a>
          </div>
          <div class="category">
            <a href="/qna">문의사항</a>
          </div>
          <div class="category">
            <a href="/findfamily">가족찾기</a>
          </div>
        </div>
        <div class="inputWrap">
          <object data="/images/search.svg"></object>
          <input type="text" id="searchInput" placeholder="제목 or 작성자" />
        </div>

        <c:if test="${user_id ne null}">
          <a href="/createqna" class="createBtn">등록</a>
        </c:if>
      </div>

      <div class="table">
        <div>
          <p>카테고리</p>
          <p>제목</p>
          <p>작성자</p>
          <p>조회수</p>
          <p>작성일</p>
        </div>

        <div id="tbody"></div>
      </div>

      <div id="pagination"></div>
    </div>

    <jsp:include page="../footer.jsp" />

    <script src="/js/notice/qnaMain.js"></script>
    <script src="/js/admin/getDate.js"></script>
    <script src="/js/pagination.js"></script>
    <script src="/js/notice/search.js"></script>
  </body>
</html>
