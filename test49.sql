--5�� => PL/SQL (�����ͺ��̽� ������)

/*
	�����ͺ��̽� : CRUD => SELECT / INSERT / UPDATE / DELETE
	=> �ڹ� / ����Ŭ => �帧 �ľ� (���=> �ణ ����) 
	-----------------------------------------------------------
	=> 1 Part : �������� ���� ��� (���� + ����)
							 ---------------- ķ���忹�� + ������
							  ��ȭ + OST => ĸó�� 
	PL / SQL => 279page
	----------- ���� : ����, ���� (�Լ�)
	----------- ���� : �������ڰ� �����ϱ� ��ƴ� (�������� ��������)
			=> SQL => SELECT name, pwd, email...
			=> getData() => SQL������ ������ �ʴ´�
			=> �Ŵ��� => �������̵� (�ҽ��� �˰� �ִ�)
	=> Procedural Language : �Լ��� ����� ���
	=> �������� ��� : �Լ����� => �����
	      ---------------- FUNCTION => �����Լ� / ����� ���� �Լ� : ������
					=> SELECT������ ����� ���� / WHERE����
				    **PROCEDURE => ����� ����� / �������� ����
					=> SELECT / INSERT / UPDATE / DELETE�� ����
					TRIGGER => �������
							  �ڵ�ȭ ó�� (�ڹٿ����� ȣ���� �ȵȴ�)
							  �����ͺ��̽��� ����
							  ���ƿ� Ŭ�� => �ڵ����� ������ ���ƿ� ����
							  �԰� = ���, ��� = ���


	=> PL/SQL ���� 
		1. ���� ����
			DECLARE
				������ ���� => C��� ���� 
			BEGIN
				SQL ���� ����
				����ó���� ���� => �޼ҵ念�� {}�� ������� �ʴ´�
			END;
			/ 
		2. ��� ���� 
	
		-----------------------------------------------------------
		  ���� : ������ �� �ִ� �Ѱ��� �����͸� �����ϴ� ����
		 --------
		  1) ��Į�󺯼�
			no NUMBER
			name VARCHAR2(20)
			today DATE 
		  ***2) %TYPE
			���� ���̺� �÷��� ���������� ���
			empno emp.empno%TYPE
			fno food_menupan.fno%TYPE
			     ------------------ -----------
				���̺��. �÷��� ���������� �о� �Ͷ�
		  3) %ROWTYPE (�Ѱ��� ���̺� ����)
			���� ���̺��� ��ü �÷� �����͸� ��Ƽ� ������ �´�
			emp emp%ROWTYPE
			----- empno, ename, job, hiredate, mgr, sal, comm, deptno
			------ VO
			���� => emp.ename => VO��ü
		  4) RECORD => ����� ���� �������� (���̺� ������ ����)
			TYPE ������ IS RECORD(
				empno NUMBER,
				ename VARCHAR2(10),
				dname VARCHAR2(10),
				loc VARCHAR2(10)
			)
		 --------------------------------------- row�Ѱ��� ����
		  ***5) CURSOR => List => ROW �������� ��Ƽ� ó���� ����
			 ---------- for��
		 => �Լ� (FUNCTION / PROCEDURE / TRIGGER)
		 => VO / DAO / Model (�������� ������ ����)
		      -----------------------
					 ��û			SQL
			������ ===== Model ====== DAO
					����		    �����
						--------------------------
						 Java / Python / C# / C/C++

			------------------------------------ �Ѱ��� Ʋ�� �̿��� �� �ְ�
								    ----------- ���κ���(������
		 => MyBatis / JPA / Spring / Spring-Boot => ���̺귯��
		
		 1. ��� 
		    SET SERVEROUTPUT ON => import
		    DBMS_OUTPUT.LINE(��µ�����) => System.out.println()

*/

/*
SET SERVEROUTPUT ON
DECLARE
  -- ���� ���� => �ʱ�ȭ => :=
  name VARCHAR2(50):='ȫ�浿';
BEGIN
  -- SQL => ������ �б� / ���
  DBMS_OUTPUT_LINE('�̸�:'||name);
END;
*/

