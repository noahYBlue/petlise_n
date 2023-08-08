<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/notice/qnaCategory.css" />
    <link rel="stylesheet" href="/css/notice/editQna.css" />
    <link
      href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/editor.css" />
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script src="/js/jquery-3.6.4.min.js"></script>
    <title>Pet LiSe</title>
    <script>
      let check = '${check}';
    </script>
  </head>
  <body>
    <jsp:include page="../header.jsp" />

    <div class="container">
      <div class="title">${title}</div>

      <div class="contents">
        <div class="category" id="category">
          <div id="dropdown" class="dropdown">
            <div class="select">
              <span>${fn:length(qnaInfo.category) != 0 ? qnaInfo.category : '카테고리 선택'}</span>
            </div>
            <input
              type="hidden"
              name="category"
              value="${fn:length(qnaInfo.category) != 0 ? qnaInfo.category : ''}"
            />
            <ul class="dropdown-menu">
              <li>상품문의</li>
              <li>기타문의</li>
            </ul>
          </div>
        </div>

        <input
          type="text"
          placeholder="제목"
          name="title"
          value="${qnaInfo.title}"
        />

        <div id="editor">${qnaInfo.contents}</div>

        <button class="editButton" onclick="return edit()">${check}하기</button>
      </div>

      <div id="pagination"></div>
    </div>

    <script src="/js/admin/noticeCategory.js"></script>
    <script src="/js/editor.js"></script>
    <script src="/js/notice/editQna.js"></script>
  </body>
</html>
