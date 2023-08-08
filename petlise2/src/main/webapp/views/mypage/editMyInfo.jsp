<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/mypage/myPageForm.css" />
    <link rel="stylesheet" href="/css/mypage/editMyInfo.css" />
    <link rel="stylesheet" href="/css/mypage/modal.css" />
    <title>Pet LiSe</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <jsp:include page="../header.jsp" />

    <p class="title">마이페이지</p>

    <div class="container">
      <div id="mypageMenu"></div>

      <div class="contentWrap">
        <div>
          <p>회원정보 수정</p>
          <div class="line"></div>

          <div class="infoWrap">
            <div class="imgWrap">
              <div class="img">
                <img
                  src="${fn:length(my_info.profile_image) != 0 ? ('https://storage.googleapis.com/' += my_info.profile_image) :''}"
                  onerror="this.onerror=null; this.src='/images/default-profile.svg';"
                  id="imgUrl"
                />
                <input
                  type="hidden"
                  id="imageValue"
                  name="profile_image"
                  value="${my_info.profile_image}"
                />
              </div>
              <label for="file">사진변경</label>
              <input
                type="file"
                id="file"
                accept="image/*"
                onchange="imageUpload()"
              />
            </div>

            <div class="nameWrap">
              <div id="nameTextWrap">
                <span id="nameText">${my_info.name}</span> <span>님</span>
                <button onclick="changeInput()">이름변경</button>
              </div>
              <input
                type="text"
                value="${my_info.name}"
                style="display: none"
                id="nameInput"
              />
              <p>${my_info.email}</p>
            </div>
          </div>

          <div class="inputWrap">
            <p>배송지</p>
            <div class="addressWrapper">
              <div class="post">
                <input
                  type="text"
                  name="address"
                  id="sample6_postcode"
                  placeholder="우편번호"
                  value="${fn:split(my_info.address, ',')[0]}"
                  readonly
                />
                <button onclick="sample6_execDaumPostcode()">
                  우편번호 검색
                </button>
              </div>
              <input
                type="text"
                class="address1"
                id="sample6_address"
                name="address"
                placeholder="주소"
                value="${fn:split(my_info.address, ',')[1]}"
              />
              <input
                type="text"
                class="address2"
                id="sample6_detailAddress"
                name="address"
                placeholder="상세주소"
                value="${fn:split(my_info.address, ',')[2]}"
              />
            </div>
          </div>

          <div class="inputWrap">
            <p>현재 비밀번호</p>
            <input type="password" id="password" />
          </div>

          <div class="inputWrap">
            <p>새 비밀번호</p>
            <div>
              <input
                type="password"
                id="newPassword"
                oninput="regPw()"
                maxlength="12"
              />
              <span id="pwRequired"></span>
            </div>
          </div>

          <div class="inputWrap">
            <p>새 비밀번호 확인</p>
            <div>
              <input
                type="password"
                id="checkNewPassword"
                oninput="checkPw()"
                maxlength="12"
              />
              <span id="checkPwRequired"></span>
            </div>
          </div>

          <div class="inputWrap">
            <p>어떤 동물과 함께 하시나요?</p>
            <div class="chooseAnimal">
              <div class="inputWrapper">
                <input type="radio" name="pet_type" value="" checked />
                <label>
                  <input type="radio" name="pet_type" id="animal1" value="dog"
                  ${my_info.pet_type == "dog" ? "checked" : false} />
                  <label for="animal1"></label> 댕댕이<img
                    src="/images/dog-icon.svg"
                    alt="강아지"
                  />
                </label>
                <label>
                  <input type="radio" name="pet_type" id="animal2" value="cat"
                  ${my_info.pet_type == "cat" ? "checked" : false} />
                  <label for="animal2"></label> 냥냥이<img
                    src="/images/cat-icon.svg"
                    alt="고양이"
                  />
                </label>
              </div>
            </div>
          </div>

          <div class="inputWrap">
            <p>반려동물 이름</p>
            <input type="text" class="petName" value="${my_info.pet_name}" />
          </div>

          <div class="inputWrap">
            <p>반려동물 나이</p>
            <input
              type="text"
              class="petAge"
              maxlength="2"
              value="${my_info.pet_age}"
              oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
            />
          </div>
        </div>
        <p class="deleteUser" onclick="clickModal()">회원탈퇴하기</p>
        <button class="editButton">확인</button>
      </div>
    </div>

    <div id="modal"></div>

    <jsp:include page="../footer.jsp" />

    <script src="/js/mypageMenu.js"></script>
    <script src="/js/mypage/updateUser.js"></script>
    <script src="/js/imageUpload.js"></script>
    <script src="/js/mypage/deleteUser.js"></script>
    <script src="/js/postcode.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  </body>
</html>