/*
DECLARE
	pEname VARCHAR2(20);
	pJob VARCHAR2(20);
	pSal NUMBER(7,2);
BEGIN
	SELECT ename,job,sal INTO pEname,pJob,pSal
	FROM emp
	WHERE empno=7788;
	
	DBMS_OUTPUT.PUT_LINE('�̸�'||pEname);
	DBMS_OUTPUT.PUT_LINE('����'||pJob);
	DBMS_OUTPUT.PUT_LINE('�޿�'||pSal);
END;

*/
/*
DECLARE
	pEmpno NUMBER;
	pEname VARCHAR2(20);
	pJob VARCHAR2(20);
	pHiredate DATE;
	pSal NUMBER(7,2);
BEGIN
	SELECT empno, ename,job,hiredate,sal INTO pEmpno,pEname,pJob,pHiredate,pSal,
	FROM emp
	WHERE empno=7788;
	
	DBMS_OUTPUT.PUT_LINE('���'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('�̸�'||pEname);
	DBMS_OUTPUT.PUT_LINE('����'||pJob);
	DBMS_OUTPUT.PUT_LINE('�Ի���'||pHiredate);
	DBMS_OUTPUT.PUT_LINE('�޿�'||pSal);
END;
/
*/

/*
-- ���� ���̺��� �÷� �����͸� ������ ���� (%TYPE)

-- ���� ���� ���Ǵ� �������� %TYPE => ������ :=
DECLARE
	pEmpno emp.empno%TYPE;
	pEname emp.ename%TYPE;
	pJob emp.job%TYPE;
	pSal emp.empno%TYPE;
	pDay emp.hiredate%TYPE;
BEGIN
	SELECT empno, ename,job,hiredate,sal INTO pEmpno,pEname,pJob,pDay,pSal
	FROM emp
	WHERE empno=7788;
	
	DBMS_OUTPUT.PUT_LINE('���'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('�̸�'||pEname);
	DBMS_OUTPUT.PUT_LINE('����'||pJob);
	DBMS_OUTPUT.PUT_LINE('�Ի���'||pDay);
	DBMS_OUTPUT.PUT_LINE('�޿�'||pSal);
END;
/
*/

