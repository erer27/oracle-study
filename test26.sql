-- ��������
/*
	��Į�� �������� : �÷� ��� ��� => ���� ��� ����� ����
	�ζ��κ� : ���̺� ��� => ����(View)
		=> 1. �ܼ���, 2. ���պ�, 3. �ζ��κ� = ���� �����͸� ������ ���� �ʴ´� / SELECT
		=> CREATE VIEW view_name
		      AS
			SELECT~
	��Į�� ��������
		����)
			SELECT �÷���,(SELECT ~~),(SELECT ~~)
					    -------------- --------------- �Ѱ����� ����
			FROM table��
			
*/
-- ����
-- ��� ����� �̸�, ����(emp), �μ���, �ٹ���(dept)
--SELECT ename,job,dname,loc
--FROM emp,dept
--WHERE emp.deptno=dept.deptno;

SELECT ename,job,
		(SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
		(SELECT loc FROM dept WHERE deptno=emp.deptno) loc
FROM emp;

-- ���� ���̺�
/*
	customer	book
	   |		   |
	  ---------------
		|
	     orders => ������ => custid / 

	member	movie
	   |		   |
	  ---------------
		|
	      reserve
*/
/*
	�ζ��κ� => ������ ������
	---------- ���̺� ��� ���
	FROM �ڿ� ��� 
	SELECT empno, ename, job, sal
					       --- ���� �÷��� ���
	FROM (SELECT empno, ename, job, hiredate, comm FROM emp)
			     ------------------------------------------ �÷�
	=> ���� �߻� 
	=> rownum�� �ַ� �̿�
	     ---------- ����Ŭ �����ϴ� ���� �÷� = >ROW�� ������ �� �� �ڵ����� ��ȣ ���� (����)
															    -------- ������ ����
															    -------- �ζ��κ�
	     ---------- Top-N
	     ---------- �α� ���� / �ֱ� ����...
	��������
		WHERE �ڿ� (������, ������) => ���ǰ����� �̿�
		FROM �ڿ� (table ��� ���) => �ζ��κ�
		SELECT �ڿ� => ��Į�� ��������
		=> ������ SELECT�������� ��������� 
*/
SELECT empno, ename,sal, rownum
FROM (SELECT empno, ename, sal FROM emp ORDER BY sal DESC);

