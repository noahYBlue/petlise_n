<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/css/admin/userManagement.css" />
    <link rel="stylesheet" href="/css/admin/modal.css" />
    <title>Pet LiSe</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/js/admin/userManagement.js"></script>
  </head>
  <body>
    <div class="container">
      <div id="asideMenu"></div>
      <main>
        <p>사용자 관리</p>
        <div>
          <div class="tabWrap">
            <div class="inputWrap">
              <object data="/images/search.svg"></object>
              <input type="text" id="searchInput" placeholder="이름 or 이메일" />
            </div>
          </div>
          <table>
            <thead>
              <tr>
                <th>이름</th>
                <th>이메일</th>
                <th>주소</th>
                <th>포인트</th>
                <th>가입일</th>
                <th>탈퇴일</th>
              </tr>
            </thead>
            <tbody id="tbody"></tbody>
          </table>

          <div id="pagination"></div>
        </div>
        <div id="modal"></div>
      </main>
    </div>

    <script src="/js/admin/aside.js"></script>
    <script src="/js/pagination.js"></script>
    <script src="/js/admin/getDate.js"></script>
    <script src="/js/admin/search.js"></script>
    <script src="/js/admin/updatePoint.js"></script>
  </body>
</html>
