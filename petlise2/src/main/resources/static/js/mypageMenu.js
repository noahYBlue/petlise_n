document.getElementById('mypageMenu').innerHTML += `
  <div class="menu_List">
    <div class="menu_MemberInfo">
      <div>
        <span class="material-symbols-outlined">person</span> 회원정보
      </div>
      <ul>
        <li><a href="/mypage">회원정보</a></li>
        <li><a href="/mypage/edit">회원정보수정</a></li>
      </ul>
    </div>
    <div class="menu_Community">
      <div>
        <span class="material-symbols-outlined">pets</span> Pet LiSe
      </div>
      <ul>
        <li><a href="/mypage/mylikerecipe">좋아요 레시피</a></li>
        <li><a href="/mypage/mywriterecipe">내가 쓴 레시피</a></li>
        <li><a href="/mypage/board">내가 쓴 게시글</a></li>
      </ul>
    </div>
    <div class="menu_Shop">
      <div>
        <span class="material-symbols-outlined">shopping_cart</span> Pet
        LiSe Shop
      </div>
      <ul>
        <li><a href="/orderlist">주문목록</a></li>
        <li><a href="/mypage/review">구매상품 후기</a></li>
      </ul>
    </div>
    <div class="menu_QnA">
      <div>
        <span class="material-symbols-outlined">forum</span> 문의사항
      </div>
      <ul>
        <li><a href="/mypage/qna">내가 남긴 문의</a></li>
      </ul>
    </div>
  </div>
`;
