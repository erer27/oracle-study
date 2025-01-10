-- Table ���� : 179page
/*
	Table : �����͸� �����ϴ� ����
	-------
		1) ����
		2) ��������
		3) ��������
		4) ����
		5) ����
		=> ����Ŭ �ȿ� ���̺� ���� ���� : user_tables => ��� ���̺���� �빮��
								user_constaints / user_views / user_indexs
		=> ���� �̸����� ������ �Ұ���
		=> ���ĺ� / �ѱ� => �ü���� ������ �Ǹ� ������
					      ------------ HOSTING 
		1. table��(column��) �ִ� ��� => �ĺ���
		   -------   --------
		   | class    | �������
		   1) ���ڷ� �����Ѵ� (���ĺ�, �ѱ�)
		       = ���ĺ� ���ÿ� ��ҹ��� ������ ���� ( ����Ŭ������ �빮�ڷ� ����)
		       = �ѱ��� �ü������ ������ �߻��� �� �ִ�
		    2) table���̳� column���� 30byte����� ����
			=> �⺻ : 7~15�ڰ� ���� (freeboard, goods, cart)
			=> table��� column���� ���Ƶ� �ȴ�
		     	     ---------------------------------------- ��������� �ƴϴ�
		    3) ���� �����ͺ��̽������� ���̺���� �Ѱ��� ����� ����
			=> ���� ����Ŭ : => 211.238.142.124
		    4) Ű����� ����� �� ����
			SELECT / FROM / WHERE ... 
		    5) ���� ����� ���� (�տ� ��� �� �� ����)
			board1, board2...
		    6) ���̺���̳� �÷����� ������ ����� �� ����
		    7) Ư������ ����� ���� ( _ )
			=> goods_info (goodsInfo)
		--------------------------------------------------------------
		 CREATE TABLE table_name(
			=> �÷�
			=> ��ġ��ŷ
		 )
		
		�÷� ���� : �÷��� �������� 
				------------------

		2. �÷� ���� : �������� (183page)
			���� ����
				CHAR(1~2000byte) => ��������Ʈ (���� ���ڼ� ����)
					=> Y / N, ���� / ����
					=> �ѱ��� 3byte���� 
					CHAR(100) ==> 'A' ==> 100byte�� ���� 
				VARCHAR2(1~4000byte) => ��������Ʈ
					=> 'A' => 1byte 
					=> ���ڿ� ������  VARCHAR2�� ����Ѵ�
				CLOB => 4�Ⱑ ���� => ������
					=> �ٰŸ� , �����Ұ� ...
			���� ����
				NUMBER => �⺻ ����Ʈ NUMBER(8,2) => NUMBER(38,128)
								   ----------------
				NUMBER(4) => 0~9999
				NUMBER(2,1) => ���� �� �� ����� ����
							 ���� �� ���߿� 1�ڸ��� �Ҽ������� ���
				---------------- 10, 20 ... 4.5
				=> ������ �Ǽ��� �����ϴ� ���� �ƴϴ� (����)
				=> �Ǽ� / ����
					=> �ڹٿ��� �б� => ����� ������ double / int 
			��¥ ����
				=> DATE / TIMESTAMP (���)
				     -------
			��Ÿ ���� => ������ / �������
				=> BLOB => 4�Ⱑ (binary ���·� ����)
				=> BFILE => 4�Ⱑ(�������·� ����)
				
			=> VARCHAR2 / CLOB / NUMBER / DATE 
			
			=> ���̺� ����
			CREATE table table_name
			(
				�÷��� �������� [��������], 
				�÷��� �������� [��������],
				�÷��� �������� [��������],
				�÷��� �������� [��������],
				�÷��� �������� [��������],
				[��������],
				[��������]
			)
			�������� : �ʿ��� �����͸� ������ ����
			--------------------------------------------
			id		name		sex
			aaa		hong		man
			aaa		shim		woman
			aaa		park		man

			=> DELETE FROM table_name WHERE id='aaa';
			=> ������ �ʴ� �����Ͱ� ����, ���� => �̻�����
				=> ���Ἲ : ��������
				     -------- �⺻Ű�� �ݵ�� �ο� (�ߺ��� ���� ��)
			
			=> �⺻Ű : �ߺ����� ������ ����(������ �ĺ�)
				PRIMARY KEY
			=> �ݵ�� �Է°� = NOT NULL
			=> �ߺ����� ������ : null���� ��� (�ĺ�Ű) : UNIQUE
			=> �ٸ� ���̺� ���� : FOREIGN KEY
			=> ���������͸� ���� : CHECK('����','����')
			=> DEFAULT => ����� �Է��� ���� ��� �ڵ� ����
						SYSDATE, HIT
			------------------------------------------------------------------------- 
			
*/
/*
CREATE TABLE mybook(
	bookid NUMBER(2) PRIMARY KEY,
	bookname VARCHAR2(40),
	publisher VARCHAR2(40),
	price NUMBER(8)
);
CREATE TABLE mybook(
	bookid NUMBER(2) PRIMARY KEY,
	bookname VARCHAR2(40),
	publisher VARCHAR2(40),
	price NUMBER(8),
	PRIMARY KEY(bookid)
);
*/
-- ����, ������ ���� => CONSTAINT => ����
/*
	�������� => user_constraints
			  ------------------- �ߺ��� ������ �ȵȴ�
	�������Ǹ� 
		  table��_�÷���_pk
					---
					PRIMARY KEY  => pk
					FOREIGN KEY  =>  fk
					CHECH	    => ck
					UNIQUE	    => uk
					NOT NULL	    => nn
		1. �÷��ڿ� ���� => �÷����� => �÷��� ���ÿ� ����
					NOT NULL / DEFAULT 
		2. �÷������Ŀ� => ���̺��� => �÷��� �� ������ ������ ���߿� �������� ����
					PRIMARY / FOREIGN / CHEECK / UNIQUE
*/
/*
CREATE TABLE mybook(
	bookid NUMBER(2) PRIMARY KEY,
	bookname VARCHAR2(40) PRIMARY KEY,
	publisher VARCHAR2(40),
	price NUMBER(8),
	CONSTRAINT mybook_bookid_pk PRIMARY KEY(boodid, bookname)
);
*/
/*
	���� ������ ���� => ������ ����
	------------------- 
		  |
	� ������ (��������) => ���� ���� 
		|
	�޸� ũ�� ����		=> ������ ����

	��ǥ
	-----------------------------------------------------
	 �÷���		id		name		sex		
	-----------------------------------------------------
	 Ű����		pk		nn		ck
	-----------------------------------------------------
	 �������̺�
	-----------------------------------------------------
	 �����÷�
	-----------------------------------------------------
	 CHECK����					check('����','����')
	-----------------------------------------------------
	 ��������		VARCHAR2 VARCHAR2 CHAR
	-----------------------------------------------------
	 ũ��			   20			51	    6
	-----------------------------------------------------
	
*/
/*
CREATE TABLE member(
	id VARCHAR2(20),
	name VARCHAR2(51) CONSTRAINT member_name_nn NOT NULL,
	sex CHAR(6),
	regdate DATE DEFAULT SYSDATE,
	CONSTRAINT member_id_pk_PRIMARY KEY(id),
	CONSTRAINT member_sex_ck CHECK(sex,IN('����','����'))
);

-- 184 page => �÷� �߰� / �÷� ���� => ALTER
ALTER TABLE member ADD email VARCHAR2(150);
ALTER TABLE member ADD addr VARCHAR2(10);

-- ����
ALTER TABLE member MODIFY addr VARCHAR2(200);

-- email�� �ʿ䰡 ����
ALTER TABLE member DROP COLUMN email;

-- addr => address
ALTER TABLE member RENAME COLUMN addr TO address;
*/
-- �����Ͱ� �����ϴ� ����

