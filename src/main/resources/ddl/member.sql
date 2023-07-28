create table member(
    user_id varchar(200) CONSTRAINT mem_id_pk PRIMARY KEY,
    user_pw varchar(200) not null,
    user_name varchar(200) not null,
    user_email varchar(200),
    user_tel varchar(200),
    user_gender varchar(2) NOT NULL ,
   CONSTRAINT mem_gender_ck check(user_gender IN('M', 'F')),
    user_birthday date,
    user_grant varchar(10) default 'user' ,
   CONSTRAINT mem_grant_ck check(user_grant IN('user', 'admin', 'manager'))
);

$2a$10$tItEOaCwzjJ.OZ4J6RJppOXBsUyEBxBy3kb1gEF9nzy4um397wBTe