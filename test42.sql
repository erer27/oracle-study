-- ���� ���Ǵ� �� => ���պ�
/*
SELECT empno, ename, job, hiredate, sal, dname, loc, grade
FROM emp, dept, salgrade
WHERE emp, deptno=dept.deptno
AND sal BETWEEN losal AND hisal;
*/

-- ���� / ����
/*
CREATE OR REPLACE VIEW emp_info
AS
	SELECT empno, ename, job, hiredate, sal, dname, loc, grade
	FROM emp, dept, salgrade
	WHERE emp.deptno=dept.deptno
	AND sal BETWEEN losal AND hisal WITH READ ONLY;

SELECT text FROm user_views
WHERE view_name='EMP_INFO';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             */

/*
	235page
	*** ����Ŭ ������ �ܰ�
	------------------------- �� / �ε���
	------------------------- ���ν����� Ʈ���� ������
	------------------------- ���� / �������� 
	=> ��� �ϳ� �̻��� ���̺� ���Ͽ� ���� ���� ���̺�
	=> ���
		���� �����Ϳ� �������� column�� �߰��ϸ� �޸� �뷮�� Ŀ����
		���̺� �����̳� ������ ����� ���
		�ڹٿ��� SQL���� ó���� ����� ��� => �ܼ�ȭ 
		------------------------------------------- �ҽ��� ������� ���
		�ǹ� => 100�� => ���ڿ�
		String sql="";
		=> ��� SQL ������ ������ �ȴ�
	=> 1. ���� => ������ ���̺��� �����͸� ������ �� �ִ�
				JOIN / SUBQUERY ����� �ʿ䰡 ����
		2. ���� => ���� �����Ͱ� ������ �� ���°� �ƴϱ� ������ ..
		3. ������ => ���̺� ���� �ܵ����� ����� ����
		   --------------------- ���̺� ������ ��ģ�� (237page)
	=> 237 �����
		CREATE [OR REPLACE] VIEW view_name
							------------- ���̺� �ĺ��ڿ� ����
		AS
			SELECT ~~ : ���̺��� ����
		
		CREATE [OR REPLACE] VIEW view_name(empno,ename, job...)
									----------------------- ������ ����
		AS
		 SELECT * FROM ~
		
		=> 240 page �� ����
		 CREATE [OR REPLACE] VIEW view_name
		=> �����
			DROP VIEW view_name
		=> user_views : �信 ����� SQL������ �� �� �ִ�
		
		=>  ����Ŭ ��ü
			table / view / sequence / constraints / 
			=> user_objects
*/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CREATE OR REPLACE VIEW empAllData(empno, ename, job, hiredate, sal, rank, dname, loc, grade)
AS
	SELECT empno, ename, job, hiredate, sal, rank, dname, loc, grade
	FROM (SELECT empno, ename, job, hiredate,sal, RANK() OVER(ORDER BY sal DESC) rank, dname, loc, grade                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	FROm emp, dept, salgrade
	WHERE emp.deptno=dept.deptno
	AND sal BETWEEN losal AND hisal);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            