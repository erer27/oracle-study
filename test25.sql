-- 2025-01-09 서브쿼리(170page) => 부속질의
/*
	서브쿼리의 종류
	 => WHERE 문장 뒤에 사용
	 = 단일행 서브쿼리 (서브쿼리의 결과값이 한개)
	 = 다중행 서브쿼리 (결과값이 여러개)
	 => SELECT ~~
	      FROM table명
	      WHERE 컬럼명 연산자 (SELECT~)
	 -------------------------------------------- 컬럼은 한 개만 이용
							*** 컬럼이 여러개 사용 => 다중컬럼 서브쿼리
	 => 컬럼을 대신 사용 : 스칼라 서브쿼리 => 조인을 대신할 수 있다
		SELECT 컬럼명, (SELECT ~~)
		FROM table명
	 => 인라인뷰 : 테이블 대신 사용 
		SELECT ~~
		FROM (SELECT ~~)

	서브쿼리 실행 순서
	1. 서브쿼리가 먼저 실행 => 결과값을 Main Query로 전송
	   Main Query = (Subquery)
				     1
	 	2
	   SELECT ~
	   FROM table명
	   WHERE 컬럼명 = (SELECT ~~)
				   ---------------
	   ------------------    SubQuery
	    MainQuery

	2. JOIN =====> 테이블 한 개 이상에서 필요한 데이터 추출하는 방식
	  SubQuery ===> SQL문장 한 개 이상을 연결 출력 
	  ------------ SQL문장을 최대한 줄일 수 있게 만든다

	 SQL문장을 두 번 이상을 사용
	 => 자바 => 오라클 전송 => 결과값 받기
	 => 자바 => 오라클 전송 => 결과값 받기
	 => 자바에서는 한 번만 수행이 가능 
	 => 프로시저 : 여러개의 SQL 문장을 한 번에 수행 (ERP) => 속도를 최적화
	 => SQL+SQL => SQL문장이 길어진다

	3. SQL문장을 통합하는 방법
			   ---------------
	   = 사원중에 전체 급여의 평균보다 적게 받는 사원의 이름, 급여, 직위, 입사일
			   --------------------
	  1) 급여의 평균을 구한다
		SELECT ROUND(AVG(sal) FROM emp; => 2073
	  2) WHERE 뒤에 평균을 대입후 처리
		SELECT ename, sal, job, hiredate
		FROM emp
		WHERE sal<(SELECT ROUND(AVG(sal) FROM emp);
				---------------------------------------------
				  한개만 사용이 가능 => 단일행 서브쿼리
			=> 다중행 서브쿼리 (연산자이용)
				IN, ANY, SOME, ALL
				    ------------------- 1개만 선택
				    ANY(SOME)
				    > ALL(10,20,30) => 최대값 => 30
				    ALL(10,20,30) => 최소값 => 10
				    ANY(10,20,30) = > 최소값 => 10
				    ANY(10,20,30) => 최대값 => 30
				   -------------------------------------- MAX/MIN
		JOIN < SUBQUERY
			  -------------- SELECT / INSERT / UPDATE / DELETE
		------ SELECT문장에서만 사용 
		1. 단일행 서브쿼리
		   예제)
			KING과 같은 부서에서 근무하는 사원의 이름, 부서, 부서번호, 입사일을 출력
			-------------------------------	    -----------------------------------------
					1						2
		  SELECT deptno FROM emp WHERE ename='KING';
		  SELECT ename, deptno, hiredate
		  FROM emp
		  WHERE deptno=10;
		-------------------------------------------- 한개의 문장으로 변경

		 SELECT ename, deptno, hiredate
		 FROM emp
		 WHERE deptno=(SELECT deptno FROM emp WHERE ename='KING')
*/
--SELECT COUNT(*) FROM emp;
--SELECT ename, deptno, hiredate FROM emp WHERE deptno=10;

--10번 부서에서 급여가 가장 많은 사원의 이름, 급여

--SELECT ename,sal FROM emp WHERE sal=(SELECT MAX(sal) FROM emp WHERE deptno=10);
/*
	1. 연결
	getConnection()
	2.SQL 문장
	String sql="SELECT MAX(sal) FROM emp WHERe deptno=10;
	3. SQL문장을 오라클 전송
	  ps=conn.preparedStatement(sql)
	4. 결과값 받기
	 ResultSet rs=ps.executeQuery()
	5. 결과값 저장
	 rs.next()
	6. 값을 대입
	 int sal=rs.getInt(1);
	 ps.close()
	 rs.close()
	7. sql문장 제작
	 sql="SELECT ename,sal FROM emp WHERE sal="sal
	 ps=conn.preparedStatement(sql)
	 rs=ps.executeQuery()
	 while(rs.next())
	 {
	 }
	rs.close()
*/
-- 170 page => 가장 비싼 도서의 이름 => SQL문장 2개
--DESC book;

--SELECT MAX(price) FROM book; 
-- 35000
--SELECT bookname FROM book WHERE price=35000;

--SELECT bookname
--FROM book
--WHERE price=(SELECT MAX(price) FROM book);

-- DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 입사일을 출력

--SELECT ename, job, deptno, hiredate FROM emp
--WHERE deptno=(SELECT deptno FROM dept WHERE loc='DALLAS');

-- SCOTT가 근무하는 부서에서 같이 근무하는 사원의 이름, 부서명, 근무지, 입사일을 출력하라


--SELECT ename, dname, loc, hiredate FROM emp JOIN dept ON emp.deptno=dept.deptno
--WHERE dept.deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');

-- 다중행 서브쿼리 (서브쿼리의 값이 여러개인 경우)
-- 모든 부서번호를 받아서 10,20,30 => 해당되는 사원의 이름, 부서번호
-- 모든 부서번호 출력

SELECT ename, deptno FROM emp WHERE deptno IN (SELECT DISTINCT deptno FROM emp);

/*
	서브쿼리 실행 결과값이 여러개인 경우
	=, <,> ,<=, >= 불가능

	=> IN() => 전체를 대입
	=> ANY(SOME)
	     =======>	deptno > ANY(10,20,30) => 한개만 선택 => 최소값
				deptno > 10
				deptno < ANY(10,20,30)
				
	=> ALL
		======> deptno > ALL(10,20,30)
				deptno > 30 =========> 최대값
				deptno < ALL(10,20,30)
				deptno < 10 =========> 최소값 MIN
*/
--SELECT ename, deptno FROM emp WHERE deptno < ANY(SELECT DISTINCT deptno FROM emp);

--SELECT ename, deptno FROM emp WHERE deptno > ANY(SELECT DISTINCT deptno FROM emp);