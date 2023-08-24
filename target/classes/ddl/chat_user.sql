
create table chat_user_table(

chat_room_id number
,user_id varchar2(200)
,room_auth varchar2(10)
,chat_user_stamp Date

);


create sequence chat_user_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1 
NOCYCLE 
NOCACHE;


