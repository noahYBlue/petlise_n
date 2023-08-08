window.addEventListener('scroll', function() {
  var header = document.querySelector('.header');
  var content = document.querySelector('.container');
  var scrollPosition = window.pageYOffset;

  if (scrollPosition > content.offsetTop) {
    header.classList.add('sticky');
  } else {
    header.classList.remove('sticky');
  }
});


$(function() {
  var prevScrollTop = 0;

  document.addEventListener("scroll", function(){
      
      var nowScrollTop = $(window).scrollTop(); //현재 스크롤 위치를 nowScrollTop 에 저장
      
      if (nowScrollTop > prevScrollTop){ $('header').addClass('active'); } 
      // 스크롤 방향(Down) 내릴때 -> 헤더에 active 클래스 추가
      else { $('header').removeClass('active'); } // 스크롤 방향(Up) 올릴때 -> 헤더에 active 클래스 제거
      prevScrollTop = nowScrollTop;  // prevScroll, nowScrollTop 조건 판단 후, 현재 스크롤값을 prevScrollTop 에 저장

  });

});

document.getElementById('nav').innerHTML += `
  <header class="header">
    <div class="container">
      <div class="row v-center">
        <!--로고-->
        <div class="header-item item-left">
          <div class="logo">
            <a href="#" title="펫라이스">
              <img src="images/nav/yellow.png" alt="Logo">
            </a>
          </div>
        </div>
        <!-- 메뉴시작 -->
        <div class="header-item item-center">
          <div class="menu-overlay">
          </div>
          <nav class="menu">
            <ul class="menu-main">
              <li class="menu-item-has-children">
                <a href="#">전문가 레시피</a>
                <div class="sub-menu mega-menu mega-menu-column-4">
                  <div class="list-item">
                    <a href="/recipelistbest">    
                      <span class="title">이달의 레시피</span>
                    </a>
                  </div>
                  <div class="list-item">
                    <div class="list-item-kind">
                      <span class="title">강아지</span>
                    </div>
                    <div class="list-container">
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=건강식&searchType3=전체">건강식</a></span>
                        <div class="list-item-recipe">
                          <ul>
                            <li><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=건강식&searchType3=다이어트식">다이어트식</a></li>
                            <li><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=건강식&searchType3=병원식">병원식</a></li>
                            <li><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=건강식&searchType3=영양식">영양식</a></li>
                          </ul>
                        </div>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=일반식&searchType3=전체">일반식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=일반식&searchType3=습식">습식</a></li>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=일반식&searchType3=건식">건식</a></li>                                         
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=간식&searchType3=전체">간식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=간식&searchType3=건조간식">건조간식</a></li>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=간식&searchType3=화식간식">화식간식</a></li>                                          
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=강아지&searchType2=기타">기타</a></span>                                    
                      </div>
                    </div>                            
                  </div>
                  <div class="list-item">
                    <div class="list-item-kind">
                      <span class="title">고양이</span>
                    </div>
                    <div class="list-container">
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=건강식&searchType3=전체">건강식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=건강식&searchType3=다이어트식">다이어트식</a></li>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=건강식&searchType3=병원식">병원식</a></li>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=건강식&searchType3=영양식">영양식</a></li>
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=일반식&searchType3=전체">일반식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=일반식&searchType3=습식">습식</a></li>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=일반식&searchType3=건식">건식</a></li>                                         
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=간식&searchType3=전체">간식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=간식&searchType3=건조간식">건조간식</a></li>
                          <li><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=간식&searchType3=화식간식">화식간식</a></li>                                          
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=전문가레시피&searchType1=고양이&searchType2=기타">기타</a></span>                                    
                      </div>
                    </div>                            
                  </div>
                </div>
              </li>
              <li class="menu-item-has-children">
                <a href="#">나만의 레시피</a>
                <div class="sub-menu mega-menu mega-menu-column-4">
                  <div class="list-item">
                    <a href="#">    
                      <span class="title">이달의 레시피</span>
                    </a>
                  </div>
                  <div class="list-item">
                    <div class="list-item-kind">
                      <span class="title">강아지</span>
                    </div>
                    <div class="list-container">
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=전체">건강식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=다이어트식">다이어트식</a></li>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=병원식">병원식</a></li>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=건강식&searchType3=영양식">영양식</a></li>
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=일반식&searchType3=전체">일반식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=일반식&searchType3=습식">습식</a></li>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=일반식&searchType3=건식">건식</a></li>                                         
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=간식&searchType3=전체">간식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=간식&searchType3=건조간식">건조간식</a></li>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=간식&searchType3=화식간식">화식간식</a></li>                                          
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=강아지&searchType2=기타">기타</a></span>                                    
                      </div>
                    </div>                            
                  </div>
                  <div class="list-item">
                    <div class="list-item-kind">
                      <span class="title">고양이</span>
                    </div>
                    <div class="list-container">
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=건강식&searchType3=전체">건강식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=건강식&searchType3=다이어트식">다이어트식</a></li>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=건강식&searchType3=병원식">병원식</a></li>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=건강식&searchType3=영양식">영양식</a></li>
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=일반식&searchType3=전체">일반식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=일반식&searchType3=습식">습식</a></li>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=일반식&searchType3=건식">건식</a></li>                                         
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=간식&searchType3=전체">간식</a></span>
                        <ul>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=간식&searchType3=건조간식">건조간식</a></li>
                          <li><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=간식&searchType3=화식간식">화식간식</a></li>                                          
                        </ul>
                      </div>
                      <div class="list-item-col">                                
                        <span class="subtitle"><a href="/recipelist?recipeType=나만의레시피&searchType1=고양이&searchType2=기타">기타</a></span>                                    
                      </div>
                    </div>                            
                  </div>
                </div>
              </li>
              <li class="menu-item-has-children">
                <a href="#">라이스샵</a>
              </li>
              <li class="menu-item-has-children">
                <a href="#">커뮤니티</a>
                <div class="sub-menu mega-menu mega-menu-column-4">
                  <div class="list-item2">
                    <a href="petplaceMain">    
                      <span class="title">펫플레이스</span>
                    </a>
                  </div>
                  <div class="list-item2">
                    <a href="boardMain">    
                      <span class="title">자유게시판</span>
                    </a>
                  </div>
                </div>
              </li>
              <li class="menu-item-has-children">
                <a href="#">공지사항</a>
                <div class="sub-menu mega-menu mega-menu-column-4">
                  <div class="list-item2">
                    <a href="noticeMain">    
                      <span class="title">공지사항</span>
                    </a>
                  </div>
                  <div class="list-item2">
                    <a href="#">    
                      <span class="title">문의사항</span>
                    </a>
                  </div>
                  <div class="list-item2">
                    <a href="#">    
                      <span class="title">이벤트</span>
                    </a>
                  </div>
                  <div class="list-item2">
                    <a href="#">    
                      <span class="title">가족찾기</span>
                    </a>
                  </div>
                </div>
              </li>
            </ul>
          </nav>
        </div>
        <!-- menu end here -->
        <!--
            <div class="header-right">
                <div class="header-item item-right">
                    <a href="#">
                    <div class="header-icon-block">
                        <div class="header-icon-4"></div>
                        <div class="header-icon-text">
                            <p>회원가입</p>
                        </div>
                    </div>
                </a>
                <a href="#">
                    <div class="header-icon-block">
                        <div class="header-icon-5"></div>
                        <div class="header-icon-text-2">
                            <p>로그인</p>
                        </div>
                    </div>
                </a>
                </div>
            </div>
            -->
        <div class="header-right">
          <div class="header-item item-right">
            <a href="#">
              <div class="header-icon-block">
                <div class="header-icon-1"></div>
                <div class="header-icon-text">
                  <p>마이페이지</p>
                </div>
              </div>
            </a>
            <a href="#">
              <div class="header-icon-block">
                <div class="header-icon-2"></div>                        
                <div class="header-icon-text">
                  <p>장바구니</p>
                </div>
              </div>
            </a>
            <a href="#">
              <div class="header-icon-block">
                <div class="header-icon-3"></div>
                <div class="header-icon-text-1">
                  <p>로그아웃</p>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </header>
`;
