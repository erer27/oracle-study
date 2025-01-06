-- 변환 함수
/*
	***1. TO_CHAR : 날짜, 숫자를 문자열로 변환
	   ------------- SimpleDateFormat / DecimalFormat
	2. TO_NUMBER : 문자열을 숫자 변환
			Integer.parseInt(), Double.parseDouble()
	3. TO_DATE : 문자열을 데이터형으로 변환
		new Date(문자열)
	
	TO_CHAR
		날짜 변환
		년도 : YYYY / YY => yyyy / yy
		월 : MM / M => mm / m
		일 : DD / D => dd / d
		시간 : HH / HH24
		분 : MI
		초 : SS
		dy : 요일
		숫자 변환
		1,000 => 자바(###,###) => 999,999
		$999,999
		L999,999
*/
--SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS DY') FROM DUAL;

--댓글
--emp에서 사원의 입사일과 요일 출력
SELECT ename, hiredate, TO_CHAR(hiredate, 'RRRR/MM/DD DY') FROM emp;
/*
	년도 : YYYY / RRRR을 이용해도 된다 => Y2K
		----------------
*/
--SELECT empno, ename, TO_CHAR(sal,'$999,999') FROM emp;
--SELECT empno, ename, TO_CHAR(sal, 'L999,999') FROM emp;
--SELECT ename, TO_CHAR(hiredate, 'YYYY "년도" MM "월" DD "일"') FROM emp;

--SELECT '100'+'200' FROM DUAL;
--SELECT TO_NUMBER('100')+TO_NUMBER('200') FROM DUAL;
SELECT TO_DATE('25/01/05', 'YYYY-MM-DD') FROM DUAL;