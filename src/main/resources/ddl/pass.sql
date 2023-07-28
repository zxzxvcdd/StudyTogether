

create table pass_table(

pass_id number constraint pass_id_pk primary key
, order_id number
, menu_id number
, user_id number
, pass_type varchar2(200)
, pass_time number
, pass_start date
, pass_end date
, pass_price number
, pass_name varchar2(200)
, pass_state varchar2(200)
, constraint pass_user_fk foreign key (user_id) references member(user_id)
, constraint pass_order_fk foreign key (order_id) references order_table(order_id)
, constraint pass_order_fk foreign key (menu_id) references menu_table(menu_id)
, constraint pass_type_ck check(pass_type in('TIME','SEASON'))
, constraint pass_state_ck check(pass_state in('DEACTIVE','ACTIVE','EXPIRED'))
,

)

create sequence pass_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
NOCYCLE 
NOCACHE;
