<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/sign/searchUser.css" />
    <title>Pet LiSe</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <jsp:include page="../header.jsp" />

    <main class="container">
      <div class="dogImage">
        <a href="/signin">
          <img src="/images/login-logo.png" alt="로고" />
        </a>
        <img src="/images/dogncat.svg" alt="강아지" />
      </div>
      <div class="loginWrapper">
        <div class="tabMenu">
          <a href="/searchuser">비밀번호 찾기</a>
        </div>
        <form method="post" action="newpw" class="searchform" name="searchform">
          <div class="divWrapper">
            <div class="inputWrapper">
              <input type="hidden" name="email" value="${userInfo}" />
              <p>새 비밀번호</p>
              <input
                type="password"
                maxlength="12"
                oninput="regPw()"
                id="password"
                name="password"
              />
              <span id="pwRequired"></span>
              <div class="emp"></div>
              <p>새 비밀번호 확인</p>
              <input
                type="password"
                maxlength="12"
                oninput="checkPw()"
                id="checkPassword"
              />
              <span id="checkPwRequired"></span>
            </div>
          </div>
          <button onclick="return check()">확인</button>
        </form>
      </div>
    </main>

    <script src="/js/sign/checkPw.js"></script>
  </body>
</html>
