-- ���� �Լ� / ��¥ �Լ�
/*
	���� �Լ�
		= MOD(����, ����) => MOD(10,3) => 10%3=1 => ������
		= CEIL(�Ǽ�) => �ø��Լ� => �Ҽ����� 1�̻��̸� �ø� => ��������
		= ROUND(�Ǽ�, �ڸ���) => �ݿø�
		   ROUND(10.567,2)
					-- 2+1 => 10.57
		= TRUNC(�Ǽ�, ����ڸ���) => ����
		   TRUNC(10.567,2) => 10.56
*/
-- SELECT MOD(10,3) FROM DUAL;
-- emp���� ����� ¦���� ����� �̸�, ���, ���� ���
--SELECT ename, empno, job FROM emp WHERE MOD(empno,2)=0 ORDER BY empno ASC;
SELECT ROUND(10.5678,2), TRUNC(10.5678,2) FROM DUAL;
