--


--테이블
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
	group_id : 답변별로 묶어주는 역할
	group_step : 답변안에서 출력 순서
	group_tab : 답변 / 답변에 답변 => 
	------------------------------------------ 답변 출력용
	root : 답변 대상
	depth : 답변 개수
	------------------------------------------ 삭제용
					no 	group_id	group_step		group_tab root depth
	AAAAA			1		1		0			0	0	2
		=> BBBBB		2		1		1			1	1	1
		=> CCCCC		3		1		2			2	2	0
		=> DDDDD	4		1		3			1	1	0
	EEEEE			5		2		0			0	0	1
		=> KKKKK		6		2		1			1	5	0

	=> 답변 / 삭제 => SQL문장 4개
		=> SQL문장 4개
	--------------------------------------- 일괄처리 : 트랜잭션
*/

/*
CREATE SEQUENCE rb_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
	
INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));

INSERT INTO replyBoard(no, name, subject, content, pwd, group_id)
VALUES(rb_no_seq.nextval,'홍길동','답변형 게시판(DML)',
	'답변형 게시판(DML) = INSERT/UPDATE/DELETE','1234',
	(SELECT NVL(MAX(group_id)+1, 1) FROM replyBoard));
COMMIT;

*/
INSERT INTO replyBoard(no, name, subject, content, pwd, group_id, group_step, group_tab)
VALUES(rb_no_seq.nextval,'심청이','답변 올립니다',
	'답변형 게시판을 사용 = SQL문장 작성= 트랜잭션','5678',
	10, 1,1);
INSERT INTO replyBoard(no, name, subject, content, pwd, group_id, group_step, group_tab)
VALUES(rb_no_seq.nextval,'심청이','답변 올립니다',
	'답변형 게시판을 사용 = SQL문장 작성= 트랜잭션','5678',
	10, 2,2);
COMMIT;
