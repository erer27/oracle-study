-- 테이블 제작
-- 회원가입
/*
	id ===> 기본키 (중복없이) PK
	***pwd
	***name
	sex ==> 남자 / 여자 => check
	***birthday
	email ==> id를 찾기 => 후보키 (unique)
	***post
	***addr1
	addr2
	***phone
	content ==> clob

	=> lastlogin DATE
	=> isadmin CHAR(1) 
*/
/*
CREATE TABLE testMember
(
	id VARCHAR2(20),
	pwd VARCHAR2(10) CONSTRAINT tm_pwd_nn NOT NULL,
	name VARCHAR2(51) CONSTRAINT tm_name_nn NOT NULL,
	sex CHAR(6),
	birthday DATE CONSTRAINT tm_day_nn NOT NULL,
	email VARCHAR2(150),
	post VARCHAR2(7) CONSTRAINT tm_post_nn NOT NULL,
	addr1 VARCHAR2(100) CONSTRAINT tm_addr1_nn NOT NULL,
	addr2 VARCHAR2(100),
	phone VARCHAR2(13),
	content CLOB,
	CONSTRAINT tm_id_pk PRIMARY KEY(id),
	CONSTRAINT tm_sex_ck CHECK(sex IN('남자','여자')),
	CONSTRAINT tmp_email_uk UNIQUE(email)
);
*/
-- 수정 => ALTER, 삭제 => DROP
-- 1. 수정 = 회원가입일 => ALTER TABLE testMember ADD regdate DATE 184page
-- ALTER TABLE testMember ADD regdate DATE DEFAULT SYSDATE;
-- ALTER TABLE testMember ADD homepage VARCHAR2(10);
-- 2.  변경 (수정) => MODIFY
-- ALTER TABLE testMember MODIFY homepage VARCHAR2(150);
-- 3. 삭제 (컬럼) => DROP COLUMN
--ALTER TABLE testMember DROP COLUMN homepage;
-- 테이블 삭제 => DROP (186page)
--DROP TABLE testMember;
/*
	비절차적 언어
	= 오류가 나면 => 다음 문장을 수행
	= 테이블 : 설계 => 6장 / 7장 => 정규화 
	1. 테이블은 데이터를 저장하는 공간 (파일)
	   --------- 일관성이 있어야 한다
	   관련데이터를 모아서 관리 : 회원, 구매, 장바구니, 게시판, 댓글...
	   => 데이터 추출 => 개념적 설계 (벤치마킹)
	   => 데이터형 => 출력 형태 => 논리적 설계
	   => 제약조건 / 크기 => 물리적 설계
	   ------------------------------------------- 데이터 추가 (DML)
	2. 테이블 형식
	3. 데이터형
	4. 제약조건
	5. 수정
	6. 테이블 삭제

*/
/*
	테이블 생성
	= 직접 생성
	= 복사 (재사용)	
*/
-- 복사 (기존의 데이터를 재사용) => 데이터가 첨부
/*
CREATE TABLE emp_dept
AS
SELECT empno, ename, job, hiredate, sal, dname, loc
FROM emp, dept
WHERE emp.deptno=dept.deptno;
*/
--
-- 데이터없이 테이블만 생성 => 테이블 구조 
/*
CREATE TABLE emp_dept2
AS
SELECT empno, ename, job, hiredate, sal, dname, loc
FROM emp, dept
WHERE 1=2;
-- 1=2 => false 100=200 'A'='B' => WHERE => false 조건을 만든다
*/
/*
	직접 생성(***)
	형식
		CREATE TABLE table_name
		(
			-- 순서가 없다
			컬럼명 데이터형  [제약조건] => 여러개를 사용할 수 있다
			예) address VARCHAR2(100) NOT NULL CHECK UNIQUE..
			컬럼명 데이터형 [제약조건],
			컬럼명 데이터형 [제약조건],
			컬럼명 데이터형 [제약조건],
			컬럼명 데이터형 [제약조건], => DEFAULT / NOT NULL
			------------------------------------
			[제약조건],
			[제약조건]
			------------------------------------ PRIMARY KEY
								  CHECK
								  UNIQUE
								  FOREIGN

		)
		
		1. 테이블 식별
		  = 같은 데이터베이스안에서는 테이블명이 유일하다 
		     --------------------- (XE), 공통 사용 오라클 (XE)
						---
						 | 계정따라 hr_1 ... hr_4
		 = 문자로 시작 (알파벳, 한글) => 알파벳 권장
				      --------
				     | 대소문자 구분이 없다 (씰제 오라클에 테이블 정보가 저장이 될 때 대문자로 저장 => 테이블 확인시 = 대문자로 입력)

		SELECT * FROM user_constaints
		WHERE table_name='board' (X) => BOARD
		=> ***user_constraints : 제약조건 저장
		=> user_tables : 테이블 정보
		=> ***user_views : 뷰정보가 저장
	= 테이블명 길이 (30byte) => 7~15자리가 적당 (의미)
	= 특수문자 : _(헝가리식 표기법(X))
			    --------------------- FileName
							   --
			    file_name
	= 키워드는 사용할 수 없다 : SELECT / FROM / JOIN ...
	= 공백사용은 할 수 없다
	= 숫자는 사용이 가능 (앞에 사용할 수 없다)
	--------------------------------------------------------------
	  CREATE TABLE table_name
				------------ column명
	   데이터형
	   ----------
	     문자 : CHAR(1~2000byte) => 고정 (문자의 길이가 동일)
			VARCHAR2(1~4000byte) => 가변 ******** 가장 많이 사용됨
			CLOB : 소개, 줄거리 ... 4기가 => 가변
			-------------------------- 자바에서는 String
		숫자 : NUMBER => NUMBER(8,2)
			 NUMBER(4), NUMBER(2,1)
		날짜 : DATE => 날짜/시간
		제약조건 
		----------
		   NOT NULL : NULL을 허용하지 않는다
				    => 무조건 데이터값이 설정
				    => 필수 입력
		   UNIQUE : 유일값 (중복이 없는 값)
				  => NULL값 허용
				  => 후보키 (기본키를 찾기 위한 키)
				  => 전화번호 / 이메일
		    PRIMARY KEY : 기본키
				     => 모든 테이블에서는 기본키를 한 개 이상 설정
					  -------------- 식별(구분자)
				     => UNIQUE + NOT NULL
				     => 기본 (숫자) , 문자열(ID)
					  게시물번호 / 영화번호 / 맛집번호 / 댓글번호 ...
					  회원(ID)
				     => 자동 증가 번호 
			FOREIGN KEY : 외래키 (참조키)
					     => 다른 테이블 연결 
				emp(deptno) dept(deptno)
						      | 중복없는 부서번호 => PRIMARY KEY
				    | 부서번호 참조 => FOREIGN KEY
				게시판	댓글
				(게시물번호) (게시물번호 참조)
				영화		리뷰 
				(영화번호)	 (영화번호 참조)
				=> JOIN 
		
				CHECK : 지정된 데이터만 사용이 가능
						=> 부서명 / 근무지 / 성별 / 장르
						=> 콤보박스 / 라디오버튼
				-------------------------------------------------- 제약조건
				DEFAULT : 미리 기본값 설정
						=> 입력이 없는 경우 적용
					=> 숫자 (0) / 날짜 (SYSDATE)

			*** 컬럼뒤에 붙인다 => NOT NULL, DEFAULT
			*** 컬럼 생성후에 붙이는 경우 => PK, FK, CK, UK
		--------------------------------------------------------------------------------
		  DDL
		    = COMMIT이 필요없다 (COMMIT이 있는 경우에는 복구가 가능)
		    = 자동 저장이 된다 (복구할 수 없다)
		    -----------------------------------------------------------------------
		    테이블을 다시 제작 => ALTER / DROP후에 다시 CREATE
						    --------   -----
								 데이터가 삭제
						    데이터를 유지
		    => CREATE : 생성
		    => ALTER : 수정
		    => DROP : 삭제
		    => RENAME : 이름 변경
		    => TRUNCATE : 테이블 유지 / 데이터만 삭제

*/
/*
CREATE TABLE myEmp
AS
	SELECT empno, ename, job, hiredate, sal
	from emp; 
*/
-- 수정 : ALTER
-- deptno 추가, mgr 추가 => ADD
/*
ALTER TABLE myEmp ADD deptno NUMBER(2) DEFAULT 10 
CONSTRAINT my_deptno_nn NOT NULL;
*/
--ALTER TABLE myEmp ADD mgr NUMBER(4);
-- 수정 MODIFY 
--ALTER TABLE myEmp MODIFY ename VARCHAR2(50) CONSTRAINT
--my_ename_nn NOT NULL;
-- 기존에 데이터가 존재하는 경우에는 문제가 없다
-- 새롭게 컬럼 추가 (데이터가 없는 상태) => NOT NULL => DEFAULT
--ALTER TABLE myEmp DROP COLUMN mgr;
-- RENAME => 테이블 이름 변경
--RENAME myEmp TO youEmp;
-- empno => sabun 컬럼이름 변경
--ALTER TABLE youEmp RENAME COLUMN empno TO sabun;

