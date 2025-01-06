-- 교재 정리
/*
	209 page 내장함수
	---------------------
	=> 
	0. table/column
	=> 210
	     단일행
		=> 문자 : LENGTH / SUBSTR / INSTR / RPAD => String
		=>CEIL / ROUND / TRUNC => Math
		=> 날짜 : SYSDATE / MONTHS_BETWEEN => DATE, Calendar
		=> 변환 : TO_CHAR, to+DATE
				SimpleDateFormat / DecimalFormat
		=> 기타 ***NVL
		 =>구분자
	=> 데이터 저장 공간 (파일)
	1. SELECT 형식 / 순서
	2. WHERE => 조건문(연산자))
	3. 필요시에 컬럼 처리 => 내장함수
	GROUP BY / ORDER BY / JOIN / SUBQUERY
	--------------------------------------------------- 
	DDL : 테이블 제작방법 => 제약조건, 정규화
	DML : 데이터 첨부
 	TCL : 정상 수행, 취소
	권한 : DCL

	=> 집계함수 => 컬럼단위
	SUM : 합
	AVG : 평균
	MIN : 최소값
	MAX : 최대값
	COUNT : 저장 개수
	 COUNT(*) => null을 포함
	 COUNT(column) => null값을 제외
	 	=> 로그인처리, 아이디 중복체크, 검색 건수, 장바구니 여부
	RANK(), DENSE_RANK()
	--------------------------- 집합함수는 아니다 => 컬럼, 단일행함수 사용이 가능
	1 2 2 4, 1 2 2 3
	=> 단일행 함수와 동반하지 못한다(같이 사용할 수 없다)
		=> GROUP BY를 사용하면 사용 가능
	=> 컬럼명과 동반하지 못한다
	=> 집계함수만 사용이 가능
	SELECT ename, SUM(sal), AVG(sal) ==> X
		  --------- ---------------------
	SELECT TO_CHAR(hiredate, 'YYYY-MM-DD'), SUM(), MAX() .... (X)


*/
--SELECT deptno, SUM(sal), COUNT(*) from emp GROUP BY deptno;
-- 사원의 급여 총액, 사원의 급여 평균 , 사원수 , 가장 많은 급여, 가장 적은 급여
--SELECT SUM(sal), AVG(sal), COUNT(*), MAX(sal), MIN(sal) from emp;

--SELECT ename, sal, DENSE_RANK() OVER(ORDER BY sal DESC) rank FROM emp;

--응용
DROP TABLE member;
CREATE TABLE member(
	id VARCHAR2(20),
	pwd VARCHAR2(10),
	name VARCHAR2(51),
	sex CHAR(6),
	address VARCHAR2(100)
);
INSERT INTO member VALUES('hong', '1234', '홍길동', '남자', '서울');
INSERT INTO member VALUES('shim','1234','심청이','여자','경기');
COMMIT;