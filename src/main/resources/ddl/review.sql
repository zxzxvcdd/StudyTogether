
CREATE TABLE review (
review_id NUMBER CONSTRAINT review_id_pk PRIMARY KEY,
review_date DATE,
branch_office_id NUMBER,
CONSTRAINT fk_branch_office_id_review FOREIGN KEY (branch_office_id) REFERENCES branch_office(branch_office_id),
branch_office_name VARCHAR(200),
CONSTRAINT fk_branch_office_name_review FOREIGN KEY (branch_office_name) REFERENCES branch_office(branch_office_name),
user_id VARCHAR(200),
CONSTRAINT fk_user_id_review FOREIGN KEY (user_id) REFERENCES member(user_id),
review_content VARCHAR(4000),
review_filename VARCHAR(200),
review_star NUMBER,
CONSTRAINT chk_review_star CHECK (review_star >=0 AND review_star <=5),
review_good NUMBER,
ref NUMBER,
re_step NUMBER
);


CREATE SEQUENCE review_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1 
MAXVALUE 999 
NOCYCLE 
NOCACHE;