-- �Խ���
/*
	�Խù���ȣ	==> �ߺ����� ������
	�ۼ��� ==> �ݵ�� �Է�
	���� ==> �ݵ�� �Է�
	���� ==> �ݵ�� �Է�
	��й�ȣ ==> �ݵ�� �Է� (���� ���� Ȯ��)
	�ۼ��� ==> �ۼ��� ���
	��ȸ�� ==> 0���� �ʱ�ȭ
	----------------------------------------- ������ ����
*/ 

/*
CREATE TABLE board(
	no NUMBER,
	name VARCHAR2(51) CONSTRAINT board_name_nn NOT NULL,
	subject VARCHAR2(2000) CONSTRAINT board_subject_nn NOT NULL,
	content CLOB CONSTRAINT board_content_nn NOT NULL,
	pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	CONSTRAINT board_no_pk PRIMARY KEY(no)
);
*/

/*
CREATE TABLE test_member(
	no NUMBER,
	id VARCHAR2(20) CONSTRAINT test_member_id_nn NOT NULL,
	pwd VARCHAR2(20) CONSTRAINT test_member_pwd_nn NOT NULL,
	name VARCHAR2(20) CONSTRAINT test_member_name_nn NOT NULL,
	sex VARCHAR2(6) CONSTRAINT test_member_sex_nn NOT NULL,
	birth DATE CONSTRAINT test_birth_id_nn NOT NULL,
	email VARCHAR2(20),
	zipcode VARCHAR2(60) CONSTRAINT test_member_zipcode_nn NOT NULL,
	address VARCHAR2(60) CONSTRAINT test_member_address_nn NOT NULL,
	detail_address VARCHAR2(60),
	phone VARCHAR2(15) CONSTRAINT test_member_phone_nn NOT NULL,
	intro VARCHAR2(200),
);
*/
--���� => 186page
DROP TABLE board;




