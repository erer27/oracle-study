-- 서브쿼리
/*
	스칼라 서브쿼리 : 컬럼 대신 사용 => 조인 대신 사용이 가능
	인라인뷰 : 테이블 대신 => 보안(View)
		=> 1. 단순뷰, 2. 복합뷰, 3. 인라인뷰 = 실제 데이터를 가지고 있지 않는다 / SELECT
		=> CREATE VIEW view_name
		      AS
			SELECT~
	스칼라 서브쿼리
		형식)
			SELECT 컬럼명,(SELECT ~~),(SELECT ~~)
					    -------------- --------------- 한개값만 수행
			FROM table명
			
*/
-- 조인
-- 모든 사원의 이름, 직위(emp), 부서명, 근무지(dept)
--SELECT ename,job,dname,loc
--FROM emp,dept
--WHERE emp.deptno=dept.deptno;

SELECT ename,job,
		(SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
		(SELECT loc FROM dept WHERE deptno=emp.deptno) loc
FROM emp;

-- 매핑 테이블
/*
	customer	book
	   |		   |
	  ---------------
		|
	     orders => 구분자 => custid / 

	member	movie
	   |		   |
	  ---------------
		|
	      reserve
*/
/*
	인라인뷰 => 페이지 나누기
	---------- 테이블 대신 사용
	FROM 뒤에 사용 
	SELECT empno, ename, job, sal
					       --- 없는 컬럼을 사용
	FROM (SELECT empno, ename, job, hiredate, comm FROM emp)
			     ------------------------------------------ 컬럼
	=> 오류 발생 
	=> rownum을 주로 이용
	     ---------- 오라클 지원하는 가상 컬럼 = >ROW가 저장이 될 때 자동으로 번호 생성 (고정)
															    -------- 변경이 가능
															    -------- 인라인뷰
	     ---------- Top-N
	     ---------- 인기 순위 / 최근 뉴스...
	서브쿼리
		WHERE 뒤에 (단일행, 다중행) => 조건값으로 이용
		FROM 뒤에 (table 대신 사용) => 인라인뷰
		SELECT 뒤에 => 스칼라 서브쿼리
		=> 무조건 SELECT문장으로 만들어진다 
*/
SELECT empno, ename,sal, rownum
FROM (SELECT empno, ename, sal FROM emp ORDER BY sal DESC);

