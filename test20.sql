-- 159page GROUP BY/JOIN
/*
	GROUP : �׷캰 ���
		   ----------------
		   �������� / �μ��� / ������ / �Ի�⵵
		=> SELECT �Ҽ�
		=> ������ �Լ��� ����� �Ұ���
		=> �����Լ��� �ַ� �̿��Ѵ�
		=> ���� �Ӽ�(�÷�)������ �׷��� ���� ���
	=>
	[
		WHERE => �����Լ��� ����� �� ���� (������ �Լ��� ��� ����)
		GROUP BY => �÷��� ���� ���� �ִ�, ������ �Լ�
		HAVING => �����Լ� �̿�
		ORDER BY => �Լ� | �÷� 
	]
	=> 159page
		COUNT : row ���� => �α��� / ���̵��ߺ�, �˻����, ��ٱ���
		MAX : �ڵ� ���� ��ȣ 
		MIN
		SUM : => ���
		AVG : => ���
		RANK / DENSE_RANK
	=> ������������ => ȸ���и� 	
	=> ���� ����
		SELECT	---> 5
		FROM 	---> 1
		WHERE	---> 2
		GROUP 	---> 3
		HAVING	---> 4
		ORDER	---> 6

*/
-- �������� �����, ��ձ޿�, �޿��� ����
--SELECT job, COUNT(*), AVG(sal), SUM(sal) FROM emp GROUP BY job;'
-- �Լ� �̿��� => �Ի�⵵ => �ο���, ���, ����
--SELECT TO_CHAR(hiredate,'YYYY'), COUNT(*), AVG(sal),SUM(sal) FROM emp GROUP BY TO_CHAR(hiredate, 'YYYY');
--�Ի� ���Ϻ�, �޿�����, ���, �ִ밪, �ּҰ�, �ο���
--SELECT TO_CHAR(hiredate,'DY'),SUM(sal),AVG(sal),MAX(sal),MIN(sal),COUNT(*) FROM emp GROUP BY TO_CHAR(hiredate,'DY');
--���� : � ���Ͽ� ���Ÿ� ���� ���� �ϴ���
--DESC Orders;
--DESC book;
--DESC customer;


/*
Orders : ������Ȳ
 ORDERID                                   NOT NULL NUMBER(2)
 CUSTID                                             NUMBER(2)
 BOOKID                                             NUMBER(2)
 SALEPRICE                                          NUMBER(8)
 ORDERDATE                                          DATE

BOOK : å����
 BOOKID                                    NOT NULL NUMBER(2)
 BOOKNAME                                           VARCHAR2(40)
 PUBLISHER                                          VARCHAR2(40)
 PRICE                                              NUMBER(8)

Customer : �� ����
 CUSTID                                    NOT NULL NUMBER(2)
 NAME                                               VARCHAR2(40)
 ADDRESS                                            VARCHAR2(50)
 PHONE                                              VARCHAR2(20)

	��			  å
		--------------
			|
		    �������̺� => 3����ȭ => ����

*/
-- ���� �ֹ��� ������ ���Ǹž� 
--SELECT TO_CHAR(SUM(saleprice),'L999,999,999') as �Ѹ��� FROM orders;

-- 2���� �ֹ� ������ ���Ǹž�
--SELECT TO_CHAR(SUM(saleprice),'L999,999,999') as �Ѹ��� FROM orders WHERE custid=2;
--���Ǹž�, ���, �ּ�, ���, �����ο�
--SELECT SUM(saleprice), AVG(saleprice),MIN(saleprice), MAX(saleprice), COUNT(*) FROM orders;

--���� ���Ǹž�, ���, �ּ�, �ִ�
--SELECT custid, SUM(saleprice), AVG(saleprice), MIN(saleprice), MAX(saleprice) FROM orders GROUP BY custid ORDER BY custid;
/*
	HAVING�� �̿��ϴ� ��쿡�� �ݵ�� GROUP BY�� ����ؾ� �ȴ�
	=> HAVING�� �ܵ����� ����� �� ����
	WHERE���忡���� �����Լ��� �̿��� �� ����
				  ------------------- ��������
	GROUP BY => �׷캰 =>  ���� (������ ���)
	----------------------------------------------------
	���� : ���̺� ���� => �ʿ��� ������ ����
	�������� : SQL���� ���� => �Ѱ��������� ����
	---------- ���� ���Ǵ� ���� : 1. ���κ��� ������
						  2. �ڹٿ��� ���� => �ִ��� �������� SQL����
*/
-- ����� ��ձ޿����� ���� �޴� ����� �̸�, �޿����
--SELECT ROUND(AVG(sal)) FROM emp;
-- 2073
--SELECT ename, sal FROM emp where sal>2073;

--SELECT ename, sal FROM emp where sal>(SELECT ROUND(AVG(sal)) FROM emp);
-- HAVING ��� => GROUP BY������ ����� ����
-- �μ����� ��ü �޿����� ���� �޴� �μ��� ���
--		2073
--SELECT deptno, COUNT(*), SUM(sal),AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal)>2073 ORDER BY deptno

--�μ����� �ο��� 3�� �̻��� �μ��� �ο�, ����, ���
--SELECT deptno, COUNT(*), SUM(sal), AVG(sal) FROM emp GROUP BY deptno HAVING COUNT(*)>3;

--������ 8õ �̻��̰� 2�� �̻��� ������ ���� ���
--SELECT custid, count(*) FROM orders WHERE saleprice>=8000 GROUP BY custid HAVING COUNT(*)>=2;

