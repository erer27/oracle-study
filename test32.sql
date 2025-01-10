-- DML (데이터 추가 : INSERT)
-- INSERT ALL
-- 최근에는 사용빈도가 거의 없다
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
-- DML => INSERT / UPDATE / DELTE => 반드시 COMMIT을 이용해서 저장
-- Java에서 INSERT / UPDATE / DELETE 사용하면 AutoCommit
/*
	create table member
	(
		id varchar2(20),
		name varchar2(30),
		address varchar2(100),
		regdate date dafault sysdate
	)
	=> 전체 데이터 저장
		INSERT INTO member VALUES('hong','홍길동','서울',SYSDATE)
				    member(*)
	=> 원하는 데이터 저장 => defalt 적용 
		INSERT INTO member(id,name,address) VALUES('hong','홍길동','서울');
	=> 반드시 => COMMIT을 해야 저장된다
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
	CONSTRAINT mem_sex_ck CHECK(sex IN('남자','여자')),
	CONSTRAINT mem_emaiil_uk UNIQUE(email)
);
*/
-- '' => null   ' '=>  공백 (문자 1개)
-- 데이터 추가
--INSERT INTO member VALUES('hong','1234','홍길동','남자','','00/10/10','서울',SYSDATE);
--COMMIT;
-- shim
--INSERT INTO member VALUES('shim','5678','심청이','여자','','01/11/11','서울',SYSDATE);
--INSERT INTO member VALUES('park','5678','박문수','남자',' ','01/11/11','서울',SYSDATE);
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
VALUES(1,'홍길동','CRUD=DML','DML:데이터 조작언어','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES(2,'홍길동','CRUD=DML','DML:데이터 조작언어','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES(3,'홍길동','CRUD=DML','DML:데이터 조작언어','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES(4,'홍길동','CRUD=DML','DML:데이터 조작언어','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES(5,'홍길동','CRUD=DML','DML:데이터 조작언어','1234');
*/

/*
INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'홍길동','CRUD=DML','DML:데이터 조작언어','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'홍길동','CRUD=DML','DML:데이터 조작언어','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'홍길동','CRUD=DML','DML:데이터 조작언어','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'홍길동','CRUD=DML','DML:데이터 조작언어','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'홍길동','CRUD=DML','DML:데이터 조작언어','1234');

INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'홍길동','CRUD=DML','DML:데이터 조작언어','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'홍길동','CRUD=DML','DML:데이터 조작언어','1234');


INSERT INTO board(no,name,subject, content,pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM board),'홍길동','CRUD=DML','DML:데이터 조작언어','1234');

--NULL값 처리
COMMIT;
*/

TRUNCATE TABLE BOARD;
COMMIT;