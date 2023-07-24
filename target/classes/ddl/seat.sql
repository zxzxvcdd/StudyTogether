-- 지점 좌석 테이블 생성
CREATE TABLE seat (
  seat_id NUMBER PRIMARY KEY,
  seat_name VARCHAR2(200),
  branch_office_id NUMBER,
  user_id VARCHAR2(200),
  entrance VARCHAR2(2), --입실여부,자리 활성 비활성 체크
  x NUMBER,
  y NUMBER,
  CONSTRAINT seat_ck CHECK(entrance IN('Y','N','D')), --'Y'입실, 'N'퇴실, 'D'비활성
  FOREIGN KEY (branchoffice_id) REFERENCES branch_office(branch_office_id),
  FOREIGN KEY (user_id) REFERENCES member(user_id)
);

CREATE SEQUENCE seat
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       NOORDER;
