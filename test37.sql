-- DML ���� => �Խ��� / ���
/*
CREATE TABLE freeboard(
	no NUMBER,
	name VARCHAR2(51) CONSTRAINT fb_name_nn NOT NULL,
	subject VARCHAR2(2000) CONSTRAINT fb_sub_nn NOT NULL,
	content CLOB CONSTRAINT fb_cont_nn NOT NULL,
	pwd VARCHAR2(10) CONSTRAINT fb_pwd_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	CONSTRAINT fb_no_pk PRIMARY KEY(no)
);

CREATE SEQUENCE fb_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;

CREATE TABLE reply(
	no NUMBER, 
	bno NUMBER,
	id VARCHAR2(20),
	name VARCHAR2(51) CONSTRAINT reply_name_nn NOT NULL,
	msg CLOB CONSTRAINT reply_msg NOT NULL, 
	regdate DATE DEFAULT SYSDATE, 
	CONSTRAINT reply_no_pk PRIMARY KEY(no),
	CONSTRAINT reply_bno_fk FOREIGN KEY(bno)
	REFERENCES freeboard(no),
	CONSTRAINT reply_id_fk FOREIGN KEY(id)
	REFERENCES member(id)
);

CREATE SEQUENCE reply_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;

*/

/*
INSERT INTO freeboard(no,name,subject, content, pwd)
VALUES(fb_no_seq.nextval,'ȫ�浿','DML(INSERT,UPDATE,DELETE)',
'������ = C(INSERT)R(SELECT)U(UPDATE)D(DELETE)','1234');
COMMIT;
*/

/*
	4��
		= �����Լ�
			������ �Լ� : ROW����
			 ���� : SUBSTR / INSTR / LENGTH / RPAD
			 ���� : CEIL / ROUND / TRUNC
			 ��¥ : SYSDATE, MONTHS_BETWEEN, ADD_MONTHS
			 ��ȯ : TO_CHAR
			 ��Ÿ : NVL
			�����Լ� : Column���� ó��
			 COUNT() : ROPW ����
			 MIN/MAX 
			 SUM/AVG
			 RANK/DENSE_RANK
		= ��� SubQuery
			SUBQUERY => WHERE => ���ǰ� �б�
				= ������
				= ������
			��Į�� �������� : SELECT �ڿ� => �÷� ��� ���
			�ζ��� �� : FROM�ڿ� => ���̺� ��� ���
		= VIEW
*/