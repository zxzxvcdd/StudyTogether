-- 문의게시판

CREATE TABLE board (
board_id NUMBER CONSTRAINT board_id_pk PRIMARY KEY
, user_id VARCHAR(200)
, title VARCHAR(200)
, content VARCHAR(200)
, writer VARCHAR(200)
, indate DATE
, count NUMBER
--, board_filename VARCHAR(200)
, boardGroup NUMBER
, boardSequence NUMBER
, boardLevel NUMBER
, boardAvailable NUMBER
, CONSTRAINT fk_user_id_board FOREIGN KEY (user_id) REFERENCES member(user_id)
);
CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
MAXVALUE 999 
NOCYCLE 
NOCACHE;
