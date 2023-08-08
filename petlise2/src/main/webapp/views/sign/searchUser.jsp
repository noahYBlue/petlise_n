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
        <form
          method="post"
          action="findpw"
          class="searchform"
          name="searchform"
        >
          <div class="divWrapper">
            <div class="inputWrapper">
              <p>이름</p>
              <input
                type="text"
                id="name"
                name="name"
                placeholder="이름 입력"
              />
              <div class="emp"></div>
              <p>이메일 주소</p>
              <div class="checkEmail">
                <input
                  type="email"
                  id="email"
                  name="email"
                  placeholder="이메일 입력"
                />
                <button
                  type="button"
                  onclick="findUser()"
                  id="sendNum"
                  value="null"
                >
                  인증번호 발송
                </button>
              </div>
              <div class="CertificationEmail">
                <input type="text" placeholder="인증번호 입력" id="number" />
                <button
                  type="button"
                  onclick="confirmNumber()"
                  id="checkNum"
                  value="false"
                  disabled
                >
                  인증번호 확인
                </button>
              </div>
            </div>
          </div>
          <button onClick="return check()">확인</button>
        </form>
      </div>
    </main>

    <script src="/js/sign/sendEmail.js"></script>
    <script src="/js/sign/checkFindIdForm.js"></script>
  </body>
</html>
