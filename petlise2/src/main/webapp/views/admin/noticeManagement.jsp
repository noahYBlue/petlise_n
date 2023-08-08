<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/admin/aside.css" />
    <link rel="stylesheet" href="/css/admin/pagination.css" />
    <link rel="stylesheet" href="/css/admin/tabMenu.css" />
    <link rel="stylesheet" href="/css/admin/noticeManagement.css" />
    <link rel="stylesheet" href="/css/admin/modal.css" />
    <title>Pet LiSe</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/js/admin/noticeManagement.js"></script>
  </head>
  <body>
    <div class="container">
      <div id="asideMenu"></div>

      <main>
        <p>공지사항 관리</p>

        <div class="tabMenu">
          <div class="tabWrap">
            <ul class="list">
              <li class="isOn"><a href="#tab1" class="btn">공지사항</a></li>
              <li><a href="#tab2" class="btn">이벤트</a></li>
              <li><a href="#tab3" class="btn">문의사항</a></li>
              <li><a href="#tab4" class="btn">가족찾기</a></li>
            </ul>
            <div class="inputWrap">
              <object data="/images/search.svg"></object>
              <input type="text" id="searchInput" placeholder="제목 or 작성자" />
            </div>
            
            <div id="edit"></div>
          </div>

          <div class="tableWrap">
            <table id="tab1" class="table" style="display: block"></table>
            <table id="tab2" class="table"></table>
            <table id="tab3" class="table"></table>
            <table id="tab4" class="table"></table>
          </div>
          <div id="pagination"></div>
        </div>
        <div id="modal"></div>
      </main>
    </div>

    <script src="/js/admin/aside.js"></script>
    <script src="/js/pagination.js"></script>
    <script src="/js/admin/tabMenu.js"></script>
    <script src="/js/admin/noticeTable.js"></script>
    <script src="/js/admin/getDate.js"></script>
    <script src="/js/admin/search.js"></script>
    <script src="/js/admin/deleteNotice.js"></script>
  </body>
</html>
