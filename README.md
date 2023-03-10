<p align="center"><img width="30%" src="https://user-images.githubusercontent.com/110653581/211257489-34757022-4c71-443f-afe7-94d240788288.png"/></p>

# FarmFarm
> 내 손으로 키운 작물, 손쉽게 거래하세요.<br><br>
## 🖥️ 프로젝트 소개
> FarmFarm은 소비자가 판매자가 되어 자신이 기른 농작물을 직접 판매할 수 있고,
농사에 필요한 물품을 사이트에서 직접 구매할 수 있으며 커뮤니티를 통해 정보를 주고 받을 수 있는 All in One 거래 중개 복합 플랫폼입니다.
<br><br>

## 🔗 프로젝트 구조<br>
![project](https://user-images.githubusercontent.com/110653581/223979355-d3890851-f2db-4714-810d-79bc305bc26e.png)
<br>
## ⏱️ 개발 기간
2022년 12월 12일 ~ 2023년 1월 11일<br><br>
## 🧑‍🤝‍🧑 멤버 구성
[6인 팀프로젝트]<br>
- 서도은 -게시판 조회, 작성, 수정, 댓글, 비밀댓글
- 신보경 -마이페이지, 주문목록, 후기 관리, 게시글, 댓글, 찜목록, 상품 상세페이지, 주문서, 채팅, 반품, 배송
- 신충영 -채팅(단체 채팅, 1대1 채팅), 알림, 상품 목록 페이지
- 이시원 -로그인, 회원가입, 아이디, 비밀번호 찾기, 개인정보수정, 레시피 API
- 이은지 -관리자 페이지 조회, 신고, 회원 관리
- 정현재 -판매자 페이지 등록, 관리, 수정, 반품 내역 관리, 장바구니, 주문 내역 관리<br><br>
## 🪄 사용 기술
**Back-end**
- Java 11
- Spring 3.9.18
- Maven
- Oracle 21C
- Apache Tomcat 9.0
- Spring Security
- Mybatis

**Front-end**
- HTML/CSS
- Javascript<br><br>
## 🏷️ ERD 설계
![216096409-23864202-486c-4dbb-a65f-9d7aebd232ad](https://user-images.githubusercontent.com/110653581/224001299-497bd7d9-0440-47d5-bd3d-0bf1c83c57dc.png)
ERD 주소 : https://www.erdcloud.com/d/xpKBdcyyrs6Ef2k9F<br><br>
## ⚙️ 핵심 기능
- 구현 기능 및 기여
  - 로그인, 회원가입 기능
  - 아이디, 비밀번호 찾기 기능
  - 개인정보 수정, 비밀번호 변경, 회원 탈퇴
  - 레시피API
   
- ### 회원가입 기능
  <details markdown="1">
  <summary>접기/펼치기</summary>

  ### 1-1. 회원가입 <br>
  <img width="40%" src="https://user-images.githubusercontent.com/110653581/224271664-c08fe935-c250-485c-9686-ee3a1d54458e.png"/>
  <img width="40%" src="https://user-images.githubusercontent.com/110653581/224271687-82978d78-ffff-4ca6-9400-bedd8d3658ba.png"/><br>
  
  - 구매자, 판매자에 따라 회원가입 양식이 다름<br>
  - 판매자의 경우 농장 인증 사진을 첨부하여 관리자의 승인을 받아야 가입 가능<br>
  - 코드
    - [Controller](https://github.com/97siwon/FarmFarm/blob/main/FarmFarm/src/main/java/edu/kh/farmfarm/member/controller/MemberController.java#L157)

    - [Service](https://github.com/97siwon/FarmFarm/blob/main/FarmFarm/src/main/java/edu/kh/farmfarm/member/model/service/MemberServiceImpl.java#L60)  
  ### 1-2. 회원가입 유효성 검사 <br>
  <img width="40%" src="https://user-images.githubusercontent.com/110653581/224277641-1ad061e9-1337-4879-93df-d4dd0ffac39f.png"/><br>
  - 아이디, 비밀번호, 이름, 닉네임, 주소, 전화번호 인증 유효성 검사<br>
  - 코드
    - [JS](https://github.com/97siwon/FarmFarm/blob/main/FarmFarm/src/main/webapp/resources/js/member/signUp.js#L75)
  ### 1-3. 주소 API <br>
  - 코드
    - [JS](https://github.com/97siwon/FarmFarm/blob/main/FarmFarm/src/main/webapp/resources/js/member/signUp.js#L42)
  ### 1-4. CoolSMS API <br>
  - 코드
    - [JS](https://github.com/97siwon/FarmFarm/blob/main/FarmFarm/src/main/webapp/WEB-INF/views/member/signUp0.jsp#L171)
  </details>
- ### 레시피 API 기능
  <details markdown="1">
  <summary>접기/펼치기</summary>
  <img width="50%" src="https://user-images.githubusercontent.com/110653581/224279515-ad6c40f1-d415-4e9a-b0b8-7d9d0a986b23.png"/><br>
  
  - 공공데이터 중 "농식품 식단관리(메뉴젠) 음식, 재료, 조리 및 이미지 정보" API를 이용하여 레시피 목록을 불러옴<br>
  - 많은 정보 중 음식 번호, 이미지, 이름, 조리법만 출력<br>
  - 비동기 페이지네이션 구현<br>
  - 코드
    - [Controller](https://github.com/97siwon/FarmFarm/blob/main/FarmFarm/src/main/java/edu/kh/farmfarm/api/controller/APIController.java#L22)
    - [Service](https://github.com/97siwon/FarmFarm/blob/main/FarmFarm/src/main/java/edu/kh/farmfarm/api/service/APIServiceImpl.java#L48)
    - [JSP](https://github.com/97siwon/FarmFarm/blob/main/FarmFarm/src/main/webapp/WEB-INF/views/recipe/recipe.jsp#L29)
  <br>
  </details>
<br>

