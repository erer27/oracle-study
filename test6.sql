-- DQL => SELECT
/*
	emp : ��� ����
	 = empno : ��� ===========> �⺻Ű (�ߺ��� ����)
	 						   ------------------------
							   ���� / ���� / �󼼺��� => �ַ� ���
							   ������
	 = ename : �̸�		���ڿ�
	 = job : ����		���ڿ�
	 = mgr : ��� ���	����
	 = hiredate : �Ի���	��¥��
	 = sal : �޿�		���� => ���� �Ǽ�
	 = comm : ������	����
	 = deptno : �μ���ȣ 	���� ===> dept���̺�� JOIN
	
*/
--1. KING�� ������ XXX�̴� => ���ڿ� ���� => ���ڿ�, ��¥�� ''�ȿ��� ���
/*SELECT ename||'�� ������ '||job||'�̴�'
FROM emp;*/
/*
	1. ���� => ����
	2. ��¥, ���ڿ� => "�� ����Ѵ�
	3. ""�� ���� => ��Ī���ÿ� �ַ� ���
	4. �ߺ����� ������ DISTINCT �÷�
	5. ���ڿ� ���� => ||
	6. ������ ����Ǹ� ;�� ���
	7. table�� � �÷��� ������ �ִ��� / � �����Ͱ� �߰��Ǿ�����
	   DESC table��
	   �÷��� ��������
*/
-- ȭ�鿡 �ʿ��� ������ ����
-- �˻� ��� / �󼼺��� / ��� ... 
-- ������ => WHERE (if) 
-- 149page
/*
	1. ��������� : SELECT �ڿ��� ���
			     +,-,*,/ => %(MOD �Լ�)
			    => �����ϰ� ���ڸ� ó��
			    => / => ����/����=�Ǽ�
			    => WHERE������ ������� �ʴ´� 
			   => ���/���
			    
	2. �񱳿����� : => WHERE�ڿ� ���
				���� ====> = (����Ŭ: =, Java:==, �ڹٽ�ũ��Ʈ : ===)
				���� �ʴ� : !=, <>(�������), ^=
				ũ��	: >
				�۴� : <
				ũ�ų� ���� : >=
				�۰ų� ���� : <=
				--------------------
				SELECT ~ 
				FROM table��
				WHERE ���ǹ� => ���ǹ��� true�� ��쿡 ����
				---------------------
					���ǹ� ��� ���
					-------------------
					WHERE �÷��� ������ ��
							     -------- --
									���� / ��¥�� �ݵ��..
							     ��������� �� ���	
	3. ��������
		���Ŀ����� => AND (& => �Է�) => ���� ����, �Ⱓ ����
		���Ŀ����� => OR (|| => ���ڿ� ����) => ���� ��, �Ⱓ ��
				=> IN
			(����) AND (����)
			------		-------
			   |		   |
			  ---------------
				  |
				����� => �¿��� ������ true�� ���� true =>  ������ false

			(����) OR (����)
			-------      -------
			    |		   |
			    --------------
				   |
				����� => �¿��� ������ false�϶��� false => �������� true
	4. ���Կ�����
		= : WHERE���� �ڿ����� ����
		     UPDATE
		      	name='A'
-------------------------------------
	5. IN
	6. NOT
	7. NULL
	8. BETWEEN
	9. LIKE
------------------------------- �����ͺ��̽������� ���
*/
-- ��������� => Ŭ���� ����� ����
/*CREATE TABLE student(
	hakbun NUMBER(4),
	name VARCHAR2(51),
	kor NUMBER(3),
	eng NUMBER(3),
	math NUMBER(3),
);*/
/*
insert into student VALUES(1,'ȫ�浿',90,80,78);
insert into student VALUES(2,'��û��',80,78,75);
insert into student VALUES(3,'�ڹ���',90,80,78);
insert into student VALUES(4,'�̼���',90,80,78);
insert into student VALUES(5,'������',90,80,78);
commit;
*/
-- ���������
-- +, /
--SELECT hakbun, name, kor, eng, math, (kor+eng+math) "total", (kor+eng+math)/3 "avg" FROM student;
-- emp ���̺��� ����� �̸��� ������ ���
-- SELECT ename "�̸�", sal*12 "����" from emp;
-- WHERE ���ǹ�(true/false)
-- emp ���̺��� �޿��� 3000�� ����� �̸�, �Ի���, �޿� ���
/*SELECT ename, hiredate, sal
FROM emp
WHERE sal=3000;*/
-- emp ���̺��� �޿��� 1500������ ����� �̸�, �Ի���, �޿� ���
--select ename, hiredate, sal from emp where sal<=1500;
-- �л� ���̺��� ������ 230 �̻��� �л��� �̸�, ������ ���
--select name, (eng+math+kor) "total" from student where 230<=(eng+math+kor);

-- emp���̺��� job�� MANAGER�� �ƴ� ����� �̸�, ����, �Ի����� ���

--sect ename, job, hiredate from emp where job!='MANAGER';
--���ڿ� => "�̿��Ѵ�, ���� ����� �����ʹ� ��ҹ��ڸ� �����Ѵ�
-- emp�� ����� ���ڿ��� ��� �빮�ڷ� �Ǿ� �ִ�.
--select ename, job, hiredate from emp where job^'MANAGER';                       
--����Ŭ ���� : ���� ��� => SQL������ ������ �ִ� => ������ ����
-- ���� �˻� => <>, !=, ^=
-- 81�� 11�� 17�Ͽ� �Ի��� ����� �̸��� �Ի����� ���
--SELECT ename, hiredate FROM emp WHERE hiredate='81/11/17';
---��¥�� ó�� => �ݵ�� ''�� �̿��Ѵ�
--SELECT ename, job,hiredate, sal FROM emp WHERE empno=&sabun;
/*
	����������
	   => ���� / ���ڿ� / ��¥ / null
					     ------- �����Ͱ� �������� �ʴ� ����
					     ------- ����ó���� �ȵȴ� (����� : null)
*/
-- ���(emp) ���̺��� �� ���� ���ɾ��� ��� 
-- sal(�޿�), ������ (comm)
SELECT ename, sal, sal+NVL(comm,0) FROM emp;
