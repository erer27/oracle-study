-- 단일행 함수 => 문자열관련
-- 변환 : ***UPPER / LOWER / INITCAP
--		toUpperCase / toLowerCase : 자바에서 처리후에 전송
-- 1. emp테이블에서 사원이름을 출력 => 대문자 / 소문자 / 이니셜
/*
SELECT ename, UPPER(ename),LOWER(ename),INITCAP(ename)
FROM emp;
*/
-- king 사원의 이름, 급여, 직위, 입사일 출력
--SELECT ename,sal,job,hiredate FROM emp WHERE ename=UPPER('king');
-- 저장된 데이터는 대소문자를 구분
--SELECT ename,sal,job,hiredate FROM emp WHERE LOWER(ename)='king';
-- 2. LENGTH => 문자의 개수 (알파벳 / 한글도 동일)
-- 주로 사용되는 위치 => 자바/자바스크립트 => 유효성 검사
--SELECT ename, LENGTH(ename) FROM emp;
--이름이 5글자인 사원의 목록
--SELECT ename FROM emp WHERE LENGTH(ename)=5;
-- 3. REPLACE => 문자를 대체
-- URL / POSTER => 크롤링 => &, ||
--SELECT 'Oracle&Java' FROM DUAL;
--SELECT REPLACE('Hello Java','Java','Oracle') FROM DUAL;
--4. SUBSTR => 문자열을 자르는 경우
/*
	HELLO JAVA
	12345678910 => 오라클
	HELLO JAVA
	12345678910 => 오라클
	SUBSTR(문자열|컬럼명,시작번호,개수)
*/
--SELECT SUBSTR('Hello Oralce',7,6) FROM DUAL;
--emp에서 81년에 입사한 사원의 이름, 입사일 출력 '81/01/10'
--SELECT ename, hiredate FROM emp WHERE SUBSTR(hiredate, 4, 2)=12;
--SELECT ename,SUBSTR(hiredate,7,2) FROM emp;

-- LPAD / RPAD => 지정된 글수만큼 출력 => 적은 경우에 => 문자를 출력이 가능
-- 문자를 출력이 가능
/*
	LPAD('Hello', 10, '*') *****Hello
	LPAD('Hello',3,'*') Hel
	RPAD('Hello',7,'#') ==> Hello##
	=> ID찾기 
*/

/*
CREATE TABLE member(id VARCHAR2(20), name VARCHAR2(51));
INSERT INTO member VALUES('hong','홍길동');
INSERT INTO member VALUES('shim','심청이');	
*/

--SELECT RPAD(SUBSTR(id,1,2),LENGTH(id),'*') FROM member WHERE name='홍길동';
--SELECT ename, RPAD(SUBSTR(ename,1,2),LENGTH(ename),'*') "rpad", LPAD(SUBSTR(ename,-1, 2), LENGTH(ename), '*') "lpad" FROM emp;
--SELECT LTRIM('AAABBBCCCAAA','A'), RTRIM('AAABBBCCCAAA','A'), TRIM('A' FROM 'AAABBBCCCAAA') FROM DUAL;
-- CONCAT : 문자열 결합 ==> ||
--SELECT CONCAT('Hello' ,'Oracle') FROM DUAL;
--SELECT 'Hello'||'Oracle' FROM DUAL;
-- INSTR => indexOf, lastIndexOf => 문자의 위치 (번호)
/*
	INSTR(문자열, 찾는문자, 시작위치, 몇번째)
					 ----------
					  양수 : indexOf
					  음수 : lastIndexOf
	A	B	C	D
	1	2	3	4
	-4	-3	-2	-1
	
	Hello => '|' => 2
*/ 
--SELECT ename, INSTR(ename, 'A', 1, 2) FROM emp; : 두번째 있는 A를 찾는다
/*
	WARD (X), ADADMS
			   --
*/
--SELECT INSTR('Hello Oracle','l', 1,3) FROM DUAL; -- indexOf (+)
--SELECT INSTR('Hello Oracle', 'l', -1, 1) FROM DUAL; -- lastIndexOf (-)


/*
	LENGTH / SUBSTR / INSTR / RPAD
*/
--SELECT ename FROM emp WHERE ename LIKE '__O__';

SELECT ename FROM emp WHERE LENGTH(ename)=5 AND INSTR(ename, 'O', 1, 1)=3;