-- SQL 소개 => 142page
/*
	SQL은 문자열 형식으로 만들어져 있다
		 -------------- 암기 / 어떤 데이터 검색 / 순서
		1) DQL : 데이터 검색언어
			SELECT
			=> 연산자
			=> 내장 함수	
			=> JOIN
			=> SubQuery
		2) DML : 데이터 조작언어
			INSERT / UPDATE / DELETE
		3) DDL : 데이터 정의 언어
			CREATE / DROP / ALTER / TRUNCATE / RENAME
		4) DCL : 데이터 제어 언어
			GRANT / REVOKE
		5) TCL : 트랜잭션 제어 언어 (일괄처리)
			COMMIT / ROLLBACK

	SQL 작성 주의점
	  1) 문장이 종료가 되면 반드시 ;을 사용한다
	  2) 문자열 => '' (""는 인용부호로만 사용)
	      'KING', "KING"(X)
	      날짜 => '' => '25/01/02' => 'YY/MM/DD'
	  3) SQL문장은 대소문자 구분하지 않는다 
	     => 약속:키워드는 대문자
	     => 실제 저장된 데이터는 대소문자를 구분한다
	   4) 문자열 결합이 가능
		|| => 'A' + 'B' (X) => 'A'||'B'
	   5) 입력이 가능
		&sabun => Scanner
	   6) 원하는 컬럼은 , => 공백이 있으면 안된다
	   7) 컬럼은 별칭을 사용할 수 있다
		empno "사번" ename "이름"
	   8) 중복없는 데이터 읽기
		DISTINCT 컬럼명 
	   9) 키워드 뒤에는 반드시 공백을 ....
	   10) SELECT ---> 3
		FROM ---> 1
		WHERE --> 2
	1.검색 (데이터) : SELECT
	   => 프로젝션
	   => 전체 데이터를 읽는 방법
	   => 원하는 데이터만 읽는 방법
	   형식)
		 -------------------------------------------------------------
		 SELECT * | column1, column2, column3 (column_list)
		 FROM table_name
		 ------------------------------------------------------------- 필수 
		 [
			WHERE 조건문 => 셀렉션 => if
			GROUP BY 그룹컬럼 => 그룹별로 통계 (부서별, 직위별, 입사일)
			HAVING 그룹 조건 => GROUP BY가 있는 경우에만 사용이 가능
			ORDER BY 컬럼 => 정렬
		 ]
		
		SELECT - FROM - GROUP BY - ORDER BY
*/
-- 사원 (emp) 테이블에 있는 사원의 모든 정보 출력
/*SELECT * 
FROM emp;
*/
-- 사원(emp) 테이블에서 사원의 정보중에 사번, 이름, 직위, 입사일
/*SELECT empno, ename,job,hiredate
FROM emp;*/
-- 사원(emp) 테이블에서 사원의 정보중에 이름(ename), 직위(job), 급여(sal) 출력
--select ename "이름", job "직위", sal "급여" from emp;
--자바에서 sql 전송시에 자동으로 ; 추가 => ; 사용하면 오류 발생

--select distinct job from emp;

--desc book;
/*
	book
	BOOKID NUMBER(2) => 숫자
	BOOKNAME VARCHAR2(40) => 문자열
					 ------- byte
			   => 영문/숫자 => 40자
			   => 한글 13자 => 3byte (한글자당)
	PUBLISHER VARCHAR2(40) => 문자열
	PRICE NUMBER(8) => 숫자 => 8자리까지 사용
	DATE => 날짜형 
*/