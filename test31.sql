-- ���̺� ����
-- ȸ������
/*
	id ===> �⺻Ű (�ߺ�����) PK
	***pwd
	***name
	sex ==> ���� / ���� => check
	***birthday
	email ==> id�� ã�� => �ĺ�Ű (unique)
	***post
	***addr1
	addr2
	***phone
	content ==> clob

	=> lastlogin DATE
	=> isadmin CHAR(1) 
*/
/*
CREATE TABLE testMember
(
	id VARCHAR2(20),
	pwd VARCHAR2(10) CONSTRAINT tm_pwd_nn NOT NULL,
	name VARCHAR2(51) CONSTRAINT tm_name_nn NOT NULL,
	sex CHAR(6),
	birthday DATE CONSTRAINT tm_day_nn NOT NULL,
	email VARCHAR2(150),
	post VARCHAR2(7) CONSTRAINT tm_post_nn NOT NULL,
	addr1 VARCHAR2(100) CONSTRAINT tm_addr1_nn NOT NULL,
	addr2 VARCHAR2(100),
	phone VARCHAR2(13),
	content CLOB,
	CONSTRAINT tm_id_pk PRIMARY KEY(id),
	CONSTRAINT tm_sex_ck CHECK(sex IN('����','����')),
	CONSTRAINT tmp_email_uk UNIQUE(email)
);
*/
-- ���� => ALTER, ���� => DROP
-- 1. ���� = ȸ�������� => ALTER TABLE testMember ADD regdate DATE 184page
-- ALTER TABLE testMember ADD regdate DATE DEFAULT SYSDATE;
-- ALTER TABLE testMember ADD homepage VARCHAR2(10);
-- 2.  ���� (����) => MODIFY
-- ALTER TABLE testMember MODIFY homepage VARCHAR2(150);
-- 3. ���� (�÷�) => DROP COLUMN
--ALTER TABLE testMember DROP COLUMN homepage;
-- ���̺� ���� => DROP (186page)
--DROP TABLE testMember;
/*
	�������� ���
	= ������ ���� => ���� ������ ����
	= ���̺� : ���� => 6�� / 7�� => ����ȭ 
	1. ���̺��� �����͸� �����ϴ� ���� (����)
	   --------- �ϰ����� �־�� �Ѵ�
	   ���õ����͸� ��Ƽ� ���� : ȸ��, ����, ��ٱ���, �Խ���, ���...
	   => ������ ���� => ������ ���� (��ġ��ŷ)
	   => �������� => ��� ���� => ���� ����
	   => �������� / ũ�� => ������ ����
	   ------------------------------------------- ������ �߰� (DML)
	2. ���̺� ����
	3. ��������
	4. ��������
	5. ����
	6. ���̺� ����

*/
/*
	���̺� ����
	= ���� ����
	= ���� (����)	
*/
-- ���� (������ �����͸� ����) => �����Ͱ� ÷��
/*
CREATE TABLE emp_dept
AS
SELECT empno, ename, job, hiredate, sal, dname, loc
FROM emp, dept
WHERE emp.deptno=dept.deptno;
*/
--
-- �����;��� ���̺� ���� => ���̺� ���� 
/*
CREATE TABLE emp_dept2
AS
SELECT empno, ename, job, hiredate, sal, dname, loc
FROM emp, dept
WHERE 1=2;
-- 1=2 => false 100=200 'A'='B' => WHERE => false ������ �����
*/
/*
	���� ����(***)
	����
		CREATE TABLE table_name
		(
			-- ������ ����
			�÷��� ��������  [��������] => �������� ����� �� �ִ�
			��) address VARCHAR2(100) NOT NULL CHECK UNIQUE..
			�÷��� �������� [��������],
			�÷��� �������� [��������],
			�÷��� �������� [��������],
			�÷��� �������� [��������], => DEFAULT / NOT NULL
			------------------------------------
			[��������],
			[��������]
			------------------------------------ PRIMARY KEY
								  CHECK
								  UNIQUE
								  FOREIGN

		)
		
		1. ���̺� �ĺ�
		  = ���� �����ͺ��̽��ȿ����� ���̺���� �����ϴ� 
		     --------------------- (XE), ���� ��� ����Ŭ (XE)
						---
						 | �������� hr_1 ... hr_4
		 = ���ڷ� ���� (���ĺ�, �ѱ�) => ���ĺ� ����
				      --------
				     | ��ҹ��� ������ ���� (���� ����Ŭ�� ���̺� ������ ������ �� �� �빮�ڷ� ���� => ���̺� Ȯ�ν� = �빮�ڷ� �Է�)

		SELECT * FROM user_constaints
		WHERE table_name='board' (X) => BOARD
		=> ***user_constraints : �������� ����
		=> user_tables : ���̺� ����
		=> ***user_views : �������� ����
	= ���̺�� ���� (30byte) => 7~15�ڸ��� ���� (�ǹ�)
	= Ư������ : _(�밡���� ǥ���(X))
			    --------------------- FileName
							   --
			    file_name
	= Ű����� ����� �� ���� : SELECT / FROM / JOIN ...
	= �������� �� �� ����
	= ���ڴ� ����� ���� (�տ� ����� �� ����)
	--------------------------------------------------------------
	  CREATE TABLE table_name
				------------ column��
	   ��������
	   ----------
	     ���� : CHAR(1~2000byte) => ���� (������ ���̰� ����)
			VARCHAR2(1~4000byte) => ���� ******** ���� ���� ����
			CLOB : �Ұ�, �ٰŸ� ... 4�Ⱑ => ����
			-------------------------- �ڹٿ����� String
		���� : NUMBER => NUMBER(8,2)
			 NUMBER(4), NUMBER(2,1)
		��¥ : DATE => ��¥/�ð�
		�������� 
		----------
		   NOT NULL : NULL�� ������� �ʴ´�
				    => ������ �����Ͱ��� ����
				    => �ʼ� �Է�
		   UNIQUE : ���ϰ� (�ߺ��� ���� ��)
				  => NULL�� ���
				  => �ĺ�Ű (�⺻Ű�� ã�� ���� Ű)
				  => ��ȭ��ȣ / �̸���
		    PRIMARY KEY : �⺻Ű
				     => ��� ���̺����� �⺻Ű�� �� �� �̻� ����
					  -------------- �ĺ�(������)
				     => UNIQUE + NOT NULL
				     => �⺻ (����) , ���ڿ�(ID)
					  �Խù���ȣ / ��ȭ��ȣ / ������ȣ / ��۹�ȣ ...
					  ȸ��(ID)
				     => �ڵ� ���� ��ȣ 
			FOREIGN KEY : �ܷ�Ű (����Ű)
					     => �ٸ� ���̺� ���� 
				emp(deptno) dept(deptno)
						      | �ߺ����� �μ���ȣ => PRIMARY KEY
				    | �μ���ȣ ���� => FOREIGN KEY
				�Խ���	���
				(�Խù���ȣ) (�Խù���ȣ ����)
				��ȭ		���� 
				(��ȭ��ȣ)	 (��ȭ��ȣ ����)
				=> JOIN 
		
				CHECK : ������ �����͸� ����� ����
						=> �μ��� / �ٹ��� / ���� / �帣
						=> �޺��ڽ� / ������ư
				-------------------------------------------------- ��������
				DEFAULT : �̸� �⺻�� ����
						=> �Է��� ���� ��� ����
					=> ���� (0) / ��¥ (SYSDATE)

			*** �÷��ڿ� ���δ� => NOT NULL, DEFAULT
			*** �÷� �����Ŀ� ���̴� ��� => PK, FK, CK, UK
		--------------------------------------------------------------------------------
		  DDL
		    = COMMIT�� �ʿ���� (COMMIT�� �ִ� ��쿡�� ������ ����)
		    = �ڵ� ������ �ȴ� (������ �� ����)
		    -----------------------------------------------------------------------
		    ���̺��� �ٽ� ���� => ALTER / DROP�Ŀ� �ٽ� CREATE
						    --------   -----
								 �����Ͱ� ����
						    �����͸� ����
		    => CREATE : ����
		    => ALTER : ����
		    => DROP : ����
		    => RENAME : �̸� ����
		    => TRUNCATE : ���̺� ���� / �����͸� ����

*/
/*
CREATE TABLE myEmp
AS
	SELECT empno, ename, job, hiredate, sal
	from emp; 
*/
-- ���� : ALTER
-- deptno �߰�, mgr �߰� => ADD
/*
ALTER TABLE myEmp ADD deptno NUMBER(2) DEFAULT 10 
CONSTRAINT my_deptno_nn NOT NULL;
*/
--ALTER TABLE myEmp ADD mgr NUMBER(4);
-- ���� MODIFY 
--ALTER TABLE myEmp MODIFY ename VARCHAR2(50) CONSTRAINT
--my_ename_nn NOT NULL;
-- ������ �����Ͱ� �����ϴ� ��쿡�� ������ ����
-- ���Ӱ� �÷� �߰� (�����Ͱ� ���� ����) => NOT NULL => DEFAULT
--ALTER TABLE myEmp DROP COLUMN mgr;
-- RENAME => ���̺� �̸� ����
--RENAME myEmp TO youEmp;
-- empno => sabun �÷��̸� ����
--ALTER TABLE youEmp RENAME COLUMN empno TO sabun;

