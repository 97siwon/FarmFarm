<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Welcom to FarmFarm!!</title>

            <!-- <link rel="stylesheet" href="/resources/css/member/login-style.css"> -->
            <link rel="stylesheet" href="/resources/css/member/login-style.css">
        </head>

        <body>
            <main>
                <div class="back-img"><img src="/resources/images/member/backImg.png"></div>
                <div class="login-page">
                    <div class="login-page-img">
                        <a href="/">
                            <img src="/resources/images/mainLogo.png">
                        </a>
                    </div>

                    <div class="form-wrap">
                        <form action="/login" method="post" id="loginFrm">
                            <section class="inputbox">
                                <input type="text" name="memberId" id="memberId" placeholder="아이디" autocomplete="off"
                                    value="${cookie.saveId.value}">
                            </section>
                            <section class="inputbox">
                                <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호">
                            </section>
                            <div class="loginCheck" id="loginCheck"></div>
                            <div class="login-btn">
                                <button class="inputbox input-button">로그인</button>
                            </div>
                        </form>

                        <section class="saveid-area">
                            <!-- 쿠키에 svaeId 있을 때 -->
                            <c:if test="${!empty cookie.saveId.value}">
                                <c:set var="temp" value="checked" />
                            </c:if>

                            <div class="save-find">
                                <label for="saveId">
                                    <div class="saveIdArea" id="idCheck">
                                        <i class="fa-solid fa-check" id="idCheck2">
                                            <input type="checkbox" name="saveId" id="saveId" ${temp}>
                                        </i>
                                    </div>아이디 저장
                                </label>
                                <div class="find-area">
                                    <div class="find"><a href="/findId">아이디 찾기</a></div>
                                    <div class="find">|</div>
                                    <div class="find"><a href="/findPw">비밀번호 찾기</a></div>
                                </div>
                            </div>

                            <div class="line-area"></div>

                            <div class="welcom">
                                <p>팜팜 회원이 되어 품질 높은 농산물을 만나보세요!</p>
                            </div>

                            <div class="signup-btn">
                                <button class="inputbox input-button"><a href="/signUpStart">회원가입</a></button>
                            </div>
                        </section>
                    </div>
                </div>
            </main>
            <c:if test="${!empty message}">
                <script>
                    alert("${message}")
                </script>

                <%-- message 1회 출력 후  모든 scope에서 삭제 --%>
                <c:remove var="message"/>
            </c:if>
        </body>
        </html>