-- TRUNCATE : 데이터 잘라내기
-- 복구할 수 없다
--TRUNCATE TABLE youEmp;
DROP TABLE youEmp;
/*
	DML => ROW 단위 => 복원이 가능
		= SELECT / INSERT / UPDATE / DELETE => 데이터 조작
		    | 웹 개발
	DDL => COLUMN단위 => 복원이 어렵다
		= CREATE / ALTER / DROP / RENAME / TRUNCATE
	TCL => 정상적 저장, 명령어 취소
				     | 복구 ROLLBACK
		    | COMMIT
	---------------------------------------------------------------------
	테이블 제작 : 데이터를 추가 / 데이터를 수정 / 데이터를 삭제
			   ----------------------------------------------------
			   | 187page => DML
	생성된 테이블 확인
	SELECT * FROM tab;
	테이블 한개에 대한 정보 (컬럼 정보)
	DESC table-name
*/
-- 데이터를 첨부
-- INSERT 명령
/*
	187page
	1) 데이터를 전체 첨부 : INSERT ALL
	2) 전체 데이터 추가
	3) 원하는 데이터 추가
*/
-- INSERT ALL 
CREATE TABLE emp_10
AS
SELECT empno, ename, job, hiredate, sal
FROM emp
WHERE 1=2;

CREATE TABLE emp_20
AS
SELECT empno, ename, job, hiredate, sal
FROM emp
WHERE 1=2;

CREATE TABLE emp_30
AS
SELECT empno, ename, job, hiredate, sal
FROM emp
WHERE 1=2;
