-- �������� ���
-- ��Į�� �������� / �ζ��κ�
-- �÷� ��� ���		���̺� ���
/*
	��������
	1. VIEW ����
	   CREATE VIEW view_name
	   AS
	   SELECT * FROM emp;
	2. ���̺� ����
	   CREATE TABLE table_name
	   AS
	    SELECT * FROM dept;
	3. INSERT
	   INSERT INTO table VALUES((SELECT MAX(no)+1 FROM data)....)
	-----------------------------------------------------------------------------

	=> �ζ��κ�
		SELECT ~ 
		FROM (SELECT~)
			 ------------- ���̺� => ���� �÷��� �ٸ� �÷��� ����ϸ� �����߻�

		SELECT a,b,c,d
		FROM (SELECT a,b,c,e,f,g FROM table)
				    ------------ ����� �����ϴ�
*/
/*
SELECT empno,ename, job, hiredate, sal 
FROM (SELECT empno, ename, job, hiredate, comm, deptno
FROM emp);

-- ���� => rownum, rowid => ����Ŭ���� �����ϴ� ���� �÷�
*/

SELECT empno, ename, job,
		(SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
		(SELECT loc FROM dept WHERE deptno=emp.deptno) loc
from emp;

