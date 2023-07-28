create table menu_table(

menu_id number constraint menu_id_pk primary key
, menu_name varchar2(200)
, pass_type varchar2(200)
, pass_time number
, pass_price number
, constraint menu_type_ck check(pass_type in('TIME','SEASON'))
, constraint menu_uk unique (menu_name)
);

create sequence menu_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
NOCYCLE 
NOCACHE;
