-- ��Ÿ �Լ� (***NVL(null�� �ٸ� ������ ��ü), DECODE(���� ���ǹ�), CASE(switch))
/*
	NVL(�÷���, ��ü��)
	       -------
		�÷��� null��쿡�� ��ü
		** �÷��� ��������, ��ü�ϴ� ���� ����
	NVL(100,'no comm') => ���� �߻�
	      ----  ------------
		NUMBER / VARCHAR2
	NVL(TO_CHAR(100), 'NO COMM')
	=> ����ó�� : null ���� �ִ� ��쿡�� ����ó�� ��� => null (����� �ȵȴ�)
	null : ���� ���� ���� 
	----- IS NULL / IS NOT NULL
*/
--SELECT ename, sal, comm, sal+NVL(comm,0) FROM emp;
SELECT ename, sal, NVL(TO_CHAR(comm), 'NO COMM') FROM emp;

/*
	����Ŭ ��������
	������
	 CHAR(1~2000byte) => ���� ����Ʈ
	 CHAR(10) => 'A' => 10byte
	 => ���ڼ��� ������ ��� : ����/����, y/n
	 VARCHAR2(1~4000byte) => ���� ����Ʈ ********** ���ڿ� ����� ���� ���� ���
	 VARCHAR2(100) => 'A' => 1byte 
	 CLOB => 4�Ⱑ (�ٰŸ�, �ڼҼ�...) => ����
	--------------------------------------------------------- String ��Ī
	������
	 NUMBER => NUMBER(8) => int
	 NUMBER(7,2) => ���� 7�� ����� ���� => 2�ڸ��� �Ҽ������� ����� ����
			    => int / double
	��¥��
	 DATE
	 TIMESTAMP : ��ϰ��� => DATE�� Ȯ��
	 ----------------------------------------------- java.util
	��Ÿ�� : ������ / ���� / �̹���
	 BFILE :  ���� ���� 
	 BLOB : ���̳ʸ� ����
		=> �������
	------------------------------------------------ java.io.InputStream
	=> DESC table�� 

*/
CREATE TABLE test(
	no NUMBER PRIMARY KEY,
	name VARCHAR2(100)
);
INSERT INTO test VALUES((SELECT NVL(MAX(no)+1,1) FROM test),'ȫ�浿');
null�� ��쿡�� => ���������� null ��� =>  �����ȣ
*/
-- ��� (������ ������, ����������) 
/*
	DECODE : ���� ���ǹ�
	DECODE(deptno, 10, '������', 20, '���ߺ�', 30, '��ȹ��',  40, '�����')
	=> DECODE(star,1,'��',2,'�ڡ�',5,'�ڡڡڡڡ�');

*/
-- switch ~ case
--SELECT ename, job, deptno, DECODE(deptno, 10, '���ߺ�', 20, '��ȹ��', 30, '�ѹ���') dname FROM emp;

--case �������ǹ�
SELECT ename, job, deptno, CASE WHEN deptno=10 THEN '���ߺ�' WHEN deptno=20 THEN '������' WHEN deptno=30 THEN '��ȹ��' END "dname" FROM emp;

