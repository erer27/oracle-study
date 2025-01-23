-- ���ν��� / Ʈ���� = ���� / ������ (�м��� ��ƴ�) => ERP (����)
/*
	FUNCTION => �������� ������ �ִ�, SELECT�� ����� ����
				DML ����� �Ұ��� 
	���ν��� => �������� ���� �Լ� 
			  SELECT / INSERT / UPDATE / DELETE�� ����
	 => �÷����̳� SQL������ �� �� ���� (����)
	 => ���� : �� �����ڴ� �����ϱ� ��ƴ�
			SQL������ �� �� ��� 1. ������ ��ƴ�, �м��� ��ƴ�
			=> ����� ������Ʈ 
			=> ����� / ������ => 70%
	���ν��� => 270page
	1. ����
		CREATE [OR REPLACE] PROCEDURE pro_name(�Ű�����...)
		IS
		 ��������
		BEGIN
		  ó������ => SQL
		END;
	2. �Ű�����
	   = IN���� => �� ���� / �� �Է� => INSERT/UPDATE/DELETE
		=> IN������ ����
		=> ����)
			���� IN �������� 
	   = OUT ���� => ���� �о���� ���� : ������ ��� ���
			    => �Ű������� ���� �޴´�
				 CALL BY REFERENCE => �޸� �ּҸ� �̿��ϴ� ���α׷�
		����)
			���� OUT �������� => ��� / �󼼺��� / �˻�
						   => SELECT
	   = INPUT���� => IN/OUT�� ����
		SELECT * id, name, sex FROM member
		WHERE id=��

	int[] arr=new int[5];
	public void display(int[] arr)
	{
		arr[0]=100;
	}
	
	display(arr) ==> �Ϲݺ����� ���� NUMBER/VARCHAR...

	���� : DROP PROCEDURE pro_name
	���� Ȯ�� : show error
*/
-- IN���� ��� : INSERT / UPDATE / DELETE
-- OUT���� ��� : SELECT

/*
		
	=> JSP������Ʈ���� ��� => ��� SQL 
	1. ���ν��� : ��� => ����/������/�����
	2. Ʈ���� : ���ƿ� / �� => �ڵ����� ���� 
	
*/
/*
	CallableStatement cs;
	String sql="{CALL studentInsert(?,?,?,?)}"; = �Լ� ȣ��
	cs=conn.preparedCall(sql)
	=> ����Ŭ�� ���̺귯�� �Լ� 
	=> �ݺ� => ERP => �ݺ� 70%
*/
-- INSERT : student
/*
CREATE OR REPLACE PROCEDURE studentInsert(
	pName student.name%TYPE,
	pKor student.kor%TYPE,
	pEng student.eng%TYPE,
	pMath student.math%TYPE
)
IS
BEGIN
	INSERT INTO student VALUES(
		(SELECT NVL(MAX(hakbun)+1,1) FROM student),
		pName,
		pKor, pEng, pMath
	);
	COMMIT;
	END;
/
*/

-- UPDATE
-- CALL studentUpdate(1,'',100,100,100)
/*
CREATE OR REPLACE PROCEDURE studentUpdate(
	pHakbun student.hakbun%TYPE,
	pName student.name%TYPE,
	pKor student.kor%TYPE,
	pEng student.eng%TYPE,
	pMath student.math%TYPE
)
IS
BEGIN
	UPDATE student SET
	name=pName,kor=pKor,eng=pEng,math=pMath
	WHERE hakbun=pHakbun;
	COMMIT;
	END;
/
-- DELETE
*/

/*
CREATE OR REPLACE PROCEDURE studentDelete(pHakbun student.hakbun%TYPE)
IS
BEGIN
	DELETE FROM student
	WHERE hakbun=pHakbun;
	COMMIT;
END;
/
*/

/*
-- OUT ���� ��� => SYS_REFCURSOR => �ڹ�
CREATE OR REPLACE PROCEDURE studentDetailData(
	pHakbun IN student.hakbun%TYPE,
	pName OUT student.name%TYPE,
	pKor OUT student.kor%TYPE,
	pEng OUT student.eng%TYPE,
	pMath OUT student.math%TYPE
)
IS
BEGIN
	SELECT name, kor, eng, math INTO pName, pKor, pEng, pMath
	FROM student
	WHERE hakbun=pHakbun;
END;
/
*/
-- OUT => �Ű������� ���� �޴� ���
-- CURSOR
/*
CREATE OR REPLACE PROCEDURE studentAllData(
	pResult OUT SYS_REFCURSOR
)
IS
BEGIN
	OPEN pResult FOR
	SELECT * FROM student;
END;
/
*/

-- CURSOR�� ROW������ ���� �޴� ���
DROP PROCEDURE studentDetailData;
CREATE OR REPLACE PROCEDURE studentDetailData(
	pHakbun IN student.hakbun%TYPE,
	pResult OUT SYS_REFCURSOR
)
IS
BEGIN
	OPEN pResult FOR
		SELECT *
		FROM student WHERE hakbun=pHakbun;
END;
/