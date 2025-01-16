-- INDEX���� => �˻���� ���� ����ϴ� �÷��� �ε����� ���
-- INDEX ����
/*
CREATE INDEX idx_emp_ename ON emp(ename DESC);
SELECT + INDEX(emp idx_emp_ename)  empno, ename, hiredate
FROM emp
WHERE ename>='A';
*/

/*
--DROP INDEX idx_emp_ename;

CREATE INDEX idx_emp_sal ON emp(sal);
SELECT + INDEX(emp idx_emp_sal)  empno,ename,sal
FROM emp
WHERE sal>0;
*/

/*
SELECT --+ INDEX(emp idx_emp_sal) 
empno, ename,sal 
FROM emp
WHERE sal>0;
*/

--DROP INDEX idx_emp_sal;
-- ORDER BY sal ASC,ename DESC
--CREATE INDEX idx_emp_salname ON emp(sal,ename DESC);
/*
SELECT + INDEX(emp idx_emp_salname)  empno, ename, sal
FROM emp
WHERE sal>0 AND ename >='A';
*/

--DROP INDEX idx_emp_salname;
-- INDEX_ASC() / INDEX_DESC() => PK

/*
SELECT /*+ INDEX_ASC(emp emp_empno_pk) */ empno, ename, sal
FROM emp; 

SELECT /*+ INDEX_DESC(emp emp_empno_pk) */ empno, ename, sal
FROM emp; 
*/

/*
	=> �Խ��� / ��� / ��ǰ / ���� ....
	�ε��� ���� => 100%
	-------------
		=> �˻� �ӵ��� ������ �ϱ� ���� ���
		=> �Ϻ� SQL���� ���� ���
		1. ���� 
		   ������ ���� ��� => �ַ� ��� (�˻��� ������ ������)
		2. ����
		    �޸� �Ҵ��� �������� => ����Ŭ ���� ���ϰ� ���ϴ�
		     => �����̺�ȿ� 4~5�� ������ �����ϴ�
			=> �˻�� �߽����� ���� => title / name
			���̺� ����ÿ��� �ε����� �ֽ�ȭ
			=> INSERT / UPDATE / DELTE
				=> ALTER INDEX index�� REBUILD 
		3. �ε��� ���
			= ���̺� ROW�� ���� ��� (100000�̻��� ���) => ������
			= WHERE���忡�� �˻��� ���� �÷��� �ִ� ���
				=> ��ȭ�� / ������ / �����Ǹ�
			= �˻� ����� ��ü �������� 2~5%������ ���
			= JOIN���� ���� ���Ǵ� �÷�
			= NULL ���� �����ϰ� �ִ� �˻�� �ִ� ��� 
			
		4. ����
			�ڵ� ���� : PRIMARY KEY, UNIQUE
			���� ���� : �ַ� �˻�� �߽����� �����
				CREATE INDEX index�� ON ���̺�(�÷� ASC|DESC) => ���� ASC
				CREATE INDEX index�� ON ���̺�(�÷�, �÷�)
			=> ������(�ε��� ����) => ������ �߰� / ���� / ����
				ALTER INDEX index�� REBUILD
		5. ����
			DROP INDEX index��
					   --------- �������̸� �ߺ�����
					   idx_���̺��_�÷��� 
		6. ����
			��Ʈ => �ּ�
					/*+ INDEX_ASC(���̺� PK) */ �÷�....
					/*+ INDEX_DESC(���̺� PK) */ �÷�....
					/*+ INDEX(���̺� INDEX��) */ �÷�....
	
		4��
		----
			SELECT / INSERT / UPDATE / DELETE
			���̺� / �ε��� / �� / ������ / �ó�� => ��ü
	
			=> ����
			     -------- �Լ� / ���ν��� / Ʈ����
			=> �����ͺ��̽� ����
			=> Ʈ�����
			
*/