<!-- # Springboot-MyBatis-Recruitment-Project -->

# HIGHRE - 개발자를 위한 구인구직 웹사이트
![image](https://user-images.githubusercontent.com/122351733/223630188-a70350c4-3496-4705-bfe3-c031f68d27f3.png)

<br> 

# 소개
>'고용하다'라는 의미의 Hire와 '더 높은'이라는 의미의 Higher를
><br>합쳐 고객들에게 더 좋은 일자리를 제공한다는 의미를 담았습니다

<br> 

# ⏰ 개발 기간
- 2023.02.20~2023.03.10(3주)

<br>

# ⚙️ 기술스택
- 언어: JDK 11
- 백엔드: Springboot 2.7.8
- 프론트엔드: HTML5, CSS3, Javascript, JSP, Bootstrap
- 데이터베이스: 테스트 H2, 프로덕션 MySQL, MyBatis, Redis 세션
- 테스트: Junit
- IDE: Visual Studio Code
- VCS: Github

<br>

# 🖥 아키텍쳐(MVC)

![image](https://user-images.githubusercontent.com/122351733/223648466-ee6ce325-64b3-4f82-888b-5d627e5e55fe.png)

<br>

# 📝 기능정리
## Front-End
- Header, Footer 레이아웃
- 메인, 로그인, 회원가입 페이지
- 이력서 메인, 등록, 목록 보기, 상세 보기 페이지
- 채용공고 리스트, 등록, 상세보기 페이지
- 개인-기업) 정보 수정
- 개인) 마이페이지 - 지원 현황, 매칭 서비스, 북마크
- 기업) 마이페이지 - 지원자 현황, 매칭 서비스, 북마크

<br>

## Back-End
<details>
  <summary>로그인</summary>
  <ul>
  <br>
    <li>로그인 기능</li>
    <li>아이디 중복 체크 및 Password 중복 검사</li>
    <li>비밀번호 HASH256, Salt 암호화</li>
    <li>로그인 시 아이디 기억하기 기능(Cookie)</li>
    <li>로그인 시 최초 접속 페이지 유지하기 기능</li>
  <br>
  </ul>
</details>
<details>
  <summary>회원가입</summary>
  <ul>
  <br>
    <li>회원가입 기능</li>
    <li>회원가입 시 기술스택 선택 기능</li>
    <li>회원정보 수정 기능</li>
  <br>
  </ul>
</details>
<details>
  <summary>이력서</summary>
  <ul>
  <br>
    <li>이력서 등록 기능</li>
    <li>이력서 수정 기능</li>
    <li>이력서 삭제 기능</li>
    <li>이력서 선택해서 채용공고 지원하기, 지원 취소하기 기능</li>
  <br>
  </ul>
</details>
<details>
  <summary>채용공고</summary>
  <ul>
  <br>
    <li>채용공고 등록 기능</li>
    <li>채용공고 수정 기능</li>
    <li>채용공고 삭제 기능</li>
    <li>채용공고 제목, 내용으로 검색 기능</li>
    <li>채용공고 카테고리별 검색 기능</li>
    <li>마감일자 기능</li>
    <li>공고 등록시 기술스택 선택 기능</li>
  <br>
  </ul>
</details>
<details>
  <summary>북마크</summary>
  <ul>
  <br>
    <li>북마크하기 기능</li>
    <li>북마크 취소하기 기능</li>
  <br>
  </ul>
</details>
<details>
  <summary>기업 마이페이지</summary>
  <ul>
  <br>
    <li>나의 기업 정보</li>
    <li>지원자 현황 보기(지원자 개인정보와 이력서 열람 기능)</li>
    <li>지원자 합격/불합격 처리하기(마이페이지 동기화 기능)</li>
    <li>나를 북마크한 회원 보기</li>
    <li>기술스택 기준 구직자 매칭서비스</li>
  <br>
  </ul>
</details>
<details>
  <summary>개인 마이페이지</summary>
  <ul>
  <br>
    <li>나의 회원 정보</li>
    <li>나의 지원 현황 보기/지원 취소하기 기능</li>
    <li>내가 북마크한 기업 보기</li>
    <li>기술스택 기준 기업 매칭서비스</li>
  <br>
  </ul>
</details>
<details>
  <summary>알림 기능</summary>
  <ul>
  <br>
    <li>SSE 통신으로 서류 발표 알림 기능</li>
  <br>
  </ul>
</details>
<details>
  <summary>Redis</summary>
  <ul>
  <br>
    <li>Redis 세션 DB 구현</li>
  <br>
  </ul>
</details>

<br>

# 📺 유저 시나리오
### 기업 회원(로그인, 회원가입)
<img src="https://user-images.githubusercontent.com/93416157/230985545-9b82e983-68b3-4739-a4a6-a97d78c8674f.gif" width="850" height="450" />
<br>

### 개인 회원(로그인, 회원가입)
<img src="https://user-images.githubusercontent.com/93416157/230986580-65207073-ab60-48bd-b88e-441a2c38fdc5.gif" width="850" height="450" />
<br>

### 기업 회원(채용공고 작성)
<img src="https://user-images.githubusercontent.com/93416157/230987060-8f2a89e5-1ee5-4ae6-99a0-60ee1013571e.gif" width="850" height="450" />
<br>

### 개인 회원(이력서 작성)
<img src="https://user-images.githubusercontent.com/93416157/230986807-e82b34a0-f1a0-4f3b-bcc2-1169081fbabf.gif" width="850" height="450" />
<br>

### 개인 회원(이력서 수정)
<img src="https://user-images.githubusercontent.com/93416157/230986800-95190601-fe99-42d7-b820-f7fd1db60448.gif" width="850" height="450" />
<br>

### 개인 회원(지원하기)
<img src="https://user-images.githubusercontent.com/93416157/230986818-6e8443ee-2287-468a-b7a5-6591c627fa11.gif" width="850" height="450" />
<br>

### 기업 회원(마이페이지, 합격/불합격)
<img src="https://user-images.githubusercontent.com/93416157/230986786-dda450a6-4c2a-4095-aa8a-62fe43454f11.gif" width="850" height="450" />
<br>

### 개인 회원(마이페이지, 서류 발표 알림)
<img src="https://user-images.githubusercontent.com/93416157/230986792-d3fadf6f-8203-4f94-bcea-34001132f8eb.gif" width="850" height="450" />
<br>
