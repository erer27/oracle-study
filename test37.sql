-- DML 사용법 => 게시판 / 댓글
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
VALUES(fb_no_seq.nextval,'홍길동','DML(INSERT,UPDATE,DELETE)',
'웹개발 = C(INSERT)R(SELECT)U(UPDATE)D(DELETE)','1234');
COMMIT;
*/

/*
	4장
		= 내장함수
			단일행 함수 : ROW단위
			 문자 : SUBSTR / INSTR / LENGTH / RPAD
			 숫자 : CEIL / ROUND / TRUNC
			 날짜 : SYSDATE, MONTHS_BETWEEN, ADD_MONTHS
			 변환 : TO_CHAR
			 기타 : NVL
			집계함수 : Column단위 처리
			 COUNT() : ROPW 개수
			 MIN/MAX 
			 SUM/AVG
			 RANK/DENSE_RANK
		= 고급 SubQuery
			SUBQUERY => WHERE => 조건값 읽기
				= 단일행
				= 다중행
			스칼라 서브쿼리 : SELECT 뒤에 => 컬럼 대신 사용
			인라인 뷰 : FROM뒤에 => 테이블 대신 사용
		= VIEW
*/