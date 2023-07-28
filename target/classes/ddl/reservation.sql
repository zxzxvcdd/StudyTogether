--��������
CREATE TABLE reservation_table (
  reservation_id NUMBER PRIMARY KEY, --���� ���̵�
  reservation_day DATE, --���� ��¥
  store_id NUMBER, --���� ���̵�
  pass_id NUMBER, --�̿�� ���̵�
  user_id VARCHAR2(200), --ȸ�� ���̵�
  seat_id NUMBER, --�¼� ���̵�
  use_time NUMBER, --���ð�
  constraint reservation_store_fk FOREIGN KEY (store_id) REFERENCES store_table(store_id) on delete cascade,
  constraint reservation_pass_fk FOREIGN KEY (pass_id) REFERENCES pass_table(pass_id) on delete cascade,
  constraint reservation_user_fk FOREIGN KEY (user_id) REFERENCES member(user_id) on delete cascade,
  constraint reservation_seat_fk FOREIGN KEY (seat_id) REFERENCES seat(seat_id) on delete cascade
);

CREATE SEQUENCE reservation_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE;