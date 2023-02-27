insert into user_tb(username, password, salt, name, email, contact, created_at) values('ssar', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '동식', 'ssar@nate.com', '01011112222', now());
insert into user_tb(username, password, salt, name, email, contact, created_at) values('cos', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', 'cos@nate.com', '01022223333', now());

insert into enterprise_tb(enterprise_name, password, salt, address, contact, image, email, sector, size, created_at) values('ssar', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', '1', '1', '1', '1', '1', now());
insert into enterprise_tb(enterprise_name, password, salt, address, contact, image, email, sector, size, created_at) values('cos', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', '1', '1', '1', '1', '1', now());

insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  
values('1', 
'개발 친화적 커뮤니케이션으로 주간 개발 목표 달성률 50%P 향상', 
'게임 커뮤니티를 둘러보던 중, 같이 게임을 할 팀원을 구하는 팀원 모집 게시판을 발견했습니다. 원하는 팀원의 역할군과 플레이 가능 시간대 등을 게시판에 글로 써서 팀원을 구하는 것이 굉장히 불편해 보였습니다. 게시글의 총 개수를 취합해봤더니 하루 평균 약 4,000~5,000개의 팀원 모 집 글이 게시되고 있었습니다. 하지만, 이후 조사를 통해 국내에는 이들을 연결해주는 서비스가 거의 없다는 사실을 알게 되었습니다. 저는 국내 게이머들을 위한 팀원 매칭 서비스를 직접 만들고자 네이버 카페에서 개발자, 디자이너, 기획자를 모집해 총 4명의 팀원과 프로젝트팀을 구성했습니다. 저는 프로젝트 팀장으로서 사업 계획 수립 및 서비스 기획 관련 업무 총괄 그리고 기획 팀과 개발팀의 의견을 조율하는 역할을 담당했습니다. 프로젝트 초반 당시, 개발팀에 업무가 과도 하게 편중되는 문제에 직면했습니다. 글만 가득한 기획안을 보고 개발팀이 내용을 이해하는데 너 무 많은 시간과 노력이 소모되는 것이 주원인이었습니다. 이를 해결하기 위해, 개발팀이 기획 내 용을 직관적으로 이해할 수 있도록 기획 내용을 이미지 형태로 시각화하고 더 나아가 내용의 이 해를 돕기 위한 참고 이미지도 기획안에 첨부하였습니다. 또한, 개발팀 회의에도 항상 참여하여 서비스 기획 방향과 개발 및 구현 방식을 의논하고 공유함으로써 개발팀과 더욱 적극적인 업무 협력을 진행하였습니다. 이러한 노력 덕에 개발팀이 기획 내용 이해에 소비하는 시간과 노력이 크게 감소하였고 주간 개발 목표 달성률을 30%에서 80%로 향상함으로써 업무 효율성을 높일 수 있었습니다. 이를 통해 교내 우수창업동아리 선정 및 18대 1의 경쟁률을 뚫고 교내 창업경진대회 결선 진출 성공이라는 성과도 거두었습니다. 개발자 및 디자이너와의 1년간의 협업 경험을 통해 효율적인 협업의 시작은 정보를 전달 받는 상대방이 더 쉽게 이해할 수 있는 방법을 고민하는 것이라는 사실을 깨달았습니다.', 
'신입', 
'서울 4년', 
'ReactJS, Typescript, Zustand, AWS', 
'없음', 
'토익 880', 
'https://github.com/InSeong-So/IT-Note', 
'', 
'1990.01.30', 
'경남 창원시 진해구 두동서로 33', 
true, 
now()); 

insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  
values('1',
'온라인 쇼핑 플랫폼에 화장품 소비자의 니즈를 반영하다', 
'OOO쇼핑사와의 산학협력 프로젝트를 수행하며 화장품/미용 카테고리의 20대 사용자 유치를 위한 서비스 개선 방안을 기획했습니다. 그 과정에서 화장품 소비자들의 구매 패턴과 소비 트렌드를 분석하고, 서비스에 적용하는 방법을 배웠습니다. 특히 소비자들이 화장품을 탐색할 때 피부 특성, 제품 기능 등을 기준으로 리뷰를 선별해 참고하려는 니즈가 있음을 고객 인터뷰를 통해 확인했습니다. 이러한 인사이트를 바탕으로 리뷰의 유효한 키워드를 추출해 검색과 추천에 활용하여 폭넓은 탐색을 돕는 솔루션을 직접 기획했습니다. 그 결과 필요하면서도 적용 가능할 정도로 현실성 있는 기획안이었다는 현직자분들의 피드백을 받았습니다. 그 외에도 재구매 패턴이나 연령대 등에 따라 선호하는 제품 추천 기능이 달라지는 경향 등을 분석하며 맞춤형 서비스 구현에 필요한 화장품 소비자들의 다양한 니즈를 이해했습니다.', 
'신입', 
'서울 4년', 
'React, VueJS, CSS, Node.js, AWS', 
'없음', 
'토익 880', 
'https://github.com/InSeong-So/IT-Note', 
'', 
'1990.01.30', 
'경남 창원시 진해구 두동서로 33', 
true, 
now()); 

insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  
values('1',
'데이터 기반으로 기획한 프로모션을 통해 230만원 매출 달성', 
'마케팅 콘텐츠 관리에는 노출, 유입률 등 데이터를 분석하고 이를 바탕으로 개선해 나갈 수 있어야 한다고 생각합니다. 마케팅 인턴십에서 고객 데이터를 분석하고 문제를 해결하는 경험을 통해 이러한 역량을 길렀습니다. 서비스의 신규고객 구매전환율을 개선해야 하는 프로젝트을 배정 받은 후 구글 애널리틱스 등을 활용해 여러 관점으로 고객의 행동 패턴을 분석했습니다. 그리고 평균 객단가를 산출해 이를 기반으로 첫 구매 마일리지를 지급하는 프로모션을 기획했습니다. 프로모션 홍보 이메일 및 SMS 내 링크에 태그를 삽입하여 유입 고객의 데이터를 수집했고, 고객의 데이터베이스를 엑셀에 연결해 객단가, 가입 시기 등을 실시간으로 추적했습니다. 이를 분석해 신규고객에 대한 인사이트를 도출하고 추가적인 마케팅 방안을 기획해 주간 회의에서 발표한 결과, 높은 성과와 지속적으로 활용 가능한 마케팅 사례를 남긴 노력을 인정받아 해당 인턴십의 직무 우수자로 선정되었습니다.', 
'신입', 
'서울 4년', 
'React, VueJS, CSS, Node.js, AWS', 
'없음', 
'토익 880', 
'https://github.com/InSeong-So/IT-Note', 
'', 
'1990.01.30', 
'경남 창원시 진해구 두동서로 33', 
true, 
now()); 

insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  
values('2',
'소통의 오류를 문화의 이해로 해결하다', 
'대학생 시절, 일본인 교환학생과 토론 동아리 활동을 한 경험이 있습니다. 매주 진행하는 토론에서 일본인 학생의 참여율이 저조해졌습니다. 토론의 특성 상 서로의 의견을 피력하고 설득하는 과정에서 감정이 격양되는 점이 부담이 될 것이라고 추측했습니다. 직설적인 표현보다는 돌려 말하는 것이 문화인 일본인에게 토론의 열기는 오히려 부담될 것으로 생각했습니다. 그리하여 문제를 해결하기 위해 먼저 언어적으로 서로를 이해할 수 있는 시간을 가졌습니다. 한글이 익숙하지 않은 학생에게 한국어 교재와 드라마를 추천하며 유대감을 쌓아갔습니다. 또한, 점심으로 일본 음식을 먹고 일어를 배우면서 그들의 문화를 이해하고 존중하는 시간을 가졌습니다. 동아리 활동이 끝나고 일본인 학생은 타지에서 온 자신을 이해하고 배려하려는 태도에 감동을 하여 자신의 집에 놀러 올 것을 권유하면서 고국으로 돌아갔습니다.

이 경험을 통해 갈등의 원인이 문화의 차이임을 인정하고 서로의 문화를 존중하고 배려하는 마음만 있다면 어떤 문화의 사람이든 함께 즐길 수 있다는 것을 깨달았습니다.', 
'신입', 
'부산대학교', 
'React, VueJS, CSS, Node.js, AWS', 
'수상 1회', 
'토익 770, 오픽 AL', 
'https://github.com/jungilhan/awesome-blogs-android', 
'', 
'1996.05.25', 
'서울시 강남구 삼성로95길 6', 
true, 
now()); 

insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  
values('2',
'할 수 있다는 믿음으로 달성한 첫 수상', 
'대학생 시절, 저는 AI 개발을 공부해보자는 다짐을 가지고 수상을 목표로 대회에 출전하였습니다. AI 알고리즘 코드를 짜본 경험이 없었기 때문에 대회 진행에 어려움을 겪었습니다. 그리하여 AI 개발에 능숙하신 교수님과 선배님들에게 이메일을 보내 적극적으로 도움을 요청하였습니다. 또한, 대회와 관련된 교내의 모든 AI 서적과 깃헙의 코드를 공부하면서 코드를 완성하였습니다. 하지만 수상을 목표로 출전한 대회에서는 입상도 하지 못하였습니다. 하지만 실패에 낙담하지 않고 뭐든지 할 수 있다는 믿음으로 대회에 다시 출전하였습니다. 팀원을 모아 다양한 시각을 통해 문제를 극복하고, 정기적으로 교수님에게 첨삭을 받으면서 프로젝트의 방향성이 맞는 지를 확인했습니다. 1년 동안 같은 데이터로 꾸준히 연구한 결과를 논문으로 구체화하였고, 그 결과 대회에서 최우수상을 받을 수 있었습니다. 1년의 프로젝트에서 지치지 않고 좋은 성과를 만들어낸 경험을 토대로 SK텔레콤에서 추진력을 발휘하여 최고의 결과를 낼 수 있도록 기여하고 싶습니다.', 
'신입', 
'부산대학교', 
'ReactJS, Typescript, Zustand, AWS', 
'수상 1회', 
'토익 770, 오픽 AL', 
'https://github.com/jungilhan/awesome-blogs-android', 
'', 
'1996.05.25', 
'서울시 강남구 삼성로95길 6', 
false, 
now()); 

insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  
values('2',
'가장 단순한 해결 방법을 통해 효율적인 결과를 도출하다', 
'전선 탐지 알고리즘 제작 프로젝트를 진행할 당시, AI 알고리즘이 촬영한 사진의 빛 번짐으로 인해 전선을 제대로 탐지하지 못하는 문제가 발생했습니다. 이를 해결하기 위한 회의 과정에서 빛 번짐을 제거할 수 있는 코드를 적용하여 데이터를 전처리 하자는 의견이 나왔습니다. 하지만 촬영한 데이터를 후처리하는 방식보다는 촬영 시에 빛 번짐이 덜한 종이를 뒤에 받쳐 찍으면 더 단순한 방식으로 문제를 해결할 수 있다고 생각했습니다. 그리하여 근처 문구점에서 하드보드지를 사 와서 빛 번짐이 발생하는지 테스트 해본 다음 해당 사진을 근거로 재촬영을 제안했습니다. 결과적으로 물체를 탐지하는 데 걸리는 시간을 최소화할 수 있었고 정확도가 20% 이상 향상 하는 성과를 달성할 수 있었습니다. 또한, 외주사에서 제시한 정확도를 달성하여 프로젝트를 진행할 수 있었습니다. 근본적으로 문제를 해결하려는 마음가짐으로 문제 해결을 위한 가장 효과적이고 단순한 방법을 고안하여 좋은 성과를 낼 수 있었습니다.', 
'신입', 
'부산대학교', 
'ReactJS, Typescript, Zustand, AWS', 
'수상 1회', 
'토익 770, 오픽 AL', 
'https://github.com/jungilhan/awesome-blogs-android', 
'', 
'1996.05.25', 
'서울시 강남구 삼성로95길 6', 
false, 
now()); 


insert into recruitment_post_tb(enterprise_id, title, career, education, pay, sector, position, address, content, enterprise_logo, created_at) values(1,'임시제목1','임시경력1','임시학력1','임시급여1','인력소싱','프론트엔드','임시근무지역1','임시내용1', '/images/coupang.png',now());
insert into recruitment_post_tb(enterprise_id, title, career, education, pay, sector, position, address, content, enterprise_logo, created_at) values(1,'임시제목2','임시경력2','임시학력2','임시급여2','대기업','백엔드','임시근무지역2','임시내용2', '/images/coupang.png',now());
insert into recruitment_post_tb(enterprise_id, title, career, education, pay, sector, position, address, content, enterprise_logo, created_at) values(2,'임시제목3','임시경력3','임시학력3','임시급여3','스타트업','소프트웨어','임시근무지역3','임시내용3', '/images/coupang.png',now());
insert into recruitment_post_tb(enterprise_id, title, career, education, pay, sector, position, address, content, enterprise_logo, created_at) values(2,'임시제목4','임시경력4','임시학력4','임시급여4','서비스','안드로이드','임시근무지역4','임시내용4', '/images/coupang.png',now());

commit;	