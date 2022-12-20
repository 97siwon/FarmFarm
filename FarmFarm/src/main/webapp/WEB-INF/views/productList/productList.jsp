<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팜팜 | 팜팜마켓</title>
    <!-- swiper-style -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

    <link rel="stylesheet" href="/src/main/webapp/resources/css/productList/productList-style.css">
    <link rel="stylesheet" href="/src/main/webapp/resources/css/header.css">

    <script src="https://kit.fontawesome.com/d449774bd8.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- header --> 
    <div class="header-container">
        <header>
          <div class="home-logo">
            <a href="/">
              <img src="../images/mainLogo.png" />
            </a>
          </div>
  
          <div class="header-widget-area">
            <!-- 로그인O 상태 -->
            <ul class="widget-list">
              <li class="widget-item">
                <div class="dropdown">
                  <button type="button" class="dropbtn1">
                    <i class="fa-solid fa-bell header-icon"></i>
                  </button>
  
                  <div id="myDropdown1" class="dropdown-message">
                    <div class="notice"><p>알림</p></div>
                    <ul>
                      <li>
                        <div class="message-box">
                          <a href="">배송이 시작되었습니다.</a>
                        </div>
                      </li>
                      <li>
                        <div class="message-box">
                          <a href="">신팜팜님이 신고했습니다..</a>
                        </div>
                      </li>
                      <li>
                        <div class="message-box">
                          <a href="">정팜팜님이 신고를 거부하셨습니다.</a>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </li>
              <li class="widget-item">
                <a href="#">
                  <i class="fa-solid fa-comment-dots"></i>
                </a>
                <!-- <div class="chat-count">21</div> -->
              </li>
              <li class="widget-item">
                <div class="dropdown">
                  <button type="button" class="dropbtn">
                    <span>
                      <i
                        class="fa-solid fa-user header-icon"
                        id="profilePhoto"
                      ></i>
                    </span>
                    <!-- <span>
                                      <img src="../images/member/farmer.png" class="login-profile-img">
                                  </span> -->
                    <i
                      class="fa-solid fa-caret-down caret-icon"
                      id="triangleIcon"
                    ></i>
                  </button>
  
                  <div id="myDropdown" class="dropdown-content">
                    <a href="#">내프로필</a>
                    <a href="#">로그아웃</a>
                  </div>
                </div>
              </li>
            </ul>
  
            <!-- 로그인X 상태 -->
            <!-- <ul class="login-list">
                      <li class="login-item"><a href="#">로그인</a></li>
                      <li class="login-item"><a href="#">회원가입</a></li>
                  </ul> -->
          </div>
        </header>
  
        <nav>
          <div class="nav-head">
            <div class="nav-body">
              <div class="nav-list"><a href="#">팜팜마켓</a></div>
              <div class="nav-list"><a href="#">사고팔고</a></div>
              <div class="nav-list"><a href="#">커뮤니티</a></div>
              <div class="nav-list"><a href="#">문의게시판</a></div>

              <!-- nav custom -->
              <div class="nav-list view-hidden" id="navSearchBar">

                    <input id="keyword" placeholder="검색어를 입력하세요">
                    <button id="searchBtn">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>

              </div>

            </div>
          </div>
        </nav>
      </div>
      <script>
        // 프로필 드롭다운
        const dropbtn = document.querySelector('.dropbtn');
        dropbtn.addEventListener('click', () => {
          const icon = document.querySelector('.caret-icon');
          const myDropdown = document.querySelector('.dropdown-content');
  
          if (
            myDropdown.style.display == 'none' ||
            myDropdown.style.display == ''
          ) {
            icon.style.transform = 'perspective(500px) rotateX(180deg)';
            myDropdown.style.display = 'block';
          } else {
            icon.style.transform = 'perspective(500px) rotateX(360deg)';
            myDropdown.style.display = 'none';
          }
        });
  
        dropbtn.addEventListener('blur', () => {
          const icon = document.querySelector('.caret-icon');
          const myDropdown = document.querySelector('.dropdown-content');
  
          myDropdown.style.display = '';
          icon.style.transform = 'perspective(500px) rotateX(360deg)';
        });
  
        // 알림 드롭다운
        const dropbtn1 = document.querySelector('.dropbtn1');
        dropbtn1.addEventListener('click', () => {
          const myDropdown1 = document.querySelector('.dropdown-message');
  
          if (
            myDropdown1.style.display == 'none' ||
            myDropdown1.style.display == ''
          ) {
            myDropdown1.style.display = 'block';
          } else {
            myDropdown1.style.display = 'none';
          }
        });
  
        dropbtn1.addEventListener('blur', () => {
          const myDropdown1 = document.querySelector('.dropdown-message');
  
          myDropdown1.style.display = '';
        });
        // const myDropdown1 = document.getElementById("myDropdown1");
  
        // function dropDown1(){
        //     myDropdown1.classList.toggle("show1");
        // };
  
        // window.onclick=function(e){
        //     if(!e.target.matches(".dropbtn, .dropbtn *")){
  
        //         if(myDropdown1.classList.contains("show1")){
        //             myDropdown1.classList.remove("show1");
        //         }
        //     }
        // };
      </script>

      <!-- end header -->

    <!-- end nav -->

    <!-- 배너와 검색창이 들어갈 자리입니다 -->
    <section class="banner">
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="/src/main/webapp/resources/images/productList/banner-sample.jpg">
                </div>
                <div class="swiper-slide">
                    <img src="/src/main/webapp/resources/images/productList/banner-sample2.jpg">
                </div>
                <div class="swiper-slide">
                    <img src="/src/main/webapp/resources/images/productList/banner-sample3.jpg">
                </div>
                <!-- 필요 시 이미지 추가 -->
            </div>
            <div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>

        
        <div class="search-area">
            <span id="title">팜팜마켓</span>
            <div id="searchBar">
                <input id="keyword" placeholder="검색어를 입력하세요">
                <button id="searchBtn">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </div>
    </section>

    <!-- 본문이 들어갈 자리입니다. -->
    <div class="container" role="main">
        

        <!-- 좌측 카테고리 영역 -->
        <section class="category-area">

            <div class="area-title">카테고리</div>
            <div class="types-area">
                
                <div class="sur">과일</div>
                <div class="category-dropdown">

                    <input type="checkbox" name="types" id="fruit1" value="apple,pear">
                    <label for="fruit1">사과/배</label>

                    <input type="checkbox" name="types" id="fruit2" value="tomato">
                    <label for="fruit2">토마토/방울토마토</label>

                    <input type="checkbox" name="types" id="fruit3" value="strawberry,blueberry">
                    <label for="fruit3">딸기/블루베리</label>

                    <input type="checkbox" name="types" id="fruit4" value="persimmon,mandarin">
                    <label for="fruit4">감/귤</label>

                    <input type="checkbox" name="types" id="fruit5" value="grape,peach">
                    <label for="fruit5">포도/복숭아</label>

                    <input type="checkbox" name="types" id="fruit6" value="watermelon,melon">
                    <label for="fruit6">수박/참외</label>



                </div>

                <div class="sur">채소</div>
                
                <div class="category-dropdown">
                    <input type="checkbox" name="types" id="vegetable1" value="lettuce">
                    <label for="vegetable1">상추/깻잎/양상추</label>

                    <input type="checkbox" name="types" id="vegetable2" value="pepper,pimento">
                    <label for="vegetable2">고추/피망</label>

                    <input type="checkbox" name="types" id="vegetable3" value="cabbage">
                    <label for="vegetable3">배추/양배추/무</label>

                    <input type="checkbox" name="types" id="vegetable4" value="spinach">
                    <label for="vegetable4">갓/시금치/치커리</label>

                    <input type="checkbox" name="types" id="vegetable5" value="cucumber">
                    <label for="vegetable5">오이/가지/옥수수</label>

                    <input type="checkbox" name="types" id="vegetable6" value="potato">
                    <label for="vegetable6">감자/고구마/당근</label>
                    
                    <input type="checkbox" name="types" id="vegetable7" value="mushroom">
                    <label for="vegetable7">버섯류</label>

                    <input type="checkbox" name="types" id="vegetable8" value="bean">
                    <label for="vegetable8">콩</label>

                </div>

                <div class="sur">기타</div>
                <div class="category-dropdown">

                </div>
            </div>

        </section>

        <!-- 우측 상품목록 영역 -->
        <section class="list-area">

            <!-- 상품 목록 정렬 옵션 -->
            <div class="list-area-header">
                <div id="listCount">
                    총 123개
                </div>
                <div class="view-option">
                    <span class="opt">판매량순</span>
                    <span>|</span>
                    <span class="opt">신상품순</span>
                    <span>|</span>
                    <span class="opt">낮은가격순</span>
                    <span>|</span>
                    <span class="opt">높은가격순</span>
                </div>
            </div>

            <!-- 상품 하나하나가 들어갈 영역(DOM 이용) -->
            <article class="list-area-body">

                <!-- 샘플 아이템 -->
                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            제목이 길어지면 어떻게 될까요? 이 정도로 길게 입력할 일은 없겠지만 혹시나 해서 확인해봅니다. 
                            매우매우매우매우 긴 제목입니다. 2줄 이상은 출력 안되게 만들거에요.
                        </div>
                        <div class="product-price">
                            3,000원
                        </div>
                        <div class="product-message">
                            제품 소개가 길어지면 어떻게 될까요? 이 정도로 길게 입력할 일은 없겠지만 혹시나 해서 확인해봅니다. 
                            매우매우매우매우 긴 제품 소개입니다. 3줄 이상은 출력 안되게 만들거에요.
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000 원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000 원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000 원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000 원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000 원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000 원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>

                <div class="product-box">
                    <div class="product-content">
                        <img src="/src/main/webapp/resources/images/productList/carrot.jpg">
                    </div>
                    <div class="product-detail">
                        <div class="product-name">
                            토마토는 거꾸로해도 토마토
                        </div>
                        <div class="product-price">
                            3,000 원
                        </div>
                        <div class="product-message">
                            토마토는 맛있어요
                        </div>
                    </div>
                </div>


                
            </article>


            <div class="pagination-area">
                <!-- ajax로 만들어 보십시다 -->
                <div class="page-box">
                    <<
                </div>
                <div class="page-box">
                    <
                </div>
                <div class="page-box">
                    1
                </div>
                <div class="page-box">
                    2
                </div>
                <div class="page-box">
                    3
                </div>
                <div class="page-box">
                    4
                </div>
                <div class="page-box">
                    5
                </div>
                <div class="page-box">
                    6
                </div>
                <div class="page-box">
                    7
                </div>
                <div class="page-box">
                    8
                </div>
                <div class="page-box">
                    9
                </div>
                <div class="page-box">
                    >
                </div>
                <div class="page-box">
                    >>
                </div>
            </div>
        </section>
    </div>

    <div id="topBtn" class="opacity-zero">
        <i class="fa-sharp fa-solid fa-arrow-up"></i>
    </div>

    <!-- swiper-js -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="/src/main/webapp/resources/js/productList/listSwiper.js"> </script>

    <script src="/src/main/webapp/resources/js/productList/productList.js"> </script>
</body>
</html>