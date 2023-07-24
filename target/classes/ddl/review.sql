

CREATE TABLE review (
review_id NUMBER CONSTRAINT review_id_pk PRIMARY KEY
, review_date DATE
, store_id NUMBER
, store_name VARCHAR(200)
, user_id VARCHAR(200)
, review_content VARCHAR(4000)
, review_filename VARCHAR(200)
, review_star NUMBER
, review_good NUMBER
, ref NUMBER
, re_step NUMBER
, CONSTRAINT review_store_id_fk FOREIGN KEY (store_id) REFERENCES store_table(store_id)
, CONSTRAINT review_store_name_fk FOREIGN KEY (store_name) REFERENCES store_table(store_name)
, CONSTRAINT review_user_id_fk FOREIGN KEY (user_id) REFERENCES member(user_id)
, CONSTRAINT review_star_chk CHECK (review_star >=0 AND review_star <=5)
);

CREATE SEQUENCE review_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
MAXVALUE 999 
NOCYCLE 
NOCACHE;