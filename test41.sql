-- 235page 뷰
/*
	뷰(view) : 
		사용자 계정에서 뷰를 생성할 권한이 없다(system계정 => 권한 부여)
		------------------------------------------------
			권한을 부여하는 계정 : 관리자 계정 (system / sysdba)
			hr : 사용자 계정
			1) system으로 연결
				conn system/happy
			2) 권한 부여
				grant create view to hr
				--------------------
				create function / create procedure .....
				권한 해제	
				revoke create view from hr

		다른 테이블을 참조해서 새롭게 만들어지는 가상 테이블
		=> 장점 : 보안 (뷰에 저장되는 것은 데이터가 저장되는 것이 아니다. SELECT 문장이 저장된다)
		=> 복잡한 SQL문장이 있는 경우에 주로 사용 / 소스가 간결해진다
		=> 일반 테이블과 동일하게 사용 
			FROM table_name|(SELECT~)|view_name
		=> 주의점 : INSERT / UPDATE / DELETE => view에 저장되는 것이 아니라 참조하는 테이블에 저장
		=> 반드시 table이 필요하다
			=> 데이터를 모아서 재사용하는 방법
	1. 뷰 종류
		1) 단순뷰 : 한 개의 테이블을 참조 => 테이블을 사용하는 것이 편리
				사용빈도는 거의 없다
		2) 복합뷰 : 두개이상의 테이블을 참조
				=> 조인 / 서브쿼리 	
		3) 인라인뷰 : SELECT => 새로운 가상 테이블 처리
				 => 페이징기법
	2. 뷰 옵션 => 보여주는 문장 (DML을 적용)
		1) WITH CHECK OPTION => INSERT / UPDATE / DELETE 가능
			= DEFAULT 
		2) WITH READ ONLY : DML이 불가능 => SELECT만 가능
		*** 뷰에 DML을 사용하면 table에 영향을 미친다
	3. 뷰 형식 
		생성 방법
		 CREATE VIEW view_name
		 AS
		  SELECT * FROM emp; => emp/dept => 조인

		=> 수정 => 삭제후에 다시 제작
		=> 생성과 동시에 수정이 가능하게 만드는 방법
		CREATE OR REPLACE VIEW view_name
		AS 
			SELECT~
		=> 삭제없이 수정이 가능
	4. 사용법 : 자바에서 JDBC시 주로 사용 => SQL문장이 복잡한 경우에 뷰를 이용해서 사용
	5. 삭제 
		DROP VIEW view_name
	6. 뷰확인 
	    SELECT * FROM user_views
	    WHERE view_name='대문자'; => SELECT 문장

*/
-- 단순뷰
-- 1. 테이블 복사
/*
CREATE TABLE myEmp
AS 
	SELECT empno, ename, hiredate, job, sal
	FROM emp;


CREATE VIEW myEmp_view
	as SELECT * FROM myEmp;
*/
-- 사용법
--SELECT * FROM myEmp_view;
-- view에 추가되는 것이 아니라 => 참조하는 테이블에 추가
--INSERT INTO myEmp_view VALUES(8000,'홍길동','24/01/01','부장',4500);
--COMMIT;
--DELETE FROM myEmp_view;
-- COMMIT전에 ROLLBACK => 원래 복귀
-- COMIT을 사용하면 ROLLBACK은 적용이 안된다
--SELECT text FROM user_views
--WHERE view_name='MYEMP_VIEW';

-- 읽기 전용 => SELECT사용이 가능
--CREATE VIEW myEmp_view
--AS
	--SELECT * FROM myEmp WITH READ ONLY;

INSERT INTO myEmp_view VALUES(8000,'홍길동','24/01/01','부장',4500);