-- TRUNCATE : ������ �߶󳻱�
-- ������ �� ����
--TRUNCATE TABLE youEmp;
DROP TABLE youEmp;
/*
	DML => ROW ���� => ������ ����
		= SELECT / INSERT / UPDATE / DELETE => ������ ����
		    | �� ����
	DDL => COLUMN���� => ������ ��ƴ�
		= CREATE / ALTER / DROP / RENAME / TRUNCATE
	TCL => ������ ����, ��ɾ� ���
				     | ���� ROLLBACK
		    | COMMIT
	---------------------------------------------------------------------
	���̺� ���� : �����͸� �߰� / �����͸� ���� / �����͸� ����
			   ----------------------------------------------------
			   | 187page => DML
	������ ���̺� Ȯ��
	SELECT * FROM tab;
	���̺� �Ѱ��� ���� ���� (�÷� ����)
	DESC table-name
*/
-- �����͸� ÷��
-- INSERT ���
/*
	187page
	1) �����͸� ��ü ÷�� : INSERT ALL
	2) ��ü ������ �߰�
	3) ���ϴ� ������ �߰�
*/
-- INSERT ALL 
CREATE TABLE emp_10
AS
SELECT empno, ename, job, hiredate, sal
FROM emp
WHERE 1=2;

CREATE TABLE emp_20
AS
SELECT empno, ename, job, hiredate, sal
FROM emp
WHERE 1=2;

CREATE TABLE emp_30
AS
SELECT empno, ename, job, hiredate, sal
FROM emp
WHERE 1=2;
