-- 235page View

/*
	4장
	 => 내장함수	
	 => 서브쿼리
	 => DDL / DML
	      --------------
	 => SEQUENCE
	 => 권한부여 / 권한해제 => View는 사용자 계정에서 권한이 없다
	 => INDEX
	 --------------------------------------------------------------------------
	 PL/SQL/데이터베이스 설계 / 트랜잭션 => 8장
	 --------------------------------------------------------------------------
	 DDL / DML / SEQUENCE

	 DDL (데이터 정의 언어)
	 | CREATE / ALTER / DROP / TRUNCATE / RENAME
	   ---------
		CREATE TABLE => 데이터 저장공간 (파일) 
		CREATE VIEW => 테이블을 참조 가상 테이블 제작
		CREATE SEQUENCE => 자동 증가번호
		CREATE INDEX => ROW => ID => 검색 속도 최적화
		CREATE FUNCTION => 내장함수 => 사용자 정의 함수
		CREATE PROCEDURE => 기능 처리 => ERP
		CREATE TRIGGER => 자동 이벤트
	---------------------------------------------------------------------------
	ALTER => 수정 (컬럼/제약조건)
	------- 추가 => ADD
		  수정 => MODIFY
		 삭제 => DROP COLUMN
		 *** 제약조건 추가
		      ---------------- NOT NULL, DEFAULT => MODIFY
		      ---------------- PRIMARY KEY,  FOREIGN KEY, CHECK, UNIQUE
					  ------------------------------------------------------ ADD
		DROP => CREATE로 생성한 개체 => DROP으로 삭제
			       DROP TABLE / DROP VIEW / DROP SEQUENCE ...
		TRUNCATE => 테이블 구조는 유지 => 데이터만 삭제
					TRUNCATE TABLE table_name
		RENAME => 이름 변경
					RENAME old_name TO new_name
					=> 데이터가 존재해도 사용 가능
		*** 정보 검색
		     ----------- 오라클에 저장
		     1) table => user_tables
		     2) sequence => user_sequence / all_sequences
		     3) view => user_views
		     4) 제약조건 => user_constraints
		SQL
		-----
			DQL / DML / TCL / DDL / DCL
			--------------------   ------------
			| 웹 개발자		    | DBA
			  -----------		     ------
						    | GRANT / REVOKE
			  | SELECT / INSERT / UPDATE / DELETE / COMMIT / ROLLBACK
			  
			INSERT 형식
			 => INSERT INTO table_name VALUES(값.....)
						 -------------- 컬럼의 모든 값을 설정
						 -------------- CREATE에서 설정된 컬럼 순서
						 -------------- DESC table_name
						 -------------- DEFAULT설정은 적용이 안됨
			=> 원하는 데이터만 첨부 / DEFAULT 적용됨
			     --------------------------- NOT NULL, PRIMARY KEY, FOREIGN
								CHECK, UNIQUE => 반드시 값을 첨부
			     --------------------------- NULL값 허용한 컬럼은 생략이 가능
			     INSERT INTO table_name(컬럼명, 컬럼명...)
			     VALUES(값,값...) => 순서 
			     => 컬럼은 순서가 없다
			     *** 문자 / 날짜 => '' => 'YY/MM/DD'
			     *** SYSDATE는 "를 사용하면 안된다
			     *** 반드시 COMMIT을 사용해야 된다 (정상적 저장)
					   ------------ 오라클에서는 사용 / 자바 AutoCommit
			UPDATE 형식 : 수정
			     UPDATE table_name SET
			     컬럼=값, 컬럼=값....	(= 대입연산자)
			     ** UPDATE는 대입연산자 / WEHRE 뒤에 = (같다)
			     [WHERE 조건문]
			     ------------------- 없는 경우 => 전체 적용
				*** 반드시 COMMIT수행 
			DELETE 형식 : 삭제 ==> ROW => 한줄 전체 삭제
				DELETE FROM table_name
				[WHERE 조건문]
				*** 반드시 COMMIT수행

			1) 사용처
			    회원가입 => INSERT
			    회원수정 => SELECT / UPDATE
			    회원 탈퇴 => DELETE
			    회원 정보 보기 => SELECT
			    ------------------------------------
				예약하기 => INSERT	
				예약취소 => DELETE
				예약수정 => UPDATE
				예약내용 => SELECT
			    -------------------------------------
				상품보기 => SELECT
				장바구니/구매 => INSERT
				장바구니보기 / 구매내역보기 => SELECT
				장바구니/구매취소 => DELETE
				수량변경 => UPDATE
		
			=> 자동 증가번호 : SEQUENCE
			     ----------------
			     | 중복없는 데이터 => 삭제/수정시에 원하는 데이터를 변경
			     				   ----------- 이상현상 => 방지 : 기본키
			     | 모든 테이블은 기본키 1개 이상이 필요
				-------------------------------------------
			     | 숫자 저장 => 자동으로 증가 / ID예외 
				=> 게시물번호 / 맛집번호 / 영화번호 / 댓글번호 / 회원번호 ...
			     | 데이터가 삭제가 되면 복구안된다 => MAX()+1
				
			     SEQUENCE 
				=> CREATE SEQUENCE seq_name
								 ------------ 
						START WITH => 시작번호 1
						INCREMENT BY  => 증가번호 1
						----------------------------------- 무한대
						MAXVALUE => 최종값
						MINVALUE => 최하값
						---------------------------
						CYCLE|NOCYCLE => 1~10 => 10에 도달하면 1로 복귀
						--------------------------- NOCYCLE
						CACHE|NOCACHE
						--------------------------- 증가값을 20개 정도 저장
					user_sequences : 중복이름을 사용할 수 없다
					=> tableName_컬럼명_seq
					=> 이름은 반드시 대문자
					=> 현재 / 다음
						seq명.currval / seq명.nextval
					=> 삭제 / 초기화 => DROP SEQUENCE seq명
				
*/