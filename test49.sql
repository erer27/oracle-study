--5Àå => PL/SQL (µ¥ÀÌÅÍº£ÀÌ½º °ü¸®ÀÚ)

/*
	µ¥ÀÌÅÍº£ÀÌ½º : CRUD => SELECT / INSERT / UPDATE / DELETE
	=> ÀÚ¹Ù / ¿À¶óÅ¬ => Èå¸§ ÆÄ¾Ç (¸ð¹æ=> ¾à°£ ¼öÁ¤) 
	-----------------------------------------------------------
	=> 1 Part : °øÅëÀ¸·Î µé¾î°¡´Â ´ñ±Û (¸ÀÁý + ¿©Çà)
							 ---------------- Ä·ÇÎÀå¿¹¾à + ·¹½ÃÇÇ
							  ¿µÈ­ + OST => Ä¸Ã³º» 
	PL / SQL => 279page
	----------- ÀåÁ¡ : º¸¾È, Àç»ç¿ë (ÇÔ¼ö)
	----------- ´ÜÁ¡ : À¥°³¹ßÀÚ°¡ ÀÌÇØÇÏ±â ¾î·Æ´Ù (°¡µ¶¼ºÀÌ ¶³¾îÁø´Ù)
			=> SQL => SELECT name, pwd, email...
			=> getData() => SQL¹®ÀåÀÌ º¸ÀÌÁö ¾Ê´Â´Ù
			=> ¸Å´º¾ó => ¿À¹ö¶óÀÌµù (¼Ò½º¸¦ ¾Ë°í ÀÖ´Ù)
	=> Procedural Language : ÇÔ¼ö¸¦ ¸¸µå´Â ¾ð¾î
	=> ºñÀýÂ÷Àû ¾ð¾î : ÇÔ¼öÀÌÇØ => °á°ú°ª
	      ---------------- FUNCTION => ³»ÀåÇÔ¼ö / »ç¿ëÀÚ Á¤ÀÇ ÇÔ¼ö : ¸®ÅÏÇü
					=> SELECT¿¡¼­¸¸ »ç¿ëÀÌ °¡´É / WHERE¹®Àå
				    **PROCEDURE => ±â´ÉÀ» ¸¸µç´Ù / ¸®ÅÏÇüÀÌ ¾ø´Ù
					=> SELECT / INSERT / UPDATE / DELETE°¡ °¡´É
					TRIGGER => ¿¬¼â¹ÝÀÀ
							  ÀÚµ¿È­ Ã³¸® (ÀÚ¹Ù¿¡¼­´Â È£ÃâÀÌ ¾ÈµÈ´Ù)
							  µ¥ÀÌÅÍº£ÀÌ½º´Â º¯°æ
							  ÁÁ¾Æ¿ä Å¬¸¯ => ÀÚµ¿À¸·Î ¸ÀÁý¿¡ ÁÁ¾Æ¿ä Áõ°¡
							  ÀÔ°í = Àç°í, Ãâ°í = Àç°í


	=> PL/SQL ¹®¹ý 
		1. º¯¼ö ¼±¾ð
			DECLARE
				º¯¼ö°¡ ¼±¾ð => C¾ð¾î Çü½Ä 
			BEGIN
				SQL ¹®Àå Á¦¾î
				¿¹¿ÜÃ³¸®°¡ °¡´É => ¸Þ¼Òµå¿µ¿ª {}´Â »ç¿ëÇÏÁö ¾Ê´Â´Ù
			END;
			/ 
		2. ±â´É ¼öÇà 
	
		-----------------------------------------------------------
		  º¯¼ö : º¯°æÇÒ ¼ö ÀÖ´Â ÇÑ°³ÀÇ µ¥ÀÌÅÍ¸¦ ÀúÀåÇÏ´Â °ø°£
		 --------
		  1) ½ºÄ®¶óº¯¼ö
			no NUMBER
			name VARCHAR2(20)
			today DATE 
		  ***2) %TYPE
			½ÇÁ¦ Å×ÀÌºí ÄÃ·³ÀÇ µ¥ÀÌÅÍÇüÀ» »ç¿ë
			empno emp.empno%TYPE
			fno food_menupan.fno%TYPE
			     ------------------ -----------
				Å×ÀÌºí¸í. ÄÃ·³ÀÇ µ¥ÀÌÅÍÇüÀ» ÀÐ¾î ¿Í¶ó
		  3) %ROWTYPE (ÇÑ°³ÀÇ Å×ÀÌºí¸¸ ¿¬°á)
			½ÇÁ¦ Å×ÀÌºíÀÇ ÀüÃ¼ ÄÃ·³ µ¥ÀÌÅÍ¸¦ ¸ð¾Æ¼­ °¡Áö°í ¿Â´Ù
			emp emp%ROWTYPE
			----- empno, ename, job, hiredate, mgr, sal, comm, deptno
			------ VO
			»ç¿ë¹ý => emp.ename => VO°´Ã¼
		  4) RECORD => »ç¿ëÀÚ Á¤ÀÇ µ¥ÀÌÅÍÇü (Å×ÀÌºí ¿©·¯°³ ¿¬µ¿)
			TYPE º¯¼ö¸í IS RECORD(
				empno NUMBER,
				ename VARCHAR2(10),
				dname VARCHAR2(10),
				loc VARCHAR2(10)
			)
		 --------------------------------------- rowÇÑ°³¸¸ Á¦¾î
		  ***5) CURSOR => List => ROW ¿©·¯°³¸¦ ¸ð¾Æ¼­ Ã³¸®°¡ °¡´É
			 ---------- for¹®
		 => ÇÔ¼ö (FUNCTION / PROCEDURE / TRIGGER)
		 => VO / DAO / Model (ºê¶ó¿ìÀú·Î µ¥ÀÌÅÍ Àü¼Û)
		      -----------------------
					 ¿äÃ»			SQL
			ºê¶ó¿ìÀú ===== Model ====== DAO
					ÀÀ´ä		    °á°ú°ª
						--------------------------
						 Java / Python / C# / C/C++

			------------------------------------ ÇÑ°³ÀÇ Æ²À» ÀÌ¿ëÇÒ ¼ö ÀÖ°Ô
								    ----------- ¸ÞÀÎº¸µå(½ºÇÁ¸µ
		 => MyBatis / JPA / Spring / Spring-Boot => ¶óÀÌºê·¯¸®
		
		 1. Ãâ·Â 
		    SET SERVEROUTPUT ON => import
		    DBMS_OUTPUT.LINE(Ãâ·Âµ¥ÀÌÅÍ) => System.out.println()

*/

