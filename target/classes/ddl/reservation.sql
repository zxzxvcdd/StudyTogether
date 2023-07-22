--예약정보
CREATE TABLE reservation_table (
  reservation_id NUMBER PRIMARY KEY, --예약 아이디
  reservation_day DATE, --예약 날짜
  store_id NUMBER, --지점 아이디
  pass_id NUMBER, --이용권 아이디
  user_id VARCHAR2(200), --회원 아이디
  seat_id NUMBER, --좌석 아이디
  useTime NUMBER, --사용시간
  constraint reservation_store_fk FOREIGN KEY (store_id) REFERENCES store_table(store_id),
  constraint reservation_pass_fk FOREIGN KEY (pass_id) REFERENCES pass_table(pass_id),
  constraint reservation_user_fk FOREIGN KEY (user_id) REFERENCES member(user_id),
  constraint reservation_seat_fk FOREIGN KEY (seat_id) REFERENCES seat(seat_id)
);

CREATE SEQUENCE reservation_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE;