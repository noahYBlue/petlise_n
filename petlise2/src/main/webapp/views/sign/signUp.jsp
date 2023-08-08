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
    <link rel="stylesheet" href="/css/sign/signUp.css" />
    <title>Pet LiSe</title>
    <script src="/js/sign/text.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <main class="container">
      <a href="/signin">
        <img src="/images/login-logo.png" alt="로고아이콘" />
      </a>
      <form method="post" action="signup" class="signupForm" name="signupForm">
        <div class="emailWrapper">
          <p>이메일</p>
          <div class="checkEmailWrap">
            <input
              type="email"
              id="email"
              name="email"
              oninput="regEmail()"
              placeholder="이메일 입력"
            />
            <button type="button" id="emailCheckButton" value="false">
              중복확인
            </button>
          </div>
          <span id="emailRequired"></span>
          <div class="CertificationEmail">
            <input type="text" placeholder="인증번호 입력" id="number" />
            <button type="button" onclick="sendNumber()" id="sendNum">
              인증번호 발송
            </button>
            <button
              type="button"
              onclick="confirmNumber()"
              style="display: none"
              id="checkNum"
              value="false"
            >
              인증번호 확인
            </button>
          </div>
        </div>
        <div class="passwordWrapper">
          <p>비밀번호</p>
          <p>영문, 숫자를 포함한 6~12자리의 비밀번호를 입력해주세요.</p>
          <input
            type="password"
            id="password"
            name="password"
            maxlength="12"
            oninput="regPw()"
            placeholder="비밀번호 입력"
          />
          <span id="pwRequired"></span>
          <p>비밀번호 확인</p>
          <input
            type="password"
            id="checkPassword"
            maxlength="12"
            oninput="checkPw()"
            placeholder="비밀번호 확인 입력"
          />
          <span id="checkPwRequired"></span>
        </div>
        <div class="nameWrapper">
          <p>별명</p>
          <input type="text" placeholder="별명 입력" id="name" name="name" oninput="regName()" />
          <span id="nameRequired"></span>
        </div>
        <div class="addressWrapper">
          <p>주소</p>
          <div class="post">
            <input
              type="text"
              id="sample6_postcode"
              placeholder="우편번호"
              name="address"
              readonly
            />
            <button type="button" onclick="sample6_execDaumPostcode()">
              우편번호 검색
            </button>
          </div>
          <input
            type="text"
            class="address1"
            id="sample6_address"
            name="address"
            placeholder="주소"
            readonly
          />
          <input
            type="text"
            class="address2"
            id="sample6_detailAddress"
            name="address"
            placeholder="상세주소"
          />
        </div>
        <div class="chooseAnimal">
          <p>어떤 동물과 함께 하시나요? (선택)</p>
          <input type="radio" name="pet_type" value="" checked />
          <div class="inputWrapper">
            <label>
              <input type="radio" name="pet_type" id="animal1" value="dog" />
              <label for="animal1"></label> 댕댕이<img
                src="/images/dog-icon.svg"
                alt="강아지"
              />
            </label>
            <label>
              <input type="radio" name="pet_type" id="animal2" value="cat" />
              <label for="animal2"></label> 냥냥이<img
                src="/images/cat-icon.svg"
                alt="고양이"
              />
            </label>
          </div>
        </div>
        <div class="petWrapper">
          <p>반려동물 이름 (선택)</p>
          <input type="text" class="petName" name="pet_name" maxlength="20" value="" />
          <p>반려동물 나이 (선택)</p>
          <input type="number" class="petAge" name="pet_age" maxlength="2" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
        </div>
        <ul>
          <li class="list">
            <label>
              <input type="radio" id="text1" required />
              <label for="text1"></label>
              <p>이용약관 (필수)</p>
            </label>
            <div id="textBorder1"></div>
          </li>
          <li class="list">
            <label>
              <input type="radio" id="text2" required />
              <label for="text2"></label>
              <p>개인정보 수집 및 이용에 대한 동의 (필수)</p>
            </label>
            <div id="textBorder2"></div>
          </li>
        </ul>
        <button class="submit" onClick="return check()">회원 가입</button>
      </form>
    </main>

    <script src="/js/sign/checkInput.js"></script>
    <script src="/js/sign/sendEmail.js"></script>
    <script src="/js/postcode.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/js/sign/checkSignupForm.js"></script>
  </body>
</html>
