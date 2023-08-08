// 페이지 이동
function movePage(page, category) {
  const url = new URL(window.location.href);
  const queryParams = new URLSearchParams(url.search);
  queryParams.set('page', page || 1);

  if (category) {
    queryParams.set('searchType1', category);
  } else {
    queryParams.delete('searchType1');
  }

  url.search = queryParams.toString();
  window.location.href = url.toString();
}

// 숫자 페이징 버튼
$(".pageNumber").on('click', function() {
  const page = $(this).text();
  const category = getSearchType();
  movePage(page, category);
});

// 첫 페이지 버튼
$(".pagefirst").on('click', function() {
  const category = getSearchType();
  movePage(1, category);
});

// 이전 페이지 버튼
$(".prev").on('click', function() {
  const page = $(this).attr("id");
  const category = getSearchType();
  movePage(page, category);
});

// 다음 페이지 버튼
$(".next").on('click', function() {
  const page = $(this).attr("id");
  const category = getSearchType();
  movePage(page, category);
});

// 마지막 페이지 버튼
$(".pagelast").on('click', function() {
  const page = $(this).attr("id");
  const category = getSearchType();
  movePage(page, category);
});

// 카테고리 값 가져오기
function getSearchType() {
  const category = document.querySelector('.petplace_category a.on');
  if (category) {
    const searchType = category.innerText;
    if (searchType === '동반산책') {
      return '산책';
    }
    else if (searchType === '동반카페') {
      return '카페';
    }
    else if (searchType === '동반식당') {
      return '식당';
    }
    else if (searchType === '동반숙소') {
      return '숙소';
    }
    return searchType;
  }
  return '';
}

// 검색창 엔터키 이벤트
$("#keyword").on("keyup", function(key) {
  if (key.keyCode == 13) {
    $("#searchbtn").click();
  }
});

// 검색 버튼
$("#searchbtn").on('click', function() {
  const queryParams = {
    page: 1,
    keyword: $("#keyword").val()
  };
  location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
});
