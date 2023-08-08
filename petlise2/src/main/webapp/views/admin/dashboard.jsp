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
    <link rel="stylesheet" href="/css/admin/dashboard.css" />
    <link rel="stylesheet" href="/css/admin/aside.css" />
    <title>Pet LiSe</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <div class="container">
      <aside id="asideMenu"></aside>
      <main>
        <p>대시보드</p>
        <div class="dataWrapper">
          <p class="totalTitle">일일 유저 데이터 통계</p>
          <div class="totalWrapper">
            <div>
              <p>오늘 등록된 나만의 레시피 수</p>
              <p>${todayRecipeCount}<span>개</span></p>
            </div>
            <div>
              <p>오늘 제품 주문 수</p>
              <p>${todayOrderCount}<span>개</span></p>
            </div>
            <div>
              <p>오늘 등록된 커뮤니티 수</p>
              <p>${todayBoardCount+todayPetplaceCount}<span>개</span></p>
            </div>
          </div>

          <div class="chartWrapper">
            <p>최근 7일간의 신규 가입자 수</p>
            <div class="chart">
              <canvas id="myChart"></canvas>
            </div>
          </div>
        </div>
      </main>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
    <script src="/js/admin/getDate.js"></script>
    <script src="/js/admin/dashboard.js"></script>
    <script src="/js/admin/aside.js"></script>
  </body>
</html>
