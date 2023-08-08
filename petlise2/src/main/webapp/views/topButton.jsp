<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Pet LiSe</title>
<style>
  button.scroll-top-btn {
    position: fixed;
    bottom: 30px;
    right: 50px;   
    background-image: url("/images/recipe/top_scroll.png");    
    background-size: cover;    
    width: 60px;
    height: 60px;   
    cursor: pointer; 
    transition: background-image 0.2s ease-in-out; 
  }
  button.scroll-top-btn:hover {
    background-image: url("/images/recipe/top_scroll_h.png");
  }
</style>
<script>
  function scrollTopFixed() {
    document.documentElement.style.scrollBehavior = 'smooth';
    window.scrollTo(0, 1);
  }
</script>
</head>
<body>
  <button class="scroll-top-btn" onclick="scrollTopFixed()"></button>
</body>
</html>
