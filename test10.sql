-- ����Ŭ 2����
/*
	SELECT : ������ �˻� (����Ŭ���� �����͸� ã���ִ� ����)
	--------
	 1) ���� / ����
	     SELECT*|column_list FROM table��[ WHERE ���ǹ� GROUP BY �׷��÷� HAVING �׷����� ORDER BY �÷� (ASC|DESC)]
	 2) ���� �˻�
		WHERE => ������ ����
		��������� : +, -, *, /
		�񱳿����� : =, <>, <, >, <=, >=
		�������� : AND, OR
		IN / BETWEEN / NOT / NULL(IS NULL, IS NOT NULL) / LIKE
	 3) ���� �Լ�
		������ �Լ�
			1. ���� �Լ� => String
			   = LENGTH() : ���� ����, LENGTHB() : ����Ʈ ��
			      ��)
				LENGTH('abc') => 3
				LENGTH('ȫ�浿') => 3
				
				LENGTHB('abc') => 3
				LENGTH('ȫ�浿') => 9
				=> ���ó : ��й�ȣ (8~15)
				=> CHAR(1~2000byte)
					VARCHAR2(1~4000byte)
				=>	VARCHAR2(9) => CLOB
				=> VARCHAR2(9)
				***= UPPER() : �빮�� ��ȯ => String���� ó���Ŀ� ����
					UPPER('abc')=>ABC
				= LOWER() : �ҹ��� ��ȯ
					LOWER('ABC') => abc
				= INITCAP() : �̴ϼ� ��ȯ => ù�ڸ� �빮��
					INITCAP('abc') => Abc'
				= LPAD / ***** RPAD
				   LPAD(���ڿ�, ���ڰ���, ��¹���)
				   LPAD('admin',10,'*')
					=> *****admin
				   RPAD('admin',10, ,'*')
					=> admin *****: IDã��, ��й�ȣã�� => �̸��� ����
												  javaMail
				= LTRIM / RTRIM / TRIM => �¿��� ���� ����, ���� ����
				    �� ��		  �¿�
				LTRIM(���ڿ�,'������ ����')
				=> LTRIM('aaaHonedage','a';) => Hongaaa
				=> RTRIM('aaaHongaaa','a'; =>  aaaHong
				= ******SUBSTR => substring() : ���ڿ��� �ڸ��� ��쿡 ���
					SUBSTR(���ڿ�, ���۹�ȣ, ����) SUBSTR('abcdfeg',1,3)
			2. ���� �Լ� => Math
			3. ��¥ �Լ� => Calendar
			4. ��ȯ �Լ� => Format
			5. ��Ÿ �Լ� => NULL ó��, ���� ���ǹ�, ���ù�
			�����Լ� : ����Ŭ���� �����ϴ� �Լ� (���̺귯��)
					���ϰ��� ������ �ִ�
					�����ġ : SELECT ��, WHERE ��, GROUP BY ��, ORDER BY ��
					*** ����� ���� �Լ��� ����
					CREATE FUNCTION �Լ�
		 => ������ �Լ� : ROW���� ó��, ���پ� ó��
		
		������ �Լ�
	 4) ������ ���̺��� ����
		= ����
		= �������� (�μ�����)
	5) �׷캰 ó�� => GROUP BY
	6) ���� => ORDER BY

*/
-- LENGTH
--SELECT LENGTH('abc'), LENGTH('ȫ�浿') FROM DUAL;
--SELECT LENGTHB('abc'), LENGTHB('ȫ�浿') FROM DUAL;
--SELECT ename,UPPER(ename),LOWER(ename) , INITCAP(ename)
--FROM emp;
--SELECT ename, RPAD(SUBTR(ename,1,2),LENGTH(ename),"*");
--SELECT RPAD('abcdefg',5,'*') FROM DUAL;
--SELECT LTRIM('aaabbbcccaaa','a'), RTRIM('aaabbbcccaaa','a'), TRIM('a' from 'aaabbbcccaaa') FROM DUAL;
-- 12���� �Ի��� ����� �̸��� �Ի���
SELECT ename, hiredate FROM emp WHERE SUBSTR(hiredate,4,2)=12;
