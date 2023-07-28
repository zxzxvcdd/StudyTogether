-- ���� �¼� ���̺� ����
CREATE TABLE seat (
  seat_id NUMBER PRIMARY KEY,
  reservation_id NUMBER, --�¼� ���̵�
  seat_name VARCHAR2(200), --�¼��̸�
  store_id NUMBER, --���� ���̵�
  user_id VARCHAR2(200), --ȸ�� ���̵�
  seat_type VARCHAR2(2), --�¼��Ǻ�(�Խ�,���,��Ȱ��,Ȱ��)
  x NUMBER,
  y NUMBER,
  CONSTRAINT seat_ck CHECK(seat_type IN('Y','N','D','A')), --'Y'�Խ�,'N'���,'D'��Ȱ��,'A'Ȱ��
  constraint seat_store_fk FOREIGN KEY (store_id) REFERENCES store_table(store_id) on delete cascade ,
  constraint seat_user_fk FOREIGN KEY (user_id) REFERENCES member(user_id) on delete cascade ,
  constraint seat_reserv_fk FOREIGN KEY (reservation_id) REFERENCES reservation_table(reservation_id) on delete cascade
);

CREATE SEQUENCE seat_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE;