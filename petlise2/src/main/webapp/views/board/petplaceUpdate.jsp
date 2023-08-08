<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/views/board/bread/style.css">
  <link rel="stylesheet" href="/css/style.css" />
  <link rel="stylesheet" href="/css/board/petplaceWrite.css" />
  <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
  <link rel="stylesheet" href="/css/editor.css" />
  <link rel="icon" type="image/x-icon" href="/path/to/favicon.ico">
  
 
  <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33ed4195d27024d4ef479d47cfa9ce6f&libraries=services&libraries=services"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
  <title>펫플레이스 수정</title>
</head>
<body>
  <header>
	<jsp:include page="../header.jsp" />
</header>
  <div id="container">
    <div class="board_title">
      <p>펫플레이스 수정</p>
    </div>
  <input type="hidden" name="seq" id="seq" value="${seq}" />

    <p>제목</p>
    <div class="write_title">
      <input type="text" placeholder="제목" name="title" size="80%" maxlength="50" value="${petplaceInfo.title}" />
    </div>
    <p>카테고리</p>
    <div class="categoryWrap">
      <div class="category" id="category">
        <div id="dropdown" class="dropdown">
          <div class="select">
            <span>${fn:length(petplaceInfo.category) != 0 ? petplaceInfo.category : '카테고리 선택'}</span>
          </div>
          <input type="hidden" name="category" value="${fn:length(petplaceInfo.category) != 0 ? petplaceInfo.category : ''}" />
          <ul class="dropdown-menu">
            <li>카페</li>
            <li>산책</li>
            <li>숙소</li>
            <li>식당</li>
          </ul>
        </div>
      </div>
      <!-- 주소 및 지도 관련 요소 -->
      <div class="adressWrap">
        <p style="margin-bottom: 70px;">주소</p>
        <input type="text" id="sample6_postcode" placeholder="우편번호" name="petplace_address0"  value="${fn:split(petplaceInfo.petplace_address, ',')[0]}" style="padding-left: 16px; margin-left: -45px; pointer-events: none;" />
        <button id="adressBtn" type="button">주소 검색</button>
        <div class="mycanvas" style="width: 150px; height: 150px; margin-bottom: 200px; pointer-events: none;">
          <%@ include file="./bread/index.html"%>
          <script src="/js/board/cogibot.js"></script>
        </div>
        <div class="talkdog">
          <button id="searchBtn" type="button" style="display: none;"></button>
          <p>
            주소를 모두 입력하면<br> 위치를 보여드릴게요!
          </p>
        </div>
      </div>
       <div class="addressLine">
        <input type="text" id="sample6_address" name="petplace_address1" value="${fn:split(petplaceInfo.petplace_address, ',')[1]}" style="padding-left: 16px; pointer-events: none;" placeholder="주소" />
        <input type="text" id="sample6_detailAddress" name="petplace_address2" value="${fn:split(petplaceInfo.petplace_address, ',')[2]}"placeholder="상세주소" style="padding-left: 16px;" />
      </div>
      <div id="map"></div>
      <div class="editorWrap">
       <div id="editor">${petplaceInfo.petplace_contents}</div>
        <button class="writeButton" onclick="edit()" >수정하기</button>
</div>
    </div>
  </div>
<footer>
	<div>

		<jsp:include page="../footer.jsp" />
	</div>
	</footer>
  <!-- 나머지 스크립트들 -->
  <script>
    $(document).ready(function() {
      // Add click event listener to the "우편번호 검색" button
      $("#adressBtn").click(function() {
        sample6_execDaumPostcode(); // Call the address search function
      });

      $('#searchBtn').click(function() {
          // 버튼을 click했을때
          // 지도를 생성합니다    
             
          var mapContainer = document.getElementById('map');
          var mapOption = {
            center : new kakao.maps.LatLng(37.501306, 127.039659), // 지도의 중심좌표
            level : 2 // 지도의 확대 레벨
          };
          var map = new kakao.maps.Map(mapContainer, mapOption);
          // 주소-좌표 변환 객체를 생성합니다
          var geocoder = new kakao.maps.services.Geocoder();
          // 주소로 좌표를 검색합니다
          geocoder.addressSearch($('#sample6_address').val(), function(result, status) {
            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
              // 추출한 좌표를 통해 도로명 주소 추출
              let lat = result[0].y;
              let lng = result[0].x;
              getAddr(lat, lng);
              function getAddr(lat, lng) {
                let geocoder = new kakao.maps.services.Geocoder();
                let coord = new kakao.maps.LatLng(lat, lng);
                let callback = function(result, status) {
                  if (status === kakao.maps.services.Status.OK) {
                    // 추출한 도로명 주소를 해당 input의 value값으로 적용
                    $('#sample6_address').val(result[0].road_address.address_name);
                  }
                }
                geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
              }
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                map: map,
                position: coords
              });
              /* // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
              });
              infowindow.open(map, marker); */
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
            }
          });
        });
      });
    </script>
    
  <script>
    // Dropdown 관련 스크립트
    $('#dropdown').click(function () {
      $(this).attr('tabindex', 1).focus();
      $(this).toggleClass('active');
      $(this).find('.dropdown-menu').slideToggle(300);
    });

    $('#dropdown').focusout(function () {
      $(this).removeClass('active');
      $(this).find('.dropdown-menu').slideUp(300);
    });

    $('#dropdown .dropdown-menu li').click(function () {
      $(this).parents('.dropdown').find('span').text($(this).text());
      $(this).parents('.dropdown').find('input').attr('value', $(this).text());
    });
  </script>
  <script>
    // Add change event listener to the "sample6_address" input field
    $("#sample6_detailAddress").on("change", function() {
      // Trigger the click event for the "searchBtn" button
      $("#searchBtn").click();
      $(".addressLine").css("margin-bottom", "0");
    });
  </script>
  <script src="/js/postcode.js"></script>
  <script src="/js/editor.js"></script>
   <script src="/js/board/UpdatePetplace.js"></script>
 
  
</body>
</html>
