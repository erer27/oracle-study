-- ���� ����
/*
	209 page �����Լ�
	---------------------
	=> 
	0. table/column
	=> 210
	     ������
		=> ���� : LENGTH / SUBSTR / INSTR / RPAD => String
		=>CEIL / ROUND / TRUNC => Math
		=> ��¥ : SYSDATE / MONTHS_BETWEEN => DATE, Calendar
		=> ��ȯ : TO_CHAR, to+DATE
				SimpleDateFormat / DecimalFormat
		=> ��Ÿ ***NVL
		 =>������
	=> ������ ���� ���� (����)
	1. SELECT ���� / ����
	2. WHERE => ���ǹ�(������))
	3. �ʿ�ÿ� �÷� ó�� => �����Լ�
	GROUP BY / ORDER BY / JOIN / SUBQUERY
	--------------------------------------------------- 
	DDL : ���̺� ���۹�� => ��������, ����ȭ
	DML : ������ ÷��
 	TCL : ���� ����, ���
	���� : DCL

	=> �����Լ� => �÷�����
	SUM : ��
	AVG : ���
	MIN : �ּҰ�
	MAX : �ִ밪
	COUNT : ���� ����
	 COUNT(*) => null�� ����
	 COUNT(column) => null���� ����
	 	=> �α���ó��, ���̵� �ߺ�üũ, �˻� �Ǽ�, ��ٱ��� ����
	RANK(), DENSE_RANK()
	--------------------------- �����Լ��� �ƴϴ� => �÷�, �������Լ� ����� ����
	1 2 2 4, 1 2 2 3
	=> ������ �Լ��� �������� ���Ѵ�(���� ����� �� ����)
		=> GROUP BY�� ����ϸ� ��� ����
	=> �÷���� �������� ���Ѵ�
	=> �����Լ��� ����� ����
	SELECT ename, SUM(sal), AVG(sal) ==> X
		  --------- ---------------------
	SELECT TO_CHAR(hiredate, 'YYYY-MM-DD'), SUM(), MAX() .... (X)


*/
--SELECT deptno, SUM(sal), COUNT(*) from emp GROUP BY deptno;
-- ����� �޿� �Ѿ�, ����� �޿� ��� , ����� , ���� ���� �޿�, ���� ���� �޿�
--SELECT SUM(sal), AVG(sal), COUNT(*), MAX(sal), MIN(sal) from emp;

--SELECT ename, sal, DENSE_RANK() OVER(ORDER BY sal DESC) rank FROM emp;

--����
DROP TABLE member;
CREATE TABLE member(
	id VARCHAR2(20),
	pwd VARCHAR2(10),
	name VARCHAR2(51),
	sex CHAR(6),
	address VARCHAR2(100)
);
INSERT INTO member VALUES('hong', '1234', 'ȫ�浿', '����', '����');
INSERT INTO member VALUES('shim','1234','��û��','����','���');
COMMIT;