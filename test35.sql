/*
	�Ǹ���ǥ

	��ǥ��

	��ǰ

*/
DROP TABLE ��ǥ��;
DROP TABLE ��ǰ;
DROP TABLE �Ǹ���ǥ;

CREATE TABLE �Ǹ���ǥ(
	��ǥ��ȣ VARCHAR2(13) ,  
	�Ǹ����� DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL,	
	���� VARCHAR2(51)	CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL,	
	�Ѿ� NUMBER,
	CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
	CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0)
);


CREATE TABLE ��ǥ��(
	��ǥ��ȣ VARCHAR2(13),
	��ǰ��ȣ VARCHAR2(100),
	���� NUMBER CONSTRAINT ��ǥ��_����_nn NOT NULL,
	�ܰ� NUMBER CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL,
	�ݾ� NUMBER,
	CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
	CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ),
	REFERENCES �Ǹ���ǥ(��ǥ��ȣ),
	CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǰ��ȣ),
	REFERENCES ��ǰ(��ǰ��ȣ),
	CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ�>0)
);

CREATE TABLE ��ǰ(
	��ǰ��ȣ VARCHAR2(13), 
	��ǰ�� VARCHAR2(100),
	��ǰ�ܰ� NUMBER,
	CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ),
	CONSTRAINT ��ǰ_��ǰ��_uk UNIQUE(��ǰ��),
	CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ�>0)
);

-- ���� => ���� ���̺� ����, ���� => �����ϰ� �ִ� ���̺� ����

