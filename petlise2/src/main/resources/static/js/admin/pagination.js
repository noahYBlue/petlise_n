const contents = document.querySelector('.contents'); //글 목록을 담기 위한 부모 리스트 요소
const buttons = document.querySelector('.buttons'); //페이지 버튼을 담기 위한 부모 리스트 요소

const numOfContent = 178; //전체 글의 개수
const showContent = 10; //한 페이지에 보여줄 글의 최대 개수
const showButton = 5; //한 화면에 보여줄 페이지 버튼의 최대 개수
const maxPage = Math.ceil(numOfContent / showContent); //글을 모두 보여주기 위해 필요한 페이지의 개수
let page = 1; //현재 페이지 (시작 페이지 = 1)

document.getElementById('pagination').innerHTML += `
<div class="prev">
  <div class="prevArrow"></div>
</div>
  <div class="pageNumber active">1</div>
  <div class="pageNumber">2</div>
  <div class="pageNumber">3</div>
  <div class="pageNumber">4</div>
  <div class="pageNumber">5</div>
  <div class="pageNumber">6</div>
  <div class="pageNumber">7</div>
  <div class="pageNumber">8</div>
  <div class="pageNumber">9</div>
  <div class="pageNumber">10</div>
<div class="next">
  <div class="nextArrow"></div>
</div>
  `;
