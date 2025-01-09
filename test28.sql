-- 서브쿼리 고급
-- 스칼라 서브쿼리 / 인라인뷰
-- 컬럼 대신 사용		테이블 대신
/*
	서브쿼리
	1. VIEW 생성
	   CREATE VIEW view_name
	   AS
	   SELECT * FROM emp;
	2. 테이블 복사
	   CREATE TABLE table_name
	   AS
	    SELECT * FROM dept;
	3. INSERT
	   INSERT INTO table VALUES((SELECT MAX(no)+1 FROM data)....)
	-----------------------------------------------------------------------------

	=> 인라인뷰
		SELECT ~ 
		FROM (SELECT~)
			 ------------- 테이블 => 지정 컬럼외 다른 컬럼을 사용하면 오류발생

		SELECT a,b,c,d
		FROM (SELECT a,b,c,e,f,g FROM table)
				    ------------ 출력이 가능하다
*/
/*
SELECT empno,ename, job, hiredate, sal 
FROM (SELECT empno, ename, job, hiredate, comm, deptno
FROM emp);

-- 예외 => rownum, rowid => 오라클에서 지원하는 가상 컬럼
*/

SELECT empno, ename, job,
		(SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
		(SELECT loc FROM dept WHERE deptno=emp.deptno) loc
from emp;