/*
-- ���̺��� ���������� �ѹ��� ó�� (��� �÷��� �������� �б�) : %ROWTYPE
-- ���̺��%ROWTYPE => ���̺� �� �� ����
DECLARE
	pEmp emp%ROWTYPE; -- EmpVO
BEGIN
	SELECT * INTO pEmp
	FROM emp
	WHERE empno=7788;
-- ���
	DBMS_OUTPUT.PUT_LINE('---------- ����� ------------');
	DBMS_OUTPUT.PUT_LINE('���:'||pEmp.empno);
	DBMS_OUTPUT.PUT_LINE('�̸�:'||pEmp.ename);
	DBMS_OUTPUT.PUT_LINE('����:'||pEmp.job);
	DBMS_OUTPUT.PUT_LINE('���:'||pEmp.mgr);
	DBMS_OUTPUT.PUT_LINE('�Ի���:'||pEmp.hiredate);
	DBMS_OUTPUT.PUT_LINE('�޿�:'||pEmp.sal);
	DBMS_OUTPUT.PUT_LINE('������:'||pEmp.comm);
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ:'||pEmp.deptno);
	END;
/
*/


	
/*
-- dept => deptno / dname / loc => 20�� �μ��� ���� ���
DECLARE
	pDept dept%ROWTYPE; 
BEGIN
	SELECT * INTO pDept
	FROM dept
	WHERE deptno=20;
-- ���
	DBMS_OUTPUT.PUT_LINE('---------- ����� ------------');
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ:'||pDept.deptno);
	DBMS_OUTPUT.PUT_LINE('�μ��̸�:'||pDept.dname);
	DBMS_OUTPUT.PUT_LINE('�μ���ġ:'||pDept.loc);

	END;
/	
*/
-- Error Ȯ�� show error
-- ���� / �������� => ���̺��� ������ ��� => ��Į�󺯼�, %TYPE
-- %ROWTYPE => �� ���� ���̺� ����  (X) => ����� ���� �������� RECORD
-- �Լ�, ���ν���, Ʈ���� => ��Į�󺯼�, %TYPE, CURSOR
-- PL => ���� => �Լ� / ���ν��� / Ʈ���� => JSP ������Ʈ
-- JDBC / �� ���� 
-- �ڹ� : VO / DAO / Model
-- ����� ���� �������� RECORD
/*
	���� : ������ ���̺��� �����ؼ� �ʿ��� ������ ���� 
		 ---------------- ���ڰ�, �ߺ�����, �������̺�
				      ------- ��� : ���, ����, �
		 �����	=== ���� === ��ȭ 	
		 �����	=== ����/��ٱ��� ===��ǰ
	----------------------------------------------------------
	INNER JOIN : ������
	  EQUI_JOIN ==> ���� ���� ������ �ִ� ��� (=)
	  WHERE emp.deptno=dept.deptno
	  NON_EQUI_JOIN => ���Ե� ���� ������ �´� (AND, BETWEEN)
	  WHERE sal BETWEEN losal AND hisal
	  *** ���̺�� ���̺� ����
	       -------	    -------
		 |		|
		--------------- ���� �÷����� ��쿡�� ����
				   => ���̺��.�÷���
				   => FROM emp e, dept d=> ��Ī
				   => ��Ī.�÷��� 
	   => ������ null���� �ִ� ��쿡�� ó�� �� �� ����
		------------------------------------------------------ ���� : Outer JOIN
	   => ������ ���������� �ַ� ���
		 OUTER JOIN : INNER JOIN+null 
		    = LEFT OUTER JOIN
			(ORACLE)
			WHERE emp.deptno=dept.deptno(+)
			(ANSI)
			FROM emp LEFT OUTER JOIN dept
			ON emp.deptno=dept.deptno
		    = RIGHT OUTER JOIN
			(����Ŭ)
			WHERE emp.deptno=dept.deptno(+)
			(ǥ��)
			FROM emp RIGHT OUTER JOIN dept
			ON emp.deptno=dept.deptno
			-----------------------------------
*/
-- ���, �̸�, ����, �Ի���, �޿� (emp), �μ���, �ٹ��� (dept), �޿����(salgrade), �޿� ���� (RANK)


/*
DECLARE
	pEmpno emp.empno%TYPE;
	pEname emp.ename%TYPE;
	pJob emp.job%TYPE;
	pDay emp.hiredate%TYPE;
	psal emp.sal%TYPE;
	pDname dept.dname%TYPE;
	pLoc dept.loc%TYPE;
	pGrade salgrade.grade%TYPE;
	pRank NUMBER; -- NUMBER(8,2)
BEGIN
	SELECT empno,ename,job,hiredate,sal,dname,loc,grade,
		RANK() OVER(ORDER BY sal DESC)
		INTO pEmpno, pEname, pJob,pDay,pSal,pDname,pLoc,pGrade,pRank
	FROM emp, dept, salgrade
	WHERE emp.deptno=dept.deptno
	AND sal BETWEEN losal AND hisal;
	AND empno=&sabun;
	-- &�� Scanner => �Է°��� �޴� ��쿡 ���
	-- RANK() OVER(ORDER BY sal DESC) => �����Լ� (������ ��½�)
	-- ���
	DBMS_OUTPUT.PUT_LINE('---------- ����� ------------');
	DBMS_OUTPUT.PUT_LINE('���:'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('�̸�:'||pEname);
	DBMS_OUTPUT.PUT_LINE('����:'||pJob);
	DBMS_OUTPUT.PUT_LINE('�Ի���:'||pDay);
	DBMS_OUTPUT.PUT_LINE('�޿�:'||pSal);
	DBMS_OUTPUT.PUT_LINE('������:'||pDname);
	DBMS_OUTPUT.PUT_LINE('�μ���ġ:'||pLoc);
END;
/
*/


