-- 문의게시판

CREATE TABLE board (
board_id NUMBER CONSTRAINT board_id_pk PRIMARY KEY
, user_id VARCHAR(200)
, board_date DATE
, board_title VARCHAR(200)
, board_content VARCHAR(200)
, board_writer VARCHAR(200)
, board_hitup NUMBER
, board_filename VARCHAR(200)
, ref NUMBER
, re_step NUMBER
, re_level NUMBER
, CONSTRAINT fk_user_id_board FOREIGN KEY (user_id) REFERENCES member(user_id) on delete cascade
);

CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
MAXVALUE 999 
NOCYCLE 
NOCACHE;
