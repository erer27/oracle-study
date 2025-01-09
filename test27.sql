-- SELECT : ������ �˻�
/*
	���� / ������(WHERE) / �����Լ�
	JOIN : ���̺� ����
	SUBQUERY : SQL���� ����
	���տ���
	----------
	UION / UNION ALL / MINUS / INTERSECT
*/
/*
CREATE TABLE A(
	no NUMBER
);

CREATE TABLE B(
	no NUMBER
);
INSERT INTO A VALUES(1);
INSERT INTO A VALUES(2);
INSERT INTO A VALUES(3);
INSERT INTO A VALUES(4);
INSERT INTO A VALUES(5);

INSERT INTO B VALUES(4);
INSERT INTO B VALUES(5);
INSERT INTO B VALUES(6);
INSERT INTO B VALUES(7);
INSERT INTO B VALUES(8);

COMMIT;
*/
--SELECT no FROM A UNION SELECT no FROM B;
--UNION ALL => ������ => �ߺ������� ���� => 1 2 3 4 5 4 5 6 7 8
--SELECT no FROM A UNION ALL SELECT no FROM B;
-- INTERSECT => ������ => ���� ���� ������ �´� => 4 5
--SELECT no FROM A INTERSECT SELECT no FROM B;

/* 
	������ => ��� 230000
	������ => �󼼺��� 120000
			---------- INTERSECT

*/
-- MINUS : ���� �����͸� ���

/*
	A MINUS B => INTERSECT + MINUS ==> LEFT OUTER JOIN
	1 2 3 4 5
	4 5 6 7 8
	----------- 1 2 3
	B MINUS A => INTERSECT + MINUS ==> RIGHT OUTER JOIN
	4 5 6 7 8
	1 2 3 4 5
	----------- 6 7 8
*/
--SELECT no FROM A MINUS SELECT no FROM B;

--SELECT name FROM customer MINUS SELECT name FROM  customer WHERE custid IN(SELECT custid FROM orders);

/*
	JOIIN : �� �� �̻��� ���̺��� ��¿� �ʿ��� �����͸� ����
				    ------- ���̺� ����
	=> SELECT������ ����� ����
	�������� : SQL���� �������� �����ؼ� ��� (��Ʈ��ũ ����)
			=> ��(�ڹ�)�̿�ÿ� �ַ� ����ϴ� ���
			=> DML ��ü / DDL������ ����� ����
			=> �������� (SELECT)
			=> �÷� ��� ���
			=> ���ǰ��� �ο� => WHERE �÷� ������ (SELECT~)
		������ ======== �ڹ� ======== ����Ŭ

		   |				  |			    |
	       ȭ�� ���		   ������/����Ŭ ����  ������ ����
		��Ʈ��ũ�� ���������� ���� ���� ������
	=> �ڹ� / ����Ŭ => ����� ���� ����
				     ---------------------	=> 1. ������ 
					ANY / ALL => MAX/MIN
								     2. ����ȭ

	=> ���� ���� : �����ӿ�ũ 
*/

/*
��������
	1. ���������� ���� =>  ����� =>  �������� ����
	SELECT ~~
	FROM WHERE �÷�=(SELECT~~)
	---------------------------------------
	  ��������		��������
	2. ������
	  �÷� 1���� ���� ����� 1��
	3. ������
	   �÷� 1���� ���� ����� ������
	=> �ΰ� �̻� �÷� => ���� �÷� �������� / ���� ��������
	=> with�� �̿��ϴ� �������� 
	=> �ٸ� ���̺� ������ ����
*/
-- �μ����� SALES���� �޿��� ���� ���� ���� ����� �̸�
--		 dept						emp
-- 		  ---------------deptno-----------------

/*
SELECT deptno FROM dept WHERE dname='SALES';
SELECT MAX(sal) FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE dname='SALES');

SELECT ename FROM emp WHERE sal=(SELECT MAX(sal) FROM emp
WHERE deptno=(SELECT deptno FROM dept WHERE dname='SALES'));
*/

-- SMITH���� �޿��� ���� �޴� ����� �̸�/�޿� ���
-- ------------------		    -------------------------
--SELECT sal FROM emp WHERE ename='SMITH';
SELECT ename, sal
FROM emp
WHERE sal>(SELECT sal FROM emp WHERE ename='SMITH');
-- ��� �κ� ������������ Ȯ��
-- 10�� �μ��� ������� ������ �ִ� ������ ���� ����� �̸�/����
--SELECT job FROM emp WHERE deptno=10;
/*
	PRESIDENT
	MANAGER
	CLERK
*/
SELECT ename,job
FROm emp
WHERE job IN('PRESIDENT','MANAGER','CLERK');

SELECT ename,job
FROm emp
WHERE job IN(SELECT job FROM emp WHERE deptno=10);





