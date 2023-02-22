create table user_tb(
    id int auto_increment primary key,
    username varchar(100) not null unique,
    password varchar(100) not null,
    name varchar(100) not null,
    email varchar(100) not null,
    contact varchar(100) not null,
    created_at timestamp not null
);

create table enterprise_tb(
    id int auto_increment primary key,
    enterprise_name varchar(100) not null unique,
    password varchar(100) not null,
    address varchar(100) not null,
    contact varchar(100) not null,
    image longtext not null,
    email varchar(100) not null,
    sector varchar(100) not null,
    size varchar(100) not null,
    created_at timestamp not null
);

create table recruitment_post_tb(
    id int auto_increment primary key,
    enterprise_id int not null unique,
    title varchar(100) not null,
    content varchar(100) not null,
    enterprise_logo longtext not null,
    address varchar(100) not null,
    created_at timestamp not null
);

create table resume_tb(
    id int auto_increment primary key,
    user_id int not null unique,
    title varchar(100) not null,
    content longtext not null,
    profile longtext not null,
    age int not null,
    address varchar(100) not null,
    career varchar(100) not null,
    education varchar(100) not null,
    position varchar(100) not null,
    field varchar(100) not null,
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
    user_id int not null unique,
    enterprise_id int not null unique,
    field varchar(100) not null,
    created_at timestamp not null
);
