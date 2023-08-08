
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
// 서버 사이드 코드에서 세션에서 user_id 값을 가져옵니다.
var user_id = (String) session.getAttribute("user_id");
var place_id = (String) session.getAttribute("place_id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/board/petplaceDetail.css">
<link rel="stylesheet" href="/css/board/modal.css">
<link rel="stylesheet" href="/css/style.css" />

<link rel="stylesheet" href="/views/board/cogi/cogi.css" />
<title>펫플레이스 상세페이지</title>
<script src="/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33ed4195d27024d4ef479d47cfa9ce6f&libraries=services&libraries=services"></script>
<script>
	
	$(document).ready(function() {
	
		var cmtInput = $("#comment-input");
		var characterCount = $("#characterCount");
	
		cmtInput.on("input", function() {
			var currentLength = cmtInput.val().length;
			var maxLength = 1000;
	
			characterCount.text(currentLength + "/" + maxLength);
		});
	
	
	//댓글 갯수 카운팅
	
		var cmtCount = $(".cmt_unit").length;
		$(".cmt_count").text(cmtCount);
	})
	
	
	</script>
<script>
$(document).ready(function() {
	 var user_id = '<%=user_id%>';
    
    $(".new-comment").each(function() {
        var comment_user_id = $(this).find('#replyButton').attr('data-user-id');
        

        if (user_id === comment_user_id) {
            console.log('Showing #replyButton');
            $(this).find("#replyButton").show();
        } else {
            console.log('Hiding #replyButton');
            $(this).find("#replyButton").hide();
        }
    });
});
</script>
<!-- 
	<script>
	$(document).on('click', '.comment_likebtn', function() {
	    if (user_id == "") {
	        // 로그인이 필요한 경우에 대한 처리
	    } else {
	        $.ajax({
	            type: 'post',
	            url: '/petplacelikeup',
	            dataType: 'json',
	            data: {
	                user_id: user_id,  // 수정: user_id 변수를 실제 값으로 전달
	                place_id: ${petplaceInfo.place_id},  // 수정: petplaceInfo.place_id 변수를 실제 값으로 전달
	                comment_id: 'place_id'  // 수정: 실제 댓글의 comment_id 값을 전달 (테이블 구조에 따라 정확한 값을 사용해야 함)
	            },
	            success: function(result) {
	                // 결과 성공 콜백함수
	                // 여기서 좋아요 수를 업데이트하거나 버튼 상태를 변경할 수 있습니다.
	            },
	            error: function(request, status, error) {
	                // 결과 에러 콜백함수
	                console.log(error);
	            }
	        }); // ajax end
	    }
	});
	
	
	$(document).on('click', '.comment_likebtn_active', function() {
	    if (user_id == "") {
	        // 로그인이 필요한 경우에 대한 처리
	    } else {
	        $.ajax({
	            type: 'post',
	            url: '/petplacelikedown',
	            dataType: 'json',
	            data: {
	                user_id: user_id,  // 수정: user_id 변수를 실제 값으로 전달
	                place_id: ${petplaceInfo.place_id},  // 수정: petplaceInfo.place_id 변수를 실제 값으로 전달
	                comment_id: 'place_id'  // 수정: 실제 댓글의 comment_id 값을 전달 (테이블 구조에 따라 정확한 값을 사용해야 함)
	            },
	            success: function(result) {
	                // 결과 성공 콜백함수
	                // 여기서 좋아요 수를 업데이트하거나 버튼 상태를 변경할 수 있습니다.
	            },
	            error: function(request, status, error) {
	                // 결과 에러 콜백함수
	                console.log(error);
	            }
	        }); // ajax end
	    }
	});
	
	    	</script> -->

</head>

<body>
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<div class="board_title">
		<a href="/petplaceMain">펫플레이스</a> <img
			src="/images/board/petplaceLogo.png" style="margin-left: -7px;"
			alt="펫플레이스이미지">
	</div>
	<div class="containers">
		<div class="contents">
			<div class="detail_title">${petplaceInfo.title}</div>
			<div class="detail_info">
				<div class="detail_writer">작성자 : ${petplaceInfo.user.name}</div>
				<div class="detail_date">
					<fmt:formatDate value="${petplaceInfo.petplace_created}"
						pattern="yyyy-MM-dd H:mm" />
				</div>
				<div class="detail_view">조회수 ${petplaceInfo.view_count}</div>
				<div class="detail_like">♥${petplaceInfo.petplacelike.likes}</div>
			</div>
			<div id=UD>
				<div class="post_actions" id="postActions" style="display: none;">
					<a class="editButton" id="editButton"
						href="/getUpdatepetplace?seq=${petplaceInfo.seq}">수정</a>
					<button class="deleteButton" id="deleteButton"
						data-placeid="${petplaceInfo.seq}" onclick="clickModal(event)">삭제</button>
				</div>
				<div id="modal"></div>
			</div>


			<div class="petplacemap">펫플레이스 위치</div>
			<div class="addressLine">
				<div id="post_address">${fn:split(petplaceInfo.petplace_address,',')[0]}</div>
				<div id="sample6_address">${fn:split(petplaceInfo.petplace_address,',')[1]}</div>
				<div id="detail_address">${fn:split(petplaceInfo.petplace_address,',')[2]}</div>
			</div>
			<%@ include file="./cogi/cogi.html"%>


			<div id="map"></div>
			<button id="searchBtn" type="button" style="display: none;"></button>
			<div class="detail_content">${petplaceInfo.petplace_contents}</div>

			<div>
				<div>
					<div class="post_like">

						<button class="comment_likebtn">
							<img src="/images/recipe/heart.svg">좋아요
						</button>
					</div>
				</div>

			</div>
		</div>




	</div>



	<div class="comment">
		<div id="cmtPosition">
			<div class="comment_header_bar">
				<span>댓글</span> <span class="cmt_count">5</span> <img
					src="/images/recipe/reply.svg">
			</div>
		</div>
		<!-- HTML 입력 폼 -->
		<input type="hidden" name="user_id" value="<%=user_id%>"> <input
			type="hidden" name="place_id" value="${ petplaceInfo.place_id}">


		<!-- 댓글작성 -->
		<div class="cmt_write_input">
			<img style="width: 50px; height: 50px;"
				src="${fn:length(userInfo.profile_image) != 0 ? ('https://storage.googleapis.com/' += userInfo.profile_image) :''}"
				onerror="this.onerror=null; this.src='/images/default-profile.svg';">
			<textarea class="cmt_textarea" id="comment-input"
				name='comment_contents' placeholder="이 곳에 댓글 내용을 입력해주세요."></textarea>
			<div class="character-count" id="characterCount">0/1000</div>
		</div>
		<div class="cmt_write_input_bottom">
			<div class="cmt_actions">

				<button type="submit" id="sticker">
					<img src="/images/recipe/sticker.svg">스티커
				</button>
				<button type="submit" id="picture">
					<img src="/images/recipe/picture.svg">사진
				</button>
				<button type="submit" id="submitButton" onclick="edit()">등록</button>
			</div>
		</div>

		<table style="width: 1240px; margin-top: -14px;">
			<c:if test="${empty response.list}">
				<tr>
					<td colspan="9" class="no_data_msg">
						<div>댓글이없습니다.</div>
					</td>
				</tr>
			</c:if>
		</table>


		<div class="commentUl">
			<c:forEach var="comment" items="${response.list}">

				<li class="new-comment">

					<div class="cmt_unit">

						<div class="cmt_left">
							<div class="user_profile">
								<img style="width: 50px; height: 50px;" class="profile"
									src="${fn:length(comment.user.profile_image) != 0 ? ('https://storage.googleapis.com/' += comment.user.profile_image) :''}"
									onerror="this.onerror=null; this.src='/images/default-profile.svg';" />
							</div>
							<span style="margin-left: 25px;" class="cmt_nick">${comment.user.name}</span>
						</div>
							<div class="comment_contents">
								<p>${comment.comment_contents}</p>
							</div>
						
						<div class="tud">
					
							<fmt:formatDate value="${comment.comment_created_at}"
								pattern="yyyy-MM-dd H:mm" />
						</div>

						<div id="replyButton" data-user-id="${comment.user_id}" style="display: none;">
							<button class="replyUButton" style=" border: 2px solid var(--light-stroke);">수정</button>
							<button class="replyDButton" style=" border: 2px solid var(--light-stroke);"data-placeid="${comment.comment_id}"
								onclick="clickCommentModal(event)">삭제</button>
						</div>
					</div>
				</li>
			</c:forEach>

		</div>

		<div class="filler"></div>



		<input type="hidden" value="${comment.comment_id}" />


		




		<%-- <c:if test="${comment.islike}">
								<button class="comment_likebtn_active">
									<span class="material-symbols-outlined">thumb_up</span>
									<br>
									<span class="likecnt">${comment.likes}</span>
								</button>
							</c:if>
							<c:if test="${!comment.islike}">
								<button class="comment_likebtn">
									<span class="material-symbols-outlined">thumb_up</span>
									<br>
									<span class="likecnt">${comment.likes}</span>
								</button>
							</c:if> --%>
		<%-- <c:if test="${comment.user_id == sessionScope.user_id}">
								<button class="comment_deletebtn">
									<span class="material-symbols-outlined">delete</span>
								</button>
							</c:if> --%>

		<!--리뷰1개-->
	</div>

	<div id="pagination">
		<c:if test="${fn:length(response.list) != 0}">
			<div class="pagefirst"
				<c:if test="${!response.pagination.existPrevPage}"> style="visibility: hidden;" </c:if>>
				<div class="prevArrow"></div>
				<div class="prevArrow" style="margin-left: -3px"></div>
			</div>
			<div class="prev" id="${response.pagination.startPage-1}"
				<c:if test="${!response.pagination.existPrevPage}"> style="visibility: hidden;" </c:if>>
				<div class="prevArrow"></div>
			</div>

			<c:choose>
				<c:when test="${searchdto.page eq null}">
					<c:forEach begin="1" end="${response.pagination.endPage}"
						varStatus="vs">
						<c:if test="${vs.index == 1}">
							<div class="pageNumber active">${vs.index}</div>
						</c:if>
						<c:if test="${vs.index != 1}">
							<div class="pageNumber">${vs.index}</div>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${response.pagination.startPage}"
						end="${response.pagination.endPage}" varStatus="vs">
						<c:if test="${vs.index == searchdto.page}">
							<div class="pageNumber active">${vs.index}</div>
						</c:if>
						<c:if test="${vs.index != searchdto.page}">
							<div class="pageNumber">${vs.index}</div>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			<div class="next" id="${response.pagination.endPage+1}"
				<c:if test="${!response.pagination.existNextPage}"> style="visibility: hidden;" </c:if>>
				<div class="nextArrow"></div>
			</div>
			<div class="pagelast" id="${response.pagination.totalPageCount}"
				<c:if test="${!response.pagination.existNextPage}"> style="visibility: hidden;" </c:if>>
				<div class="nextArrow"></div>
				<div class="nextArrow" style="margin-left: -6px"></div>
			</div>
		</c:if>
	</div>
	<!-- pagination -->
	<footer>
	<div>

		<jsp:include page="../footer.jsp" />
	</div>
	</footer>
	<script>
	    $(document).ready(function() {
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
	      geocoder.addressSearch($("#sample6_address").text(), function(result, status) {
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
	    
	  </script>


	<script src="/js/board/DeletePetplace.js"></script>
	<script src="/js/board/editComments.js"></script>
	<script src="/js/board/Comment.js"></script>

	<script>
	    // user_id 값을 JavaScript로 가져와서 변수에 할당합니다.
	    var user_id = '<%=user_id%>';
		

		// 페이지 로드 시 바로 실행되는 함수
		window.onload = function(){
			// user_id와 petplaceInfo.user_id를 비교하여 같으면 보이게, 다르면 숨기기
			if (user_id == '${petplaceInfo.user_id}') {
				document.getElementById("postActions").style.display = "block";

			} else {
				document.getElementById("postActions").style.display = "none";

			}
		};
	</script>





</body>
</html>
