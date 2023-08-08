let link = document.location.pathname;

document.getElementById('asideMenu').innerHTML += `
  <img src="/images/login-logo.png" alt="로고" onClick="location.href='/'" />
  <ul class="menuWrapper">
    <li onClick="location.href='/admin'" style="background:${
      link === '/admin' ? '#181818' : ''
    }">
      <object
        data="/images/dashboard-icon.svg"
        alt="대시보드아이콘"
      ></object>
      <span>대시보드</span>
    </li>
    <li onClick="location.href='/admin/usermanagement'" style="background:${
      link === '/admin/usermanagement' ? '#181818' : ''
    }">
      <object
        data="/images/userManagement-icon.svg"
        alt="사용자관리아이콘"
      ></object>
      <span>사용자 관리</span>
    </li>
    <ul class="ul">
      <li style="background:${
        link === '/admin/expertrecipemanagement' ||
        link === '/admin/expertrecipemanagement-cat'
          ? '#181818'
          : ''
      }">
        <object
          data="/images/expertRecipe-icon.svg"
          alt="전문가레시피아이콘"
        ></object>
        <span>전문가 레시피 관리</span>
      </li>
      <li onClick="location.href='/admin/expertrecipemanagement'">강아지</li>
      <li onClick="location.href='/admin/expertrecipemanagement-cat'">고양이</li>
      </ul>
    <ul class="ul">
      <li style="background:${
        link === '/admin/myrecipemanagement' ||
        link === '/admin/myrecipemanagement-cat'
          ? '#181818'
          : ''
      }">
        <object
          data="/images/myRecipe-icon.svg"
          alt="나만의레시피아이콘"
        ></object>
        <span>나만의 레시피 관리</span>
      </li>
      <li onClick="location.href='/admin/myrecipemanagement'">강아지</li>
      <li onClick="location.href='/admin/myrecipemanagement-cat'">고양이</li>
    </ul>
    <li onClick="location.href='/adminshoplist'" style="background:${
      link === '/adminshoplist' ? '#181818' : ''
    }">
      <object
        data="/images/shop-icon.svg"
        alt="라이스샵아이콘"
      ></object>
      <span>라이스샵 관리</span>
    </li>
    <li onClick="location.href='/adminorderlist'" style="background:${
      link === '/adminorderlist' ? '#181818' : ''
    }">
      <object
        data="/images/delivery-icon.svg"
        alt="배달아이콘"
      ></object>
      <span>결제/배송 관리</span>
    </li>
    <li onClick="location.href='/admin/boardmanagement'" style="background:${
      link === '/admin/boardmanagement' ? '#181818' : ''
    }">
      <object
        data="/images/board-icon.svg"
        alt="자유게시판아이콘"
      ></object>
      <span>자유게시판 관리</span>
    </li>
    <li onClick="location.href='/admin/petplacemanagement'" style="background:${
      link === '/admin/petplacemanagement' ? '#181818' : ''
    }">
      <object
        data="/images/place-icon.svg"
        alt="펫플레이스아이콘"
      ></object>
      <span>펫플레이스 관리</span>
    </li>
    <li onClick="location.href='/admin/noticemanagement'" style="background:${
      link === '/admin/noticemanagement' ? '#181818' : ''
    }">
      <object
        data="/images/announcement-icon.svg"
        alt="공지사항아이콘"
      ></object>
      <span>공지사항 관리</span>
    </li>
  </ul>
`;
