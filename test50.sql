-- PL/SQL => �����ͺ��̽� ���α׷��� (DBA)
/*
	�� ������ : JDBC (����Ŭ ����) / ������ (JSP,Spring)
	PL/SQL => �ݺ� ���� (�Լ�), ����
	-------- FUNCTION / PROCEDURE / TRIGGER
	����)
		DECLARE
		 ���� ���� => ����� 
		BEGIN
		 SQL�̿��ؼ� ó�� => ������
		END;

		=> CREATE [OR REPLACE] FUNCTION fun_name(�Ű�����)
			RETURN ��������
			IS
			 ���� ����
			BEGIN
			 ��� ó��
			END;
		=> CREATE [OR REPLACE] PROCEDURE pro_name(�Ű�����)
			IS
			 ���� ����
			BEGIN
			 ��� ó��
			END;
			=> �ٸ� ���̺� ����
		=> CREATE [OR REPLACE] TRIGGER tri_name
			BEFORE (INSERT/UPDATE/DELETE) ON table_name
			DECLARE
			 ���� ����
			BEGIN
			   �̺�Ʈ ó��
			END;

		���� (PL/SQL)
		   1. ������ ���� => �������� / �Ű�����
			= ��Į�� ���� (����� ����)
			   ������ ��������
			   on NUMBER
			   day DATE ... ==> ���̺� ���۽� �÷� �����ϰ� ����
			   => ������(CHAR, VARCHAR2, CLOB)
				 ������(NUMBER)
				 ��¥��(DATEA)
			= %TYPE (���� ���̺� ����� �÷� ���������� �б�)
				������ ���̺��.�÷���%TYPE

			= %ROWTYPE (���̺� ��ü �÷��� �������� �ѹ��� �ִ� ���)
			   => �ڹ� (VO)
			   ������ ���̺�%ROWTYPE

			 = ����� ���� �������� (���̺� ������) RECORD => ����/��������
			    TYPE ������ IS RECORD(
				=> ��Į�󺯼�
				=> %TYPE
			    )
			--------------------------- ROW �� ������ ������ ���� (������)
			= CURSOR : List,ResultSet => ��� (���ÿ� �������� ROW �б�
			   CURSOR cur�� IS
				SELECT ~~
			=> ��Į�󺯼� / %TYPE / CURSOR
				
		   2. ������ => ����Ŭ ������ (���, ��, ��, IN, BETWEEN, NULL, NOT, LIKE)
		   3. ���
			= ���ǹ�
			   = ���� ���ǹ� 
				IF ���ǹ� THEN
					ó������ => SQL�̿� : ������ TRUE�� �� �����ϴ� ���� 
				END IF;
				= ���� ���ǹ� : TRUE / FALSE => ó��
				   IF ���ǹ� THEN
					ó������ ==> ������ TRUE�� �� ó��
				   ELSE
					ó������ ==> ������ FALSE�� �� ó��
				   END IF;
				= ���� ���ǹ� => ������ ������ : �� ���� ���� => �� ���� ��������
				 IF ���ǹ� THEN
					ó������ => TRUE => ó�� = ����
					FALSE
					     |
				 ELSIF ���ǹ� THEN
					ó������ => TRUE => ó�� = ����
				 ELSE
					ó������ => ������ ���� ��� ó�� => ������ ����
				END IF;
			= ���ù� : CASE => TRIGGER���� �ַ� ���
				CASE ����	=> switch(����)
				WHEN �� THEN ó��
				WHEN �� THEN ó��
				WHEN �� THEN ó��
				ELSE
					ó��
				END;
			= �ݺ��� 
				= �⺻ �ݺ��� => do~while
				   LOOP
					�ݺ�ó������
					EXIT ���� ==> ����
				   END LOOP;
				= WHILE
				   WHILE ���ǹ� LOOP
					�ݺ� ó������
				   END LOOP;

				= FOR 
				   ����)
					  FOR i IN 1..9 LOOP => for(int i=1;i<=9; i++)
					  FOR ���� IN low..hi LOOP => 1~9
						ó������
					  END LOOP
					  
					 =>  ���� ���
					  FOR i IN REVERSE 1..9 LOOP => for(int i=9; i>=1; i--)
						      ----------- 9���� 1����
						ó������
					  END LOOP
*/
-- CASE ����
SET SERVEROUTPUT ON;
/*
DECLARE
	vEname emp.ename%TYPE;
	vDeptno emp.deptno%TYPE;
	vDname dept.dname%TYPE;
BEGIN
	SELECT ename, deptno INTO vEname,vDeptno
	FROM emp
	WHERE empno=7788;
	-- switch(vDeptno) ==> := �� ���� 
	vDname:=CASE vDeptno
			WHEN 10 THEN '���ߺ�'
			WHEN 20 THEN '������'
			WHEN 30 THEN '�����'
			ELSE '����'
			END;
	-- ���
	DBMS_OUTPUT.PUT_LINE('----- ��� -----');
	DBMS_OUTPUT.PUT_LINE('�̸�:'||vEname);
	DBMS_OUTPUT.PUT_LINE('�μ�:'||vDname);
	
END;
/
*/

-- Basic Loop (do~while)
/*
	int sno=1;
	int eno=10;
	do
	{
		System.out.println(sno);
		sno++;
	}while(sno>eno);
*/
/*
DECLARE
	sno NUMBER:=1;
	eno NUMBER:=10;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE(sno);
		sno:=sno+1; -- ++ �������� �ʴ´�
		EXIT WHEN sno>eno;
	END LOOP;
END;
/
*/
-- WHILE
DECLARE
	no NUMBER:=1;
 BEGIN
	WHILE no<=10 LOOP
	 DBMS_OUTPUT.PUT_LINE(no);
	 no:=no+1;
END LOOP;
END;
/
-- FOR : �����͸� ������

-- ¦�� => MOD(10,2) = 10%2
DECLARE
BEGIN
	FOR i IN  1..10 LOOP
		IF MOD(i,2)=0 THEN
		 DBMS_OUTPUT.PUT_LINE(i);
		END IF;
	END LOOP;
END;
/

DECLARE
BEGIN
	FOR i IN  1..10 LOOP
		IF MOD(i,2)=1 THEN
		 DBMS_OUTPUT.PUT_LINE(i);
		END IF;
	END LOOP;
END;
/