/*
	SQL : ����Ŭ ���� ���
	===
		DQL : SELECT =>������ �˻� : ����Ʈ ���� => 60%
			����)	 
				SELECT * | column_list
				FROM (table_name|view_name|SELECT~)
				[
					WHERE �÷���|�Լ��� ������ ��
					GROUP BY �÷��� | �Լ� => �׷캰 ó��	
					HAVING �����Լ� = ��
					ORDER BY �÷���|�Լ� ASC|DESC
									----- ����
				]
			=> ���̺� ���� (����)
				���� : 2���̻��� ���̺��� ��¿� �ʿ��� ������ �����ؼ� ���ο� ���̺� ���� => �ߺ����� (����ȭ) => ���̺��� �������� �������� 
				����
					INNER JOIN => ������, null���� ó�� �� �� ����
						=> �÷��� ���� ���� ��� (=)
						=> �÷��� ���� ������ ���� (AND, BETWEEN) : NON_EQUI_JOIN
						1) ����Ŭ ����
							SELECT A.col,B.col
							FROM A,B
							WHERE A.col=B.col
							*** ���̺��� ���� �÷��� �ִ� ���
									     ------------
									    ���̺��. �÷��� / ��Ī.�÷�
							*** ���̺� ��Ī
								FROM ���̺�� ��Ī
								��) FROM emp e => ���̺���� �� ���
						2) ǥ�� ����
							SELECT A.col,B.col
							FROM A JOIN B
							ON A.col=B.col
							=> , (JOIN) WHERE (ON)
					OUTER JOIN => ������ + null ���� �� ó��
						A(1,2,3,4,6), B(1,2,3,4,5)
						   ---------	  --------
								   5 ��� => RIGHT
						=> LEFT OUTER JOIN
							SELECT A.col,B.col
							FROM A JOIN B
							ON A.col=B.col(+)
							** ANSI ����
							SELECT A.col, B.col
							FROM A RIGHT OUTER JOIN B
							ON A.col=B.col
						=> RIGHT OUTER JOIN
							
						OUTER JOIN => ������ + null ���� �� ó��
			=> SQL���� ���� (��������)
			     ---------- SQL���� �������� ��� �� ���� SQL���� ����
					��Ʈ��ũ�� �ִ������� �����ϴ� ������ ���� ���� ������
				(MainQuery) = (SubQuery)
						      ------------
							SubQuery�� ������� �޾Ƽ� MainQuery�� ����
				** subquery�� �ݵ�� ()�ȿ� ����
				   ----------- ���ó (���� : select������ ����� ����)
						DML/DDL/DQL���� ����� ����
				= WHERE �ڿ�
					=> ���ǰ��� ��ü
					WHERE �÷� ������ (SELECT~)
								| ����� 1�� (������ ��������)
									=> �Ϲ� �񱳿����ڸ� ���
								[����� ������ (������ ��������)
									=> IN, ANY, ALL
										 ------------ �� �� ����
										 ------------ MAX/MIN
									> ANY (`1,2,3) => �ּҰ� => 1
									< ANY (1,2,3,) => �ִ밪 => 3
									> ALL (1,2,3) => �ִ밪 => 3
									< ALL (1,2,3) => �ּҰ� => 1
									| ��ü (IN), MAX/MIN
							  | �񱳿�����
				= SELECT �ڿ� =====> JOIN��� ==> ��Į�� ��������
					=> �÷� ��ü
					SELECT �÷���, (SELECT ~~) ����
							     --------------
								�ݵ�� => �÷� 1��, ������� 11�� ����
				= FROM �ڿ� ====> ���� (�޸𸮿� ������ �ȵ� ����) �ζ��κ� => ������ ������
					=> ���̺� ��ü
				*** rownum : ����Ŭ���� �� row���� ��ȣ�� �ο� => ����
				    ---------- ���� �÷� => �ʿ�ø��� ����� ����
				*** ����Ŭ�� �����ʹ� ���ĵ� ���°� �ƴϴ�
		DDL => 179page (DBA�� �ַ� ����Ѵ�) => ������ ���̺� ����
			*** COMMIT�� �ʿ���� (�ڵ� ����)
			*** DQL/DML => ���� ROW
			*** DDL => ���� column => �÷� �߰�
			*** ������ �Ұ���
			CREATE : ����
				TABLE : ������ ���� ���� => ����
				VIEW : �������̺� => ���� 
				SEQUENCE : �ڵ� ���� ��ȣ 
				INDEX : �˻��� �ӵ� ����ȭ => ORDER BY ��ü
				FUNCTION : �Լ�
				PROCEDURE : ��� ó��
				TRIGGER : �ڵ� �̺�Ʈ ó��
			ALTER : ����
				ADD : �߰� (�÷�, ��������)
				MODIFY : ���� => ������ ũ��
				DROP : �÷� ����
			DROP : ����
				table���� => ��������
			TRUNCATE : �����͸� �߶󳻱�
				table�� �����ϰ� �����͸� ���� => ũ�Ѹ��� 
			RENAME : �̸� ����
				table�� ����
		DML : ������ ���� => row���� 
			INSERT : ������ �߰�
			UPDATE : ������ ����
			DELETE : ������ ����
		DCL 
		TCL : ���� / ���
			COMMIT / ROLLBACK
		
*/