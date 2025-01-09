-- 2025-01-09 ��������(170page) => �μ�����
/*
	���������� ����
	 => WHERE ���� �ڿ� ���
	 = ������ �������� (���������� ������� �Ѱ�)
	 = ������ �������� (������� ������)
	 => SELECT ~~
	      FROM table��
	      WHERE �÷��� ������ (SELECT~)
	 -------------------------------------------- �÷��� �� ���� �̿�
							*** �÷��� ������ ��� => �����÷� ��������
	 => �÷��� ��� ��� : ��Į�� �������� => ������ ����� �� �ִ�
		SELECT �÷���, (SELECT ~~)
		FROM table��
	 => �ζ��κ� : ���̺� ��� ��� 
		SELECT ~~
		FROM (SELECT ~~)

	�������� ���� ����
	1. ���������� ���� ���� => ������� Main Query�� ����
	   Main Query = (Subquery)
				     1
	 	2
	   SELECT ~
	   FROM table��
	   WHERE �÷��� = (SELECT ~~)
				   ---------------
	   ------------------    SubQuery
	    MainQuery

	2. JOIN =====> ���̺� �� �� �̻󿡼� �ʿ��� ������ �����ϴ� ���
	  SubQuery ===> SQL���� �� �� �̻��� ���� ��� 
	  ------------ SQL������ �ִ��� ���� �� �ְ� �����

	 SQL������ �� �� �̻��� ���
	 => �ڹ� => ����Ŭ ���� => ����� �ޱ�
	 => �ڹ� => ����Ŭ ���� => ����� �ޱ�
	 => �ڹٿ����� �� ���� ������ ���� 
	 => ���ν��� : �������� SQL ������ �� ���� ���� (ERP) => �ӵ��� ����ȭ
	 => SQL+SQL => SQL������ �������

	3. SQL������ �����ϴ� ���
			   ---------------
	   = ����߿� ��ü �޿��� ��պ��� ���� �޴� ����� �̸�, �޿�, ����, �Ի���
			   --------------------
	  1) �޿��� ����� ���Ѵ�
		SELECT ROUND(AVG(sal) FROM emp; => 2073
	  2) WHERE �ڿ� ����� ������ ó��
		SELECT ename, sal, job, hiredate
		FROM emp
		WHERE sal<(SELECT ROUND(AVG(sal) FROM emp);
				---------------------------------------------
				  �Ѱ��� ����� ���� => ������ ��������
			=> ������ �������� (�������̿�)
				IN, ANY, SOME, ALL
				    ------------------- 1���� ����
				    ANY(SOME)
				    > ALL(10,20,30) => �ִ밪 => 30
				    ALL(10,20,30) => �ּҰ� => 10
				    ANY(10,20,30) = > �ּҰ� => 10
				    ANY(10,20,30) => �ִ밪 => 30
				   -------------------------------------- MAX/MIN
		JOIN < SUBQUERY
			  -------------- SELECT / INSERT / UPDATE / DELETE
		------ SELECT���忡���� ��� 
		1. ������ ��������
		   ����)
			KING�� ���� �μ����� �ٹ��ϴ� ����� �̸�, �μ�, �μ���ȣ, �Ի����� ���
			-------------------------------	    -----------------------------------------
					1						2
		  SELECT deptno FROM emp WHERE ename='KING';
		  SELECT ename, deptno, hiredate
		  FROM emp
		  WHERE deptno=10;
		-------------------------------------------- �Ѱ��� �������� ����

		 SELECT ename, deptno, hiredate
		 FROM emp
		 WHERE deptno=(SELECT deptno FROM emp WHERE ename='KING')
*/
--SELECT COUNT(*) FROM emp;
--SELECT ename, deptno, hiredate FROM emp WHERE deptno=10;

--10�� �μ����� �޿��� ���� ���� ����� �̸�, �޿�

--SELECT ename,sal FROM emp WHERE sal=(SELECT MAX(sal) FROM emp WHERE deptno=10);
/*
	1. ����
	getConnection()
	2.SQL ����
	String sql="SELECT MAX(sal) FROM emp WHERe deptno=10;
	3. SQL������ ����Ŭ ����
	  ps=conn.preparedStatement(sql)
	4. ����� �ޱ�
	 ResultSet rs=ps.executeQuery()
	5. ����� ����
	 rs.next()
	6. ���� ����
	 int sal=rs.getInt(1);
	 ps.close()
	 rs.close()
	7. sql���� ����
	 sql="SELECT ename,sal FROM emp WHERE sal="sal
	 ps=conn.preparedStatement(sql)
	 rs=ps.executeQuery()
	 while(rs.next())
	 {
	 }
	rs.close()
*/
-- 170 page => ���� ��� ������ �̸� => SQL���� 2��
--DESC book;

--SELECT MAX(price) FROM book; 
-- 35000
--SELECT bookname FROM book WHERE price=35000;

--SELECT bookname
--FROM book
--WHERE price=(SELECT MAX(price) FROM book);

-- DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �Ի����� ���

--SELECT ename, job, deptno, hiredate FROM emp
--WHERE deptno=(SELECT deptno FROM dept WHERE loc='DALLAS');

-- SCOTT�� �ٹ��ϴ� �μ����� ���� �ٹ��ϴ� ����� �̸�, �μ���, �ٹ���, �Ի����� ����϶�


--SELECT ename, dname, loc, hiredate FROM emp JOIN dept ON emp.deptno=dept.deptno
--WHERE dept.deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');

-- ������ �������� (���������� ���� �������� ���)
-- ��� �μ���ȣ�� �޾Ƽ� 10,20,30 => �ش�Ǵ� ����� �̸�, �μ���ȣ
-- ��� �μ���ȣ ���

SELECT ename, deptno FROM emp WHERE deptno IN (SELECT DISTINCT deptno FROM emp);

/*
	�������� ���� ������� �������� ���
	=, <,> ,<=, >= �Ұ���

	=> IN() => ��ü�� ����
	=> ANY(SOME)
	     =======>	deptno > ANY(10,20,30) => �Ѱ��� ���� => �ּҰ�
				deptno > 10
				deptno < ANY(10,20,30)
				
	=> ALL
		======> deptno > ALL(10,20,30)
				deptno > 30 =========> �ִ밪
				deptno < ALL(10,20,30)
				deptno < 10 =========> �ּҰ� MIN
*/
--SELECT ename, deptno FROM emp WHERE deptno < ANY(SELECT DISTINCT deptno FROM emp);

--SELECT ename, deptno FROM emp WHERE deptno > ANY(SELECT DISTINCT deptno FROM emp);