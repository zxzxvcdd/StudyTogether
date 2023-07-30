
CREATE TABLE review (
review_id NUMBER CONSTRAINT review_id_pk PRIMARY KEY
, user_id VARCHAR(200)
, store_id NUMBER
, store_name VARCHAR(200)
, reservation_id number
, review_date DATE
, review_content VARCHAR(4000)
, review_filename VARCHAR(200)
, review_star NUMBER
, CONSTRAINT review_store_id_fk FOREIGN KEY (store_id) REFERENCES store_table(store_id)
, CONSTRAINT review_store_name_fk FOREIGN KEY (store_name) REFERENCES store_table(store_name)
, CONSTRAINT review_user_id_fk FOREIGN KEY (user_id) REFERENCES member(user_id)
, CONSTRAINT review_reserv_id_fk FOREIGN KEY (reservation_id) REFERENCES reservation_table(reservation_id)
);
CREATE SEQUENCE review_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
MAXVALUE 999 
NOCYCLE 
NOCACHE;