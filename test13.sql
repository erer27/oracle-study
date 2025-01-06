-- 숫자 함수 / 날짜 함수
/*
	숫자 함수
		= MOD(숫자, 숫자) => MOD(10,3) => 10%3=1 => 나머지
		= CEIL(실수) => 올림함수 => 소수점이 1이상이면 올림 => 총페이지
		= ROUND(실수, 자리수) => 반올림
		   ROUND(10.567,2)
					-- 2+1 => 10.57
		= TRUNC(실수, 출력자리수) => 버림
		   TRUNC(10.567,2) => 10.56
*/
-- SELECT MOD(10,3) FROM DUAL;
-- emp에서 사번이 짝수인 사원의 이름, 사번, 직위 출력
--SELECT ename, empno, job FROM emp WHERE MOD(empno,2)=0 ORDER BY empno ASC;
SELECT ROUND(10.5678,2), TRUNC(10.5678,2) FROM DUAL;
