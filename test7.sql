-- 오라클 연산자
/*
	논리연산자
		AND/ OR => (& : 입력), (||:문자열 결합)
			  | 미포함 (두개의 조건문중에 1개 이상 true면 true => 나머지는 false)
		   | 포함 (두개의 조건문이 둘 다 true만 true => 나머지는 false)

	데이터베이스 연산자
	-----------------------
	IN 연산자
	BETWEEN AND 연산자
	NOT
	NULL
	LIKE
*/
-- 80년에 입사한 사원의 이름 / 입사일 / 급여 출력
/*SELECT ename, hiredate, sal
FROM emp
WHERE hiredate>='81/01/01' AND hiredate<='81/12/31';*/

-- emp 테이블에서 부서가 10에서 30번까지 출력 (이름, 부서번호)
/*SELECT, ename, deptno
FROM emp
WHERE deptno>=10 AND deptno<=30;*/

-- OR연산
-- emp 테이블에서 직위(job) MANAGER 이거나 SALEMAN인 사원의 이름, 직위 출력
--SELECT ename,job FROM emp WHERE job='MANGER' OR job='SALEMAN';

-- book테이블에서 출판사(publisher)가 이상미디어 또는 대한미디어
-- 책 제목(bookname)과 출판사를 출력
--select bookname, publisher from book where publisher='이상미디어' or publisher='대한미디어' ;
--select ename, job, hiredate from emp where ename in('KING','CLARK', 'ALLEN', 'WARD', 'FORD', 'SCOTT');

-- IN => 다중 조건 (체크박스)
-- BETWEEN ~ AND : 페이지 나누는 경우
-- WHERE hiredate BETWEEN start AND end =>	>= AND <=
-- start/end를 포함
-- 81년에 입사한 사원의 이름과 입사일
SELECT ename, hiredate FROM emp WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
-- 기간 포함 
-- NOT : 부정 연산자
-- 직위가 MANAGER나 CLERK이 아닌 사원의 이름과 직위를 출력
--SELECT ename, job FROM emp WHERE NOT (job='MANAGER' OR job='CLERK');
--SELECT ename, job FROM emp WHERE job NOT IN('MANAGER', 'CLERK');

-- NULL
-- IS NULL => NULL인 경우
-- IS NOT NULL => NULL 값이 아닌 경우
-- 1. 사수가 없는 사원의 이름과 직위, 입사일을 출력
--SELECT ename, job, hiredate FROM emp WHERE mgr IS NULL;
-- mgr=null
-- 2. 성과급을 받는 사원의 이름, 급여, 직위, 성과급
--SELECT ename, sal, job, comm FROM emp WHERE comm IS NOT NULL;
SELECT ename, sal, job, comm FROM emp WHERE comm IS NOT NULL AND comm<> 0;
--0값과 null은 다르다
-- null인 경우 => 브라우저에서 => null을 출력 => 우편번호 (번지)
-- LIKE
/*
	검색
	---------------------------------
	startsWith : 시작문자열
	==> WHERE 컬럼명 LIKE '문자열%' => 'Java%' 'A%'
	endsWith : 끝나는 문자열 
	==> WHERE 컬럼명 LIKE '%문자열' => '%Java', '%K'
	%는 문자열의 개수를 모르는 경우 
	contains : 포함
	==> WHERE 컬럼명 LIKE '%문자열%' => '%Java%', '%A%'
	문자열 글자수를 아는 경우 _
	5글자중에 가운데가 O
	'_ _O_ _'
	'_K_ _'
	'J___'
	----------------------------------------

	----------------------------------------
*/