
create table chat_room_table(

chat_room_id number
,chat_room_title varchar2(200)
,chat_room_comment varchar2(200)
,chat_room_goal varchar2(200)
,chat_room_max number
,chat_room_category number
,chat_room_img varchar2(200)
,chat_room_state varchar2(200)
,user_id varchar2(200)
,exit_opt number
,exit_ck varchar2(5)
,chat_room_date Date
);


create sequence chat_room_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1 
NOCYCLE 
NOCACHE;


