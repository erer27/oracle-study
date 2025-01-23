-- FUNCTION 제작 : 리턴형을 가지고 있는 함수 = 삭제하기 전가지 영구 저장
-- 오라클 / 자바에서도 사용이 가능
-- SELECT뒤에, WHERE 조건값
-- 내장함수 => 사용자정의 함수
-- 장점 : 소스 간결하게 만들 수 있다
/*
	형식)
			CREATE [OR REPLACE] FUNCTION func_name(매개변수..)
			RETURN 데이터형
			IS
			 변수선언
			BEGIN
			 처리
			RETURN 값
			END;
			=> RETURN값은 한개만 넘어간다
*/
/*
-- JOIN
SELECT empno,ename, dname,loc, grade
FROM emp,dept,salgrade
WHERE emp.deptno=dept.deptno
AND sal BETWEEN losal AND hisal;

-- SUBQUERY
SELECT empno, ename, 
		(SELECT dname FROM dept WHERE deptno = emp.deptno) "dname",
		(SELECT loc FROM dept WHERE deptno=emp.deptno) "loc",
		(SELECT grade FROM salgrade WHERE emp.sal BETWEEN losal AND hisal) "grade"
FROM emp;
*/

/*
CREATE OR REPLACE FUNCTION getDname(vDeptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
	vdname dept.dname%TYPE;
BEGIN
	SELECT dname INTO vdname
	FROM dept
	WHERE deptno=vDeptno;
	RETURN vdname;
END;
/
*/

/*
CREATE OR REPLACE FUNCTION getLoc(vDeptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
	vloc dept.dname%TYPE;
BEGIN
	SELECT loc INTO vloc
	FROM dept
	WHERE deptno=vDeptno;
	RETURN vloc;
END;
/
*/

-- ROW 통계 => COLUMN 통계 (집계함수) => JOIN이 많거나 서브쿼리
SELECT hakbun,name,kor,eng,math,(kor+eng+math) "total",
	ROUND((kor+eng+math)/3.0,2) "avg"
FROM student;
-- 단일행 함수 제작
-- 총점 함수
-- 정수 / 실수 => NUMBER => NUMBER(8,2)
CREATE OR REPLACE FUNCTION stdTotal(pHakbun student.hakbun%TYPE)
RETURN NUMBER
IS
	total NUMBER;
BEGIN
	SELECT (kor+eng+math) INTO total
	FROM student
	WHERE hakbun=pHakbun;
	RETURN total;
END;
/
-- 평균 함수 
CREATE OR REPLACE FUNCTION stdAvg(pHakbun student.hakbun%TYPE)
RETURN NUMBER
IS
	savg NUMBER;
BEGIN
	SELECT ROUND((kor+eng+math)/3.0,2) INTO savg
	FROM student
	WHERE hakbun=pHakbun;
	RETURN savg;
END;
/

-- 매핑 테이블 => 조인 : => 보안, SQL문장을 볼 수 없다 (가독성이 낮다)
-- 내용변경시 문제 발생 
-- 고정된 경우 : 총페이지 구하기
/*
	FUNCTION 형식
	CREATE OR REPLACE FUNCTION func_name(매개변수...)
	RETURN 데이터형 => VARCHAR2, NUMBER, DATE
	IS
	 리턴할 변수 설정
	BEGIN
	SQL을 이용해서 데이터 읽기
	RETURN 값
	END;
*/
-- Function 삭제
DROP FUNCTION stdTotal;
DROP FUNCTION stdAvg;
DROP FUNCTION getDname;
DROP FUNCTION getLoc;
-- PL => 프로시저