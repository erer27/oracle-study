-- FUNCTION ���� : �������� ������ �ִ� �Լ� = �����ϱ� ������ ���� ����
-- ����Ŭ / �ڹٿ����� ����� ����
-- SELECT�ڿ�, WHERE ���ǰ�
-- �����Լ� => ��������� �Լ�
-- ���� : �ҽ� �����ϰ� ���� �� �ִ�
/*
	����)
			CREATE [OR REPLACE] FUNCTION func_name(�Ű�����..)
			RETURN ��������
			IS
			 ��������
			BEGIN
			 ó��
			RETURN ��
			END;
			=> RETURN���� �Ѱ��� �Ѿ��
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

-- ROW ��� => COLUMN ��� (�����Լ�) => JOIN�� ���ų� ��������
SELECT hakbun,name,kor,eng,math,(kor+eng+math) "total",
	ROUND((kor+eng+math)/3.0,2) "avg"
FROM student;
-- ������ �Լ� ����
-- ���� �Լ�
-- ���� / �Ǽ� => NUMBER => NUMBER(8,2)
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
-- ��� �Լ� 
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

-- ���� ���̺� => ���� : => ����, SQL������ �� �� ���� (�������� ����)
-- ���뺯��� ���� �߻� 
-- ������ ��� : �������� ���ϱ�
/*
	FUNCTION ����
	CREATE OR REPLACE FUNCTION func_name(�Ű�����...)
	RETURN �������� => VARCHAR2, NUMBER, DATE
	IS
	 ������ ���� ����
	BEGIN
	SQL�� �̿��ؼ� ������ �б�
	RETURN ��
	END;
*/
-- Function ����
DROP FUNCTION stdTotal;
DROP FUNCTION stdAvg;
DROP FUNCTION getDname;
DROP FUNCTION getLoc;
-- PL => ���ν���