<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/header.css" />
<title>Pet LiSe</title>
<script>
$(document).ready(function() {
	var prevScrollTop = 0;
	$(window).scroll(function() {
		var nowScrollTop = $(window).scrollTop(); //현재 스크롤 위치를 nowScrollTop 에 저장
		if(window.pageYOffset!=0){
			// 스크롤 방향(Down) 내릴때
			if (nowScrollTop > prevScrollTop) {
				$('#header').removeClass('sticky').addClass('downactive');
			}
			// 스크롤 방향(Up) 올릴때
			else {
				$('#header').addClass('sticky').removeClass('downactive');
			}
			prevScrollTop = nowScrollTop; // prevScroll, nowScrollTop 조건 판단 후, 현재 스크롤값을 prevScrollTop 에 저장
		}
	});
	
	$(".header-list").hide();
	
	/* 헤더 버튼별 호버시 리스트다운 */
	$(".menu-main").on("mouseover", function(){
		let class_name = ".header-list."+ $(this).attr('id');
		$(".header-list").hide();
		$(class_name).slideDown();
	});
	
	$(".header-list").on("mouseleave", function(){
		$(".header-list").slideUp();
	});
	
	/* 버튼별 페이지 이동 함수 */
	$("#header_logo").click(function(){ location.href = "/"; })
	$("#header_signup").click(function(){ location.href = "/signup"; })
	$("#header_signin").click(function(){ location.href = "/signin"; })
	$("#header_gomypage").click(function(){ location.href = "/mypage"; })
	$("#header_gomycart").click(function(){ location.href = "/shopcart"; })
	$("#header_logout").click(function(){ location.href = "/logout"; })
})
</script>
</head>
<body>
	<div id="header">
	<header class="header">
		<div class="header_container">
			<!--로고-->
			<div class="header-item">
				<div id="header_logo">
					<img src="/images/nav/yellow.png" alt="Logo" title="Pet LiSe Home">
				</div>
			</div>
			<!-- 메뉴시작 -->
			<div class="header-item">
				<ul class="header-menu">
					<li class="menu-main" id="header-expert-recipe"><a href="#">전문가 레시피</a></li>
					<li class="menu-main" id="header-my-recipe"><a href="#">나만의 레시피</a></li>
					<li class="menu-main" id="header-shop"><a href="#">라이스샵</a></li>
					<li class="menu-main" id="header-community"><a href="#">커뮤니티</a></li>
					<li class="menu-main" id="header-notice"><a href="#">공지사항</a></li>
				</ul>
			</div>
			<!-- menu end here -->
			<c:choose>
				<c:when test="${user_id eq null}">
		            <div class="header-right">
		                <div class="header-item item-right">
		                    <div class="header-icon-block" id="header_signup">
								<div class="header-icon" style="background-image: url(/images/nav/sign.svg); "></div>
								<div class="header-icon-text">회원가입</div>
							</div>
		                    <div class="header-icon-block" id="header_signin">
								<div class="header-icon" style="background-image: url(/images/nav/login.svg); margin:2px 3px 0px 0px"></div>
								<div class="header-icon-text">로그인</div>
							</div>
		                </div>
		            </div>
				</c:when>
				<c:otherwise>
					<div class="header-right">
						<div class="header-item item-right">
							<div class="header-icon-block" id="header_gomypage">
								<div class="header-icon" style="background-image: url(/images/nav/mypage.svg);"></div>
								<div class="header-icon-text">마이페이지</div>
							</div>
							<div class="header-icon-block" id="header_gomycart">
								<div class="header-icon" style="background-image: url(/images/nav/cart.svg);"></div>
								<div class="header-icon-text">장바구니</div>
							</div>
							<div class="header-icon-block" id="header_logout">
								<div class="header-icon" style="background-image: url(/images/nav/logout.svg);"></div>
								<div class="header-icon-text">로그아웃</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
	
	<div class="header-list header-expert-recipe">
		<div class="header-best-recipe">
			<a href="recipelistbest?recipeType=전문가레시피">이달의 레시피</a>
		</div>
		<div class="header-grid-dog">
			<div class="header-grid-title">강아지</div>
			
			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=건강식&searchType3=전체">건강식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=건강식&searchType3=다이어트식">다이어트식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=건강식&searchType3=병원식">병원식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=건강식&searchType3=영양식">영양식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=일반식&searchType3=전체">일반식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=일반식&searchType3=습식">습식</a></div>
			<div style="grid-row:4/6;"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=일반식&searchType3=건식">건식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=간식&searchType3=전체">간식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=간식&searchType3=건조간식">건조간식</a></div>
			<div style="grid-row:4/6;"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=간식&searchType3=화식간식">화식간식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=기타">기타</a></div>
		</div>
		<div class="header-grid-cat">
			<div class="header-grid-title">고양이</div>
			
			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=건강식&searchType3=전체">건강식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=건강식&searchType3=다이어트식">다이어트식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=건강식&searchType3=병원식">병원식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=건강식&searchType3=영양식">영양식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=일반식&searchType3=전체">일반식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=일반식&searchType3=습식">습식</a></div>
			<div style="grid-row:4/6;"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=일반식&searchType3=건식">건식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=간식&searchType3=전체">간식</a></div>
			<div><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=간식&searchType3=건조간식">건조간식</a></div>
			<div style="grid-row:4/6;"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=간식&searchType3=화식간식">화식간식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=기타">기타</a></div>
		</div>
	</div>
	
	<div class="header-list header-my-recipe">
		<div class="header-best-recipe">
			<a href="recipelistbest?recipeType=나만의레시피">이달의 레시피</a>
		</div>
		<div class="header-grid-dog">
			<div class="header-grid-title">강아지</div>
			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=전체">건강식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=다이어트식">다이어트식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=병원식">병원식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=영양식">영양식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=일반식&searchType3=전체">일반식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=일반식&searchType3=습식">습식</a></div>
			<div style="grid-row:4/6;"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=일반식&searchType3=건식">건식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=간식&searchType3=전체">간식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=간식&searchType3=건조간식">건조간식</a></div>
			<div style="grid-row:4/6;"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=간식&searchType3=화식간식">화식간식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=기타">기타</a></div>
		</div>
		<div class="header-grid-cat">
			<div class="header-grid-title">고양이</div>
			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=건강식&searchType3=전체">건강식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=건강식&searchType3=다이어트식">다이어트식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=건강식&searchType3=병원식">병원식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=건강식&searchType3=영양식">영양식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=일반식&searchType3=전체">일반식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=일반식&searchType3=습식">습식</a></div>
			<div style="grid-row:4/6;"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=일반식&searchType3=건식">건식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=간식&searchType3=전체">간식</a></div>
			<div><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=간식&searchType3=건조간식">건조간식</a></div>
			<div style="grid-row:4/6;"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=간식&searchType3=화식간식">화식간식</a></div>

			<div class="header-grid-subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=기타">기타</a></div>
		</div>
	</div>
	
	<div class="header-list header-shop">
		<div class="header-shop-all" style="margin-left:150px">
			<a href="/shop">라이스샵 전체</a>
		</div>
		<div class="header-shop-grid-dog">
			<div class="header-grid-title"><a href="/shop?searchType1=강아지">강아지</a></div>
			<div><a href="/shop?searchType1=강아지&searchType2=사료">사료</a></div>
			<div><a href="/shop?searchType1=강아지&searchType2=간식">간식</a></div>
			<div><a href="/shop?searchType1=강아지&searchType2=영양제">영양제</a></div>
			<div><a href="/shop?searchType1=강아지&searchType2=장난감">장난감</a></div>
		</div>
		<div class="header-shop-grid-cat">
			<div class="header-grid-title"><a href="/shop?searchType1=고양이">고양이</a></div>
			<div><a href="/shop?searchType1=고양이&searchType2=사료">사료</a></div>
			<div><a href="/shop?searchType1=고양이&searchType2=간식">간식</a></div>
			<div><a href="/shop?searchType1=고양이&searchType2=영양제">영양제</a></div>
			<div><a href="/shop?searchType1=고양이&searchType2=장난감">장난감</a></div>
		</div>
	</div>
	
	<div class="header-list header-community" >
		<div class="header-list-box" 
		<c:choose>
			<c:when test="${user_id eq null}">style="margin-right: 70px;"</c:when>
			<c:otherwise>style="margin-right: 120px;"</c:otherwise>
		</c:choose> >
			<div class="header-list-title">
				<a href="/boardMain">자유게시판</a>
			</div>
			<div class="header-list-title">
				<a href="/petplaceMain">펫플레이스</a>
			</div>
		</div>
	</div>
	
	<div class="header-list header-notice" >
		<div class="header-list-box" 
		<c:choose>
			<c:when test="${user_id eq null}">style="margin-right: -20px;"</c:when>
			<c:otherwise>style="margin-right: 50px;"</c:otherwise>
		</c:choose> >
			<div class="header-list-title">
				<a href="/noticeMain">공지사항</a>
			</div>
			<div class="header-list-title">
				<a href="">이벤트</a>
			</div>
			<div class="header-list-title">
				<a href="/qna">문의사항</a>
			</div>
			<div class="header-list-title">
				<a href="/findfamily">가족찾기</a>
			</div>
		</div>
	</div>
	</div>
	
	
</body>
</html>
