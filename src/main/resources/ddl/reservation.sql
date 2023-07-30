CREATE TABLE reservation_table (
  reservation_id NUMBER PRIMARY KEY, --���� ���̵�
  reservation_day DATE, --���� ��¥
  store_id NUMBER, --���� ���̵�
  store_name varchar2(200),
  pass_id NUMBER, --�̿�� ���̵�
  user_id VARCHAR2(200), --ȸ�� ���̵�
  seat_id NUMBER, --�¼� ���̵�
  use_time NUMBER, --���ð�
  constraint reservation_store_fk FOREIGN KEY (store_id) REFERENCES store_table(store_id) on delete set null,
  constraint reservation_user_fk FOREIGN KEY (user_id) REFERENCES member(user_id) on delete set null,
  constraint rservation_pass_fk FOREIGN KEY (pass_id) REFERENCES pass_table(pass_id) on delete set null
);

alter table seat add constraint seat_resrv_fk FOREIGN KEY (reservation_id) REFERENCES reservation_table(reservation_id) on delete set null;

CREATE SEQUENCE reservation_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE;