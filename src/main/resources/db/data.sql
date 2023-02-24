insert into user_tb(username, password, salt, name, email, contact, created_at) values('ssar', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '동식', 'ssar@nate.com', '01011112222', now());
insert into user_tb(username, password, salt, name, email, contact, created_at) values('cos', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', 'cos@nate.com', '01022223333', now());

insert into enterprise_tb(enterprise_name, password, salt, address, contact, image, email, sector, size, created_at) values('ssar', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', '1', '1', '1', '1', '1', now());

insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  values('1','제목1', '내용1', '경력1', '학력1', '스킬1', '수상1', '외국어1', '링크1', '', '날짜', '주소1', true, now()); 
insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  values('2','제목2', '내용2', '경력2', '학력2', '스킬2', '수상2', '외국어2', '링크2', '', '날짜', '주소2', true, now()); 
insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  values('3','제목3', '내용3', '경력3', '학력3', '스킬3', '수상3', '외국어3', '링크3', '', '날짜', '주소3', true, now()); 
insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  values('4','제목4', '내용4', '경력4', '학력4', '스킬4', '수상4', '외국어4', '링크4', '', '날짜', '주소4', false, now()); 
insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  values('5','제목5', '내용5', '경력5', '학력5', '스킬5', '수상5', '외국어5', '링크5', '', '날짜', '주소5', false, now()); 
insert into resume_tb(user_id, title, content, career, education, skill, award, language, link, file, birthdate, address, finish, created_at)  values('6','제목6', '내용6', '경력6', '학력6', '스킬6', '수상6', '외국어6', '링크6', '', '날짜', '주소6', false, now());

insert into recruitment_post_tb(enterprise_id, title, career, education, pay, sector, position, address, content, created_at) values(1,'임시제목','임시경력','임시학력','임시급여','임시기업형태','임시희망포지션','임시근무지역','임시내용',now());
insert into recruitment_post_tb(enterprise_id, title, career, education, pay, sector, position, address, content, created_at) values(2,'임시제목2','임시경력2','임시학력2','임시급여2','임시기업형태2','임시희망포지션2','임시근무지역2','임시내용2',now());

commit;