-- JOIN(163page) / Subquery (170page) => 고급 쿼리
/*
	1. 데이터베이스는 중복을 최소화
	   -----------------------------------
		테이블을 나눠서 저장 => 참조 => 정규화
		------------------------
		| 테이블을 연결해서 필요한 데이터를 추출 : 조인

		=> 원자값만 저장한다
		취미 저장
		ID HOBBY
	      aaa  등산, 여행, 게임 => 수정 / 삭제가 어렵다

		=> ID HOBBY => 중복이 많다 
		 aaa 등산
		 aaa 여행
		 aaa 게임
		=> 중복을 제거한다
		개인			취미
			-------------
			     |
			매핑 테이블
		정규화 : 여러개의 테이블이 생성
			   ------------------- 한개로 묶어서 데이터 추출 => 조인
		emp / dept
		 |	   |
		----------
		     |
		  deptno
		    custid	      bookid
		orders custommer book
		   |		|	    |
		  -------------	    |
		   |			   |
		  ---------------------

		1. 조인의 종류 (163page)
			for(int i=0, i<=10; i++)
			{
				if(emp[i]==dept[i])
				{
					데이터 추출
				}
			}
		 INNER JOIN => 교집합 =>  단점은 null값을 처리하지 못한다
			=  EQUI_JOIN : 컬럼의 값이 같은 경우
						연산자(=)
						=> 컬럼명이 동일하지 않는 경우도 있다
						=> 같은 테이블을 이용해서 조인이 가능하다
							(SELF JOIN)
			Oracle JOIN : 오라클에서만 사용
			 SELECT A.col,B.col FROM A,B WHERE A.col=B.col
			 => 테이블이 길거나 알아보기 어려운 경우에는 별칭 사용이 가능하다
				SELECT col,col
				FROM A.a,B.b
				WHERE a.col=b.col
			ANSI JOIN : 모든 데이터베이스에서 사용 (표준화) => MySQL
			SELECT A.col, B.col
			FROM A (INNER) JOIN B
			ON A.col=B.col
		------------------------------ 컬럼명은 다를 수 있다(저장된 데이터값)
			NATURAL JOIN
			SELECT A.col,B.col FROM A NATURAL JOIN B
			JOIN ~ USING
			SELECT A.col,B.col
			FROM A JOIN B USING(공통컬럼명)
		------------------------------ 컬럼명이 동일
			= NON_EQUI_JOIN : 포함된 경우 => 연산자 (=)가 아닌 연산자 사용
						    BETWEEN, AND
		 OUTER JOIN => 교집합 => INNER JOIN의 단점을 보완
							----------------------- NULL값 처리 가능
		= LEFT OUTER JOIN (왼쪽의 테이블에 데이터 존재 = 오른쪽에 없는 경우)
		   = Oracle JOIN
		   = ANSI JOIN
		= RIGHT OUTER JOIN (오른쪽 테이블에 데이터 존재 = 왼쪽에는 존재하지 않는 경우)
		   = Oracle JOIN
		   = ANSI JOIN
		= FULL OUTER JOIN => 사용 빈도가 거의 없다 => UNION / UNION ALL
		   = ANSI JOIN

*/

/*
	emp
	 empno/ename/job/mgr/hiredate/sal/comm/deptno
	dept
	 deptno/dname/loc
		   부서명 근무지
*/
/*
SELECT empno,ename,job,hiredate,dname,loc 
FROM emp, dept
WHERE deptno=deptno;
*/
-- 애매한 정의
/*
SELECT empno, ename, job, hiredate, dname, loc
FROM emp e,dept d
WHERE e.deptno=d.deptno;
*/

--SELECT ename,job,dname,loc FROM emp,dept WHERE emp.deptno=dept.deptno;

--SELECT ename,job, dname, loc FROM emp JOIN dept ON emp.deptno=dept.deptno;

SELECT e1.ename "본인", e2.ename "사수" FROM emp e1,emp e2 WHERE e1.mgr=e2.empno(+);
