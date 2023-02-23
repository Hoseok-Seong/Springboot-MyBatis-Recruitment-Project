insert into user_tb(username, password, salt, name, email, contact, created_at) values('ssar', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '동식', 'ssar@nate.com', '01011112222', now());
insert into user_tb(username, password, salt, name, email, contact, created_at) values('cos', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', 'cos@nate.com', '01022223333', now());

insert into enterprise_tb(enterprise_name, password, salt, address, contact, image, email, sector, size, created_at) values('ssar', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', '1', '1', '1', '1', '1', now());
insert into enterprise_tb(enterprise_name, password, salt, address, contact, image, email, sector, size, created_at) values('cos', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', '1', '1', '1', '1', '1', now());

insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('2', '2제목', '2내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('1', '1제목', '1내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('1', '3제목', '3내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('1', '4제목', '4내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('1', '5제목', '5내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('1', '6제목', '6내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('1', '7제목', '7내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('1', '8제목', '8내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('1', '9제목', '9내용', '', '경기도', now());
insert into recruitment_post_tb(enterprise_id, title, content, enterprise_logo, address, created_at) values('2', '10제목', '1내용', '', '경기도', now());

commit;