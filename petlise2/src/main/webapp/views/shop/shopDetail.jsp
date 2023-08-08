<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="css/shop/shopDetail.css" />
<link rel="stylesheet" href="css/shop/pagination_shop.css" />
<link rel="stylesheet" href="css/shop/modal_main.css" />
<link rel="stylesheet" href="/css/style.css" />

<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<title>Pet LiSe</title>
<script src="/js/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function(){
    	if("${searchdto.searchType2}"=="review"){
    		$('html').animate({scrollTop : $('#review_statistic').offset().top}, 0);
    	}
    	
    	//숫자 페이징버튼 
    	$(".pageNumber").on('click', function() {
    		const queryparamsPage = {
    			product_id : "${product.product_id}",
    			page: $(this).text(),
    			searchType2: "review",
    			searchType3: $('#isphoto').is(':checked')?'photo':'',
 				sortType:$("#filter_active").text()
    		}
    		location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
    	});

    	//첫페이지버튼 
    	$(".pagefirst").on('click', function() {
    		const queryparamsPage = {
    			product_id : "${product.product_id}",
    	    	page: 1,
    	    	searchType2: "review",
    	    	searchType3: $('#isphoto').is(':checked')?'photo':'',
    	    	sortType:$("#filter_active").text()
    		}
    		location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
    	});

    	//이전페이지버튼
    	$(".prev").on('click', function() {
    		const queryparamsPage = {
   				product_id : "${product.product_id}",
       	    	page: $(this).attr("id"),
       	    	searchType2: "review",
       	    	searchType3: $('#isphoto').is(':checked')?'photo':'',
 	    		sortType:$("#filter_active").text()
    		}
    		location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
    	});

    	//다음페이지버튼
    	$(".next").on('click', function() {
    		const queryparamsPage = {
   				product_id : "${product.product_id}",
				page: $(this).attr("id"),
				searchType2: "review",
				searchType3: $('#isphoto').is(':checked')?'photo':'',
				sortType:$("#filter_active").text()
    		}
    		location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
    	});

    	//마지막페이지버튼
    	$(".pagelast").on('click', function() {
    		const queryparamsPage = {
   				product_id : "${product.product_id}",
   				page: $(this).attr("id"),
   				searchType2: "review",
				searchType3: $('#isphoto').is(':checked')?'photo':'',
				sortType:$("#filter_active").text()
    		}
    		location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
    	});
    	
    	//포토후기 모아보기 체크박스
    	$("#product_review").on('click',"#isphoto", function() {
    		const queryparamsPage = {
   				product_id : "${product.product_id}",
    			page: 1,
    			searchType2: "review",
    			searchType3: $('#isphoto').is(':checked')?'photo':'',
				sortType:$("#filter_active").text()
    		}
    		location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
    	});
    	
    	//정렬버튼
    	$("#product_review").on('click',".filter", function() {
    		const queryparamsPage = {
   				product_id : "${product.product_id}",
    			page: 1,
    			searchType2: "review",
    			searchType3: $('#isphoto').is(':checked')?'photo':'',
    			sortType:$(this).text()
    		}
    		location.href = location.pathname + '?' + new URLSearchParams(queryparamsPage).toString();
    	});
    	
    	//후기 좋아요 버튼 클릭
    	$("#review_show").on('click','.review_likebtn',function(){
    		if("${user_id}"==""){
   				$("#login_modal").css("top", $(window).scrollTop()+"px");
				$("#login_modal").css('display', 'block');
				
				$('#login_modal').on('scroll touchmove mousewheel', function(event) {
					event.preventDefault();
					event.stopPropagation();
					return false;
				});
   			}//if
   			else{
	    		$(this).removeClass();
				$(this).addClass('review_likebtn_active');
				$(this).children(".likecnt").text(Number($(this).children(".likecnt").text())+1);
				
	    		$.ajax({
	    			type : 'post',
	    			url : '/likeup',
	    			dataType : 'json',
	    			data : {
	    				user_id : "${sessionScope.user_id}",
	    				review_id : $(this).siblings("input[type='hidden']").val()
	    			},
	    			success : function(result) { // 결과 성공 콜백함수
	    				
	    			},
	    		    error : function(request, status, error) { // 결과 에러 콜백함수
	    		        console.log(error)
	    		    }
	    		});//ajax end    		
   			}
    	});
    	
    	//후기 좋아요 취소
    	$("#review_show").on('click','.review_likebtn_active',function(){
    		if("${user_id}"==""){
   				$("#login_modal").css("top", $(window).scrollTop()+"px");
				$("#login_modal").css('display', 'block');
				
				$('#login_modal').on('scroll touchmove mousewheel', function(event) {
					event.preventDefault();
					event.stopPropagation();
					return false;
				});
   			}//if
   			else{
	    		$(this).removeClass();
				$(this).addClass('review_likebtn');
				$(this).children(".likecnt").text(Number($(this).children(".likecnt").text())-1);
	    		
	    		$.ajax({
	    			type : 'post',
	    			url : '/likedown',
	    			dataType : 'json',
	    			data : {
	    				user_id : "${sessionScope.user_id}",
	    				review_id : $(this).siblings("input[type='hidden']").val()
	    			},
	    			success : function(result) { // 결과 성공 콜백함수
	    			},
	    		    error : function(request, status, error) { // 결과 에러 콜백함수
	    		        console.log(error)
	    		    }
	    		});//ajax end
   			}
    	});
    	
   		// ----- 장바구니버튼 -----
   		$("#cartbtn").on('click',function(e){
   			if("${user_id}"==""){
   				$("#login_modal").css("top", $(window).scrollTop()+"px");
				$("#login_modal").css('display', 'block');
				
				$('#login_modal').on('scroll touchmove mousewheel', function(event) {
					event.preventDefault();
					event.stopPropagation();
					return false;
				});
   			}//if
   			else{
	   			$.ajax({
	   				type : 'post',
	   				url : '/isincart',
	   				dataType : 'json',
	   				data : {
	   					user_id : "${user_id}",
	   					product_id : "${product.product_id}"
	   				},
	   				success : function(result) { // 결과 성공 콜백함수
	   					//장바구니 신규등록
	   					if(result.result == 'no'){
	   						$.ajax({
	   							type : 'post',
	   							url : '/insertcart',
	   							dataType : 'json',
	   							data : {
	   								user_id : "${user_id}",
	   								product_id : "${product.product_id}",
	   								quantity : $("#number").text()
	   							},
	   							success : function(result) { // 결과 성공 콜백함수
	   								$("#okay_modal .modal_text>div").html("상품이 장바구니에 등록되었습니다.<br>장바구니로 이동하시겠습니까?");
	   								$("#okay_modal").css("top", $(window).scrollTop()+"px");
	   								$("#okay_modal").css('display', 'block');
	   								
	   								$('#okay_modal').on('scroll touchmove mousewheel', function(event) {
	   									event.preventDefault();
	   									event.stopPropagation();
	   									return false;
	   								});
	   								
	   					    	},
	   						    error : function(request, status, error) { // 결과 에러 콜백함수
	   						        console.log(error)
	   						    }
	   						});//ajax end
	   					}
	   					//장바구니 기존 존재
	   					else {
	   						$("#okay_modal .modal_text>div").html("장바구니에 이미 등록된 상품입니다.<br>장바구니로 이동하시겠습니까?");
	   						$("#okay_modal").css("top", $(window).scrollTop()+"px");
	   						$("#okay_modal").css('display', 'block');
	   						
	   						$('#okay_modal').on('scroll touchmove mousewheel', function(event) {
	   							event.preventDefault();
	   							event.stopPropagation();
	   							return false;
	   						});
	   					}
	   					
	   		    	},
	   			    error : function(request, status, error) { // 결과 에러 콜백함수
	   			        console.log(error)
	   			    }
	   			});//ajax end
   			}//else
   		});//cart end
    	
   		
	   	// ----- 바로 구매하기 버튼 -----
	   	$("#buybtn").on('click',function(){
	   		if("${user_id}"==""){
   				$("#login_modal").css("top", $(window).scrollTop()+"px");
				$("#login_modal").css('display', 'block');
				
				$('#login_modal').on('scroll touchmove mousewheel', function(event) {
					event.preventDefault();
					event.stopPropagation();
					return false;
				});
   			}//if
   			else{
   				//주문상품 신규등록
				$.ajax({
					type : 'post',
					url : '/insertorderproduct',
					dataType : 'json',
					data : {
						user_id : "${user_id}",
						product_id : "${product.product_id}",
						quantity : $("#number").text()
					},
					success : function(result) { // 결과 성공 콜백함수
						$("#go_order_modal").css("top", $(window).scrollTop()+"px");
						$("#go_order_modal").css('display', 'block');
						
						$('#go_order_modal').on('scroll touchmove mousewheel', function(event) {
							event.preventDefault();
							event.stopPropagation();
							return false;
						});
						
			    	},
				    error : function(request, status, error) { // 결과 에러 콜백함수
				        console.log(error)
				    }
				});//ajax end
   			}//else
	   	});
   		
	   	// ----- 구매목록가기 버튼 -----
	   	$("#gomyorder").on('click',function(){
	   		if("${user_id}"==""){
   				$("#login_modal").css("top", $(window).scrollTop()+"px");
				$("#login_modal").css('display', 'block');
				
				$('#login_modal').on('scroll touchmove mousewheel', function(event) {
					event.preventDefault();
					event.stopPropagation();
					return false;
				});
   			}//if
   			else{
   				location.href = "/mypage/review";
   			}//else
	   	});
    });
    </script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div id='layout'>
		<div id="categorys">
			<p style="margin-left: 7px;">라이스샵 > ${product.pet_type} > ${product.category}</p>
		</div>
		<!-- categorys -->

		<div id="detail_img_info">
			<div id="img" style="background-image: url(https://storage.googleapis.com/${product.image_main});">
				<c:if test="${!product.isvisible}">
					<div class="product_img_cover_soldout">
						<div>
							SOLD<br>OUT
						</div>
					</div>
				</c:if>
			</div>
			<div id="info">
				<p>${product.product_name}</p>
				<table>
					<tbody>
						<tr>
							<td>가격</td>
							<td><img src="/images/shop/shopdetail/coin2.svg" alt="coin" />
							<fmt:formatNumber value="${product.price}" pattern="#,###" /></td>
						</tr>
						<tr>
							<td>배송비</td>
							<td><img src="/images/shop/shopdetail/coin2.svg" alt="coin" />3,000
								/ 포인트 선결제</td>
						</tr>
						<tr>
							<td>상품코드</td>
							<td>${product.product_code}</td>
						</tr>
						<tr>
							<td>남은 수량</td>
							<td>${product.quatity}개</td>
						</tr>
						<tr>
							<td>주문 수량</td>
							<td id="select_number">
								<input type="hidden" value="${product.quatity}">
								<button id="num_minus" class="oper">
									<span class="material-symbols-outlined">remove</span>
								</button>
								<div id="number">1</div>
								<button id="num_plus" class="oper">
									<span class="material-symbols-outlined">add</span>
								</button> <span></span>
							</td>
						</tr>
					</tbody>
				</table>
				<div id="info_btns">
					<c:if test="${product.isvisible}">
						<button id="cartbtn">장바구니담기</button>
						<button id="buybtn">바로 구매하기</button>
					</c:if>
					<c:if test="${!product.isvisible}">
						<button id="soldoutbtn">품절</button>
					</c:if>

				</div>
			</div>
		</div>
		<!-- detail_img_info -->

		<div class="detail_tab">
			<div id="tab1_1" class="tab_active">
				<img src="/images/shop/shopdetail/pawprint_black.svg">상품상세정보
			</div>
			<div id="tab1_2">상품후기</div>
			<div id="tab1_3">상품안내</div>
		</div>

		<div id="product_detail">
			<img src="https://storage.googleapis.com/${product.image_detail}">
		</div>

		<div class="detail_tab">
			<div id="tab2_1">상품상세정보</div>
			<div id="tab2_2" class="tab_active">
				<img src="/images/shop/shopdetail/pawprint_black.svg">상품안내
			</div>
			<div id="tab2_3">상품후기</div>
		</div>

		<div id="product_infomation">
			<h4>배송안내</h4>
			<p>
				▪ 배송방법 : 순차배송<br> ▪ 배송비 : 3,000 point / 포인트 선결제<br> <span
					class="tab">&#9;</span>- 배송비 포함하여 전액 포인트 결제를 진행해 주셔야 합니다.<br>
				▪ 배송기간 : 결제 완료 후 2~3일 이내 도착<br> <span class="tab">&#9;</span>-
				도서 산간 지역은 하루가 더 소요될 수 있습니다.<br>
			</p>
			<h4>주의사항</h4>
			<p>
				라이스샵은 수익을 창출하지 않는 회원 전용 포인트샵으로 운영되며 라이스샵 내 모든 상품은 교환 및 반품이 불가합니다.<br>
				구매 시 신중한 선택을 부탁드리며, 기타 문의사항은 문의게시판을 이용해주시기 바랍니다.
			</p>
		</div>

		<div class="detail_tab">
			<div id="tab3_1">상품상세정보</div>
			<div id="tab3_2">상품안내</div>
			<div id="tab3_3" class="tab_active">
				<img src="/images/shop/shopdetail/pawprint_black.svg">상품후기
			</div>
		</div>

		<div id="product_review">
			<div id="review_title">
				<div>
					<h4>상품후기</h4>
					<p>
						이 상품을 구매한 회원님들의 후기입니다.<br> 구매한 제품에 대한 후기는 마이페이지 구매목록에서 남기실 수
						있습니다.
					</p>
				</div>
				<button id="gomyorder">구매상품후기 바로가기</button>
			</div>

			<div id="review_statistic">
				<div id="score">
					<span>구매고객 만족도</span> <span><fmt:formatNumber
							value="${totalAvg}" pattern="#.#" />점</span>
					<div>
						<img src="/images/shop/shopdetail/borns5_line.svg" /> <span
							id="fillscore" style="width: ${totalAvg/5*100}%;"> <img
							src="/images/shop/shopdetail/borns5_fill.svg" />
						</span>
					</div>
				</div>
				<div id="count">
					<span>작성 후기 건수</span> <span>${totalCnt}건</span>
				</div>

				<div id="score_count">
					<div id="score_box">
						<c:forEach begin="0" end="4" varStatus="vs">
							<div class="scores">
								<div class="score_score">${5-vs.index}점</div>
								<div class="graph_back">
									<div class="graph_color"
										style="width:${totalCnt==0?0:scores[5-vs.index-1]/totalCnt*100}%;"></div>
								</div>
								<div class="score_cnt">${scores[5-vs.index-1]}건(<fmt:formatNumber
										value="${totalCnt==0?0:scores[5-vs.index-1]/totalCnt*100}" pattern="#" />%)
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- review_statistic end -->
			
			<div id="review_filter">
				<div>
					<span style="border-right:1px solid var(--light-sub, #FBC252);">전체후기 ${totalCnt}건</span>
					<span>사진후기 ${totalPhotoCnt}건</span>
					<div>
						<input type="checkbox" id="isphoto"
							<c:if test="${searchdto.searchType3 eq 'photo'}"> checked </c:if> /> 
						<label for="isphoto"><span></span>사진후기모아보기
						<span class="material-symbols-outlined">photo_camera</span>
						</label>
					</div>
				</div>
				<div>
					<span class="material-symbols-outlined">filter_alt</span>
					
					<span class="filter" <c:if test="${searchdto.sortType eq '최신순' || searchdto.sortType eq null || searchdto.sortType eq ''}">id="filter_active"</c:if>>최신순</span>
					<span class="filter" <c:if test="${searchdto.sortType eq '평점높은순'}">id="filter_active"</c:if>>평점높은순</span>
					<span class="filter" <c:if test="${searchdto.sortType eq '평점낮은순'}">id="filter_active"</c:if>>평점낮은순</span>
					<span class="filter" <c:if test="${searchdto.sortType eq '후기추천순'}">id="filter_active"</c:if>>후기추천순</span>
				</div>
			</div>
			
			<div id="review_show">
			<c:if test="${fn:length(response.list) == 0}">
				<div id="noreview">
				작성된 상품후기가 없습니다.<br>
				첫 상품후기를 등록해 보세요!
				</div>
			</c:if>
			
			
			<c:forEach items="${response.list}" var="review">
				<div class="review_container">
					<div class="review_info"
						<c:if test="${review.review_img == '' || review.review_img eq null}">style="width:1130px"</c:if>>
						<div class="user_info">
							<div class="box" style="background: #BDBDBD;">
								<img class="profile" src="https://storage.googleapis.com/${review.user.profile_image}">
							</div>
							<span>${review.user.name}</span>
							<span>${review.created_at}</span>
						</div>
						<!--유저정보영역-->
						<div class="review_contents">
							<div class="score">
								<c:forEach begin="1" end="${review.score}">
									<img class="score_fill"
										src="/images/shop/shopdetail/bone_fill.svg">
								</c:forEach>
								<c:forEach begin="${review.score+1}" end="5">
									<img class="score_fill"
										src="/images/shop/shopdetail/bone_line.svg">
								</c:forEach>
								<span>${review.score}점</span>
							</div>
							<div class="contents">
								<p>${review.contents}</p>
							</div>
							<!--후기내용-->
						</div>
						<!--후기영역-->
					</div>
					<!--정보/후기영역-->

					<c:if
						test="${review.review_img != '' && review.review_img != null}">
						<div class="review_img_box">
							<img class="review_img" src="https://storage.googleapis.com/${review.review_img}">
						</div>
					</c:if>

					<div class="review_btns">
						<input type="hidden" value="${review.review_id}"/>
						<c:if test="${review.islike}">
							<button class="review_likebtn_active">
								<span class="material-symbols-outlined">thumb_up</span>
								<br>
								<span class="likecnt">${review.likes}</span>
							</button>
						</c:if>
						<c:if test="${!review.islike}">
							<button class="review_likebtn">
								<span class="material-symbols-outlined">thumb_up</span>
								<br>
								<span class="likecnt">${review.likes}</span>
							</button>
						</c:if>
						<c:if test="${review.user_id == sessionScope.user_id}">
							<button class="review_deletebtn">
								<span class="material-symbols-outlined">delete</span>
							</button>
						</c:if>
					</div>
				</div>
				<!--리뷰1개-->
			</c:forEach>
			</div>
		</div><!-- products review -->
		
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
	</div>
	<!-- Layout -->
	
	<jsp:include page="../footer.jsp" />
	
	<div class="modal" id="delete_confirm_modal">
		<div class="modal_contents">
			<div class="modal_text">
			<img src="images/mypage/warning.svg">
			후기 삭제 시 후기 복구 및 <br>
			해당 상품 후기 재작성이 불가합니다.<br>
			정말 후기를 삭제하시겠습니까?
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button class="modal_deletebtn">삭제</button>
				<input type="hidden" id="delete_review_id" value=""/>
			</div>
		</div>
	</div>

	<div class="modal" id="delete_okay_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<img src="/images/logo-icon.png" style="margin-bottom:10px; width:25px;"/>
				<div>
					후기가 삭제되었습니다.<br>
					후기 첫 페이지로 이동합니다.
				</div>
			</div>
			<div class="modal_btn">
				<button class="modal_okaybtn">확인</button>
				<input type="hidden" value="${product.product_id}"/>
			</div>
		</div>
	</div>
	
	<div class="modal" id="cartconfrim_modal">
		<div class="modal_contents">
			<div class="modal_text">
			<div>
			<img src="/images/shop/shoplist/cart_yellow.svg" alt="cart" style="margin-bottom:10px;"/><br>
			장바구니에 상품을 등록하시겠습니까?</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button class="modal_editbtn">확인</button>
			</div>
		</div>
	</div>
	
	<div class="modal" id="okay_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<img src="/images/shop/shoplist/cart_yellow.svg" alt="cart" style="margin-bottom:10px;"/>
				<div>
				</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">계속쇼핑하기</button>
				<button class="modal_gocartbtn">장바구니가기</button>
			</div>
		</div>
	</div>

	<div class="modal" id="go_order_modal">
		<div class="modal_contents">
			<div class="modal_text">
				<img src="/images/shop/shoplist/cart_yellow.svg" alt="cart" style="margin-bottom:10px;"/>
				<div>
				주문페이지로 이동합니다.</div>
			</div>
			<div class="modal_btn">
				<button class="modal_goorderbtn">확인</button>
			</div>
		</div>
	</div>
	
	<div class="modal" id="login_modal">
		<div class="modal_contents">
			<div class="modal_text">
			<div>
			<img src="/images/logo-icon.png" style="margin-bottom:10px; width:25px;"/><br>
			로그인이 필요한 항목입니다.<br>
			로그인 페이지로 이동하시겠습니까?
			</div>
			</div>
			<div class="modal_btn">
				<button class="modal_cancelbtn">취소</button>
				<button onclick="location.href='/signin'" class="modal_loginbtn">이동</button>
			</div>
		</div>
	</div>
	
	<script src="/js/shop/shopDetail.js"></script>
</body>
</html>