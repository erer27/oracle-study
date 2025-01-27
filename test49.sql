--5장 => PL/SQL (데이터베이스 관리자)

/*
	데이터베이스 : CRUD => SELECT / INSERT / UPDATE / DELETE
	=> 자바 / 오라클 => 흐름 파악 (모방=> 약간 수정) 
	-----------------------------------------------------------
	=> 1 Part : 공통으로 들어가는 댓글 (맛집 + 여행)
							 ---------------- 캠핑장예약 + 레시피
							  영화 + OST => 캡처본 
	PL / SQL => 279page
	----------- 장점 : 보안, 재사용 (함수)
	----------- 단점 : 웹개발자가 이해하기 어렵다 (가독성이 떨어진다)
			=> SQL => SELECT name, pwd, email...
			=> getData() => SQL문장이 보이지 않는다
			=> 매뉴얼 => 오버라이딩 (소스를 알고 있다)
	=> Procedural Language : 함수를 만드는 언어
	=> 비절차적 언어 : 함수이해 => 결과값
	      ---------------- FUNCTION => 내장함수 / 사용자 정의 함수 : 리턴형
					=> SELECT에서만 사용이 가능 / WHERE문장
				    **PROCEDURE => 기능을 만든다 / 리턴형이 없다
					=> SELECT / INSERT / UPDATE / DELETE가 가능
					TRIGGER => 연쇄반응
							  자동화 처리 (자바에서는 호출이 안된다)
							  데이터베이스는 변경
							  좋아요 클릭 => 자동으로 맛집에 좋아요 증가
							  입고 = 재고, 출고 = 재고


	=> PL/SQL 문법 
		1. 변수 선언
			DECLARE
				변수가 선언 => C언어 형식 
			BEGIN
				SQL 문장 제어
				예외처리가 가능 => 메소드영역 {}는 사용하지 않는다
			END;
			/ 
		2. 기능 수행 
	
		-----------------------------------------------------------
		  변수 : 변경할 수 있는 한개의 데이터를 저장하는 공간
		 --------
		  1) 스칼라변수
			no NUMBER
			name VARCHAR2(20)
			today DATE 
		  ***2) %TYPE
			실제 테이블 컬럼의 데이터형을 사용
			empno emp.empno%TYPE
			fno food_menupan.fno%TYPE
			     ------------------ -----------
				테이블명. 컬럼의 데이터형을 읽어 와라
		  3) %ROWTYPE (한개의 테이블만 연결)
			실제 테이블의 전체 컬럼 데이터를 모아서 가지고 온다
			emp emp%ROWTYPE
			----- empno, ename, job, hiredate, mgr, sal, comm, deptno
			------ VO
			사용법 => emp.ename => VO객체
		  4) RECORD => 사용자 정의 데이터형 (테이블 여러개 연동)
			TYPE 변수명 IS RECORD(
				empno NUMBER,
				ename VARCHAR2(10),
				dname VARCHAR2(10),
				loc VARCHAR2(10)
			)
		 --------------------------------------- row한개만 제어
		  ***5) CURSOR => List => ROW 여러개를 모아서 처리가 가능
			 ---------- for문
		 => 함수 (FUNCTION / PROCEDURE / TRIGGER)
		 => VO / DAO / Model (브라우저로 데이터 전송)
		      -----------------------
					 요청			SQL
			브라우저 ===== Model ====== DAO
					응답		    결과값
						--------------------------
						 Java / Python / C# / C/C++

			------------------------------------ 한개의 틀을 이용할 수 있게
								    ----------- 메인보드(스프링
		 => MyBatis / JPA / Spring / Spring-Boot => 라이브러리
		
		 1. 출력 
		    SET SERVEROUTPUT ON => import
		    DBMS_OUTPUT.LINE(출력데이터) => System.out.println()

*/

/*
SET SERVEROUTPUT ON
DECLARE
  -- 변수 설정 => 초기화 => :=
  name VARCHAR2(50):='홍길동';
BEGIN
  -- SQL => 데이터 읽기 / 출력
  DBMS_OUTPUT_LINE('이름:'||name);
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
	
	DBMS_OUTPUT.PUT_LINE('이름'||pEname);
	DBMS_OUTPUT.PUT_LINE('직위'||pJob);
	DBMS_OUTPUT.PUT_LINE('급여'||pSal);
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
	
	DBMS_OUTPUT.PUT_LINE('사번'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('이름'||pEname);
	DBMS_OUTPUT.PUT_LINE('직위'||pJob);
	DBMS_OUTPUT.PUT_LINE('입사일'||pHiredate);
	DBMS_OUTPUT.PUT_LINE('급여'||pSal);
END;
/
*/

