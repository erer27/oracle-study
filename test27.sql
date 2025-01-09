-- SELECT : 데이터 검색
/*
	순서 / 연산자(WHERE) / 내장함수
	JOIN : 테이블 연결
	SUBQUERY : SQL문장 연결
	집합연산
	----------
	UION / UNION ALL / MINUS / INTERSECT
*/
/*
CREATE TABLE A(
	no NUMBER
);

CREATE TABLE B(
	no NUMBER
);
INSERT INTO A VALUES(1);
INSERT INTO A VALUES(2);
INSERT INTO A VALUES(3);
INSERT INTO A VALUES(4);
INSERT INTO A VALUES(5);

INSERT INTO B VALUES(4);
INSERT INTO B VALUES(5);
INSERT INTO B VALUES(6);
INSERT INTO B VALUES(7);
INSERT INTO B VALUES(8);

COMMIT;
*/
--SELECT no FROM A UNION SELECT no FROM B;
--UNION ALL => 합집합 => 중복데이터 포함 => 1 2 3 4 5 4 5 6 7 8
--SELECT no FROM A UNION ALL SELECT no FROM B;
-- INTERSECT => 교집합 => 같은 값을 가지고 온다 => 4 5
--SELECT no FROM A INTERSECT SELECT no FROM B;

/* 
	레시피 => 목록 230000
	레시피 => 상세보기 120000
			---------- INTERSECT

*/
-- MINUS : 없는 데이터를 출력

/*
	A MINUS B => INTERSECT + MINUS ==> LEFT OUTER JOIN
	1 2 3 4 5
	4 5 6 7 8
	----------- 1 2 3
	B MINUS A => INTERSECT + MINUS ==> RIGHT OUTER JOIN
	4 5 6 7 8
	1 2 3 4 5
	----------- 6 7 8
*/
--SELECT no FROM A MINUS SELECT no FROM B;

--SELECT name FROM customer MINUS SELECT name FROM  customer WHERE custid IN(SELECT custid FROM orders);

/*
	JOIIN : 한 개 이상의 테이블에서 출력에 필요한 데이터를 추출
				    ------- 테이블 연결
	=> SELECT에서만 사용이 가능
	서브쿼리 : SQL문장 여러개를 통합해서 사용 (네트워크 연동)
			=> 웹(자바)이용시에 주로 사용하는 기술
			=> DML 전체 / DDL에서도 사용이 가능
			=> 서브쿼리 (SELECT)
			=> 컬럼 대신 사용
			=> 조건값을 부여 => WHERE 컬럼 연산자 (SELECT~)
		브라우저 ======== 자바 ======== 오라클

		   |				  |			    |
	       화면 출력		   브라우저/오라클 연동  데이터 관리
		네트워크는 서버연결이 적을 수록 빠르다
	=> 자바 / 오라클 => 경우의 수가 많다
				     ---------------------	=> 1. 가독성 
					ANY / ALL => MAX/MIN
								     2. 최적화

	=> 형식 통일 : 프레임워크 
*/

/*
서브쿼리
	1. 서브쿼리를 수행 =>  결과값 =>  메인쿼리 전송
	SELECT ~~
	FROM WHERE 컬럼=(SELECT~~)
	---------------------------------------
	  메인쿼리		서브쿼리
	2. 단일행
	  컬럼 1개에 대한 결과값 1개
	3. 다중행
	   컬럼 1개에 대한 결과값 여러개
	=> 두개 이상 컬럼 => 다중 컬럼 서브쿼리 / 연관 서브쿼리
	=> with절 이용하는 서브쿼리 
	=> 다른 테이블 연동이 가능
*/
-- 부서명이 SALES에서 급여를 가장 많이 받은 사원의 이름
--		 dept						emp
-- 		  ---------------deptno-----------------

/*
SELECT deptno FROM dept WHERE dname='SALES';
SELECT MAX(sal) FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE dname='SALES');

SELECT ename FROM emp WHERE sal=(SELECT MAX(sal) FROM emp
WHERE deptno=(SELECT deptno FROM dept WHERE dname='SALES'));
*/

-- SMITH보다 급여를 많이 받는 사원의 이름/급여 출력
-- ------------------		    -------------------------
--SELECT sal FROM emp WHERE ename='SMITH';
SELECT ename, sal
FROM emp
WHERE sal>(SELECT sal FROM emp WHERE ename='SMITH');
-- 어느 부분 서브쿼리인지 확인
-- 10번 부서의 사원들이 가지고 있는 직위를 가진 사원의 이름/직위
--SELECT job FROM emp WHERE deptno=10;
/*
	PRESIDENT
	MANAGER
	CLERK
*/
SELECT ename,job
FROm emp
WHERE job IN('PRESIDENT','MANAGER','CLERK');

SELECT ename,job
FROm emp
WHERE job IN(SELECT job FROM emp WHERE deptno=10);





