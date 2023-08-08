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
<link rel="stylesheet" href="/css/footer.css" />
<title>Pet LiSe</title>
<script>
$(document).ready(function() {
	/* 버튼별 페이지 이동 함수 */
	$("#github").click(function(){ 
		window.open("https://github.com/MK-final-team2/pet-lise", "_blank");
	})
})
</script>
</head>
<body>
	<Footer id="footer">
		<div id="footer_container">
			<div id="footer_logo">
				<img src="/images/footer-logo.svg" alt="Logo" title="Pet LiSe Home">
			</div>
			<div id="footer_info">
				<span>ABOUT</span>
				<span>Project : Pet LiSe(펫라이스)</span>
				<span>Project Period : 2023.06.19 ~ 2023.8.9 </span>
				<span>Code by Pet LiSe, Group 2 of MultiCampus Camp 13th</span>
				<span>Copyrightⓒ 2023.Pet LiSe.All Rights Reserved</span>
			</div>
			<div id="footer_github">
				<img src="/images/footer-github.svg" alt="github" id="github" title="Pet LiSe github">
			</div>
		</div>
	</Footer>
	
	<jsp:include page="topButton.jsp" />	
</body>
</html>
