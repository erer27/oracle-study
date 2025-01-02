-- DQL : ������ �˻� => SELECT
/*
	1. DESC table�� => �÷� Ȯ��
	2. ���������� ���� Ȯ��
	3. ���̺�� Ȯ��
	---------------------------------
	����Ŭ���� ����ϴ� ��������
	# ���ڿ�, ��¥ => ''�� ����Ѵ�
	   ��) 'KING', '25/01/02' => 'YY/MM/DD' => ��¥�� ���ڿ� �������� ����
	���ڿ�
		CHAR, VARCHAR2, CLOB
	����
		NUMBER (8), NUMBER(2,1)
		--------------
	��¥
		DATE, TIMESTAMP
	��Ÿ => ����, ������ ����
		BLOB, BFILE 
	SELECT
	����)
			SELECT *(ALL) column_list => column1, column2....
					    --------------- ��¿� �ʿ��� �÷��� ����
			FROM table�� => view�� / SELECT~(�ζ��κ�)
			---------------------------------------------------------- �ʼ� ����
			[
				WHERE ���ǹ� => if
					   -------- ������
				GROUP BY �׷��÷� 
				HAVING �׷����� ==========> �ݵ�� GROUP BY�� �ִ� ��쿡
				ORDER BY �÷��� ==========> ����
							ASC (������ ����), DESC
			]
			***** ����Ŭ �����ʹ� ���ĵǾ� ���� �ʴ�
			***** �˻� �ӵ��� ������ �Ѵ� (Order by => �ӵ��� ������)
			       ---------------------------- INDEX
			1. ����
			  ���̺�� : book
			  �÷��� : bookid / bookname / publisher / price
				     ---------  �����	    ���ǻ�	    ����
					å�� ������ȣ => ISBN => �ߺ��� ����
*/
-- ��� ������ �̸��� ������ �˻� => ����� ���� 
/*SELECT bookname, price
FROM book;*/
/*SELECT price, bookname
FROM book;*/
-- �÷��� ������ ������ ���� �ƴϴ�
-- ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ ���
SELECT bookid, bookname, publisher,price
FROM book;
-- SELECT bookid,bookname,publisher,price, SELECT *
/*
	*�� ����ϸ� ������ ���̺� ������ �� ������ ����
	CREATE TABLE Book (
	bookid NUMBER(2) PRIMARY KEY, getInt(1)
	bookname VARCHAR2(40),		getString(2)
	publisher VARCHAR2(40),		getString(3)
	price NUMBER(8)				getInt(4)
	);
	DESC book => ���̺� ����� ������ �����ش�
	*�� ���� ��� �󵵰� ���� => null (��ü)
*/
-- ���� ���̺� �ִ� ��� ���ǻ縦 ���
/*SELECT publisher
FROM book;*/
-- Set
-- �ߺ� ������ ���
SELECT DISTINCT publisher
FROM book;
-- 146page ~ 148page 