/*
SET SERVEROUTPUT ON
DECLARE
  -- º¯¼ö ¼³Á¤ => ÃÊ±âÈ­ => :=
  name VARCHAR2(50):='È«±æµ¿';
BEGIN
  -- SQL => µ¥ÀÌÅÍ ÀÐ±â / Ãâ·Â
  DBMS_OUTPUT_LINE('ÀÌ¸§:'||name);
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
	
	DBMS_OUTPUT.PUT_LINE('ÀÌ¸§'||pEname);
	DBMS_OUTPUT.PUT_LINE('Á÷À§'||pJob);
	DBMS_OUTPUT.PUT_LINE('±Þ¿©'||pSal);
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
	
	DBMS_OUTPUT.PUT_LINE('»ç¹ø'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('ÀÌ¸§'||pEname);
	DBMS_OUTPUT.PUT_LINE('Á÷À§'||pJob);
	DBMS_OUTPUT.PUT_LINE('ÀÔ»çÀÏ'||pHiredate);
	DBMS_OUTPUT.PUT_LINE('±Þ¿©'||pSal);
END;
/
*/

/*
-- ½ÇÁ¦ Å×ÀÌºíÀÇ ÄÃ·³ µ¥ÀÌÅÍ¸¦ °¡Áö°í ¿À±â (%TYPE)

-- °¡Àå ¸¹ÀÌ »ç¿ëµÇ´Â µ¥ÀÌÅÍÇü %TYPE => °ª´ëÀÔ :=
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
	
	DBMS_OUTPUT.PUT_LINE('»ç¹ø'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('ÀÌ¸§'||pEname);
	DBMS_OUTPUT.PUT_LINE('Á÷À§'||pJob);
	DBMS_OUTPUT.PUT_LINE('ÀÔ»çÀÏ'||pDay);
	DBMS_OUTPUT.PUT_LINE('±Þ¿©'||pSal);
END;
/
*/

