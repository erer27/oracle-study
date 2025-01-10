-- DML (������ �߰� : INSERT)
-- INSERT ALL
-- �ֱٿ��� ���󵵰� ���� ����
/*
INSERT ALL
	WHEN deptno=10 THEN
	INTO emp_10 VALUES(empno,ename,job,hiredate,sal)
	WHEN deptno=20 THEN
	INTO emp_20 VALUES(empno,ename,job,hiredate,sal)
	WHEN deptno=30 THEN
	INTO emp_30 VALUES(empno,ename,job,hiredate,sal)
SELECT * FROM emp;
COMMIT;
*/
-- DML => INSERT / UPDATE / DELTE => �ݵ�� COMMIT�� �̿��ؼ� ����
-- Java���� INSERT / UPDATE / DELETE ����ϸ� AutoCommit
/*
	create table member
	(
		id varchar2(20),
		name varchar2(30),
		address varchar2(100),
		regdate date dafault sysdate
	)
	=> ��ü ������ ����
		INSERT INTO member VALUES('hong','ȫ�浿','����',SYSDATE)
				    member(*)
	=> ���ϴ� ������ ���� => defalt ���� 
		INSERT INTO member(id,name,address) VALUES('hong','ȫ�浿','����');
	=> �ݵ�� => COMMIT�� �ؾ� ����ȴ�
*/
/*
CREATE TABLE member(
	id VARCHAR2(20),
	pwd VARCHAR2(10) CONSTRAINT mem_pwd_nn NOT NULL,
	name VARCHAR2(50) CONSTRAINT mem_name_nn NOT NULL,
	sex CHAR(6),
	email VARCHAR2(100),
	birthday DATE CONSTRAINT mem_day_nn NOT NULL,
	address VARCHAR2(100) CONSTRAINT mem_not_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	CONSTRAINT mem_id_pk PRIMARY KEY(id),
	CONSTRAINT mem_sex_ck CHECK(sex IN('����','����')),
	CONSTRAINT mem_emaiil_uk UNIQUE(email)
);
*/
-- '' => null   ' '=>  ���� (���� 1��)
-- ������ �߰�
--INSERT INTO member VALUES('hong','1234','ȫ�浿','����','','00/10/10','����',SYSDATE);
--COMMIT;
-- shim
--INSERT INTO member VALUES('shim','5678','��û��','����','','01/11/11','����',SYSDATE);
--INSERT INTO member VALUES('park','5678','�ڹ���','����',' ','01/11/11','����',SYSDATE);
--COMMIT;

/*
CREATE TABLE board(
	no NUMBER,
	name VARCHAR2(50) CONSTRAINT board_name_nn NOT NULL,
	subject VARCHAR2(2000) CONSTRAINT board_subject_nn NOT NULL,
	content CLOB CONSTRAINT board_content_nn NOT NULL,
	pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	CONSTRAINT board_no_pk PRIMARY KEY(no)
);
*/
/*
INSERT INTO board(no,name,subject, content,pwd)
VALUES(1,'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES(2,'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES(3,'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES(4,'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES(5,'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');
*/

/*
INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'ȫ�浿','CRUD=DML','DML:������ ���۾��','1234');

--NULL�� ó��
COMMIT;
*/

TRUNCATE TABLE BOARD;
COMMIT;