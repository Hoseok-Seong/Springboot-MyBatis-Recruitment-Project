create table user_tb(
    id int auto_increment primary key,
    username varchar(100) not null unique,
    password varchar not null,
    salt varchar not null,
    name varchar(100) not null,
    email varchar(100) not null,
    contact varchar(100) not null,
    profile longtext,
    created_at timestamp not null
);

create table enterprise_tb(
    id int auto_increment primary key,
    enterprise_name varchar(100) not null unique,
    password varchar not null,
    salt varchar not null,
    address varchar(100) not null,
    contact varchar(100) not null,
    email varchar(100) not null,
    sector varchar(100) not null,
    size varchar(100) not null,
    created_at timestamp not null
);

create table recruitment_post_tb(
    id int auto_increment primary key,
    enterprise_id int not null,
    title varchar(100) not null,
    career varchar(100) not null,
    education varchar(100) not null,
    pay varchar(100) not null,
    sector varchar(100) not null,
    position varchar(100) not null,
    address varchar(100) not null,
    content longtext not null,
    enterprise_logo varchar(100),
    created_at timestamp not null
);

create table resume_tb(
    id int auto_increment primary key,
    user_id int not null,
    title longtext not null,
    content longtext not null,
    career longtext not null,
    education longtext not null,
    skill longtext not null,
    award longtext not null,
    language longtext not null,
    link longtext not null,
    file longtext,
    birthdate longtext not null,
    address longtext not null,
    finish boolean not null,
    created_at timestamp not null
);

create table bookmark_tb(
    id int auto_increment primary key,
    user_id int not null unique,
    enterprise_id int not null unique,    
    count int not null,
    created_at timestamp not null
);

create table like_tb(
    id int auto_increment primary key,
    user_id int not null unique,
    recruitment_id int not null unique,    
    count int not null,
    created_at timestamp not null
);

create table apply_tb(
    id int auto_increment primary key,
    user_id int not null,
    enterprise_id int not null,
    recruitment_post_id int not null,
    sector varchar(100),
    resume_id int not null,
    created_at timestamp not null
);

create table apply_resume_tb(
    id int auto_increment primary key,
    user_id int not null,
    title longtext not null,
    content longtext not null,
    career longtext not null,
    education longtext not null,
    skill longtext not null,
    award longtext not null,
    language longtext not null,
    link longtext not null,
    file longtext,
    birthdate longtext not null,
    address longtext not null,
    created_at timestamp not null
);