/*
-- Å×ÀÌºíÀÇ µ¥ÀÌÅÍÇüÀ» ÇÑ¹ø¿¡ Ã³¸® (¸ðµç ÄÃ·³ÀÇ µ¥ÀÌÅÍÇü ÀÐ±â) : %ROWTYPE
-- Å×ÀÌºí¸í%ROWTYPE => Å×ÀÌºí ÇÑ °³ ¿¬µ¿
DECLARE
	pEmp emp%ROWTYPE; -- EmpVO
BEGIN
	SELECT * INTO pEmp
	FROM emp
	WHERE empno=7788;
-- Ãâ·Â
	DBMS_OUTPUT.PUT_LINE('---------- °á°ú°ª ------------');
	DBMS_OUTPUT.PUT_LINE('»ç¹ø:'||pEmp.empno);
	DBMS_OUTPUT.PUT_LINE('ÀÌ¸§:'||pEmp.ename);
	DBMS_OUTPUT.PUT_LINE('Á÷À§:'||pEmp.job);
	DBMS_OUTPUT.PUT_LINE('»ç¼ö:'||pEmp.mgr);
	DBMS_OUTPUT.PUT_LINE('ÀÔ»çÀÏ:'||pEmp.hiredate);
	DBMS_OUTPUT.PUT_LINE('±Þ¿©:'||pEmp.sal);
	DBMS_OUTPUT.PUT_LINE('¼º°ú±Þ:'||pEmp.comm);
	DBMS_OUTPUT.PUT_LINE('ºÎ¼­¹øÈ£:'||pEmp.deptno);
	END;
/
*/


	
/*
-- dept => deptno / dname / loc => 20¹ø ºÎ¼­ÀÇ Á¤º¸ Ãâ·Â
DECLARE
	pDept dept%ROWTYPE; 
BEGIN
	SELECT * INTO pDept
	FROM dept
	WHERE deptno=20;
-- Ãâ·Â
	DBMS_OUTPUT.PUT_LINE('---------- °á°ú°ª ------------');
	DBMS_OUTPUT.PUT_LINE('ºÎ¼­¹øÈ£:'||pDept.deptno);
	DBMS_OUTPUT.PUT_LINE('ºÎ¼­ÀÌ¸§:'||pDept.dname);
	DBMS_OUTPUT.PUT_LINE('ºÎ¼­À§Ä¡:'||pDept.loc);

	END;
/	
*/
-- Error È®ÀÎ show error
-- Á¶ÀÎ / ¼­ºêÄõ¸® => Å×ÀÌºíÀÌ ¿©·¯°³ »ç¿ë => ½ºÄ®¶óº¯¼ö, %TYPE
-- %ROWTYPE => ÇÑ °³ÀÇ Å×ÀÌºí¸¸ ¿¬°á  (X) => »ç¿ëÀÚ Á¤ÀÇ µ¥ÀÌÅÍÇü RECORD
-- ÇÔ¼ö, ÇÁ·Î½ÃÀú, Æ®¸®°Å => ½ºÄ®¶óº¯¼ö, %TYPE, CURSOR
-- PL => ¹®¹ý => ÇÔ¼ö / ÇÁ·Î½ÃÀú / Æ®¸®°Å => JSP ÇÁ·ÎÁ§Æ®
-- JDBC / À¥ °³¹ß 
-- ÀÚ¹Ù : VO / DAO / Model
-- »ç¿ëÀÚ Á¤ÀÇ µ¥ÀÌÅÍÇü RECORD
/*
	Á¶ÀÎ : ¿©·¯°³ Å×ÀÌºíÀ» ¿¬°áÇØ¼­ ÇÊ¿äÇÑ µ¥ÀÌÅÍ ÃßÃâ 
		 ---------------- ¿øÀÚ°ª, Áßº¹Á¦°Å, ¸ÅÇÎÅ×ÀÌºí
				      ------- Ãë¹Ì : µî»ê, ³¬½Ã, ¿îµ¿
		 »ç¿ëÀÚ	=== ¿¹¾à === ¿µÈ­ 	
		 »ç¿ëÀÚ	=== ±¸¸Å/Àå¹Ù±¸´Ï ===»óÇ°
	----------------------------------------------------------
	INNER JOIN : ±³ÁýÇÕ
	  EQUI_JOIN ==> °°Àº °ªÀ» °¡Áö°í ÀÖ´Â °æ¿ì (=)
	  WHERE emp.deptno=dept.deptno
	  NON_EQUI_JOIN => Æ÷ÇÔµÈ °ªÀ» °¡Áö°í ¿Â´Ù (AND, BETWEEN)
	  WHERE sal BETWEEN losal AND hisal
	  *** Å×ÀÌºí°ú Å×ÀÌºí ¿¬°á
	       -------	    -------
		 |		|
		--------------- °°Àº ÄÃ·³¸íÀÏ °æ¿ì¿¡´Â ±¸ºÐ
				   => Å×ÀÌºí¸í.ÄÃ·³¸í
				   => FROM emp e, dept d=> º°Äª
				   => º°Äª.ÄÃ·³¸í 
	   => ´ÜÁ¡Àº null°ªÀÌ ÀÖ´Â °æ¿ì¿¡´Â Ã³¸® ÇÒ ¼ö ¾ø´Ù
		------------------------------------------------------ º¸¿Ï : Outer JOIN
	   => °ü¸®ÀÚ ÆäÀÌÁö¿¡¼­ ÁÖ·Î »ç¿ë
		 OUTER JOIN : INNER JOIN+null 
		    = LEFT OUTER JOIN
			(ORACLE)
			WHERE emp.deptno=dept.deptno(+)
			(ANSI)
			FROM emp LEFT OUTER JOIN dept
			ON emp.deptno=dept.deptno
		    = RIGHT OUTER JOIN
			(¿À¶óÅ¬)
			WHERE emp.deptno=dept.deptno(+)
			(Ç¥ÁØ)
			FROM emp RIGHT OUTER JOIN dept
			ON emp.deptno=dept.deptno
			-----------------------------------
*/
-- »ç¹ø, ÀÌ¸§, Á÷À§, ÀÔ»çÀÏ, ±Þ¿© (emp), ºÎ¼­¸í, ±Ù¹«Áö (dept), ±Þ¿©µî±Þ(salgrade), ±Þ¿© ¼ø¼­ (RANK)


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
	-- &´Â Scanner => ÀÔ·Â°ªÀ» ¹Þ´Â °æ¿ì¿¡ »ç¿ë
	-- RANK() OVER(ORDER BY sal DESC) => Áý°èÇÔ¼ö (¿©·¯¸í Ãâ·Â½Ã)
	-- Ãâ·Â
	DBMS_OUTPUT.PUT_LINE('---------- °á°ú°ª ------------');
	DBMS_OUTPUT.PUT_LINE('»ç¹ø:'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('ÀÌ¸§:'||pEname);
	DBMS_OUTPUT.PUT_LINE('Á÷À§:'||pJob);
	DBMS_OUTPUT.PUT_LINE('ÀÔ»çÀÏ:'||pDay);
	DBMS_OUTPUT.PUT_LINE('±Þ¿©:'||pSal);
	DBMS_OUTPUT.PUT_LINE('¼º°ú±Þ:'||pDname);
	DBMS_OUTPUT.PUT_LINE('ºÎ¼­À§Ä¡:'||pLoc);
END;
/
*/


/*
-- µ¥ÀÌÅÍÇüÀ» ¸¸µé¾î¼­ Ã³¸®
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
-- RECORDº¯¼ö ¼±¾ð
ed empDEpt;
BEGIN
	SELECT empno,ename,job,hiredate,sal,dname,loc,grade,
		RANK() OVER(ORDER BY sal DESC)
		INTO ed
	FROM emp,dept,salgrade
	WHERE emp.deptno=dept.deptno
	AND sal BETWEEN losal AND hisal
	AND empno=7788;
	-- Ãâ·Â
	DBMS_OUTPUT.PUT_LINE('---------- °á°ú°ª ------------');
	DBMS_OUTPUT.PUT_LINE('»ç¹ø:'||ed.pEmpno);
	DBMS_OUTPUT.PUT_LINE('ÀÌ¸§:'||ed.pEname);
	DBMS_OUTPUT.PUT_LINE('Á÷À§:'||ed.pJob);
	DBMS_OUTPUT.PUT_LINE('ÀÔ»çÀÏ:'||ed.pDay);
	DBMS_OUTPUT.PUT_LINE('±Þ¿©:'||ed.pSal);
	DBMS_OUTPUT.PUT_LINE('¼º°ú±Þ:'||ed.pDname);
	DBMS_OUTPUT.PUT_LINE('ºÎ¼­À§Ä¡:'||ed.pLoc);
END;
/
*/


/*
	½ºÄ®¶óº¯¼ö
	%TYPE
	------------------ ÇÑ¸í¿¡ ´ëÇÑ Á¤º¸ => ÀÏ¹Ýº¯¼ö
	CURSOR => ¸ÖÆ¼ (¿©·¯°³¸¦ µ¿½Ã¿¡ ¹Þ´Â´Ù) => List
	
	Çü½Ä)
		DECLARE
			º¯¼ö ¼³Á¤
		BEGIN
			SELECT¸¦ ÀÌ¿ëÇØ¼­ º¯¼ö°ª ÀúÀå => INTO
			º¯¼ö Ãâ·Â 
		END;
		
	º¯¼ö ¼³Á¤
	¿¬»êÀÚ
	 = »ê¼ú¿¬»êÀÚ ( +, -, *, / ) => +´Â ¼ø¼öÇÏ°Ô »ê¼ú¸¸ Ã³¸®
						  / 0À¸·Î ³ª´­ ¼ö ¾ø´Ù, Á¤¼ö/Á¤¼ö=½Ç¼ö
	 = ºñ±³¿¬»êÀÚ ( =, !=(<>,^=), <, >, <=, >=) => Á¶°Ç¹®
	 = ³í¸®¿¬»êÀÚ (AND, OR)
	 = IN (OR°¡ ¿©·¯°³ÀÎ °æ¿ì)
	 = BETWEEN ~ AND (±â°£, ¹üÀ§)
	 = LIKE => %(¹®ÀÚ °³¼öÁ¦ÇÑÀÌ ¾ø´Ù), _(ÇÑ±ÛÀÚ)
	 = NULL : °ªÀÌ ¾ø´Â »óÅÂ (¿¬»êÃ³¸®°¡ ¾ÈµÈ´Ù)
			IS NULL(nullÀÏ °æ¿ì), IS NOT NULL
	 = NOT : ºÎÁ¤¿¬»êÀÚ => NOT IN, NOT LIKE, NOT BETWEEN
	 => ÀÏ¹Ý SQL¿¡¼­ »ç¿ëÇÏ´Â ¿¬»êÀÚ¿Í µ¿ÀÏ 
	Á¦¾î¹®
	 Á¶°Ç¹®
	  = ´ÜÀÏ Á¶°Ç¹®
		Çü½Ä)
			IF Á¶°Ç¹® THEN => Á¶°ÇÀÌ trueÀÏ¶§¸¸ ¼öÇà
			  Ã³¸®¹®Àå
			END IF;
			=> if(Á¶°Ç¹®)
			     {
			     }
			IF (Á¶°Ç¹®) THEN => Á¶°ÇÀÌ trueÀÏ ¶§¸¸ ¼öÇà
				Ã³¸®¹®Àå
			END IF;
	  = ¼±ÅÃ Á¶°Ç¹® : true / false¸¦ ³ª´²¼­ ÀÛ¾÷
		Çü½Ä)
			IF Á¶°Ç¹® THEN
				Ã³¸®¹®Àå -- trueÀÏ¶§ Ã³¸®ÇÏ´Â ¹®Àå
			ELSE
				Ã³¸®¹®Àå -- falseÀÏ¶§ Ã³¸®ÇÏ´Â ¹®Àå
			END IF;
	
			=> if(Á¶°Ç)
			     {
			     }
			     else
			     {
			     }
			=> sqldeveloper
			
	  = ´ÙÁßÁ¶°Ç¹® : Á¶°Ç¹®ÀÌ ¿©·¯°³Áß¿¡ ÇÑ°³¸¸ ¼öÇà
		Çü½Ä)
			IF Á¶°Ç¹® THEN
				Ã³¸®¹®Àå
				Á¶°Ç : true => Ã³¸®¹®ÀåÀ» ¼öÇà => Á¾·á
				Á¶°Ç : false => ¹Ø¿¡ ÀÖ´Â Á¶°Ç¹®À¸·Î ÀÌµ¿
					|
			ELSIF Á¶°Ç¹® THEN
				Ã³¸®¹®Àå
				Á¶°Ç : true => Ã³¸®¹®ÀåÀ» ¼öÇà => Á¾·á
				Á¶°Ç : false => ¹Ø¿¡ ÀÖ´Â Á¶°Ç¹®À¸·Î ÀÌµ¿
					|
			ELSIF Á¶°Ç¹® THEN
				Ã³¸®¹®Àå
				Á¶°Ç : true => Ã³¸®¹®ÀåÀ» ¼öÇà => Á¾·á
				Á¶°Ç : false => ¹Ø¿¡ ÀÖ´Â Á¶°Ç¹®À¸·Î ÀÌµ¿
					|
			ELSIF Á¶°Ç¹® THEN
				Ã³¸®¹®Àå
				Á¶°Ç : true => Ã³¸®¹®ÀåÀ» ¼öÇà => Á¾·á
				Á¶°Ç : false => ¹Ø¿¡ ÀÖ´Â Á¶°Ç¹®À¸·Î ÀÌµ¿
					|
			ELSE
				Ã³¸®¹®Àå (ÇØ´ç Á¶°ÇÀÌ ¾ø´Â °æ¿ì¿¡ Ã³¸®) = »ý·«ÀÌ °¡´É
			END IF;
	 ¹Ýº¹¹®
	  = BASIC ¹Ýº¹¹® => do~while
	  = WHILE
	  = FOR 
*/
-- ´ÜÀÏ Á¶°Ç¹® IF Á¶°Ç¹® THEN ~ END IF;

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
 -- µû·Î Ã³¸®°¡ µÈ´Ù => ¼Óµµ°¡ ´Ê´Ù



 IF pDeptno=10 THEN
	pDname:='°³¹ßºÎ';
 END IF;
 
 IF pDeptno=20 THEN
	pDname:='¿µ¾÷ºÎ';
 END IF;

  IF (pDeptno)=30 THEN
	pDname:='±âÈ¹ºÎ';
 END IF;

	DBMS_OUTPUT.PUT_LINE('------- °á°ú°ª ---------');
	DBMS_OUTPUT.PUT_LINE('»ç¹ø:'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('ÀÌ¸§:'||pEname);
	DBMS_OUTPUT.PUT_LINE('Á÷À§:'||pJob);
	DBMS_OUTPUT.PUT_LINE('ºÎ¼­:'||pDname);
	-- ÇÔ¼ö : ¸®ÅÏ

END;
/
*/

/*
DECLARE
 pNo NUMBER:=&no;
 pResult VARCHAR2(20);
BEGIN
 IF MOD(pNo, 2)=0 THEN
    DBMS_OUTPUT.PUT_LINE(pNo||'´Â(Àº) Â¦¼öÀÔ´Ï´Ù');
 ELSE
    DBMS_OUTPUT.PUT_LINE(pNo||'´Â(Àº) È¦¼öÀÔ´Ï´Ù');
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
		³»ÀåÇÔ¼ö
		 ¹®ÀÚ (substr, instr, rpad)
		 ¼ýÀÚ (ceil, round)
		 ³¯Â¥ (sysdate, months_between)
		 º¯È¯ (to_char) => MM(¿ù), MI(ºÐ), DY(¿äÀÏ)
		 ±âÅ¸(nvl) => null °ªÀ» ´ëÃ¼

		regexp_like()
		 => Á¤±Ô½Ä
		 => ÇÑ±ÛÀÚ. 
		 => ¿©·¯±ÛÀÚ : *(0ÀÌ»ó), +(1 ÀÌ»ó),
		 => | => ¼±ÅÃ
		 => [°¡-ÆR] : ÇÑ±Û ÀüÃ¼
				^[°¡-ÆR] => ÇÑ±Û·Î ½ÃÀÛ
				[°¡-ÆR]$ => ÇÑ±Û·Î ³¡³­´Ù
		 => [A-Za-z] : ¾ËÆÄºª ÀüÃ¼
		 => [0-9] : ¼ýÀÚ ÀüÃ¼ 
	*/
BEGIN
	SELECT ename, comm, sal, sal+NVL(comm,0)
	INTO pEname, pComm, pSal, pTotal
	FROM emp
	WHERE empno=&empno;
	

	-- comm(NULL°ªÀÌ ¸¹´Ù) => null°ªÀº ¿¬»êÃ³¸®°¡ ¾ÈµÈ´Ù
	-- pComm>0 => null => else¹®ÀåÀ» ¼öÇà
	IF pComm>0 THEN
		DBMS_OUTPUT.PUT_LINE(pEname||'´ÔÀÇ ±Þ¿©´Â'
					||pSal||'ÀÌ°í ¼º°ú±ÞÀº'
					||pComm||'ÀÌ¸ç ÃÑ ±Þ¿©´Â' 
					||pTotal||'ÀÔ´Ï´Ù');

	ELSE
		DBMS_OUTPUT.PUT_LINE(pEname||'´ÔÀÇ ±Þ¿©´Â'
					||pSal||'ÀÌ°í ¼º°ú±ÞÀº'
					||'¾ø°í ÃÑ ±Þ¿©´Â '
					||pTotal||'ÀÔ´Ï´Ù');
	END IF;
END;
/

*/

-- TRIGGER => Ãâ°í / ÀÔ°í = Àç°í
-- ´ÙÁßÁ¶°Ç¹® IF Á¶°Ç¹® THEN ~ ELSIF Á¶°Ç¹® THEN ~ ELSE ~ END IF
DECLARE
 jumsu NUMBER(3):=&jumsu;
 hakjum VARCHAR2(10);
BEGIN
 IF jumsu>=90 THEN
	hakjum:='AÇÐÁ¡';
 ELSIF jumsu >=80 THEN
	hakjum:='BÇÐÁ¡';
 ELSIF jumsu >=70 THEN
	hakjum:='CÇÐÁ¡';
 ELSIF jumsu >=60 THEN
	hakjum:='DÇÐÁ¡';
 ELSE
	hakjum:='FÇÐÁ¡';
 END IF;
	DBMS_OUTPUT.PUT_LINE('ÇÐÁ¡:'||hakjum);
END;
/