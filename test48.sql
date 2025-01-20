--


--���̺�
/*
CREATE TABLE replyBoard(
	no NUMBER,
	name VARCHAR2(2000) CONSTRAINT rb_name_nn NOT NULL,
	subject VARCHAR2(200) CONSTRAINT rb_sub_nn NOT NULL,
	content CLOB CONSTRAINT rb_cont_nn NOT NULL,
	pwd VARCHAR2(10) CONSTRAINT rb_pwd_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	group_id NUMBER,
	group_step NUMBER DEFAULT 0,
	group_tab NUMBER DEFAULT 0,
	root NUMBER DEFAULT 0,
	depth NUMBER DEFAULT 0,
	CONSTRAINT rb_no_pk PRIMARY KEY(no)
);
*/

/*
	-----------------------------------------
	group_id : �亯���� �����ִ� ����
	group_step : �亯�ȿ��� ��� ����
	group_tab : �亯 / �亯�� �亯 => 
	------------------------------------------ �亯 ��¿�
	root : �亯 ���
	depth : �亯 ����
	------------------------------------------ ������
					no 	group_id	group_step		group_tab root depth
	AAAAA			1		1		0			0	0	2
		=> BBBBB		2		1		1			1	1	1
		=> CCCCC		3		1		2			2	2	0
		=> DDDDD	4		1		3			1	1	0
	EEEEE			5		2		0			0	0	1
		=> KKKKK		6		2		1			1	5	0

	=> �亯 / ���� => SQL���� 4��
		=> SQL���� 4��
	--------------------------------------- �ϰ�ó�� : Ʈ�����
*/

/*
CREATE SEQUENCE rb_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
	
INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'ȫ�浿','�亯�� �Խ���(DML)',
	'�亯�� �Խ���(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));
COMMIT;

*/
INSERT INTO replyBoard(no, name, subject, content, pwd, group_id, group_step, group_tab)
VALUES(rb_no_seq.nextval,'��û��','�亯 �ø��ϴ�',
	'�亯�� �Խ����� ��� = SQL���� �ۼ�= Ʈ�����','5678',
	10, 1,1);
INSERT INTO replyBoard(no, name, subject, content, pwd, group_id, group_step, group_tab)
VALUES(rb_no_seq.nextval,'��û��','�亯 �ø��ϴ�',
	'�亯�� �Խ����� ��� = SQL���� �ۼ�= Ʈ�����','5678',
	10, 2,2);
COMMIT;
