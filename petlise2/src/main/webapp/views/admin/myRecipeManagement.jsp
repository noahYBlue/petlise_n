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
    <link rel="stylesheet" href="/css/admin/aside.css" />
    <link rel="stylesheet" href="/css/admin/pagination.css" />
    <link rel="stylesheet" href="/css/admin/tabMenu.css" />
    <link rel="stylesheet" href="/css/admin/recipeManagement.css" />
    <link rel="stylesheet" href="/css/admin/modal.css" />
    <title>Pet LiSe</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    let recipe_category = "나만의레시피";
    let pet_category = "${pet_category}";
    </script>
    <script src="/js/admin/recipeManagement.js"></script>
  </head>
  <body>
    <div class="container">
      <div id="asideMenu"></div>

      <main>
        <p>나만의 레시피 관리 - ${pet_category}</p>

        <div class="tabMenu">
        <div class="tabWrap">
          <ul class="list">
            <li class="isOn"><a href="#tab1" class="btn">전체</a></li>
            <li><a href="#tab2" class="btn">이달의 레시피</a></li>
            <li><a href="#tab3" class="btn">일반식</a></li>
            <li><a href="#tab4" class="btn">건강식</a></li>
            <li><a href="#tab5" class="btn">간식</a></li>
            <li><a href="#tab6" class="btn">기타</a></li>
          </ul>
          	<div class="inputWrap">
            <object data="/images/search.svg"></object>
            <input type="text" id="searchInput" />
            </div>
          </div>

          <div class="tableWrap">
            <table id="tab1" class="table" style="display: block"></table>
          </div>
          
          <div id="pagination"></div>
        </div>
        <div id="modal"></div>
      </main>
    </div>

    <script src="/js/admin/aside.js"></script>
    <script src="/js/pagination.js"></script>
    <script src="/js/admin/recipeTabMenu.js"></script>
    <script src="/js/admin/recipeTable.js"></script>
    <script src="/js/admin/getDate.js"></script>
    <script src="/js/admin/search.js"></script>
    <script src="/js/admin/recipeOfTheMonth.js"></script>
    <script src="/js/admin/deleteRecipe.js"></script>
  </body>
</html>
