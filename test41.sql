-- 235page ��
/*
	��(view) : 
		����� �������� �並 ������ ������ ����(system���� => ���� �ο�)
		------------------------------------------------
			������ �ο��ϴ� ���� : ������ ���� (system / sysdba)
			hr : ����� ����
			1) system���� ����
				conn system/happy
			2) ���� �ο�
				grant create view to hr
				--------------------
				create function / create procedure .....
				���� ����	
				revoke create view from hr

		�ٸ� ���̺��� �����ؼ� ���Ӱ� ��������� ���� ���̺�
		=> ���� : ���� (�信 ����Ǵ� ���� �����Ͱ� ����Ǵ� ���� �ƴϴ�. SELECT ������ ����ȴ�)
		=> ������ SQL������ �ִ� ��쿡 �ַ� ��� / �ҽ��� ����������
		=> �Ϲ� ���̺�� �����ϰ� ��� 
			FROM table_name|(SELECT~)|view_name
		=> ������ : INSERT / UPDATE / DELETE => view�� ����Ǵ� ���� �ƴ϶� �����ϴ� ���̺� ����
		=> �ݵ�� table�� �ʿ��ϴ�
			=> �����͸� ��Ƽ� �����ϴ� ���
	1. �� ����
		1) �ܼ��� : �� ���� ���̺��� ���� => ���̺��� ����ϴ� ���� ��
				���󵵴� ���� ����
		2) ���պ� : �ΰ��̻��� ���̺��� ����
				=> ���� / �������� 	
		3) �ζ��κ� : SELECT => ���ο� ���� ���̺� ó��
				 => ����¡���
	2. �� �ɼ� => �����ִ� ���� (DML�� ����)
		1) WITH CHECK OPTION => INSERT / UPDATE / DELETE ����
			= DEFAULT 
		2) WITH READ ONLY : DML�� �Ұ��� => SELECT�� ����
		*** �信 DML�� ����ϸ� table�� ������ ��ģ��
	3. �� ���� 
		���� ���
		 CREATE VIEW view_name
		 AS
		  SELECT * FROM emp; => emp/dept => ����

		=> ���� => �����Ŀ� �ٽ� ����
		=> ������ ���ÿ� ������ �����ϰ� ����� ���
		CREATE OR REPLACE VIEW view_name
		AS 
			SELECT~
		=> �������� ������ ����
	4. ���� : �ڹٿ��� JDBC�� �ַ� ��� => SQL������ ������ ��쿡 �並 �̿��ؼ� ���
	5. ���� 
		DROP VIEW view_name
	6. ��Ȯ�� 
	    SELECT * FROM user_views
	    WHERE view_name='�빮��'; => SELECT ����

*/
-- �ܼ���
-- 1. ���̺� ����
/*
CREATE TABLE myEmp
AS 
	SELECT empno, ename, hiredate, job, sal
	FROM emp;


CREATE VIEW myEmp_view
	as SELECT * FROM myEmp;
*/
-- ����
--SELECT * FROM myEmp_view;
-- view�� �߰��Ǵ� ���� �ƴ϶� => �����ϴ� ���̺� �߰�
--INSERT INTO myEmp_view VALUES(8000,'ȫ�浿','24/01/01','����',4500);
--COMMIT;
--DELETE FROM myEmp_view;
-- COMMIT���� ROLLBACK => ���� ����
-- COMIT�� ����ϸ� ROLLBACK�� ������ �ȵȴ�
--SELECT text FROM user_views
--WHERE view_name='MYEMP_VIEW';

-- �б� ���� => SELECT����� ����
--CREATE VIEW myEmp_view
--AS
	--SELECT * FROM myEmp WITH READ ONLY;

INSERT INTO myEmp_view VALUES(8000,'ȫ�浿','24/01/01','����',4500);