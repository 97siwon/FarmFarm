<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>와글와글 글쓰기</title>
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/board/boardWrite-style.css">
    <link rel="stylesheet" href="/css/common/header-style.css">
</head>
<body>

    <div class="header-container">
        <header>
            <div class="home-logo">
                <a href="/">
                    <img src="/images/mainLogo.png">
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
                                    <i class="fa-solid fa-user header-icon" id="profilePhoto"></i>
                                </span>
                                <!-- <span>
                                    <img src="../images/member/farmer.png" class="login-profile-img">
                                </span> -->
                                <i class="fa-solid fa-caret-down caret-icon" id="triangleIcon"></i>
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
                    <div class="nav-list"><a href="#">홈</a></div>
                    <div class="nav-list"><a href="#">팜팜마켓</a></div>
                    <div class="nav-list"><a href="#">사고팔고</a></div>
                    <div class="nav-list"><a href="#">커뮤니티</a></div>
                    <div class="nav-list"><a href="#">문의게시판</a></div>
                </div>
            </div>
        </nav>
    </div>
    <script>
        // 프로필 드롭다운
        const dropbtn = document.querySelector('.dropbtn')
        dropbtn.addEventListener('click', () => {
            
            const icon = document.querySelector('.caret-icon');
            const myDropdown = document.querySelector('.dropdown-content');
            
            if(myDropdown.style.display == 'none' || myDropdown.style.display == "") {
                icon.style.transform = 'perspective(500px) rotateX(180deg)';
                myDropdown.style.display = 'block';
            } else{
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
        const dropbtn1 = document.querySelector('.dropbtn1')
        dropbtn1.addEventListener('click', () => {
            
            const myDropdown1 = document.querySelector('.dropdown-message');
            
            if(myDropdown1.style.display == 'none' || myDropdown1.style.display == "") {
                myDropdown1.style.display = 'block';
            } else{
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


    <main>
        <section class="board-top">
            <div class="board-top-title">와글와글 글쓰기</div>
        </section>
        <form action="">
            <section class="board-category">
                <div class="board-category-area">
                    <span class="category">카테고리 선택</span>

                    <input type="radio" name="category" id="share" value="share">
                    <label for="share">물물교환</label>

                    <input type="radio" name="category" id="tip" value="tip">
                    <label for="tip">팁</label>

                    <input type="radio" name="category" id="question" value="question">
                    <label for="question">질문</label>
                </div>
                <button class="board-submit">게시하기</button>
            </section>
            <section class="board-write">
                <div class="write-title">
                    <span>제목 &nbsp; : </span>
                    <input type="text" class="input-write-title">
                </div>
                <textarea class="write-content"></textarea>
                <div class="board-img-ex">이미지 첨부하기</div>
                <div class="board-img-area">

                    <div class="board-img">
                        <label for="img1">
                            <img src="" class="board-preview">
                        </label>
                        <input type="file" class="board-input-img" id="img1" name="imgs" accept="img/*">
                        <span class="board-img-delete"><i class="fa-solid fa-xmark"></i></span>
                    </div>
                    
                    <div class="board-img">
                        <label for="img2">
                            <img src="" class="board-preview">
                        </label>
                        <input type="file" class="board-input-img" id="img2" name="imgs" accept="img/*">
                        <span class="board-img-delete"><i class="fa-solid fa-xmark"></i></span>
                    </div>
                    
                    <div class="board-img">
                        <label for="img3">
                            <img src="" class="board-preview">
                        </label>
                        <input type="file" class="board-input-img" id="img3" name="imgs" accept="img/*">
                        <span class="board-img-delete"><i class="fa-solid fa-xmark"></i></span>
                    </div>
                    
                    <div class="board-img">
                        <label for="img4">
                            <img src="" class="board-preview">
                        </label>
                        <input type="file" class="board-input-img" id="img4" name="imgs" accept="img/*">
                        <span class="board-img-delete"><i class="fa-solid fa-xmark"></i></span>
                    </div>
                    
                    
                </div>
            </section>
        </form>
    </main>
</body>
</html>