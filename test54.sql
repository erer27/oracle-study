-- Ʈ����
/*
	1.�ڵ�ȭ ó��(�̺�Ʈ)
	2.�԰� ���̺� => INSERT / UPDATE / DELETE => ��� ���̺� �ڵ�ȭ
		��� ���̺� => INSERT / UPDATE / DELETE => ��� ���̺� �ڵ�ȭ
										  ------------------------
										����Ŭ ��ü óġ
							------------------- �ڹٿ����� ȣ���� �ȵȴ�
							 ���α׷� �м� / ������ => ��������
	3. SELECT ������ ����� �Ұ��� => INSERT / UPDATE / DELETE�� ����
							  ����� ����
	4. :NEW, : OLD
		     ------- ������ ���� �д� ���
	  -------- INSERT / UPDATE => ���ο� �����͸� �д� ���
	  INSERT INTO �԰�(a,b,c) VALUES(��1, ��2, ��3...)
						   ----------------- �ٸ� ���̺� ���� �߰�
	 :NEW.a, :NEW.b, :NEW.c => ��� INSERT

	���̺� 2���� ���ÿ� ó��
	�԰� => INSERT
	��� => INSERT/UPDATE
	5. DBA�� �ַ� ��� => �޴���
	6. ����)
		  CREATE [OR REPLACE] TRIGGER tri_name
		  BEFORE|AFTER (INSERT/UPDATE/DELETE) ON table_name
			     --------
			     ���� INSERT => �ڵ�ȭ ó��
		 => �԰��� INSERT�� �Ǹ� ��� �ڵ�ȭ ó��
		FOR EACH ROW -- ��ü ROW�� ���� ó��
		DECLARE
		   ���� ����
		BEGIN
		   �ڵ�ȭ ó�� => ���
		END;
		  / 
	7. ����
	   DROP TRIGGER tri_name
	
	8. ����
	   ALTER TRIGGER tri_name => OR REPLACE
	9. ������Ʈ���� Ʈ����
	   => ���� : ���ƿ� / ���ϱ� / ���
		----- COUNT����
	10. ���ν��� : => ��� ���̺��� ����� �ѹ��� ó�� => �ݺ�
	     ----------- ����¡ ���
	     
*/
/*
CREATE TABLE ��ǰ(
	ǰ�� NUMBER,
	��ǰ�� VARCHAR2(30),
	�ܰ� NUMBER
);
CREATE TABLE �԰�(
	ǰ�� NUMBER,
	���� NUMBER,
	�ݾ� NUMBER
);
CREATE TABLE ���(
	ǰ�� NUMBER,
	���� NUMBER,
	�ݾ� NUMBER
);
-- �ڵ�ȭ
CREATE TABLE ���(
	ǰ�� NUMBER,
	���� NUMBER,
	�ݾ� NUMBER
);
INSERT INTO ��ǰ VALUES(100,'�����',1500);
INSERT INTO ��ǰ VALUES(200,'���ڱ�',1000);
INSERT INTO ��ǰ VALUES(300,'������',2500);
INSERT INTO ��ǰ VALUES(400,'¯��',1200);
INSERT INTO ��ǰ VALUES(500,'������',2000);
COMMIT;
SELECT * FROM ��ǰ;
*/
/*
	�԰� => ��� (�ڵ�ȭ)
		   1. ��ǰ�� ���翩�� Ȯ��
			���� => UPDATE(������ ����) 
		    ������ => INSERT
	��� => ��� (�ڵ�ȭ) 
		   1. ��ǰ�� �����ִ��� Ȯ��
			���� �ִ� ��� : UPDATE (���� ����)
			���� ��� : DELETE
*/
-- �԰� => Ʈ���� => AFTER : �԰�Ϸ��Ŀ� ��� ó���� �Ѵ�
-- Ʈ���Ŵ� COMMIT�� ����ϸ� ������ �߻� => AutoCommit
/*
CREATE OR REPLACE TRIGGER input_trigger
AFTER INSERT ON �԰�
FOR EACH ROW
DECLARE
 -- ���� ����
 vcnt NUMBER:=0; --�ʱ�ȭ
BEGIN
 SELECT COUNT(*) INTO vcnt
 FROM ���
 WHERE ǰ��=:NEW.ǰ��; -- �԰� => INSERT���� ���� ǰ��
 -- ��� ��ϵ� ��ǰ���� ���� Ȯ��
 IF vcnt=0 THEN
   -- ���ο� ��ǰ�� ���´� (INSERT)
   -- INSERT INTO �԰� VALUES(100,10,1500)
   INSERT INTO ��� VALUES(:NEW.ǰ��,:NEW.����,:NEW.����*:NEW.�ݾ�);
 ELSE
   -- ��ϵ� ��ǰ�� ���� (������ ���� => UPDATE)
   UPDATE ��� SET
   ���� = ���� +:NEW.����,
   �ݾ�=�ݾ�+(:NEW.����*:NEW.�ݾ�)
   WHERE ǰ��=:NEW.ǰ��;
 END IF;
END;
/
*/
--280page => ī����� / ����Ʈ �ڵ�ȭ
/*
	���� ���̺��� ó�� �� �� ���� => �ٸ� ���̺� ����
	INSERT / UPDATE / DELETE���� ����� �� => ������ �� �� : NEW.�÷���
*/
-- ���
/*
	��� => INSERT 
	----- 1. ������ ���� �ִ� �� Ȯ��
		���� �ִ� ��� : UPDATE
		������ ���� ��� : DELETE
*/
/*
CREATE OR REPLACE TRIGGER output_trigger
AFTER INSERT ON ���
FOR EACH ROW
DECLARE
 vcnt NUMBER:=0;
BEGIN
 SELECT ���� INTO vcnt
 FROM ���
 WHERE ǰ��=:NEW.ǰ��;
 -- ����ϴ� ������ ���� �ִ� ������ ���� ���
 IF :NEW.����=vcnt THEN
    DELETE FROM ���
    WHERE ǰ��=:NEW.ǰ��;
 ELSE
  UPDATE ��� SET
  ����=����-:NEW.����,
  �ݾ�=�ݾ�-(:NEW.����*:NEW.�ݾ�)
  WHERE ǰ��=:NEW.ǰ��;
 END IF;
END;
/
*/

DROP TRIGGER input_trigger;
DROP TRIGGER output_trigger;