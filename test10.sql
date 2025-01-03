-- 오라클 2일차
/*
	SELECT : 데이터 검색 (오라클에서 데이터를 찾아주는 역할)
	--------
	 1) 형식 / 순서
	     SELECT*|column_list FROM table명[ WHERE 조건문 GROUP BY 그룹컬럼 HAVING 그룹조건 ORDER BY 컬럼 (ASC|DESC)]
	 2) 조건 검색
		WHERE => 연산자 사용법
		산술연산자 : +, -, *, /
		비교연산자 : =, <>, <, >, <=, >=
		논리연산자 : AND, OR
		IN / BETWEEN / NOT / NULL(IS NULL, IS NOT NULL) / LIKE
	 3) 내장 함수
		단일행 함수
			1. 문자 함수 => String
			   = LENGTH() : 문자 개수, LENGTHB() : 바이트 수
			      예)
				LENGTH('abc') => 3
				LENGTH('홍길동') => 3
				
				LENGTHB('abc') => 3
				LENGTH('홍길동') => 9
				=> 사용처 : 비밀번호 (8~15)
				=> CHAR(1~2000byte)
					VARCHAR2(1~4000byte)
				=>	VARCHAR2(9) => CLOB
				=> VARCHAR2(9)
				***= UPPER() : 대문자 변환 => String에서 처리후에 전송
					UPPER('abc')=>ABC
				= LOWER() : 소문자 변환
					LOWER('ABC') => abc
				= INITCAP() : 이니셜 변환 => 첫자만 대문자
					INITCAP('abc') => Abc'
				= LPAD / ***** RPAD
				   LPAD(문자열, 문자갯수, 출력문자)
				   LPAD('admin',10,'*')
					=> *****admin
				   RPAD('admin',10, ,'*')
					=> admin *****: ID찾기, 비밀번호찾기 => 이메일 전송
												  javaMail
				= LTRIM / RTRIM / TRIM => 좌우의 문자 제거, 공백 제거
				    좌 우		  좌우
				LTRIM(문자열,'제거할 문자')
				=> LTRIM('aaaHonedage','a';) => Hongaaa
				=> RTRIM('aaaHongaaa','a'; =>  aaaHong
				= ******SUBSTR => substring() : 문자열을 자르는 경우에 사용
					SUBSTR(문자열, 시작번호, 개수) SUBSTR('abcdfeg',1,3)
			2. 숫자 함수 => Math
			3. 날짜 함수 => Calendar
			4. 변환 함수 => Format
			5. 기타 함수 => NULL 처리, 다중 조건문, 선택문
			내장함수 : 오라클에서 지원하는 함수 (라이브러리)
					리턴값을 가지고 있다
					사용위치 : SELECT 뒤, WHERE 뒤, GROUP BY 뒤, ORDER BY 뒤
					*** 사용자 정의 함수도 존재
					CREATE FUNCTION 함수
		 => 단일행 함수 : ROW단위 처리, 한줄씩 처리
		
		집합행 함수
	 4) 여러개 테이블을 연결
		= 조인
		= 서브쿼리 (부속질의)
	5) 그룹별 처리 => GROUP BY
	6) 정렬 => ORDER BY

*/
-- LENGTH
--SELECT LENGTH('abc'), LENGTH('홍길동') FROM DUAL;
--SELECT LENGTHB('abc'), LENGTHB('홍길동') FROM DUAL;
--SELECT ename,UPPER(ename),LOWER(ename) , INITCAP(ename)
--FROM emp;
--SELECT ename, RPAD(SUBTR(ename,1,2),LENGTH(ename),"*");
--SELECT RPAD('abcdefg',5,'*') FROM DUAL;
--SELECT LTRIM('aaabbbcccaaa','a'), RTRIM('aaabbbcccaaa','a'), TRIM('a' from 'aaabbbcccaaa') FROM DUAL;
-- 12월에 입사한 사원의 이름과 입사일
SELECT ename, hiredate FROM emp WHERE SUBSTR(hiredate,4,2)=12;