/*
-- ���������� ���� ó��
DECLARE
 TYPE empDept IS RECORD(
	pEmpno emp.empno%TYPE,
	pEname emp.ename%TYPE,
	pJob emp.job%TYPE,
	pDay emp.hiredate%TYPE,
	psal emp.sal%TYPE,
	pDname dept.dname%TYPE,
	pLoc dept.loc%TYPE,
	pGrade salgrade.grade%TYPE,
	pRank NUMBER
	
 );
-- RECORD���� ����
ed empDEpt;
BEGIN
	SELECT empno,ename,job,hiredate,sal,dname,loc,grade,
		RANK() OVER(ORDER BY sal DESC)
		INTO ed
	FROM emp,dept,salgrade
	WHERE emp.deptno=dept.deptno
	AND sal BETWEEN losal AND hisal
	AND empno=7788;
	-- ���
	DBMS_OUTPUT.PUT_LINE('---------- ����� ------------');
	DBMS_OUTPUT.PUT_LINE('���:'||ed.pEmpno);
	DBMS_OUTPUT.PUT_LINE('�̸�:'||ed.pEname);
	DBMS_OUTPUT.PUT_LINE('����:'||ed.pJob);
	DBMS_OUTPUT.PUT_LINE('�Ի���:'||ed.pDay);
	DBMS_OUTPUT.PUT_LINE('�޿�:'||ed.pSal);
	DBMS_OUTPUT.PUT_LINE('������:'||ed.pDname);
	DBMS_OUTPUT.PUT_LINE('�μ���ġ:'||ed.pLoc);
END;
/
*/


/*
	��Į�󺯼�
	%TYPE
	------------------ �Ѹ� ���� ���� => �Ϲݺ���
	CURSOR => ��Ƽ (�������� ���ÿ� �޴´�) => List
	
	����)
		DECLARE
			���� ����
		BEGIN
			SELECT�� �̿��ؼ� ������ ���� => INTO
			���� ��� 
		END;
		
	���� ����
	������
	 = ��������� ( +, -, *, / ) => +�� �����ϰ� ����� ó��
						  / 0���� ���� �� ����, ����/����=�Ǽ�
	 = �񱳿����� ( =, !=(<>,^=), <, >, <=, >=) => ���ǹ�
	 = �������� (AND, OR)
	 = IN (OR�� �������� ���)
	 = BETWEEN ~ AND (�Ⱓ, ����)
	 = LIKE => %(���� ���������� ����), _(�ѱ���)
	 = NULL : ���� ���� ���� (����ó���� �ȵȴ�)
			IS NULL(null�� ���), IS NOT NULL
	 = NOT : ���������� => NOT IN, NOT LIKE, NOT BETWEEN
	 => �Ϲ� SQL���� ����ϴ� �����ڿ� ���� 
	���
	 ���ǹ�
	  = ���� ���ǹ�
		����)
			IF ���ǹ� THEN => ������ true�϶��� ����
			  ó������
			END IF;
			=> if(���ǹ�)
			     {
			     }
			IF (���ǹ�) THEN => ������ true�� ���� ����
				ó������
			END IF;
	  = ���� ���ǹ� : true / false�� ������ �۾�
		����)
			IF ���ǹ� THEN
				ó������ -- true�϶� ó���ϴ� ����
			ELSE
				ó������ -- false�϶� ó���ϴ� ����
			END IF;
	
			=> if(����)
			     {
			     }
			     else
			     {
			     }
			=> sqldeveloper
			
	  = �������ǹ� : ���ǹ��� �������߿� �Ѱ��� ����
		����)
			IF ���ǹ� THEN
				ó������
				���� : true => ó�������� ���� => ����
				���� : false => �ؿ� �ִ� ���ǹ����� �̵�
					|
			ELSIF ���ǹ� THEN
				ó������
				���� : true => ó�������� ���� => ����
				���� : false => �ؿ� �ִ� ���ǹ����� �̵�
					|
			ELSIF ���ǹ� THEN
				ó������
				���� : true => ó�������� ���� => ����
				���� : false => �ؿ� �ִ� ���ǹ����� �̵�
					|
			ELSIF ���ǹ� THEN
				ó������
				���� : true => ó�������� ���� => ����
				���� : false => �ؿ� �ִ� ���ǹ����� �̵�
					|
			ELSE
				ó������ (�ش� ������ ���� ��쿡 ó��) = ������ ����
			END IF;
	 �ݺ���
	  = BASIC �ݺ��� => do~while
	  = WHILE
	  = FOR 
*/
-- ���� ���ǹ� IF ���ǹ� THEN ~ END IF;

