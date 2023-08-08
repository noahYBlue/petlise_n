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
    <link rel="stylesheet" href="/css/sign/searchUser.css" />
    <link rel="stylesheet" href="/css/sign/findId.css" />
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
        <div class="searchform">
          <div class="divWrapper">
            <p>일치하는 이메일이 없습니다.</p>
          </div>
          <button onClick="location.href='/searchuser'">확인</button>
        </div>
      </div>
    </main>

    <script src="/js/sign/sendEmail.js"></script>
    <script src="/js/sign/checkFindIdForm.js"></script>
  </body>
</html>
