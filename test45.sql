-- 2025-01-15 INDEX (4��) = ����
/*
	5��
	----- JDBC / WEB ���� (JSP) / PL-SQL
		------------------------------------ ���α׷� ����
	6�� / 7�� => �����ͺ��̽� ���� (����ȭ)
	8�� => Ʈ����� =============== admin(DBA) : ����, ����, ���
	
	�ε���
		1) �˻� �ӵ� ���
		2) �ε����� �����ϱ� ���� �޸𸮰� ���� �ҿ�ȴ� (����)
		3) ���� => ����� ����, UNIQUE / PRIMARY KEY�� �ڵ� ������ �ȴ�
		4) �ε��� ���� �ñ�
		    1. �����Ǵ� ���� ������ �ִ� ��� (PRIMARY KEY)	
		    2. WHERE������ ���� ���Ǵ� �÷� (�˻�)
			--------------------------------------------- title / name ...
		    3. JOIN���� �ַ� ���Ǵ� �÷�
		    4. NULL���� �����ϰ� �ִ� �÷��� ���� ���
			---------------- bunji ..	
		     5. ���� ���� (������� �ʴ´�)
			=> INSERT / UPDATE / DELETE�� ���� ���̺� 
			ȸ������ / �Խ��� / ��� / ����
			=> �ٽ� �ε�����ȣ�� �ٽ� ���� => rebuild 
KING                 AAAStOAAHAAAAFeAAA
BLAKE                AAAStOAAHAAAAFeAAB
CLARK                AAAStOAAHAAAAFeAAC
JONES                AAAStOAAHAAAAFeAAD
MARTIN               AAAStOAAHAAAAFeAAE
ALLEN                AAAStOAAHAAAAFeAAF
TURNER               AAAStOAAHAAAAFeAAG
JAMES                AAAStOAAHAAAAFeAAH
WARD                 AAAStOAAHAAAAFeAAI
FORD                 AAAStOAAHAAAAFeAAJ
SMITH                AAAStOAAHAAAAFeAAK

		AAAStO AAH AAAAFe AAA
						�����͹�ȣ
				   ��Ϲ�ȣ
			    ��� ���Ϲ�ȣ => �����ͺ� ���ϰ��� ������ �ִ�
		������Ʈ��ȣ => ���̺�(���ϰ�)
		
		B-tree
				--- ��Ʈ 
				 |
			-------------- ���η�Ʈ
			|	|	|
			--------------- ������Ʈ
			
		��)
			1~7 => empno
				��� �ִ� ���� => ��Ʈ
				
				4
			      -----
			     |	    |
			   (1~3) (5~7)
			      2		6
			    ----      ---
			    |    |     |   |
			   1    3    5   7
		=> 8,9 �߰� => 1~9
		     =>	5
	=> rowid�� �˻��� ���� ������ => ����Ŭ���� �������ִ� ���� �÷�
		rownum / rowid 
	�ε��� ����
	-------------
	���� : �˻� �ӵ��� ������
		 �ý��� ���ϸ� �ٿ��� ��ü ���� ���
	���� : �޸� (�ε����� �߰��ϴ� �޸� ����)
		 �ε��� ��ȣ�� ��� �߰��ϸ� �ӵ� ���� 

	1) �ε��� ����
		1.PK / UK => �ڵ� ����
		2. �������� => �˻���� ���� ���
			CREATE INDEX index�� ON ���̺��(�˻��� ���� �÷���)
						=> user_indexs
						=> idx_���̺��_�÷���
			=> ON ���̺��(�÷���) ==> ASC
			=> ON ���̺��(�÷��� DESC) ==> DESC

	3) => ORDER BY ��ü
		INDEX_ASC(���̺�� PK)
		INDEX_DESC(���̺�� PK)
		INDEX(���̺�� �ε�����)
		SELECT "/*+INDEX_ASC(���̺�� PK) */" �÷���
		FROM ���̺��
		SELECT "/*+INDEX_DESC(���̺�� PK) */" �÷���
		FROM ���̺��
		SELECT --+INDEX_ASC(���̺�� PK)  �÷���
		FROM ���̺��
		=> ��Ʈ
*/
