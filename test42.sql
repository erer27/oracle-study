-- 많이 사용되는 뷰 => 복합뷰
/*
SELECT empno, ename, job, hiredate, sal, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp, deptno=dept.deptno
AND sal BETWEEN losal AND hisal;
*/

-- 생성 / 수정
/*
CREATE OR REPLACE VIEW emp_info
AS
	SELECT empno, ename, job, hiredate, sal, dname, loc, grade
	FROM emp, dept, salgrade
	WHERE emp.deptno=dept.deptno
	AND sal BETWEEN losal AND hisal WITH READ ONLY;

SELECT text FROm user_views
WHERE view_name='EMP_INFO';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             */

/*
	235page
	*** 오라클 면접의 단골
	------------------------- 뷰 / 인덱스
	------------------------- 프로시저와 트리거 차이점
	------------------------- 조인 / 서브쿼리 
	=> 뷰는 하나 이상의 테이블 합하여 만든 가상 테이블
	=> 사용
		실제 데이터에 물리적인 column을 추가하면 메모리 용량이 커진다
		테이블 수정이나 관리가 어려운 경우
		자바에서 SQL문장 처리가 어려운 경우 => 단순화 
		------------------------------------------- 소스가 길어지는 경우
		실무 => 100줄 => 문자열
		String sql="";
		=> 뷰는 SQL 문장이 저장이 된다
	=> 1. 편리성 => 여러개 테이블의 데이터를 재사용할 수 있다
				JOIN / SUBQUERY 사용할 필요가 없다
		2. 보안 => 실제 데이터가 저장이 된 상태가 아니기 때문에 ..
		3. 독립성 => 테이블 없이 단독으로 사용이 가능
		   --------------------- 테이블 영향을 미친다 (237page)
	=> 237 뷰생성
		CREATE [OR REPLACE] VIEW view_name
							------------- 테이블 식별자와 동일
		AS
			SELECT ~~ : 테이블을 참조
		
		CREATE [OR REPLACE] VIEW view_name(empno,ename, job...)
									----------------------- 지정이 가능
		AS
		 SELECT * FROM ~
		
		=> 240 page 뷰 수정
		 CREATE [OR REPLACE] VIEW view_name
		=> 뷰삭제
			DROP VIEW view_name
		=> user_views : 뷰에 저장된 SQL문장을 볼 수 있다
		
		=>  오라클 객체
			table / view / sequence / constraints / 
			=> user_objects
*/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CREATE OR REPLACE VIEW empAllData(empno, ename, job, hiredate, sal, rank, dname, loc, grade)
AS
	SELECT empno, ename, job, hiredate, sal, rank, dname, loc, grade
	FROM (SELECT empno, ename, job, hiredate,sal, RANK() OVER(ORDER BY sal DESC) rank, dname, loc, grade                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	FROm emp, dept, salgrade
	WHERE emp.deptno=dept.deptno
	AND sal BETWEEN losal AND hisal);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            