/*
-- 실제 테이블의 컬럼 데이터를 가지고 오기 (%TYPE)

-- 가장 많이 사용되는 데이터형 %TYPE => 값대입 :=
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
	
	DBMS_OUTPUT.PUT_LINE('사번'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('이름'||pEname);
	DBMS_OUTPUT.PUT_LINE('직위'||pJob);
	DBMS_OUTPUT.PUT_LINE('입사일'||pDay);
	DBMS_OUTPUT.PUT_LINE('급여'||pSal);
END;
/
*/

/*
-- 테이블의 데이터형을 한번에 처리 (모든 컬럼의 데이터형 읽기) : %ROWTYPE
-- 테이블명%ROWTYPE => 테이블 한 개 연동
DECLARE
	pEmp emp%ROWTYPE; -- EmpVO
BEGIN
	SELECT * INTO pEmp
	FROM emp
	WHERE empno=7788;
-- 출력
	DBMS_OUTPUT.PUT_LINE('---------- 결과값 ------------');
	DBMS_OUTPUT.PUT_LINE('사번:'||pEmp.empno);
	DBMS_OUTPUT.PUT_LINE('이름:'||pEmp.ename);
	DBMS_OUTPUT.PUT_LINE('직위:'||pEmp.job);
	DBMS_OUTPUT.PUT_LINE('사수:'||pEmp.mgr);
	DBMS_OUTPUT.PUT_LINE('입사일:'||pEmp.hiredate);
	DBMS_OUTPUT.PUT_LINE('급여:'||pEmp.sal);
	DBMS_OUTPUT.PUT_LINE('성과급:'||pEmp.comm);
	DBMS_OUTPUT.PUT_LINE('부서번호:'||pEmp.deptno);
	END;
/
*/


	
/*
-- dept => deptno / dname / loc => 20번 부서의 정보 출력
DECLARE
	pDept dept%ROWTYPE; 
BEGIN
	SELECT * INTO pDept
	FROM dept
	WHERE deptno=20;
-- 출력
	DBMS_OUTPUT.PUT_LINE('---------- 결과값 ------------');
	DBMS_OUTPUT.PUT_LINE('부서번호:'||pDept.deptno);
	DBMS_OUTPUT.PUT_LINE('부서이름:'||pDept.dname);
	DBMS_OUTPUT.PUT_LINE('부서위치:'||pDept.loc);

	END;
/	
*/
-- Error 확인 show error
-- 조인 / 서브쿼리 => 테이블이 여러개 사용 => 스칼라변수, %TYPE
-- %ROWTYPE => 한 개의 테이블만 연결  (X) => 사용자 정의 데이터형 RECORD
-- 함수, 프로시저, 트리거 => 스칼라변수, %TYPE, CURSOR
-- PL => 문법 => 함수 / 프로시저 / 트리거 => JSP 프로젝트
-- JDBC / 웹 개발 
-- 자바 : VO / DAO / Model
-- 사용자 정의 데이터형 RECORD
/*
	조인 : 여러개 테이블을 연결해서 필요한 데이터 추출 
		 ---------------- 원자값, 중복제거, 매핑테이블
				      ------- 취미 : 등산, 낚시, 운동
		 사용자	=== 예약 === 영화 	
		 사용자	=== 구매/장바구니 ===상품
	----------------------------------------------------------
	INNER JOIN : 교집합
	  EQUI_JOIN ==> 같은 값을 가지고 있는 경우 (=)
	  WHERE emp.deptno=dept.deptno
	  NON_EQUI_JOIN => 포함된 값을 가지고 온다 (AND, BETWEEN)
	  WHERE sal BETWEEN losal AND hisal
	  *** 테이블과 테이블 연결
	       -------	    -------
		 |		|
		--------------- 같은 컬럼명일 경우에는 구분
				   => 테이블명.컬럼명
				   => FROM emp e, dept d=> 별칭
				   => 별칭.컬럼명 
	   => 단점은 null값이 있는 경우에는 처리 할 수 없다
		------------------------------------------------------ 보완 : Outer JOIN
	   => 관리자 페이지에서 주로 사용
		 OUTER JOIN : INNER JOIN+null 
		    = LEFT OUTER JOIN
			(ORACLE)
			WHERE emp.deptno=dept.deptno(+)
			(ANSI)
			FROM emp LEFT OUTER JOIN dept
			ON emp.deptno=dept.deptno
		    = RIGHT OUTER JOIN
			(오라클)
			WHERE emp.deptno=dept.deptno(+)
			(표준)
			FROM emp RIGHT OUTER JOIN dept
			ON emp.deptno=dept.deptno
			-----------------------------------
*/
-- 사번, 이름, 직위, 입사일, 급여 (emp), 부서명, 근무지 (dept), 급여등급(salgrade), 급여 순서 (RANK)


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
	-- &는 Scanner => 입력값을 받는 경우에 사용
	-- RANK() OVER(ORDER BY sal DESC) => 집계함수 (여러명 출력시)
	-- 출력
	DBMS_OUTPUT.PUT_LINE('---------- 결과값 ------------');
	DBMS_OUTPUT.PUT_LINE('사번:'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('이름:'||pEname);
	DBMS_OUTPUT.PUT_LINE('직위:'||pJob);
	DBMS_OUTPUT.PUT_LINE('입사일:'||pDay);
	DBMS_OUTPUT.PUT_LINE('급여:'||pSal);
	DBMS_OUTPUT.PUT_LINE('성과급:'||pDname);
	DBMS_OUTPUT.PUT_LINE('부서위치:'||pLoc);
END;
/
*/


/*
-- 데이터형을 만들어서 처리
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
-- RECORD변수 선언
ed empDEpt;
BEGIN
	SELECT empno,ename,job,hiredate,sal,dname,loc,grade,
		RANK() OVER(ORDER BY sal DESC)
		INTO ed
	FROM emp,dept,salgrade
	WHERE emp.deptno=dept.deptno
	AND sal BETWEEN losal AND hisal
	AND empno=7788;
	-- 출력
	DBMS_OUTPUT.PUT_LINE('---------- 결과값 ------------');
	DBMS_OUTPUT.PUT_LINE('사번:'||ed.pEmpno);
	DBMS_OUTPUT.PUT_LINE('이름:'||ed.pEname);
	DBMS_OUTPUT.PUT_LINE('직위:'||ed.pJob);
	DBMS_OUTPUT.PUT_LINE('입사일:'||ed.pDay);
	DBMS_OUTPUT.PUT_LINE('급여:'||ed.pSal);
	DBMS_OUTPUT.PUT_LINE('성과급:'||ed.pDname);
	DBMS_OUTPUT.PUT_LINE('부서위치:'||ed.pLoc);
END;
/
*/


/*
	스칼라변수
	%TYPE
	------------------ 한명에 대한 정보 => 일반변수
	CURSOR => 멀티 (여러개를 동시에 받는다) => List
	
	형식)
		DECLARE
			변수 설정
		BEGIN
			SELECT를 이용해서 변수값 저장 => INTO
			변수 출력 
		END;
		
	변수 설정
	연산자
	 = 산술연산자 ( +, -, *, / ) => +는 순수하게 산술만 처리
						  / 0으로 나눌 수 없다, 정수/정수=실수
	 = 비교연산자 ( =, !=(<>,^=), <, >, <=, >=) => 조건문
	 = 논리연산자 (AND, OR)
	 = IN (OR가 여러개인 경우)
	 = BETWEEN ~ AND (기간, 범위)
	 = LIKE => %(문자 개수제한이 없다), _(한글자)
	 = NULL : 값이 없는 상태 (연산처리가 안된다)
			IS NULL(null일 경우), IS NOT NULL
	 = NOT : 부정연산자 => NOT IN, NOT LIKE, NOT BETWEEN
	 => 일반 SQL에서 사용하는 연산자와 동일 
	제어문
	 조건문
	  = 단일 조건문
		형식)
			IF 조건문 THEN => 조건이 true일때만 수행
			  처리문장
			END IF;
			=> if(조건문)
			     {
			     }
			IF (조건문) THEN => 조건이 true일 때만 수행
				처리문장
			END IF;
	  = 선택 조건문 : true / false를 나눠서 작업
		형식)
			IF 조건문 THEN
				처리문장 -- true일때 처리하는 문장
			ELSE
				처리문장 -- false일때 처리하는 문장
			END IF;
	
			=> if(조건)
			     {
			     }
			     else
			     {
			     }
			=> sqldeveloper
			
	  = 다중조건문 : 조건문이 여러개중에 한개만 수행
		형식)
			IF 조건문 THEN
				처리문장
				조건 : true => 처리문장을 수행 => 종료
				조건 : false => 밑에 있는 조건문으로 이동
					|
			ELSIF 조건문 THEN
				처리문장
				조건 : true => 처리문장을 수행 => 종료
				조건 : false => 밑에 있는 조건문으로 이동
					|
			ELSIF 조건문 THEN
				처리문장
				조건 : true => 처리문장을 수행 => 종료
				조건 : false => 밑에 있는 조건문으로 이동
					|
			ELSIF 조건문 THEN
				처리문장
				조건 : true => 처리문장을 수행 => 종료
				조건 : false => 밑에 있는 조건문으로 이동
					|
			ELSE
				처리문장 (해당 조건이 없는 경우에 처리) = 생략이 가능
			END IF;
	 반복문
	  = BASIC 반복문 => do~while
	  = WHILE
	  = FOR 
*/
-- 단일 조건문 IF 조건문 THEN ~ END IF;

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
 -- 따로 처리가 된다 => 속도가 늦다



 IF pDeptno=10 THEN
	pDname:='개발부';
 END IF;
 
 IF pDeptno=20 THEN
	pDname:='영업부';
 END IF;

  IF (pDeptno)=30 THEN
	pDname:='기획부';
 END IF;

	DBMS_OUTPUT.PUT_LINE('------- 결과값 ---------');
	DBMS_OUTPUT.PUT_LINE('사번:'||pEmpno);
	DBMS_OUTPUT.PUT_LINE('이름:'||pEname);
	DBMS_OUTPUT.PUT_LINE('직위:'||pJob);
	DBMS_OUTPUT.PUT_LINE('부서:'||pDname);
	-- 함수 : 리턴

END;
/
*/

/*
DECLARE
 pNo NUMBER:=&no;
 pResult VARCHAR2(20);
BEGIN
 IF MOD(pNo, 2)=0 THEN
    DBMS_OUTPUT.PUT_LINE(pNo||'는(은) 짝수입니다');
 ELSE
    DBMS_OUTPUT.PUT_LINE(pNo||'는(은) 홀수입니다');
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
		내장함수
		 문자 (substr, instr, rpad)
		 숫자 (ceil, round)
		 날짜 (sysdate, months_between)
		 변환 (to_char) => MM(월), MI(분), DY(요일)
		 기타(nvl) => null 값을 대체

		regexp_like()
		 => 정규식
		 => 한글자. 
		 => 여러글자 : *(0이상), +(1 이상),
		 => | => 선택
		 => [가-힣] : 한글 전체
				^[가-힣] => 한글로 시작
				[가-힣]$ => 한글로 끝난다
		 => [A-Za-z] : 알파벳 전체
		 => [0-9] : 숫자 전체 
	*/
BEGIN
	SELECT ename, comm, sal, sal+NVL(comm,0)
	INTO pEname, pComm, pSal, pTotal
	FROM emp
	WHERE empno=&empno;
	

	-- comm(NULL값이 많다) => null값은 연산처리가 안된다
	-- pComm>0 => null => else문장을 수행
	IF pComm>0 THEN
		DBMS_OUTPUT.PUT_LINE(pEname||'님의 급여는'
					||pSal||'이고 성과급은'
					||pComm||'이며 총 급여는' 
					||pTotal||'입니다');

	ELSE
		DBMS_OUTPUT.PUT_LINE(pEname||'님의 급여는'
					||pSal||'이고 성과급은'
					||'없고 총 급여는 '
					||pTotal||'입니다');
	END IF;
END;
/

*/

-- TRIGGER => 출고 / 입고 = 재고
-- 다중조건문 IF 조건문 THEN ~ ELSIF 조건문 THEN ~ ELSE ~ END IF
DECLARE
 jumsu NUMBER(3):=&jumsu;
 hakjum VARCHAR2(10);
BEGIN
 IF jumsu>=90 THEN
	hakjum:='A학점';
 ELSIF jumsu >=80 THEN
	hakjum:='B학점';
 ELSIF jumsu >=70 THEN
	hakjum:='C학점';
 ELSIF jumsu >=60 THEN
	hakjum:='D학점';
 ELSE
	hakjum:='F학점';
 END IF;
	DBMS_OUTPUT.PUT_LINE('학점:'||hakjum);
END;
/