<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />
<c:set var="boardCount" value="${map.boardCount}" />


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지 | 개인 정보 수정</title>
    <link rel="stylesheet" href="/resources/css/common/header-style.css" />
    <link rel="stylesheet" href="/resources/css/common/footer-style.css" />
    <link rel="stylesheet" href="/resources/css/myPage/myPage-style.css" />
    <link rel="stylesheet" href="/resources/css/myPage/myPageProfile-style.css" />
    <script
      src="https://kit.fontawesome.com/591746f9e8.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body>

      <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>
      <jsp:include page="/WEB-INF/views/myPage/myPage.jsp"/>
      
      <section class="list-container">
        <jsp:include page="/WEB-INF/views/myPage/myPageNav.jsp"/>
        <div class="board-list">
          <span class="board-list-title">개인 정보 수정</span>
          <span class="sub-update">* 변경가능</span>
            <form action="/myPage/myPageProfile" id="myProfileFrm" class="profile-form" method="post">
              <section class="image">
                <div class="farm-img">
                  <label for="farmImg"><img class="preview" src="">
                    <div class="profile-img">
                      <c:if test="${empty loginMember.profileImg}">
                        <img
                        src="/resources/images/myPage/profile/profileImg.png"
                        class="member-profile-img"
                        id="memberProfileImg"/>
                      </c:if>
                      <c:if test="${!empty loginMember.profileImg}">
                        <img
                        src="${loginMember.mypageImg}"
                        class="member-profile-img"
                        id="memberProfileImg"/>
                      </c:if>
                    </div>
                    <input type="file" name="farmfarm" id="farmImg" class="input-image" accept="image/*">
                  </label>
                  <div class="delete">
                    <span class="delete-image">&times;</span>
                  </div>
                </div>
              </section>
    
              <section class="update">
                <div class="title">아이디</div>
                <div class="update-div">
                  <p>${loginMember.memberId}</p>
                </div>
              </section>
              <section class="update">
                <div class="title">*비밀번호</div>
                <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호"
                    maxlegnth="20">
                <input type="password" name="memberPwConfirm" id="memberPwConfirm"
                    placeholder="비밀번호 확인" maxlegnth="20">
                <div id="pwConfirm" class="coner">영어, 숫자, 특수문자(!,@,#,-,_) 최소 6자 이상 입력해주세요.
                </div>
              </section>
              <section class="update">
                <div class="title">이름</div>
                <div class="update-div">
                  <p>${loginMember.memberName}</p>
                </div>
              </section>
              <section class="update">
                <div class="title">*닉네임</div>
                <input type="text" name="memberNickname" id="memberNickname"
                    maxlegnth="10" value="${loginMember.memberNickname}">
                <div id="nicknameConfirm" class="coner">한글, 영어, 숫자 2~10자리 입력해주세요.</div>
              </section>
              <section class="update">
                <div class="title">생년월일</div>
                <div class="update-div">
                  <p>${loginMember.memberBirth}</p>
                </div>
              </section>
    
              <%-- a,,b,,c --%>
              <%-- 주소 문자열 -> 배열로 쪼개기 --%>
              ${loginMember.memberAddress}
              <c:set var="addr" value="${fn:split(loginMember.memberAddress,',,')}" />
              <%-- 변수 선언 --%>
              <section class="update">
                  <div class="title">*주소</div>
                  <div>
                      <input type="text" name="memberAddress" id="sample6_postcode"
                          placeholder="우편번호" maxlength="6" value="${addr[0]}">
                      <button type="button" class="find-btn address-btn address-btn1"
                          onclick="sample6_execDaumPostcode()">주소찾기</button>
                  </div>
                  <div>
                      <input type="text" name="memberAddress" id="sample6_address"
                          placeholder="도로명/지번 주소" value="${addr[1]}">
                  </div>
                  <div>
                      <input type="text" name="memberAddress"
                          id="sample6_detailAddress" placeholder="상세 주소"
                          value="${addr[2]}">
                  </div>
              </section>
              <section class="update tel">
                  <div class="title">전화번호</div>
                  <div class="update-div">
                    <p>${loginMember.to}</p>
                  </div>
              </section>
              <button class="update-btn">변경하기</button>
              <button class="update-btn">탈퇴하기</button>
            </form>
      </section>
      
      </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <jsp:include page="/WEB-INF/views/common/modal/message.jsp"/>

    <script>
      var sortFl = 'N';
    </script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="/resources/js/common/common.js"></script>

    <script src="/resources/js/myPage/myPage.js"></script>
    <script src="/resources/js/myPage/myPageBoard.js"></script>

  </body>
</html>
