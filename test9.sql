/*
	BETWEEN ~ AND : ���� => �̻� / ����
*/
-- 1. å �����߿� 10000~20000 ���� å�� => å�̸�/����
/*
	book (���̺�)
	bookid
	bookname
	publisher
	price
*/
/*
SELECT bookname, price
FROM book
WHERE price BETWEEN 10000 AND 20000;
*/
-- 2. å�����߿� �ι�° ���ڰ� '��'�� å�̸��� ���
SELECT bookname FROM book WHERE bookname LIKE '_��%';

--3. IN => ���ǻ� => �½�����, ���ѹ̵�� => ��ü ���� ��� (*)
--SELECT * FROM book WHERE publisher IN('�½�����','���ѹ̵��');

--4. IN => ���ǻ� => �½�����, ���ѹ̵� �ƴ� => ��ü ���� ��� (*)
--SELECT * FROM book WHERE publisher NOT IN('�½�����','���ѹ̵��');
/*
	156page => ����
	=> ��ɾ� : ORDER BY => SQL���� �������� �߰�
			------------- �ø����� / ��������
							DESC
					 ASC => ����
*/
-- 1. emp => �޿��� ���� ������ �̸� / �޿� ���
SELECT ename, sal FROM emp ORDER BY sal ASC;

SELECT ename, sal FROM emp ORDER BY sal DESC;

SELECT ename, sal FROM emp ORDER BY 2 DESC;

-- 2�� ����
SELECT ename, sal FROM emp ORDER BY 2 DESC, 1 ASC;

SELECT ename, sal FROM emp ORDER BY sal DESC, 1 ASC;
-- �亯�� �Խ���, ���� =>  �ַ� ���
-- ���� ���� ������ �ִ� ��� => ������ �ٽ� SORT
