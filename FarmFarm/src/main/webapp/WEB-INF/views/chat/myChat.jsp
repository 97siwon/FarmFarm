<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팜팜 | 내 채팅</title>

    <link rel="stylesheet" href="/resources/css/chat/myChat-style.css">
    <link rel="stylesheet" href="/resources/css/common/header-style.css">

    
    <script src="https://kit.fontawesome.com/d449774bd8.js" crossorigin="anonymous"></script>
</head>
<body>
    
    <!-- 헤더 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 본문 영역 -->
    <div class="container" role="main">

        <!-- 좌측 사이드바 채팅방 목록 -->
        <section class="chat-list-area">
            <div class="title">
              <i class="fa-solid fa-bell"></i>&nbsp;&nbsp;알림 센터
            </div>
            <div class="search-area">
                <input id="searchBar" placeholder="채팅방 검색">
                <button id="searchBtn">
                    검색
                </button>
            </div>

            <!-- 이하는 채팅방 영역 -->

            <div class="chat-box">
              
              <div class="profile-img">
                <img src="/resources/images/chat/farmer.png">
              </div>
              
              <div class="enter-icon">
                <i class="fa-solid fa-right-to-bracket"></i>
              </div>

              <div class="box-label">
                <div class="member-nickname">
                  착한 판매자
                </div>
              
                <div class="last-message-time">
                  2022-12-18
                </div>
              
              </div>
              
              <div class="last-message-content">
                메세지가 아무리 길어도 2줄 이상은 출력되지 않게 만들려고 합니다. 메세지가 긴 경우는 이렇게 됩니다.
              </div>
            
            </div> <!-- end box -->

            <div class="chat-box">
              <div class="profile-img">
                <img src="/resources/images/chat/farmer2.png">
              </div>
              
              <div class="enter-icon">
                <i class="fa-solid fa-right-to-bracket"></i>
              </div>
              
              <div class="box-label">
                <div class="member-nickname">
                  이름이 정말 너무너무 긴 판매자가 있다면 어떻게 될까요?
                </div>
              
                <div class="last-message-time">
                  2022-12-18
                </div>
              
              </div>
              
              <div class="last-message-content">
                메세지가 아무리 길어도 2줄 이상은 출력되지 않게 만들려고 합니다. 메세지가 긴 경우는 이렇게 됩니다.
              </div>
            
            </div> <!-- end box -->

            <div class="chat-box">

              <div class="profile-img">
                <img src="/resources/images/chat/farmer3.png">
              </div>

              <div class="enter-icon">
                <i class="fa-solid fa-right-to-bracket"></i>
              </div>

              <div class="box-label">
                <div class="member-nickname">
                  이름이 정말 너무너무 긴 판매자가 있다면 어떻게 될까요? 이건 3줄을 넘어서 4줄, 5줄까지 가는 아주 긴 이름입니다..
                </div>
                
                <div class="last-message-time">
                  오후 6:26
                </div>
              </div>

              <div class="last-message-content">
                메세지가 아무리 길어도 2줄 이상은 출력되지 않게 만들려고 합니다. 메세지가 긴 경우는 이렇게 됩니다.
              </div>

            </div> <!-- end box -->

        </section>

        <!-- 우측 채팅 내역 -->
        <section class="chat-room">

          <div id="roomLabel">
            <div id="postImg">
              <img src="/resources/images/chat/potato.jpg">
            </div>
            <div id="postTitle">
              아주 긴 채팅방 제목... 아주 긴 채팅방 제목... 아주 긴 채팅방 제목...
              아주 긴 채팅방 제목... 아주 긴 채팅방 제목... 아주 긴 채팅방 제목...
              아주 긴 채팅방 제목... 아주 긴 채팅방 제목... 아주 긴 채팅방 제목...
              아주 긴 채팅방 제목... 아주 긴 채팅방 제목... 아주 긴 채팅방
            </div>
            <button id="purchaseBtn">
              구매하기
            </button>

            <button id="roomEditBtn">
              <i class="fa-sharp fa-solid fa-gear"></i>
            </button>

            <div id="roomEditDropdown">
              <ul>
                <li class="roomEditDropdownMenu">신고하기</li>
                <li class="roomEditDropdownMenu">나가기</li>
              </ul>
            </div>

            <button id="spreadBtn">
              <i class="fa-solid fa-caret-down"></i>
            </button>
          </div>

          <!-- end roomLabel -->

          <!-- 채팅창 메인 -->
          <div id="roomBody">
            <!-- 채팅방 메세지 예시 -->
            <div id="readingArea">

              <!-- 송신/수신한 메세지가 들어갈 영역입니다 -->
              <!-- 받은 메세지 received-message -->
              <!-- message-profile-img, received-bubble. received-bubble-tail -->

              <!-- 보낸 메세지 sent-message -->
              <!-- sent-bubble, sent-bubble-tail -->
              <div class="received-message">
                <div class="message-profile-img">
                  <img src="/resources/images/chat/farmer.png">
                </div>

                <div class="member-name">
                  착한판매자
                </div>

                <div class="received-bubble-tail"></div>

                <div class="received-bubble">
                  ‘박제가 되어 버린 천재’를 아시오? 나는 유쾌하오. 이런 때 연애까지가 유쾌하오.
                  육신이 흐느적흐느적하도록 피로했을 때만 정신이 은화처럼 맑소. 
                  니코틴이 내 횟배 앓는 뱃속으로 스미면 머릿속에 으레 백지가 준비되는 법이오. 
                  그 위에다 나는 위트와 패러독스를 바둑 포석처럼 늘어놓소. 가증할 상식의 병이오.
                  나는 또 여인과 생활을 설계하오. 연애기법에마저 서먹서먹해진 지성의 극치를 흘깃 좀 들여다본 일이 있는, 말하자면 일종의 정신분일자말이오. 
                  이런 여인의 반 — 그것은 온갖 것의 반이오. — 만을 영수하는 생활을 설계한다는 말이오. 그런 생활 속에 한 발만 들여놓고 흡사 두 개의 태양처럼 마주 쳐다보면서 낄낄거리는 것이오. 
                  나는 아마 어지간히 인생의 제행이 싱거워서 견딜 수가 없게끔 되고 그만둔 모양이오. 굿바이.
                </div>

              </div>
  
              <div class="sent-message">
                <div class="sent-bubble">
                  그대 자신을 위조하는 것도 할 만한 일이오. 그대의 작품은 한 번도 본 일이 없는 기성품에 의하여 차라리 경편하고 고매하리다.

                  19세기는 될 수 있거든 봉쇄하여 버리오. 도스토옙스키 정신이란 자칫하면 낭비일 것 같소. 
                  위고를 불란서의 빵 한 조각이라고는 누가 그랬는지 지언인 듯싶소. 그러나 인생 혹은 그 모형에 있어서 ‘디테일’ 때문에 속는다거나 해서야 되겠소?
                  
                  화를 보지 마오. 부디 그대께 고하는 것이니…….
                  
                  “테이프가 끊어지면 피가 나오. 생채기도 머지않아 완치될 줄 믿소. 굿바이.” 감정은 어떤 ‘포즈’. (그 ‘포즈’의 원소만을 지적하는 것이 아닌지 나도 모르겠소.) 
                  그 포우즈가 부동자세에까지 고도화할 때 감정은 딱 공급을 정지합네다.
                </div>
                <div class="sent-bubble-tail"></div>
              </div>

                <div class="received-message">
                  <div class="message-profile-img">
                    <img src="/resources/images/chat/farmer.png">
                  </div>
                  <div class="member-name">
                    착한판매자
                  </div>
                  <div class="received-bubble-tail"></div>
                  <div class="received-bubble">
                    우리들은 서로 오해하고 있느니라. 설마 아내가 아스피린 대신에 아달린의 정량을 나에게 먹여 왔을까? 
                    나는 그것을 믿을 수는 없다. 아내가 대체 그럴 까닭이 없을 것이니, 그러면 나는 날밤을 새면서 도둑질을 계집질을 하였나? 정말이지 아니다.

                    우리 부부는 숙명적으로 발이 맞지 않는 절름발이인 것이다. 내나 아내나 제 거동에 로직을 붙일 필요는 없다. 
                    변해할 필요도 없다. 사실은 사실대로 오해는 오해대로 그저 끝없이 발을 절뚝거리면서 세상을 걸어가면 되는 것이다. 그렇지 않을까?
                    
                    그러나 나는 이 발길이 아내에게로 돌아가야 옳은가 이것만은 분간하기가 좀 어려웠다. 가야하나? 그럼 어디로 가나?
                    
                    이때 뚜우 하고 정오 사이렌이 울었다. 
                    사람들은 모두 네 활개를 펴고 닭처럼 푸드덕거리는 것 같고 온갖 유리와 강철과 대리석과 지폐와 잉크가 부글부글 끓고 수선을 떨고 하는 것 같은 찰나! 
                    그야말로 현란을 극한 정오다.
                  </div>
                </div>
    
                <div class="sent-message">
                  <div class="sent-bubble">
                    나는 불현듯 겨드랑이가 가렵다. 아하, 그것은 내 인공의 날개가 돋았던 자국이다. 
                    오늘은 없는 이 날개. 머릿속에서는 희망과 야심이 말소된 페이지가 딕셔너리 넘어가듯 번뜩였다.
                    나는 걷던 걸음을 멈추고 그리고 일어나 한 번 이렇게 외쳐 보고 싶었다.
                    날개야 다시 돋아라.
                    날자. 날자. 한 번만 더 날자꾸나.
                    한 번만 더 날아 보자꾸나.
                  </div>
                  <div class="sent-bubble-tail"></div>
                </div>
              </div>

              <div id="bottomBtn">
                <i class="fa-solid fa-caret-down"></i>
              </div>

            </div>

            
            <!-- 메세지 입력 영역 -->
            <div id="writingArea">

              <button id="addImageBtn">
                <i class="fa-solid fa-image"></i>
              </button>
              <input id="inputBox" type="text" placeholder="메세지를 입력하세요">
              <button id="sendMessage">
                <i class="fa-solid fa-paper-plane"></i>
              </button>

            </div>


          </div>


        </section>
    </div>

    <script src="/resources/js/chat/myChat.js"></script>

</body>
</html>