<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="footer-btn">
            <!-- <a id="chatWidget"> -->
                <!-- <button type="button" id="showChatWidget"> -->
                <button type="button" class="btn-chat">
                    <i class="fa-solid fa-comment-dots go-to-top-icon"></i>
                    <div id="chatAlarmDot">
                        <i class="fa-solid fa-circle"></i>
                    </div>
                </button>
                <jsp:include page="/WEB-INF/views/chat/chatWidget.jsp"/>
            <!-- </a> -->
            <a href="#">
                <button type="button" class="btn-go-to-top" id="top_btn">
                    <i class="fa-solid fa-arrow-up go-to-top-icon"></i>
                </button>
            </a>
            <!-- 1:1 상담 버튼 -->
            <c:if test="${! empty loginMember}">
            <c:if test="${loginMember.authority == 0 or loginMember.authority == 1}">
            <button type="button" class="btn-inquire" id="inquireOpen">
                1:1
            <div id="inquireUnread">
                <i class="fa-solid fa-circle"></i>
            </div>
            </button>
            <jsp:include page="/WEB-INF/views/inquire/inquire.jsp"/>
            </c:if>
            </c:if>

            <!-- 알림 메시지 -->
            <jsp:include page="/WEB-INF/views/notify/notifyReceiver.jsp" />
        </div>

        <footer>
            <div class="footer">
                <div class="footer-wrap1">
                    <p>고객행복센터</p>
                    <div class="day">
                        <p>1644-1234</p>
                        <p>월~금 오전 9시 - 오후 6시</p>
                    </div>
                    <p>비회원 문의: help@farmfarm.com</p>
                </div>
                <div class="footer-wrap2">
                    <div class="part1">
                        <a href="#">이용약관</a>
                        <span>|</span>
                        <a href="#">개인정보취급방침</a>
                        <span>|</span>
                        <a href="#">이용안내</a>
                        <span>|</span>
                        <a href="#">고객센터</a>
                    </div>
                    <div class="part2">
                        <p>법인명(상호):주식회사 팜팜 | 사업자등록번호:435-43-34567</p>
                        <p>통신판매업:제 2022-서울중구-04567호 | 개인정보보호책임자:신총명</p>
                        <p>주소:서울시 중구 남대문로 120 2층 | 바지대표:신팀장</p>
                        <p>Copyright &copy; FarmFarm 2022 SSSLLJ</p>
                    </div>
                    <div class="part3">
                        <a href="http://146.56.191.169:8080/" target="_blank"><img
                                src="/resources/images/footer/BOND.png"></a>
                        <a href="http://146.56.188.235:8080/" target="_blank"><img
                                src="/resources/images/footer/Fiesta.png"></a>
                        <a href="#"><img src="/resources/images/footer/saladay.png"></a>
                    </div>
                </div>
            </div>
        </footer>

    