/*
DECLARE
 pEmpno emp.empno%TYPE;
 pEname emp.ename%TYPE;
 pJob emp.job%TYPE;
 pDeptno emp.deptno%TYPE;
 pDname dept.dname%TYPE;
BEGIN
 SELECT empno, ename, job, deptno
	INTO pEmpno, pEname,pJob,pDeptno
 FROM emp
 WHERE empno=7900;
 -- ���� ó���� �ȴ� => �ӵ��� �ʴ�



 IF pDeptno=10 THEN
	pDname:='���ߺ�';
 END IF;
 
 IF pDeptno=20 THEN
	pDname:='������';
 END IF;

  IF (pDeptno)=30 THEN
	pDname:='��ȹ��';
 END IF;

	DBMS_OUTPUT.PUT_LINE('------- ����� ---------');
	DBMS_OUTPUT.PUT_LINE('���:'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('�̸�:'||pEname);
	DBMS_OUTPUT.PUT_LINE('����:'||pJob);
	DBMS_OUTPUT.PUT_LINE('�μ�:'||pDname);
	-- �Լ� : ����

END;
/
*/

/*
DECLARE
 pNo NUMBER:=&no;
 pResult VARCHAR2(20);
BEGIN
 IF MOD(pNo, 2)=0 THEN
    DBMS_OUTPUT.PUT_LINE(pNo||'��(��) ¦���Դϴ�');
 ELSE
    DBMS_OUTPUT.PUT_LINE(pNo||'��(��) Ȧ���Դϴ�');
 END IF;
END;
/

*/

/*
DECLARE
	pEname emp.ename%TYPE;
	pComm emp.comm%TYPE;
	pSal emp.sal%type;
	pTotal NUMBER; -- NUMBER(8,2)
	/*
		�����Լ�
		 ���� (substr, instr, rpad)
		 ���� (ceil, round)
		 ��¥ (sysdate, months_between)
		 ��ȯ (to_char) => MM(��), MI(��), DY(����)
		 ��Ÿ(nvl) => null ���� ��ü

		regexp_like()
		 => ���Խ�
		 => �ѱ���. 
		 => �������� : *(0�̻�), +(1 �̻�),
		 => | => ����
		 => [��-�R] : �ѱ� ��ü
				^[��-�R] => �ѱ۷� ����
				[��-�R]$ => �ѱ۷� ������
		 => [A-Za-z] : ���ĺ� ��ü
		 => [0-9] : ���� ��ü 
	*/
BEGIN
	SELECT ename, comm, sal, sal+NVL(comm,0)
	INTO pEname, pComm, pSal, pTotal
	FROM emp
	WHERE empno=&empno;
	

	-- comm(NULL���� ����) => null���� ����ó���� �ȵȴ�
	-- pComm>0 => null => else������ ����
	IF pComm>0 THEN
		DBMS_OUTPUT.PUT_LINE(pEname||'���� �޿���'
					||pSal||'�̰� ��������'
					||pComm||'�̸� �� �޿���' 
					||pTotal||'�Դϴ�');

	ELSE
		DBMS_OUTPUT.PUT_LINE(pEname||'���� �޿���'
					||pSal||'�̰� ��������'
					||'���� �� �޿��� '
					||pTotal||'�Դϴ�');
	END IF;
END;
/

*/

-- TRIGGER => ��� / �԰� = ���
-- �������ǹ� IF ���ǹ� THEN ~ ELSIF ���ǹ� THEN ~ ELSE ~ END IF
DECLARE
 jumsu NUMBER(3):=&jumsu;
 hakjum VARCHAR2(10);
BEGIN
 IF jumsu>=90 THEN
	hakjum:='A����';
 ELSIF jumsu >=80 THEN
	hakjum:='B����';
 ELSIF jumsu >=70 THEN
	hakjum:='C����';
 ELSIF jumsu >=60 THEN
	hakjum:='D����';
 ELSE
	hakjum:='F����';
 END IF;
	DBMS_OUTPUT.PUT_LINE('����:'||hakjum);
END;
/