-- CURSOR : 핵심 => 데이터를 여러개 모아서 관리 => List / ResultSet
-- CURSOR가 자바 => ResultSet 결과값을 받는다 => 멀티 ROW =>  목록
/*
	CURSOR cur IS
		SELECT * FROM emp;
*/

SET SERVEROUTPUT ON;
/*

DECLARE
	vemp emp%ROWTYPE;
	CURSOR cur IS
		SELECT * FROM emp;
BEGIN
	-- for(EmpVO vo:list) = for-each
	FOR vemp IN cur LOOP -- 데이터를 한줄씩 읽어 온다
		DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate);
	END LOOP;
END;
/
*/

DECLARE
	-- 사용자 정의 데이터형
	TYPE empDept IS RECORD(
		empno emp.empno%TYPE,
		ename emp.ename%TYPE,
		job emp.job%TYPE,
		dname dept.dname%TYPE,
		loc dept.loc%TYPE
	);
	-- TYPE 선언
	ed empDept;
	-- 데이터를 모아서 관리
	CURSOR cur IS
	SELECT empno,ename,job,dname,loc 
	FROM emp,dept
	WHERE emp.deptno=dept.deptno;
BEGIN
	FOR ed IN cur LOOP
	-- empno+" "+job+" " ...
	 DBMS_OUTPUT.PUT_LINE(ed.empno||' '||ed.ename||' '||ed.job||' ||ed.dname||' '||ed.loc);
	END LOOP;
END;
/