
/*
DROP TABLE ��ǥ��;
DROP TABLE ��ǰ;
DROP TABLE �Ǹ���ǥ;


CREATE TABLE �Ǹ���ǥ(
	��ǥ��ȣ VARCHAR2(13),
	�Ǹ����� DATE,	
	���� VARCHAR2(51),	
	�Ѿ� NUMBER
);


CREATE TABLE ��ǥ��(
	��ǥ��ȣ VARCHAR2(13),
	��ǰ��ȣ VARCHAR2(100),
	���� NUMBER,
	�ܰ� NUMBER,
	�ݾ� NUMBER
);

CREATE TABLE ��ǰ(
	��ǰ��ȣ VARCHAR2(13), 
	��ǰ�� VARCHAR2(100),
	��ǰ�ܰ� NUMBER
);

--�������� ����(���̺� �����Ŀ� ��������)
-- PK
ALTER TABLE �Ǹ���ǥ ADD CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk
PRIMARY KEY(��ǥ��ȣ);

-- NOT NULL
ALTER TABLE �Ǹ���ǥ MODIFY  �Ǹ����� DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL;

-- NOT NULL => MODIFY, CHECK, PRIMARY, FOREIGN, UNIQUE => ADD

ALTER TABLE �Ǹ���ǥ MODIFY  ���� VARCHAR2(51) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL;

ALTER TABLE �Ǹ���ǥ ADD CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0);

*/


-- �������� ���� => FOREIGN
--ALTER TABLE �Ǹ���ǥ DROP CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck;
-- �����Ͱ� ���� => ���������� ���� ���� => ���������� ����

/*
	��������
	1) ���
		id varchar(20) PRIMARY KEY
		name varchar2(50) NOT NULL
	2) 
		id VARCHAR(20)
		name varchar2(50) NOT NULL,
		PRIMARY KEY(id)

	3) ���� => �ʿ�ø��� ������ ����
		id VARCHAR(20)
		name varchar2(50) CONSTRAINT ���̺��_�÷���_nn NOT NULL,
		CONSTRAINT ���̺��_�÷���_pk PRIMARY KEY(id)
				   -----------------------
				   ALTER�� �̿��ؼ� ���� / ����

		*** �����ͺ��̽� ����� �ѹ��� �ϼ����� �ʴ´�
			=> ��� ������ �����ؾ� �ȴ�
			=> ������ ���� 
*/
-- �ڵ� ������ȣ : SEQUENCE 
/*
	CREATE SEQUENCE table��_�÷���_seq
	
	=> �ɼ�
		START WITH 1 -- ����
		INCREMENT BY 1 -- ����
		NOCACHE -- 20�� ���� ���� �� ���� => ���嵥���;���
		NOCYCLE -- ó������ ���ƿ´�
		1~10 => 10 => 1
		=> MAXVALUE => ���Ѵ�
	=> ����
		DROP SEQUENCE ��������
	
	=> ���簪 (���� �ȵ� ��) => ��������.currval
	=> ������ => ��������.nextval
	=> ���� : ������ �����ȴ�
		      -------------------
		SELECT NVL(MAX(no)+1,1) FROM ���̺��
		-------------------------------------------------- �������� �̿�
	=> �⺻Ű (PRIMARY KEY) => id�ܿ� �������� ����
						   => �ڵ����� ���ڿ� �� ���� = �ߺ����� ó��
*/

/*
CREATE TABLE test(
	no NUMBER,
	name VARCHAR2(20) CONSTRAINT test_name_nn NOT NULL,
	CONSTRAINT test_no_pk PRIMARY KEY(no)
);
-- NO�� �ڵ� ���� => ������
CREATE SEQUENCE test_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;

���� : DROP SEQUENCE test_no_seq => �ʱ�ȭ
*/
/*
-- ���̺�� => SEQUENCE�� ���
CREATE SEQUENCE test_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;
INSERT INTO test VALUES(test_no_seq.nextval,'ȫ�浿');
INSERT INTO test VALUES(test_no_seq.nextval,'��û��');
INSERT INTO test VALUES(test_no_seq.nextval,'�ڹ���');

COMMIT;
*/

/*
conn system/happy
GRANT CREATE SYNONYM TO hr;
conn hr/happy;
*/


--CREATE PUBLIC SYNONYM sawon_info FOR test;
/*
	���Ǿ� => ���̺� �̸� ������ ����� �����ϰ� �����
	SYNONYM
	=> ���� => ����� ���������� ����� �Ұ���
			���� �� ���
			------------------- system/sysdba
	=> hr : synonym / view => �Ұ��� (����) 
	=> conn system/happy
		GRANT CREATE VIEW TO hr; => ���� ����
		REVOKE CREATE VIEW FROM hr; => ���� ����
		--------------------------------------


	=> SEQUENCE / VIEW / PROCEDURE / TRIGGER / INDEX

	=> ����Ʈ : ���̺� (RENAME) => �ڹٿ��� ���̺���� ����
			--------------------- ���Ǿ� (�����丵)
							    ------------ ������ (�÷���, ���̺��)
							    | Ŭ������ / ������� / �޼ҵ��
*/
