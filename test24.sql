/*
	= 데이터 검색 : SELECT => 웹(50%) => INSERT/UPDATE/DELETE (20%)
	
		=> 1. 연산자
		=> 2. 내장함수
		=> 3. 테이블 연결
			= JOIN => 두개이상의 테이블을 연결해서 출력에 필요한 데이터 추출
			= SubQuery => SQL문장을 묶어서 한 개의 SQL을 만들어 준다
		-------------------------------------------------------------------------------------
		=> 테이블안에서 그룹별 통계 : GROUP BY
		=> 정렬해서 처리 : ORDER BY
		
		* DML => SELECT / INSERT / UPDATE / DELETE
				-------- DML OR DQL
				
				= 테이블명 확인
				= 컬럼명 확인, 데이터형
				----------------------------
				1) 테이블 확인
				    SELECT * FROM tab;
				    SELECT * FROM user_tables WHERE table_name='테이블명'
				2) 컬럼확인 => 컬럼명 / 데이터형
				    DESC table명
				*** 오라클에 저장되는 테이블명, 컬럼명은 무조건 대문자로 저장
		1) 문법 / 순서
			SELECT 용도
			--------------
				= 컬럼명 대신 사용 => 스칼라 서브쿼리
				= 조건문 대신 사용 => 서브쿼리
								-----------
								단일행 서브쿼리 ***
								다중행 서브쿼리
								------------------
								다중컬럼 서브쿼리
								연관 서브쿼리
				= 테이블 대신 사용 => 인라인뷰 *** (페이지 나누기)
			SELECT * | coloumn1, column2... (column_list)
			FROM table명 | SELECT ~
			[
				WHERE 컬럼명 연산자 값
				GROUP BY 컬럼명|함수 => 같은 값을 가진 컬럼명
				HAVING 그룹함수(집계함수) 연산자 값
					    ---------------------- 반드시 => GROUP BY가 존재
				ORDER BY 컬럼명 | 함수명 (ASC|DESC)
								      ----- 생략이 가능
			]
			SELECT - FROM - WHERE - GROUP BY - HAVING - ORDER BY
			    5		1	    2		3		   4		6

		=> WHERE : 조건 검색
				------------- 연산자
				비교연산자
				논리연산자
				IN => 논리연산자 OR 대체
				NOT
				NULL : 연산처리가 안된다 IS NULL / IS NOT NULL
				BETWEEN => 논리연산자 AND 대체
				LIKE => %, _
				---------------- REGEXP_LIKE 변경 
		=> 내장 함수
		      문자열 / 숫자 / 날짜 / 변환 / 기타
		      --------   ----    ----    -----   ------
							       NVL
						    TO_CHAR
					   SYSDATE
				   CEIL/ROUND
			LENGTH / RPAD(아이디찾기)/SUBSTR/INSTR
		=>  집계함수 => GROUP BY / HAVING
			COUNT : 가장 많이 사용
			MAX / SUM / AVG
				  -------------- 구매 
		=> JOIN : 테이블 연결
			=> 테이블 => 컬럼 : 200 => 관련된 데이터를 모아서 테이블을 나눠서 작업
		----------------------------------------------------------------------------------------------- INNER JOIN
		=> 컬럼에 같은 값을 가지고 있는 경우 => EQUI
			
		=> 컬럼값이 다른 테이블 포함 => NON_EQUI
			AND, OR, BETWEEN
		------------------------------------------------------------------------------------------------
			단점은 연산자를 사용한다 => NULL값을 처리 하지 못한다
								------------------- 가능 (OUTER JOIN)
		=> 오라클 조인
			SELECT A.col, B.col
			FROM A,B
			WHERE A.col=B.col
		=> ANSI 조인
			SELECT A.col, B.col
			FROM A JOIN B
			ON A.col=B.col
*/
-- 가상 컬럼 => 오라클에서 지정한 row의 번호
-- 이전 | 다음
/*
SELECT ename, sal, rownum
FROM emp
WHERE rownum<=5;


SELECT ename, sal, rownum
FROM (SELECT ename, sal FROM emp ORDER BY sal DESC)
WHERE rownum<=5;
*/

SELECT ename, sal, rownum
FROM (SELECT ename, sal FROM emp ORDER BY sal DESC);

CREATE TABLE emp_1
AS
  SELECT empno, ename, job, hiredate
  FROM emp,dept
  WHERE emp.deptno=dept.deptno;