
create table order_table(
order_id number constraint order_id_pk primary key
,imp_uid varchar2(200) unique not null
,user_id varchar2(200)
,order_state varchar2(200)
,order_name varchar2(200) 
,order_price number 
,order_date DATE DEFAULT SYSDATE
, constraint oder_user_fk foreign key (user_id) references meber(user_id)
, constraint pass_type_ck check(pass_type in('PAID','REFUNDED'))
)

create sequence order_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
NOCYCLE 
NOCACHE;
