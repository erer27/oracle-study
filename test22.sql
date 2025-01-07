-- EQUI_JOIN => 컬럼의 값이 같은 경우에 데이터 추출(연산자=)
/*
	같은 컬럼명을 가지고 있는 경우 => 반드시 테이블명.컬럼명, 별칭명.컬럼명
								 ---------------------------------------
								| 구분이 없는 경우 애매의 컬럼 정의
	=> 다른 컬럼명으로 비교가 가능 : 컬럼에 저장된 값이 동일한 경우
	=> 예약/결제
		=> 예약정보 = 회원정보
		=> 결재정보 = 회원정보
	=> 맛집 / 댓글, 자유게시판 / 댓글
	=> 가장 많이 사용되는 조인이다
	
	=> 오라클 조인
		FROM 테이블,테이블
		WHERE 테이블, 컬럼=테이블.컬럼
	=> 표준 조인 ==>, => JOIN, WHERE => ON => MYSQL
	=> 실무는 대부분 표준 조인을 사용하고 있다
		FROM 테이블 JOIN 테이블
		ON 테이블.컬럼=테이블.컬럼
	=> 실무 => 30개 연결 

	=> 같은 컬럼 출력시
		오라클 조인, 표준 조인 => 식별해서 사용
		NATURAL JOIN / JOIN USING은 식별하지 않는다

	=> 조인 조건 + 일반 조건이 있는 경우
	=> emp에서 이름, 입사일, 직위, 급여, 부서명, 근무지
	     --------------------------------------------------------
	    + 10번 부서에 대해서 데이터를 추출
	   => OR(X), AND(O)
*/

--SELECT ename, hiredate, job, sal, dname, loc FROM emp, dept where emp.deptno=dept.deptno and emp.deptno=10;
-- 사원 이름중에 A가 포함된 사원의 이름, 직위, 부서명, 근무지 출력
SELECT ename, job, dname, loc FROM emp, dept WHERE emp.deptno=dept.deptno AND ename LIKE '%A%';

