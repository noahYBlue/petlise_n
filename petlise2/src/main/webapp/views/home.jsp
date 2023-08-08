<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/home.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Pet LiSe</title>
<script>
$(document).ready(function() {
	$("#header").css("background-color","transparent");
	$("#header").css("border-bottom","1px solid transparent");
	$(window).scroll(function(){
		if(window.pageYOffset<100){
			$("#header").css("background-color","transparent");
			$("#header").css("border-bottom","1px solid transparent");
		}else{
			$("#header").css("background-color","white");
			$("#header").css("border-bottom","1px solid #BDBDBD");
		}
	})
	
	//상품이동
	$(".back").click(function(){
		location.href = "/shopdetail?product_id="+$(this).attr("id");
	});
	
	
	
}); //ready
</script>

</head>
<body>
	<div id="home_layout">
		
		<jsp:include page="header.jsp" />
		
		<div id="topWrap">
			<img src="/images/dogs.svg" alt="강아지" />
			<div id="home_catchphrase">
				Eat Always<br>
				Healthy
				<img src="/images/logo-icon.png" alt="로고" />
			</div>
		</div>
		
		<div class="best title recipe">
			<img src="/images/home_fork.svg" alt="로고" />
			<span>이달의 레시피</span>
			<img src="/images/home_spoon.svg" alt="로고" />
		</div>
		<div class="minibar"></div>
		
		<div id="expert_recipeWrap" class="recipeWrap">
			<div style="border-color:transparent;">
				<img src="/images/home_expertrecipe.svg" alt="로고" />
				<span>전문가 레시피 Top3</span>
			</div>
			<div class="bestrecipes" style="background-image: url(https://storage.googleapis.com/${expertRecipes[0].image})">
				<div class="recipe_rank" style="margin-left: 10px;">1</div>
				<a href="/shop" class="recipe_cover">
					<span>${expertRecipes[0].recipe_title}</span>
					<span>${expertRecipes[0].user.name}</span>
				</a>
			</div>
			<div class="bestrecipes" style="background-image: url(https://storage.googleapis.com/${expertRecipes[1].image})">
				<a href="/shop" class="recipe_cover" >
					<span>${expertRecipes[1].recipe_title}</span>
				</a>
				<div class="recipe_rank">2</div>
			</div>
			<div class="bestrecipes" style="background-image: url(https://storage.googleapis.com/${expertRecipes[2].image})">
				<a href="/shop" class="recipe_cover">
					<span>${expertRecipes[2].recipe_title}</span>
				</a>
				<div class="recipe_rank">3</div>
			</div>
		</div>
		
		<div id="my_recipeWrap" class="recipeWrap">
			<div style="border-color:transparent;">
				<img src="/images/home_myrecipe.svg" alt="로고" />
				<span>나만의 레시피 Top3</span>
			</div>
			<div class="bestrecipes" style="background-image: url(https://storage.googleapis.com/${myRecipes[0].image})">
				<a href="/shop" class="recipe_cover">
					<span>${myRecipes[0].recipe_title}</span>
					<span>${myRecipes[0].user.name}</span>
				</a>
				<div class="recipe_rank" style="margin-left: 10px;">1</div>
			</div>
			<div class="bestrecipes" style="background-image: url(https://storage.googleapis.com/${myRecipes[2].image})">
				<a href="/shop" class="recipe_cover">
					<span>${myRecipes[2].recipe_title}</span>
				</a>
				<div class="recipe_rank">3</div>
			</div>
			<div class="bestrecipes" style="background-image: url(https://storage.googleapis.com/${myRecipes[1].image})">
				<a href="/shop" class="recipe_cover">
					<span>${myRecipes[1].recipe_title}</span>
				</a>
				<div class="recipe_rank">2</div>
			</div>
		</div>
		
		<div class="best title shop">
			<img src="/images/shop/shoplist/shop_main.svg" alt="로고" />
			<span>LiSe Shop 이달의 인기상품</span>
		</div>
		<div class="minibar"></div>
		
		<div id="shopWrap">
			<c:forEach items="${products}" var="product" varStatus="vs">
				<div class="flip">
					<div class="card">
						<div class="productWrap front">
							<div class="product_rank">${vs.index+1}</div>
							<img src="https://storage.googleapis.com/${product.image_main}">
							<div>${product.product_name}</div>
							<div class="product_detail">
								<img src="/images/shop/shoplist/coin2.svg"/>
								<span><fmt:formatNumber value="${product.price}" pattern="#,###" /></span>
								<img src="/images/shop/shopdetail/bone_fill.svg" style="margin-left: 20px;"/>
								<span><fmt:formatNumber value="${product.review_avg}" pattern="#.#" /></span>
							</div>
						</div>
						<div class="back" id="${product.product_id}">
							<div>
								<img src="/images/logo-icon-white.svg"/>
								<div>상품명 : ${product.product_name}</div>
								<div>대상동물 : ${product.pet_type}</div>
								<div>상품종류 : ${product.category}</div>
								<div>클릭시 상세페이지 이동</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
