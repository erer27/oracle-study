-- ��¥ �Լ� (����, ����, ��¥)
/*
	***SYSDATE : �ý����� ��¥ / �ð��� �о�´�
		=> + , -�� ����
*/
-- SELECT SYSDATE FROM DUAL;
SELECT SYSDATE-1 "����", SYSDATE "����", SYSDATE +1 "����" FROM DUAL;
-- �Խ��� / ������ / ȸ�������� / �α����� �� ......
-- MONTHS_BETWEEN : �Ⱓ�� ������ => ������ ���
-- MONTHS_BETWEEN(����, ����) => 1���� ������ �ڵ� ����
--SELECT empno, ename, hiredate, MONTHS_BETWEEN(SYSDATE, hiredate) "������" FROM emp;

--SELECT empno, ename, hiredate, ROUND(ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)/12)) "������" FROM emp;

-- ADD_MONTHS : ������ ���� => ������ ��¥ ���
--SELECT SYSDATE, ADD_MONTHS(SYSDATE,6) FROM DUAL;
--SELECT '24/11/18', ADD_MONTHS('24/11/18',7) FROM DUAL;

--LAST_DAY : ��¥ ���� => ������ ��¥ ���
--SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
--SELECT LAST_DAY('25/02/10') FROM DUAL;
--NEXT_DAY => ���� ���� => ��¥ Ȯ��
SELECT NEXT_DAY(SYSDATE, 'ȭ') FROM DUAL;
/*

	SYSDATE : �ý����� ��¥/�ð�
	-----------------------------------
	=> �⼮ (ERP) / ��� / ��¥�� �ʿ��� ���
	MONTHS_BETWEEN : �Ⱓ�� ������ 

*/