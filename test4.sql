-- SQL �Ұ� => 142page
/*
	SQL�� ���ڿ� �������� ������� �ִ�
		 -------------- �ϱ� / � ������ �˻� / ����
		1) DQL : ������ �˻����
			SELECT
			=> ������
			=> ���� �Լ�	
			=> JOIN
			=> SubQuery
		2) DML : ������ ���۾��
			INSERT / UPDATE / DELETE
		3) DDL : ������ ���� ���
			CREATE / DROP / ALTER / TRUNCATE / RENAME
		4) DCL : ������ ���� ���
			GRANT / REVOKE
		5) TCL : Ʈ����� ���� ��� (�ϰ�ó��)
			COMMIT / ROLLBACK

	SQL �ۼ� ������
	  1) ������ ���ᰡ �Ǹ� �ݵ�� ;�� ����Ѵ�
	  2) ���ڿ� => '' (""�� �ο��ȣ�θ� ���)
	      'KING', "KING"(X)
	      ��¥ => '' => '25/01/02' => 'YY/MM/DD'
	  3) SQL������ ��ҹ��� �������� �ʴ´� 
	     => ���:Ű����� �빮��
	     => ���� ����� �����ʹ� ��ҹ��ڸ� �����Ѵ�
	   4) ���ڿ� ������ ����
		|| => 'A' + 'B' (X) => 'A'||'B'
	   5) �Է��� ����
		&sabun => Scanner
	   6) ���ϴ� �÷��� , => ������ ������ �ȵȴ�
	   7) �÷��� ��Ī�� ����� �� �ִ�
		empno "���" ename "�̸�"
	   8) �ߺ����� ������ �б�
		DISTINCT �÷��� 
	   9) Ű���� �ڿ��� �ݵ�� ������ ....
	   10) SELECT ---> 3
		FROM ---> 1
		WHERE --> 2
	1.�˻� (������) : SELECT
	   => ��������
	   => ��ü �����͸� �д� ���
	   => ���ϴ� �����͸� �д� ���
	   ����)
		 -------------------------------------------------------------
		 SELECT * | column1, column2, column3 (column_list)
		 FROM table_name
		 ------------------------------------------------------------- �ʼ� 
		 [
			WHERE ���ǹ� => ������ => if
			GROUP BY �׷��÷� => �׷캰�� ��� (�μ���, ������, �Ի���)
			HAVING �׷� ���� => GROUP BY�� �ִ� ��쿡�� ����� ����
			ORDER BY �÷� => ����
		 ]
		
		SELECT - FROM - GROUP BY - ORDER BY
*/
-- ��� (emp) ���̺� �ִ� ����� ��� ���� ���
/*SELECT * 
FROM emp;
*/
-- ���(emp) ���̺��� ����� �����߿� ���, �̸�, ����, �Ի���
/*SELECT empno, ename,job,hiredate
FROM emp;*/
-- ���(emp) ���̺��� ����� �����߿� �̸�(ename), ����(job), �޿�(sal) ���
--select ename "�̸�", job "����", sal "�޿�" from emp;
--�ڹٿ��� sql ���۽ÿ� �ڵ����� ; �߰� => ; ����ϸ� ���� �߻�

--select distinct job from emp;

--desc book;
/*
	book
	BOOKID NUMBER(2) => ����
	BOOKNAME VARCHAR2(40) => ���ڿ�
					 ------- byte
			   => ����/���� => 40��
			   => �ѱ� 13�� => 3byte (�ѱ��ڴ�)
	PUBLISHER VARCHAR2(40) => ���ڿ�
	PRICE NUMBER(8) => ���� => 8�ڸ����� ���
	DATE => ��¥�� 
*/