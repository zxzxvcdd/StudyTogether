-- 지점 좌석 테이블 생성
CREATE TABLE seat (
  seat_id NUMBER PRIMARY KEY, --좌석 아이디
  seat_name VARCHAR2(200), --좌석이름
  store_id NUMBER, --지점 아이디
  user_id VARCHAR2(200), --회원 아이디
  seat_type VARCHAR2(2), --좌석판별(입실,퇴실,비활성,활성)
  x NUMBER,
  y NUMBER,
  CONSTRAINT seat_ck CHECK(seat_type IN('Y','N','D','A')), --'Y'입실,'N'퇴실,'D'비활성,'A'활성
  constraint seat_store_fk FOREIGN KEY (store_id) REFERENCES store_table(store_id),
  constraint seat_user_fk FOREIGN KEY (user_id) REFERENCES member(user_id)
);

CREATE SEQUENCE seat_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE;