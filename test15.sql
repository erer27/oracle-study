-- ��ȯ �Լ�
/*
	***1. TO_CHAR : ��¥, ���ڸ� ���ڿ��� ��ȯ
	   ------------- SimpleDateFormat / DecimalFormat
	2. TO_NUMBER : ���ڿ��� ���� ��ȯ
			Integer.parseInt(), Double.parseDouble()
	3. TO_DATE : ���ڿ��� ������������ ��ȯ
		new Date(���ڿ�)
	
	TO_CHAR
		��¥ ��ȯ
		�⵵ : YYYY / YY => yyyy / yy
		�� : MM / M => mm / m
		�� : DD / D => dd / d
		�ð� : HH / HH24
		�� : MI
		�� : SS
		dy : ����
		���� ��ȯ
		1,000 => �ڹ�(###,###) => 999,999
		$999,999
		L999,999
*/
--SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS DY') FROM DUAL;

--���
--emp���� ����� �Ի��ϰ� ���� ���
SELECT ename, hiredate, TO_CHAR(hiredate, 'RRRR/MM/DD DY') FROM emp;
/*
	�⵵ : YYYY / RRRR�� �̿��ص� �ȴ� => Y2K
		----------------
*/
--SELECT empno, ename, TO_CHAR(sal,'$999,999') FROM emp;
--SELECT empno, ename, TO_CHAR(sal, 'L999,999') FROM emp;
--SELECT ename, TO_CHAR(hiredate, 'YYYY "�⵵" MM "��" DD "��"') FROM emp;

--SELECT '100'+'200' FROM DUAL;
--SELECT TO_NUMBER('100')+TO_NUMBER('200') FROM DUAL;
SELECT TO_DATE('25/01/05', 'YYYY-MM-DD') FROM DUAL;