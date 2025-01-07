-- JOIN(163page) / Subquery (170page) => ��� ����
/*
	1. �����ͺ��̽��� �ߺ��� �ּ�ȭ
	   -----------------------------------
		���̺��� ������ ���� => ���� => ����ȭ
		------------------------
		| ���̺��� �����ؼ� �ʿ��� �����͸� ���� : ����

		=> ���ڰ��� �����Ѵ�
		��� ����
		ID HOBBY
	      aaa  ���, ����, ���� => ���� / ������ ��ƴ�

		=> ID HOBBY => �ߺ��� ���� 
		 aaa ���
		 aaa ����
		 aaa ����
		=> �ߺ��� �����Ѵ�
		����			���
			-------------
			     |
			���� ���̺�
		����ȭ : �������� ���̺��� ����
			   ------------------- �Ѱ��� ��� ������ ���� => ����
		emp / dept
		 |	   |
		----------
		     |
		  deptno
		    custid	      bookid
		orders custommer book
		   |		|	    |
		  -------------	    |
		   |			   |
		  ---------------------

		1. ������ ���� (163page)
			for(int i=0, i<=10; i++)
			{
				if(emp[i]==dept[i])
				{
					������ ����
				}
			}
		 INNER JOIN => ������ =>  ������ null���� ó������ ���Ѵ�
			=  EQUI_JOIN : �÷��� ���� ���� ���
						������(=)
						=> �÷����� �������� �ʴ� ��쵵 �ִ�
						=> ���� ���̺��� �̿��ؼ� ������ �����ϴ�
							(SELF JOIN)
			Oracle JOIN : ����Ŭ������ ���
			 SELECT A.col,B.col FROM A,B WHERE A.col=B.col
			 => ���̺��� ��ų� �˾ƺ��� ����� ��쿡�� ��Ī ����� �����ϴ�
				SELECT col,col
				FROM A.a,B.b
				WHERE a.col=b.col
			ANSI JOIN : ��� �����ͺ��̽����� ��� (ǥ��ȭ) => MySQL
			SELECT A.col, B.col
			FROM A (INNER) JOIN B
			ON A.col=B.col
		------------------------------ �÷����� �ٸ� �� �ִ�(����� �����Ͱ�)
			NATURAL JOIN
			SELECT A.col,B.col FROM A NATURAL JOIN B
			JOIN ~ USING
			SELECT A.col,B.col
			FROM A JOIN B USING(�����÷���)
		------------------------------ �÷����� ����
			= NON_EQUI_JOIN : ���Ե� ��� => ������ (=)�� �ƴ� ������ ���
						    BETWEEN, AND
		 OUTER JOIN => ������ => INNER JOIN�� ������ ����
							----------------------- NULL�� ó�� ����
		= LEFT OUTER JOIN (������ ���̺� ������ ���� = �����ʿ� ���� ���)
		   = Oracle JOIN
		   = ANSI JOIN
		= RIGHT OUTER JOIN (������ ���̺� ������ ���� = ���ʿ��� �������� �ʴ� ���)
		   = Oracle JOIN
		   = ANSI JOIN
		= FULL OUTER JOIN => ��� �󵵰� ���� ���� => UNION / UNION ALL
		   = ANSI JOIN

*/

/*
	emp
	 empno/ename/job/mgr/hiredate/sal/comm/deptno
	dept
	 deptno/dname/loc
		   �μ��� �ٹ���
*/
/*
SELECT empno,ename,job,hiredate,dname,loc 
FROM emp, dept
WHERE deptno=deptno;
*/
-- �ָ��� ����
/*
SELECT empno, ename, job, hiredate, dname, loc
FROM emp e,dept d
WHERE e.deptno=d.deptno;
*/

--SELECT ename,job,dname,loc FROM emp,dept WHERE emp.deptno=dept.deptno;

--SELECT ename,job, dname, loc FROM emp JOIN dept ON emp.deptno=dept.deptno;

SELECT e1.ename "����", e2.ename "���" FROM emp e1,emp e2 WHERE e1.mgr=e2.empno(+);
