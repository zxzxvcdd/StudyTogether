
create table chat_table(

chat_id number
,chat_room_id number
,user_id varchar2(200)
,chat_content varchar2(200)
,chat_date Date
,chat_state varchar2(200)
,chat_ck_cnt number
,chat_file varchar2(200)
);


create sequence chat_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1 
NOCYCLE 
NOCACHE;


