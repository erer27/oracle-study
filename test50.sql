-- PL/SQL => 데이터베이스 프로그래머 (DBA)
/*
	웹 개발자 : JDBC (오라클 연결) / 웹연동 (JSP,Spring)
	PL/SQL => 반복 제거 (함수), 재사용
	-------- FUNCTION / PROCEDURE / TRIGGER
	형식)
		DECLARE
		 변수 선언 => 선언부 
		BEGIN
		 SQL이용해서 처리 => 구현부
		END;

		=> CREATE [OR REPLACE] FUNCTION fun_name(매개변수)
			RETURN 데이터형
			IS
			 변수 선언
			BEGIN
			 기능 처리
			END;
		=> CREATE [OR REPLACE] PROCEDURE pro_name(매개변수)
			IS
			 변수 선언
			BEGIN
			 기능 처리
			END;
			=> 다른 테이블 변경
		=> CREATE [OR REPLACE] TRIGGER tri_name
			BEFORE (INSERT/UPDATE/DELETE) ON table_name
			DECLARE
			 변수 선언
			BEGIN
			   이벤트 처리
			END;

		문법 (PL/SQL)
		   1. 변수의 종류 => 지역변수 / 매개변수
			= 스칼라 변수 (사용자 정의)
			   변수명 데이터형
			   on NUMBER
			   day DATE ... ==> 테이블 제작시 컬럼 설정하고 동일
			   => 문자형(CHAR, VARCHAR2, CLOB)
				 숫자형(NUMBER)
				 날짜형(DATEA)
			= %TYPE (실제 테이블에 저장된 컬럼 데이터형을 읽기)
				변수명 테이블명.컬럼명%TYPE

			= %ROWTYPE (테이블 전체 컬럼의 데이터형 한번에 있는 경우)
			   => 자바 (VO)
			   변수명 테이블%ROWTYPE

			 = 사용자 정의 데이터형 (테이블 여러개) RECORD => 조인/서브쿼리
			    TYPE 변수명 IS RECORD(
				=> 스칼라변수
				=> %TYPE
			    )
			--------------------------- ROW 한 개값만 대입이 가능 (단일행)
			= CURSOR : List,ResultSet => 목록 (동시에 여러개의 ROW 읽기
			   CURSOR cur명 IS
				SELECT ~~
			=> 스칼라변수 / %TYPE / CURSOR
				
		   2. 연산자 => 오라클 연산자 (산술, 비교, 논리, IN, BETWEEN, NULL, NOT, LIKE)
		   3. 제어문
			= 조건문
			   = 단일 조건문 
				IF 조건문 THEN
					처리문장 => SQL이용 : 조건이 TRUE일 때 수행하는 문장 
				END IF;
				= 선택 조건문 : TRUE / FALSE => 처리
				   IF 조건문 THEN
					처리문장 ==> 조건이 TRUE일 때 처리
				   ELSE
					처리문장 ==> 조건이 FALSE일 때 처리
				   END IF;
				= 다중 조건문 => 조건이 여러개 : 한 개만 수행 => 한 개의 문장으로
				 IF 조건문 THEN
					처리문장 => TRUE => 처리 = 종료
					FALSE
					     |
				 ELSIF 조건문 THEN
					처리문장 => TRUE => 처리 = 종료
				 ELSE
					처리문장 => 조건이 없는 경우 처리 => 생략이 가능
				END IF;
			= 선택문 : CASE => TRIGGER에서 주로 사용
				CASE 변수	=> switch(변수)
				WHEN 값 THEN 처리
				WHEN 값 THEN 처리
				WHEN 값 THEN 처리
				ELSE
					처리
				END;
			= 반복문 
				= 기본 반복문 => do~while
				   LOOP
					반복처리문장
					EXIT 조건 ==> 종료
				   END LOOP;
				= WHILE
				   WHILE 조건문 LOOP
					반복 처리문장
				   END LOOP;

				= FOR 
				   형식)
					  FOR i IN 1..9 LOOP => for(int i=1;i<=9; i++)
					  FOR 변수 IN low..hi LOOP => 1~9
						처리문장
					  END LOOP
					  
					 =>  역순 출력
					  FOR i IN REVERSE 1..9 LOOP => for(int i=9; i>=1; i--)
						      ----------- 9부터 1까지
						처리문장
					  END LOOP
*/
-- CASE 사용법
SET SERVEROUTPUT ON;
/*
DECLARE
	vEname emp.ename%TYPE;
	vDeptno emp.deptno%TYPE;
	vDname dept.dname%TYPE;
BEGIN
	SELECT ename, deptno INTO vEname,vDeptno
	FROM emp
	WHERE empno=7788;
	-- switch(vDeptno) ==> := 값 대입 
	vDname:=CASE vDeptno
			WHEN 10 THEN '개발부'
			WHEN 20 THEN '영업부'
			WHEN 30 THEN '자재부'
			ELSE '신입'
			END;
	-- 출력
	DBMS_OUTPUT.PUT_LINE('----- 결과 -----');
	DBMS_OUTPUT.PUT_LINE('이름:'||vEname);
	DBMS_OUTPUT.PUT_LINE('부서:'||vDname);
	
END;
/
*/

-- Basic Loop (do~while)
/*
	int sno=1;
	int eno=10;
	do
	{
		System.out.println(sno);
		sno++;
	}while(sno>eno);
*/
/*
DECLARE
	sno NUMBER:=1;
	eno NUMBER:=10;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE(sno);
		sno:=sno+1; -- ++ 존재하지 않는다
		EXIT WHEN sno>eno;
	END LOOP;
END;
/
*/
-- WHILE
DECLARE
	no NUMBER:=1;
 BEGIN
	WHILE no<=10 LOOP
	 DBMS_OUTPUT.PUT_LINE(no);
	 no:=no+1;
END LOOP;
END;
/
-- FOR : 데이터를 여러개

-- 짝수 => MOD(10,2) = 10%2
DECLARE
BEGIN
	FOR i IN  1..10 LOOP
		IF MOD(i,2)=0 THEN
		 DBMS_OUTPUT.PUT_LINE(i);
		END IF;
	END LOOP;
END;
/

DECLARE
BEGIN
	FOR i IN  1..10 LOOP
		IF MOD(i,2)=1 THEN
		 DBMS_OUTPUT.PUT_LINE(i);
		END IF;
	END LOOP;
END;
/