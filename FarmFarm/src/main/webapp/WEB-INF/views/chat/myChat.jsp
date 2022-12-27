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
        <section class="chat-sidebar">
            <div class="chat-sidebar-header">
              <div class="title">
                <i class="fa-solid fa-bell"></i>&nbsp;&nbsp;알림 센터
              </div>
              <div class="search-area">
                  <input id="searchBar" placeholder="채팅방 검색">
                  <button id="resetRoomSearch">
                    <i class="fa-solid fa-circle-xmark"></i>
                  </button>
                  <button id="searchBtn">
                      검색
                  </button>
              </div>
            </div>
            <div class="chat-preview-area">
              <!-- 채팅방 미리보기 영역 -->
            </div>

        </section>

        <!-- 우측 채팅 내역 -->
        <section class="chat-room">
          <div id="roomBodyBlinder">
            <div id="emptyChat">
              <div id="emptyChatIcon">
                <i class="fa-solid fa-message"></i>
                <!-- <i class="fa-solid fa-cart-shopping"></i> -->
              </div>
              <div id="emptyDetail">
                사고 싶은 상품을 찾고 판매자와 채팅을 시작해보세요!
              </div>
            </div>
          </div>
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
              <!-- 받은 메세지 received-chat -->
              <!-- chat-profile-img2, received-bubble. received-bubble-tail -->

              <!-- 보낸 메세지 sent-chat -->
              <!-- sent-bubble, sent-bubble-tail -->
              
              <!-- 메세지가 없는 경우 -->
 
            </div>

            
            
            
            <!-- 메세지 입력 영역 -->
            <div id="writingArea">
              
              <input id="imageInput" type="file" accept="image/*" hidden>
              <button id="addImageBtn">
                <i class="fa-solid fa-image"></i>
              </button>
              <input id="inputBox" type="text" placeholder="메세지를 입력하세요">
              <div id="inputImgPreviewBox">
                <div id="inputImgPreviewBoxHeader">
                  <span>사진 보내기</span>
                  <i id="inputImgPreviewDelBtn" class="fa-solid fa-xmark"></i>
                </div>
                <img id="inputImgPreview"> <!-- 사진 미리보기 들어갑니다! -->
                <div id="sendImgBtn">사진 전송</div>
              </div>
            <button id="sendBtn">
              <i class="fa-solid fa-paper-plane"></i>
            </button>
          </div>
          
        </div>
        <!-- 하단 이동 -->
        <div id="bottomBtn">
          <i class="fa-solid fa-caret-down"></i>
        </div>


        </section>
    </div>

    <!-- https://github.com/sockjs/sockjs-client -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

    <!-- Axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script src="/resources/js/chat/chatService.js"></script>
    <script src="/resources/js/chat/myChat.js"></script>

    <script>
      const loginMemberNo = "${loginMember.memberNo}";
    </script>
</body>
</html>