-- 날짜 함수 (문자, 숫자, 날짜)
/*
	***SYSDATE : 시스템의 날짜 / 시간을 읽어온다
		=> + , -가 가능
*/
-- SELECT SYSDATE FROM DUAL;
SELECT SYSDATE-1 "어제", SYSDATE "오늘", SYSDATE +1 "내일" FROM DUAL;
-- 게시판 / 예약일 / 회원가입일 / 로그인한 날 ......
-- MONTHS_BETWEEN : 기간의 개월수 => 퇴직금 계산
-- MONTHS_BETWEEN(현재, 과거) => 1년이 지나면 자동 해제
--SELECT empno, ename, hiredate, MONTHS_BETWEEN(SYSDATE, hiredate) "개월수" FROM emp;

--SELECT empno, ename, hiredate, ROUND(ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)/12)) "개월수" FROM emp;

-- ADD_MONTHS : 개월을 지정 => 지정된 날짜 출력
--SELECT SYSDATE, ADD_MONTHS(SYSDATE,6) FROM DUAL;
--SELECT '24/11/18', ADD_MONTHS('24/11/18',7) FROM DUAL;

--LAST_DAY : 날짜 지정 => 마지막 날짜 출력
--SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
--SELECT LAST_DAY('25/02/10') FROM DUAL;
--NEXT_DAY => 요일 지정 => 날짜 확인
SELECT NEXT_DAY(SYSDATE, '화') FROM DUAL;
/*

	SYSDATE : 시스템의 날짜/시간
	-----------------------------------
	=> 출석 (ERP) / 퇴근 / 날짜가 필요한 경우
	MONTHS_BETWEEN : 기간의 개월수 

*/