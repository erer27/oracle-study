-- ������ �Լ� => ���ڿ�����
-- ��ȯ : ***UPPER / LOWER / INITCAP
--		toUpperCase / toLowerCase : �ڹٿ��� ó���Ŀ� ����
-- 1. emp���̺��� ����̸��� ��� => �빮�� / �ҹ��� / �̴ϼ�
/*
SELECT ename, UPPER(ename),LOWER(ename),INITCAP(ename)
FROM emp;
*/
-- king ����� �̸�, �޿�, ����, �Ի��� ���
--SELECT ename,sal,job,hiredate FROM emp WHERE ename=UPPER('king');
-- ����� �����ʹ� ��ҹ��ڸ� ����
--SELECT ename,sal,job,hiredate FROM emp WHERE LOWER(ename)='king';
-- 2. LENGTH => ������ ���� (���ĺ� / �ѱ۵� ����)
-- �ַ� ���Ǵ� ��ġ => �ڹ�/�ڹٽ�ũ��Ʈ => ��ȿ�� �˻�
--SELECT ename, LENGTH(ename) FROM emp;
--�̸��� 5������ ����� ���
--SELECT ename FROM emp WHERE LENGTH(ename)=5;
-- 3. REPLACE => ���ڸ� ��ü
-- URL / POSTER => ũ�Ѹ� => &, ||
--SELECT 'Oracle&Java' FROM DUAL;
--SELECT REPLACE('Hello Java','Java','Oracle') FROM DUAL;
--4. SUBSTR => ���ڿ��� �ڸ��� ���
/*
	HELLO JAVA
	12345678910 => ����Ŭ
	HELLO JAVA
	12345678910 => ����Ŭ
	SUBSTR(���ڿ�|�÷���,���۹�ȣ,����)
*/
--SELECT SUBSTR('Hello Oralce',7,6) FROM DUAL;
--emp���� 81�⿡ �Ի��� ����� �̸�, �Ի��� ��� '81/01/10'
--SELECT ename, hiredate FROM emp WHERE SUBSTR(hiredate, 4, 2)=12;
--SELECT ename,SUBSTR(hiredate,7,2) FROM emp;

-- LPAD / RPAD => ������ �ۼ���ŭ ��� => ���� ��쿡 => ���ڸ� ����� ����
-- ���ڸ� ����� ����
/*
	LPAD('Hello', 10, '*') *****Hello
	LPAD('Hello',3,'*') Hel
	RPAD('Hello',7,'#') ==> Hello##
	=> IDã�� 
*/

/*
CREATE TABLE member(id VARCHAR2(20), name VARCHAR2(51));
INSERT INTO member VALUES('hong','ȫ�浿');
INSERT INTO member VALUES('shim','��û��');	
*/

--SELECT RPAD(SUBSTR(id,1,2),LENGTH(id),'*') FROM member WHERE name='ȫ�浿';
--SELECT ename, RPAD(SUBSTR(ename,1,2),LENGTH(ename),'*') "rpad", LPAD(SUBSTR(ename,-1, 2), LENGTH(ename), '*') "lpad" FROM emp;
--SELECT LTRIM('AAABBBCCCAAA','A'), RTRIM('AAABBBCCCAAA','A'), TRIM('A' FROM 'AAABBBCCCAAA') FROM DUAL;
-- CONCAT : ���ڿ� ���� ==> ||
--SELECT CONCAT('Hello' ,'Oracle') FROM DUAL;
--SELECT 'Hello'||'Oracle' FROM DUAL;
-- INSTR => indexOf, lastIndexOf => ������ ��ġ (��ȣ)
/*
	INSTR(���ڿ�, ã�¹���, ������ġ, ���°)
					 ----------
					  ��� : indexOf
					  ���� : lastIndexOf
	A	B	C	D
	1	2	3	4
	-4	-3	-2	-1
	
	Hello => '|' => 2
*/ 
--SELECT ename, INSTR(ename, 'A', 1, 2) FROM emp; : �ι�° �ִ� A�� ã�´�
/*
	WARD (X), ADADMS
			   --
*/
--SELECT INSTR('Hello Oracle','l', 1,3) FROM DUAL; -- indexOf (+)
--SELECT INSTR('Hello Oracle', 'l', -1, 1) FROM DUAL; -- lastIndexOf (-)


/*
	LENGTH / SUBSTR / INSTR / RPAD
*/
--SELECT ename FROM emp WHERE ename LIKE '__O__';

SELECT ename FROM emp WHERE LENGTH(ename)=5 AND INSTR(ename, 'O', 1, 1)=3;