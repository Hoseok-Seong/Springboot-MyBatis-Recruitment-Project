<!-- # Springboot-MyBatis-Recruitment-Project -->
# Highre

<h1 align="center">
  <br>
  <br>
  <img width="300" alt="image" src="https://user-images.githubusercontent.com/93416157/235137778-5fedc41e-8e17-4fdf-bd08-887200f946f4.png">
  <br>
  <br>
  <br>
</h1>

# 👨‍👨‍👧 서비스 소개
>'고용하다'라는 의미의 Hire와 '더 높은'이라는 의미의 Higher를
><br>합친 의미를 가진 구인구직 웹사이트 프로젝트입니다

<br>

# 데모영상
[![youtube](http://img.youtube.com/vi/fA5lgoRrtc8/0.jpg)](https://www.youtube.com/watch?v=fA5lgoRrtc8)

<br>

# 발표자료
[미니프로젝트_5조.pdf](https://drive.google.com/file/d/1DezLgt5yquNGs-7O1Q0Ky3qVpvy_B5lX/view?usp=share_link)

<br>

## Contact

|                                                 성호석(팀장)                                                  |                                                 김호현                                                  |                                                                          임지상                                                                          |                                                 심동환                                                  |
| :-----------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/93416157?v=4" alt="profile" width="100" height="100"> | <img src="https://avatars.githubusercontent.com/u/122351733?v=4" alt="profile" width="100" height="100"> | <img src="https://avatars.githubusercontent.com/u/67888405?v=4" alt="profile" width="100" height="100"> | <img src="https://avatars.githubusercontent.com/u/122349890?v=4" alt="profile" width="100" height="100"> |
|                                   [@Hoseok-Seong](https://github.com/Hoseok-Seong)                                   |                                 [@Khohyeon](https://github.com/Khohyeon)                                 |                                                        [@tero1115](https://github.com/tero1115)                                                         |                              [@controller22](https://github.com/controller22)                              |

<br>

# ⏰ 개발 기간
- 2023.02.20~2023.03.10(3주)

<br>

# ⚙️ 기술스택
<img src="https://img.shields.io/badge/JDK-11-007396?style=for-the-badge&logo=java&logoColor=white"><br><img src="https://img.shields.io/badge/Springboot-6DB33F?style=for-the-badge&logo=Springboot&logoColor=white">
<br>
<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"><img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"><img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"><img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"><img src="https://img.shields.io/badge/jsp-F5C300?style=for-the-badge&logo=jsp&logoColor=white"><img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
<br>
<img src="https://img.shields.io/badge/H2-512BD4?style=for-the-badge&logo=H2&logoColor=white"><img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"><img src="https://img.shields.io/badge/MyBatis-색상?style=for-the-badge&logo=MyBatis&logoColor=white"><img src="https://img.shields.io/badge/redis-DC382D?style=for-the-badge&logo=redis&logoColor=white">
<br>
<img src="https://img.shields.io/badge/junit5-25A162?style=for-the-badge&logo=junit5&logoColor=white">
<br>
<img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
<br>
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"><img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">

<br>

# 📋  ERD-Diagram

![erd](https://user-images.githubusercontent.com/93416157/236497375-e2d3e29a-1e19-488d-b4ff-04d0de803732.png)

<br>

# Coding-Convention
<details>
  <summary>Camel Case</summary>
  <ul>
  <br>
    <li>폴더명, 패키지명, 메서드명, 변수명은 첫 단어는 소문자로, 그 뒤는 대문자로</li>
    <li>단어와 단어 사이는 붙이는 것을 원칙으로 함.</li>
    <li>단, 클래스명은 파스칼 표기법으로 함.</li>
  <br>
  </ul>
</details>
<details>
  <summary>주석 규칙</summary>
  <ul>
  <br>
    <li>한줄을 "//"로 적고, 그 이상은 "/* */"로 함.</li>
  <br>
  </ul>
</details>
<details>
  <summary>데이터베이스 명명 규칙</summary>
  <ul>
  <br>
    <li>데이터베이스 명은 영어 소문자로 구성. 대문자는 _로 표현한다.</li>
    <li>테이블은 영어 소문자로 구성, 대문자는 _로 표현한다. 대분류_의미있는 테이블 명 형태로 작성한다.</li>
    <li>컬럼은 영어 소문자로 구성, 대문자는 _로 표현한다. 의미있는 컬럼명_접미사 형태로 작성한다.</li>
    <li>컬럼의 성질을 나타내는 접미사를 사용한다. (사용하는 데이터의 타입을 나타내는 것이 아님에 유의)</li>
    <li>단어는 언더바.</li>
  <br>
  </ul>
</details>
<details>
  <summary>변수명 명명 Recommend</summary>
  <ul>
  <br>
    <li>배열이 들어가는 변수면 마지막에 List.</li>
    <li>통신이 쓰인 변수는 data.</li>
    <li>함수는 동사가 제일 먼저 오고, 뒤에 명사가 붙는다.</li>
  <br>
  </ul>
</details>
<details>
  <summary>CSS 명명 규칙</summary>
  <ul>
  <br>
    <li>소문자_소문자의 형태로 표기.</li>
    <li>부트스트랩이 아닌 직접 만든 CSS는 맨 앞에 my_를 붙인다. (본인이 커스텀한 CSS는 my_이름 영문이니셜 2자_CSS명을 붙인다)</li>
    <li>동사가 제일 먼저 오고 뒤에 명사가 붙는다.</li>
  <br>
  </ul>
</details>

<br>

# 브랜치 전략
<details>
  <summary>Branch 중심 운영</summary>
  <ul>
  <br>
    <li>master - 실제 올라가는 Branch</li>
    <li>develop - 중간 Branch</li>
    <li>topic - 기능 개발용 Branch</li>
  <br>
  </ul>
</details>
<details>
  <summary>Merge 규칙</summary>
  <ul>
  <br>
    <li>Pull Request 날리기</li>
    <li>코드 작성자가 리뷰를 한 후 Merge</li>
  <br>
  </ul>
</details>
<details>
  <summary>Commit Message</summary>
  <ul>
  <br>
    <li>Feat: 새로운 기능 구현</li>
    <li>Refactor: 원래 있던 코드의 수정(기능도 변경될 경우)</li>
    <li>Style: 원래 있던 코드의 수정(기능이 안 변경될 경우)</li>
    <li>Docs: 문서 변경</li>
    <li>Fix: 오류 수정</li>
    <li>Test: 테스트 코드</li>
    <li>한글로 커밋하기. 커밋은 이해하기 편한 단위로 나누기</li>
  <br>
  </ul>
</details>

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
