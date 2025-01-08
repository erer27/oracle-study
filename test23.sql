-- 오라클 2025-01-08
/*
	=> 데이터베이스는 모든 데이터를 한곳에 모아서 처리하는 것이 아니다
		=> 중복 제거 / 사용을 쉽게 만든다 => 테이블 분산 (정규화)
		=> 데이터를 모아서 추출 : 조인 / 서브쿼리
		=> 테이블 분산 : 사용자 요청한 데이터를 어떻게 가지고 올지 ...
		조인의 종류
		1) EUQI_JOIN : 컬럼이 같은 값을 가지고 있는 경우에 처리
					=> 자바에서는 포함 클래스
					class Emp : 사원 정보
					{
						Dept dvo = new Dept()
						Salgrade s = new Salgrade()
					}
					=> 단독 사용이 가능
					class Dept : 부서 정보
					{
					}
					class Salgrade : 등급 정보	
					{
					}
			=> 두개 이상의 테이블에서 공통적으로 존재하는 컬럼의 값이 일치가 됐을때 해당 테이블의 ROW 전체를 갖고 올 수 있다
			=> 테이블에서 컬럼명이 같은 경우
				=> 테이블명.컬럼명 / 별칭명.컬럼명
				*** 컬럼명이 다른 경우에는 생략이 가능
				=> 동일 컬럼명이 없는 경우에는 다른 컬럼명을 사용이 가능
			=> 같은 값일 때 처리 : EUQI JOIN => (=)
			=> 포함 관계 : NON EUQI JOIN => AND, BETWEEN~AND
			
			= 사용방법
			   A(col1, col2,col3), B(col1,col4,col5)
			      ----		      -----
				|			|
				---------------------
					   |
					JOIN
			   오라클 조인
				SELECT col2,col3,col4,col5,A.col FROM A,B WHERE A.col1=B.col1 
													==> 연산자를 사용하면 null을 처리할 수 없다			
													==> 교집합의 데이터만 가지고 온다
													==> INTERSECT
			   표준 조인 (Ansi Join)
				SELECT col2,col3,col4,col5,A.col
				FROM A JOIN B
					    ------ => INNER는 생략이 가능
				ON A.col1=B.col1
				----
					JOIN => 조건문은 ON
			   -------------------------------
			   자연 조인
			   SELECT col2, col3, col4, col5, col1
								  ------ 식별하면 오류 발생
			   FROM A NATURAL JOIN B => 별칭은 사용하지 않는다

			   JOIN ~ USING
			   SELECT col2,col3,col4,col5,col1
			   FROM A JOIN B USING(col1)
						  ---------------- 비교대상의 컬럼명
			   ------------------------------- 테이블의 컬럼명이 동일해야 가능하다
			   NON_EUQI_JOIN
			   => 
			   WHERE sal>=losal AND sal<=hisal
				      --------------------------------- 범위 지정
			   WHERE sal BETWEEN losal AND hisal

		==> 유지보수 => 추가 / 수정 / 삭제
			조인
				중복없는 데이터 ===== 참조 데이터
				    dept				|
								     emp : deptno:Foreign key
				    deptno : Primary 
			emp : 사원정보
				empno / ename / job / mgr / hiredate / sal / comm / deptno
													  ---------
													 중복이 가능
			dept : 부서정보
				deptno / dname(부서명) / loc(근무지)
				--------
				=> 중복없는 데이터
			=> 부서명이 변경 / 근무지 변경
			     --------------------------------
			salgrade : 등급정보 => 호봉
				grade(등급) / losal (최저범위) / hisal (최고범위)
			
*/
-- 사원의 이름, 직위, 입사일, 부서명, 근무지 (dept)
SELECT ename, job, hiredate, dname, loc
FROM emp, dept
WHERE emp.deptno=dept.deptno;
-- 별칭 => 테이블명이 긴 경우 테이블 별칭
SELECT ename,job,hiredate,dname,loc
FROM emp e, dept d
WHERE e.deptno=d.deptno;
--자연 조인
SELECT ename, job, hiredate, dname, loc
FROM emp NATURAL JOIN dept
-- JOIN~USING
SELECT ename, job, hiredate, dname, loc
FROm emp JOIN dept USING(deptno);

-------------------------------------------
-- NON - EUQI JOIN => =이 아닌 다른 연산자 사용 => 범위, 기간 : AND hisal;
SELECT ename, job, hiredate, sal, grade
FROM emp JOIN salgrade
WHERE sal BETWEEN losal AND hisal;

SELECT ename, job, hiredate, sal, grade
FROM emp JOIN salgrade
WHERE sal BETWEEN losal AND hisal;

-- 3개의 테이블 연결
SELECT ename, job, hiredate, sal, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp.deptno=dept.deptno
AND sal BETWEEN losal AND hisal;

SELECT *
FROM emp JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal;











