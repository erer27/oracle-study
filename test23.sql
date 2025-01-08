-- ����Ŭ 2025-01-08
/*
	=> �����ͺ��̽��� ��� �����͸� �Ѱ��� ��Ƽ� ó���ϴ� ���� �ƴϴ�
		=> �ߺ� ���� / ����� ���� ����� => ���̺� �л� (����ȭ)
		=> �����͸� ��Ƽ� ���� : ���� / ��������
		=> ���̺� �л� : ����� ��û�� �����͸� ��� ������ ���� ...
		������ ����
		1) EUQI_JOIN : �÷��� ���� ���� ������ �ִ� ��쿡 ó��
					=> �ڹٿ����� ���� Ŭ����
					class Emp : ��� ����
					{
						Dept dvo = new Dept()
						Salgrade s = new Salgrade()
					}
					=> �ܵ� ����� ����
					class Dept : �μ� ����
					{
					}
					class Salgrade : ��� ����	
					{
					}
			=> �ΰ� �̻��� ���̺��� ���������� �����ϴ� �÷��� ���� ��ġ�� ������ �ش� ���̺��� ROW ��ü�� ���� �� �� �ִ�
			=> ���̺��� �÷����� ���� ���
				=> ���̺��.�÷��� / ��Ī��.�÷���
				*** �÷����� �ٸ� ��쿡�� ������ ����
				=> ���� �÷����� ���� ��쿡�� �ٸ� �÷����� ����� ����
			=> ���� ���� �� ó�� : EUQI JOIN => (=)
			=> ���� ���� : NON EUQI JOIN => AND, BETWEEN~AND
			
			= �����
			   A(col1, col2,col3), B(col1,col4,col5)
			      ----		      -----
				|			|
				---------------------
					   |
					JOIN
			   ����Ŭ ����
				SELECT col2,col3,col4,col5,A.col FROM A,B WHERE A.col1=B.col1 
													==> �����ڸ� ����ϸ� null�� ó���� �� ����			
													==> �������� �����͸� ������ �´�
													==> INTERSECT
			   ǥ�� ���� (Ansi Join)
				SELECT col2,col3,col4,col5,A.col
				FROM A JOIN B
					    ------ => INNER�� ������ ����
				ON A.col1=B.col1
				----
					JOIN => ���ǹ��� ON
			   -------------------------------
			   �ڿ� ����
			   SELECT col2, col3, col4, col5, col1
								  ------ �ĺ��ϸ� ���� �߻�
			   FROM A NATURAL JOIN B => ��Ī�� ������� �ʴ´�

			   JOIN ~ USING
			   SELECT col2,col3,col4,col5,col1
			   FROM A JOIN B USING(col1)
						  ---------------- �񱳴���� �÷���
			   ------------------------------- ���̺��� �÷����� �����ؾ� �����ϴ�
			   NON_EUQI_JOIN
			   => 
			   WHERE sal>=losal AND sal<=hisal
				      --------------------------------- ���� ����
			   WHERE sal BETWEEN losal AND hisal

		==> �������� => �߰� / ���� / ����
			����
				�ߺ����� ������ ===== ���� ������
				    dept				|
								     emp : deptno:Foreign key
				    deptno : Primary 
			emp : �������
				empno / ename / job / mgr / hiredate / sal / comm / deptno
													  ---------
													 �ߺ��� ����
			dept : �μ�����
				deptno / dname(�μ���) / loc(�ٹ���)
				--------
				=> �ߺ����� ������
			=> �μ����� ���� / �ٹ��� ����
			     --------------------------------
			salgrade : ������� => ȣ��
				grade(���) / losal (��������) / hisal (�ְ����)
			
*/
-- ����� �̸�, ����, �Ի���, �μ���, �ٹ��� (dept)
SELECT ename, job, hiredate, dname, loc
FROM emp, dept
WHERE emp.deptno=dept.deptno;
-- ��Ī => ���̺���� �� ��� ���̺� ��Ī
SELECT ename,job,hiredate,dname,loc
FROM emp e, dept d
WHERE e.deptno=d.deptno;
--�ڿ� ����
SELECT ename, job, hiredate, dname, loc
FROM emp NATURAL JOIN dept
-- JOIN~USING
SELECT ename, job, hiredate, dname, loc
FROm emp JOIN dept USING(deptno);

-------------------------------------------
-- NON - EUQI JOIN => =�� �ƴ� �ٸ� ������ ��� => ����, �Ⱓ : AND hisal;
SELECT ename, job, hiredate, sal, grade
FROM emp JOIN salgrade
WHERE sal BETWEEN losal AND hisal;

SELECT ename, job, hiredate, sal, grade
FROM emp JOIN salgrade
WHERE sal BETWEEN losal AND hisal;

-- 3���� ���̺� ����
SELECT ename, job, hiredate, sal, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp.deptno=dept.deptno
AND sal BETWEEN losal AND hisal;

SELECT *
FROM emp JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal;











