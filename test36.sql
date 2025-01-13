
/*
DROP TABLE 전표상세;
DROP TABLE 제품;
DROP TABLE 판매전표;


CREATE TABLE 판매전표(
	전표번호 VARCHAR2(13),
	판매일자 DATE,	
	고객명 VARCHAR2(51),	
	총액 NUMBER
);


CREATE TABLE 전표상세(
	전표번호 VARCHAR2(13),
	제품번호 VARCHAR2(100),
	수량 NUMBER,
	단가 NUMBER,
	금액 NUMBER
);

CREATE TABLE 제품(
	제품번호 VARCHAR2(13), 
	제품명 VARCHAR2(100),
	제품단가 NUMBER
);

--제약조건 변경(테이블 생성후에 제약조건)
-- PK
ALTER TABLE 판매전표 ADD CONSTRAINT 판매전표_전표번호_pk
PRIMARY KEY(전표번호);

-- NOT NULL
ALTER TABLE 판매전표 MODIFY  판매일자 DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL;

-- NOT NULL => MODIFY, CHECK, PRIMARY, FOREIGN, UNIQUE => ADD

ALTER TABLE 판매전표 MODIFY  고객명 VARCHAR2(51) CONSTRAINT 판매전표_고객명_nn NOT NULL;

ALTER TABLE 판매전표 ADD CONSTRAINT 판매전표_총액_ck CHECK(총액>0);

*/


-- 제약조건 삭제 => FOREIGN
--ALTER TABLE 판매전표 DROP CONSTRAINT 판매전표_총액_ck;
-- 데이터가 존재 => 제약조건을 따로 생성 => 제약조건을 삭제

/*
	제약조건
	1) 약식
		id varchar(20) PRIMARY KEY
		name varchar2(50) NOT NULL
	2) 
		id VARCHAR(20)
		name varchar2(50) NOT NULL,
		PRIMARY KEY(id)

	3) 권장 => 필요시마다 변경이 가능
		id VARCHAR(20)
		name varchar2(50) CONSTRAINT 테이블명_컬럼명_nn NOT NULL,
		CONSTRAINT 테이블명_컬럼명_pk PRIMARY KEY(id)
				   -----------------------
				   ALTER를 이용해서 변경 / 삭제

		*** 데이터베이스 설계는 한번에 완성되지 않는다
			=> 계속 변경이 가능해야 된다
			=> 데이터 수집 
*/
-- 자동 증가번호 : SEQUENCE 
/*
	CREATE SEQUENCE table명_컬럼명_seq
	
	=> 옵션
		START WITH 1 -- 시작
		INCREMENT BY 1 -- 증가
		NOCACHE -- 20개 정도 저장 후 시작 => 저장데이터없이
		NOCYCLE -- 처음으로 돌아온다
		1~10 => 10 => 1
		=> MAXVALUE => 무한대
	=> 삭제
		DROP SEQUENCE 시퀀스명
	
	=> 현재값 (증가 안된 값) => 시퀀스명.currval
	=> 증가값 => 시퀀스명.nextval
	=> 단점 : 무조건 증가된다
		      -------------------
		SELECT NVL(MAX(no)+1,1) FROM 테이블명
		-------------------------------------------------- 서브쿼리 이용
	=> 기본키 (PRIMARY KEY) => id외에 나머지는 숫자
						   => 자동으로 숫자에 값 지정 = 중복없이 처리
*/

/*
CREATE TABLE test(
	no NUMBER,
	name VARCHAR2(20) CONSTRAINT test_name_nn NOT NULL,
	CONSTRAINT test_no_pk PRIMARY KEY(no)
);
-- NO가 자동 증가 => 시퀀스
CREATE SEQUENCE test_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;

삭제 : DROP SEQUENCE test_no_seq => 초기화
*/
/*
-- 테이블당 => SEQUENCE가 사용
CREATE SEQUENCE test_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;
INSERT INTO test VALUES(test_no_seq.nextval,'홍길동');
INSERT INTO test VALUES(test_no_seq.nextval,'심청이');
INSERT INTO test VALUES(test_no_seq.nextval,'박문수');

COMMIT;
*/

/*
conn system/happy
GRANT CREATE SYNONYM TO hr;
conn hr/happy;
*/


--CREATE PUBLIC SYNONYM sawon_info FOR test;
/*
	동의어 => 테이블 이름 여러개 사용이 가능하게 만든다
	SYNONYM
	=> 단점 => 사용자 계정에서는 사용이 불가능
			권한 얻어서 사용
			------------------- system/sysdba
	=> hr : synonym / view => 불가능 (권한) 
	=> conn system/happy
		GRANT CREATE VIEW TO hr; => 권한 설정
		REVOKE CREATE VIEW FROM hr; => 권한 해제
		--------------------------------------


	=> SEQUENCE / VIEW / PROCEDURE / TRIGGER / INDEX

	=> 사이트 : 테이블 (RENAME) => 자바에서 테이블명을 변경
			--------------------- 동의어 (리팩토링)
							    ------------ 가독성 (컬럼명, 테이블명)
							    | 클래스명 / 멤버변수 / 메소드명
*/
