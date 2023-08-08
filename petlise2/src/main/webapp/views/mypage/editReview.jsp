<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Pet LiSe 후기작성</title>
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/mypage/editReview.css" />
<link rel="stylesheet" href="css/shop/modal_main.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="/js/jquery-3.6.4.min.js"></script>
</head>
<body>
	<div id="review_box">
		<div><img class="closebtn" src="/images/mypage/close.svg"></div>
		<div><img src="/images/logo-icon.png"><span>상품후기작성</span></div>
		<div><span>주문상품명</span><span>${product_name}</span></div>
		<div>
			<span>상품의 만족도를 표시해 주세요</span>
			<div>
				<div id="score_box">
					<img id="linescore" src="/images/shop/shopdetail/borns5_line.svg" />
					<c:choose>
						<c:when test="${reviewdto eq null}">
							<span id="fillscore" style="width: 0%;"> 
								<img src="/images/shop/shopdetail/borns5_fill.svg" />
							</span>
							<input type="range"	step="1" min="1" max="5" value="0">
						</c:when>
						<c:otherwise>
							<span id="fillscore"> 
								<img src="/images/shop/shopdetail/borns5_fill.svg" />
							</span>
							<input type="range"	step="1" min="1" max="5" value="${reviewdto.score}">
						</c:otherwise>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${reviewdto eq null}">
						<span id='score'>0점</span>
					</c:when>
					<c:otherwise>
						<span id='score'>${reviewdto.score}점</span>
					</c:otherwise>
				</c:choose>
			</div>
			<span>클릭 및 드래그를 통해 점수 조정이 가능합니다.</span>
		</div>
		<div>
			<span>상품후기를 작성해 주세요</span>
			<span>일반후기는 100p, 사진후기는 150p가 적립됩니다.</span>
				<c:choose>
					<c:when test="${reviewdto eq null}">
						<div id="reviewcontents">
							<textarea placeholder="상품과 관련 없는 내용(사진/동영상 포함), 동일 문자의 반복 등을 포함한 의미없는 후기,&#10;욕설/비방 등의 악의적인 내용을 포함한 후기, 부정거래에 기반하여 작성된 후기는 &#10;통보없이 삭제 및 적립혜택이 회수될 수 있습니다."></textarea>
							<div>
								<input id="review_img" type="file" style="display:none;">
								<label for="review_img">
								<span class="material-symbols-outlined">photo_camera</span>
								<span>사진첨부하기</span>
								</label>
								<input type="hidden" id="imageValue" value="">
								<span><span id="textlength">0</span>/500</span>
							</div>
						</div>
						<div id="previewbox">
							<div id="imgbox">
							<img id="previewimg"/>
								<div id="imgcover">
									<div>클릭하여<br>삭제</div>
								</div>							
							</div>
							<span>
							첨부된 사진을 확인해 주세요.<br><br>
							상품과 무관한 사진/동영상을 첨부한 리뷰는<br>
							통보없이 삭제 및 적립 혜택이 회수될 수 있습니다.</span>
						</div>
					</c:when>
					<c:otherwise>
						<div id="reviewcontents_review">
							<textarea>${reviewdto.contents}</textarea>
							<div>
								<input id="review_img" type="file" style="display:none;">
								<label for="review_img">
								<span class="material-symbols-outlined">photo_camera</span>
								<span>사진수정하기</span>
								</label>
								<input type="hidden" id="imageValue" value="${reviewdto.review_img==''?'':reviewdto.review_img}">
								<span><span id="textlength">${fn:length(reviewdto.contents)}</span>/500</span>
							</div>
						</div>
						
						<c:choose>
							<c:when test="${reviewdto.review_img == '' || reviewdto.review_img eq null}">
								<div id="previewbox_review" style="display:none;">
									<img id="previewimg_review" src="" />
									<span>
									첨부된 사진을 확인해 주세요.<br><br>
									상품과 무관한 사진/동영상을 첨부한 리뷰는<br>
									통보없이 삭제 및 적립 혜택이 회수될 수 있습니다.</span>
								</div>
							</c:when>
							<c:otherwise>
								<div id="previewbox_review">
									<div id="imgbox">
									<img id="previewimg_review" src="https://storage.googleapis.com/${reviewdto.review_img}" />
										<div id="imgcover">
											<div>클릭하여<br>삭제</div>
										</div>							
									</div>
									<span>
									첨부된 사진을 확인해 주세요.<br><br>
									상품과 무관한 사진/동영상을 첨부한 리뷰는<br>
									통보없이 삭제 및 적립 혜택이 회수될 수 있습니다.</span>
								</div>
							</c:otherwise>
						</c:choose>
						
					</c:otherwise>
				</c:choose>
		</div>
		<div>
			상품과 관련 없는 내용(사진/동영상 포함), 동일 문자의 반복 등을 포함한 의미없는 후기,<br>
			욕설/비방 등의 악의적인 내용을 포함한 후기, 부정거래에 기반하여 작성된 후기는 <br>
			통보없이 삭제 및 적립혜택이 회수될 수 있습니다.
		</div>
		<div>
			<button class="closebtn">취소</button>
			<c:choose>
				<c:when test="${reviewdto eq null}">
					<button id="savebtn">등록</button>
				</c:when>
				<c:otherwise>
					<button id="updatebtn">수정</button>
					<input type="hidden" id="review_id" value="${reviewdto.review_id}">
				</c:otherwise>
			</c:choose>
		</div>
		
		<input type="hidden" id="user_id" value="${user_id}">
		<input type="hidden" id="product_id" value="${param.pi}">
		<input type="hidden" id="order_detail_id" value="${param.di}">
	</div>
	
	<div class="modal" id="alert_modal">
		<div class="modal_contents">
			<div class="modal_text">
			</div>
			<div class="modal_btn">
				<button class="modal_okaybtn">확인</button>
			</div>
		</div>
	</div>

	<div class="modal" id="insert_modal">
		<div class="modal_contents">
			<div class="modal_text">
			<c:choose>
				<c:when test="${reviewdto eq null}">
					<img src='/images/mypage/coin2.svg' style='margin-bottom:10px; width:50px;'/>
				</c:when>
				<c:otherwise>
					<img src='/images/logo-icon.png' style='margin-bottom:10px; width:25px;'/>
				</c:otherwise>
			</c:choose>
			</div>
			<div class="modal_btn">
				<button class="modal_okaybtn">확인</button>
			</div>
		</div>
	</div>
	
	<script src="js/mypage/editReview.js"></script>
</body>
</html>
