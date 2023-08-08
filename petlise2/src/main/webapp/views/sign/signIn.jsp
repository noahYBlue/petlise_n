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
    <link rel="stylesheet" href="/css/sign/signIn.css" />
    <title>Pet LiSe</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <jsp:include page="../header.jsp" />

    <main class="container">
      <div class="dogImage">
        <!-- <a href="/signin">
          <img src="/images/login-logo.png" alt="로고" />
        </a> -->
        <img src="/images/dogncat.svg" alt="강아지" />
      </div>
      <div class="loginWrapper">
        <form method="post" class="loginform" name="loginform" id="form">
          <p>로그인</p>
          <div class="emailWrapper">
            <p>E-mail</p>
            <input type="email" id="email" name="email" />
          </div>
          <div class="passwordWrapper">
            <p>Password</p>
            <input type="password" id="password" name="password" />
          </div>
          <div class="errorMessage">
            <%=session.getAttribute("error_message")%>
          </div>
          <button onclick="return checkLogin()">이메일로 로그인하기</button>
        </form>
        <div class="findlink">
          <a href="/searchuser">비밀번호 찾기</a>
        </div>
        <div class="line"></div>
        <div class="snsWrapper">
          <p>다음 계정으로 간편 로그인</p>
          <a href="/login/oauth2/google">
            <object data="/images/google.svg" alt="구글아이콘"></object>
            <span>Google로 로그인</span>
          </a>
        </div>
        <div class="movetosignup">
          <span>회원이 아니신가요?</span>
          <a href="/signup">회원가입 하기</a>
        </div>
      </div>
    </main>

    <script src="/js/sign/checkLoginForm.js"></script>
  </body>
</html>
