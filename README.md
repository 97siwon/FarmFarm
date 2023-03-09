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
- 서도은 -로그인, 회원가입, 아이디,비밀번호 찾기, 모달창, 모임가입,탈퇴
- 신보경 -
- 신충영 -관리자 페이지, 신고 처리, 접수, 일정 기능 
- 이시원 -모임 찾기 검색 기능, 가입X 모임 조회, 카테고리별 모임 조회
- 이은지 -
- 정현재 -모임 생성, 게시글 조회, 작성, 댓글, 앨범 사진 불러오기<br><br>
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
<details markdown="1">
<summary>접기/펼치기</summary>

### 1. 모임 찾기 페이지<br>
<img width="50%" src="https://user-images.githubusercontent.com/110653581/223965275-a06bc621-d33a-4f99-a003-0a4c7d38c096.png"/>
<br>
<br>

### 1-1. 카테고리 별 모임<br>
<img width="50%" src="https://user-images.githubusercontent.com/110653581/223965549-2f7e511a-0e05-444c-94ee-063351748889.png"/><br>
- 원하는 카테고리 선택 시 해당 카테고리 모임 추천 페이지로 이동<br>
- 가나다 순으로 조회<br>
- 코드
  - [Controller](https://github.com/97siwon/bondProject/blob/f14332b1052756e5bb7b00ac9d012269103a4910/Bond/src/main/java/kh/semi/project/member/controller/findBondController.java#L36)

### 1-2. 모임 검색<br>
<img width="50%" src="https://user-images.githubusercontent.com/110653581/223965575-5e9dee7e-042e-4c7a-86fa-1b85acfee249.png"/><br>
- 본드 이름, 소개글이 포함된 단어 검색 시 검색 결과 화면으로 이동<br>
- 코드
  - [Controller](https://github.com/97siwon/bondProject/blob/main/Bond/src/main/java/kh/semi/project/member/controller/SearchController.java#L29)
  - [Sevice](https://github.com/97siwon/bondProject/blob/main/Bond/src/main/java/kh/semi/project/member/model/service/SearchServiceImpl.java#L20)
<br>
</details>
<br>
<h2>💣 트러블 슈팅</h2>
<h3> DB 전체 삭제</h3>
<blockquote> 학원에서 DB 서버를 업데이트하던 중 전체 DB 서버가 날라간 문제.
저희 팀은 DB 테이블을 따로 만들어두었고 팀원 각자 SQL문을 저장해놓았기 때문에 크게 영향을 받지는 않았습니다.
최근에 만든 테이블이나 수정하던 테이블들만 복구 작업이 필요했습니다.
그 후로 전체 DB를 백업하였고 또 DB가 날라가거나 서버가 마비되었을 때 아무 문제 없이 개발을 진행할 수 있었습니다.
이와 같은 경험으로 백업이 얼마나 중요한지에 대해 깨달을 수 있는 경험이었습니다.
</blockquote>
