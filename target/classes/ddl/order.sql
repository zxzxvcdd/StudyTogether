
create table order_table(
order_id number constraint order_id_pk primary key
,user_id varchar2(200)
,order_name varchar2(200) 
,order_price number 
,order_date DATE DEFAULT SYSDATE
, constraint oder_user_fk foreign key (user_id) references meber(user_id)
, 
)

create sequence order_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
NOCYCLE 
NOCACHE;
