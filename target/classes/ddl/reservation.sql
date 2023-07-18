
--예약정보
CREATE TABLE reservation_data (
  reservation_id NUMBER PRIMARY KEY, --예약 아이디
  reservation_day DATE, --예약 날짜
  branch_office_id NUMBER, --지점 아이디
  utilization_id NUMBER, --이용권 아이디
  user_id VARCHAR2(200), --회원 아이디
  seat_id NUMBER, --좌석 아이디
  useTime NUMBER, --사용시간
  FOREIGN KEY (branch_office_id) REFERENCES branch_office(branch_office_id),
  FOREIGN KEY ( utilization_id) REFERENCES 이용권( utilization_id),
  FOREIGN KEY (user_id) REFERENCES member(user_id),
  FOREIGN KEY (seat_id) REFERENCES seat(seat_id)
);

CREATE SEQUENCE reservation_data
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1

       NOCYCLE
       NOCACHE
       NOORDER;