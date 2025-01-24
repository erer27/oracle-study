-- 전체 정리 (오라클 => 형식)
/*
	1) SQL
	    1. DQL : 데이터를 검색 => 자바에서 데이터 읽어 오기
		SELECT * | column_list
		FROM table_name | view_name | (SELECT ~)
		[
			WHERE 조건문 (컬럼명|함수명 연산자 값)
						ename='KING';
						TO_CHAR(hiredate,'YY')=80
			GROUP BY 그룹컬럼|함수
			HAVING 집계함수 연산자 값
			ORDER BY 컬럼|함수 ASC|DESC
			------------ 수정, 삭제, 추가가 많은 경우
		]
		*** 별칭 / 중복없는 데이터 검색
			     ---- DISTINCT 컬럼 => 장르 / 메뉴 ... 
		    ------ 컬럼명 "별칭", 컬럼명 as 별칭명
		    ------ 테이블명 별칭 => FROM emp
		    ------ 함수이용 / 서브쿼리
		    SELECT empno, ename, NVL(comm,0) as comm
		    FROM emp
		    => rs.getInt(1), rs.getString(2), rs.getInt(3) => JDBC가능
		    => MyBatis --> JSP / Spring / 실무
			 rs.getInt("empnp"), rs.getString("ename")
			 rs.getInt("NVL(comm,0)") => 오류 발생 rs.getInt("comm")
		    => DAO / VO / Model => 2차 자바
					   | 브라우저 연동
			| 오라클 연동
			out.write("100|id|sex|name")
		     => 문자 / 날짜 => '' => ""는 인용할 때 사용
		    ------------------------------------------------------
			상품목록 / 상세보기 / 검색결과
	    2. DML
		데이터 변경 (데이터 조작)
		= INSERT : 데이터 추가 => 회원가입 , 글쓰기, 댓글쓰기
		   INSERT INTO table_name(컬럼....) VALUES(값...)
						     ---------- default 제외, null값을 제외
		   INSERT INTO table_naem VALUES(값...)
			=> 모든 컬럼값을 추가
		   => 제외시에 PK,NN,FK,CK => * 필수입력
		= UPDATE : 데이터 수정 => 회원수정, 장바구니, 예약수정, 조회수 증가
		   UPDATE table_name SET
		   컬럼=값, 컬럼=값....
		   [WHERE 조건문]
		   => 자바 (autocommit)
		= DELETE : 데이터 삭제 => 예약 취소, 회원 탈퇴, 장바구니 취소
		   DELETE FROM table_name
		   [WHERE 조건문]
		--------------------- 웹 개발자가 주로 사용
			=> 사용자 요청 => SQL문장을 이용해서 데이터를 관리

	    3. DDL : 정의 언어
		1) 데이터형
			문자열 저장
			  CHAR(1~2000byte) => 같은 글자수를 저장할 때 주로 사용
							  남자/여자, y/n => 고정 바이트
			  VARCHAR2(1~4000byte) : 주로 문자열의 디폴트
			  				     => 가변 바이트
			  CLOB : 4기가 => 가변바이트 
			 ------------------------------ 자바에서는 String으로 값을 받는다
			숫자 저장 : NUMBER => NUMBER(8,2)
				   평점 : NUMBER(2,1), 점수 NUMBER(3)
				  => 저장된 데이터
					실수 / 정수
						=> int
					=> double
			날짜 저장 : 날짜 / 시간
				DATE => java.util.Date
		2) 제약조건 => 데이터베이스 설계
		   ----------- 프로그램에서 필요한 데이터만 저장 ( 정형화된 데이터)
			=> NOT NULL : 반드시 입력값이 필요하다
			=> UNIQUE : null값은 허용, 데이터는 중복이 없다
					   => ID찾기 (후보키) => email/phone
			=> NOT NULL + UNIQUE => PRIMARY KEY
					   => 데이터 무결성
					   => 원하지 않는 데이터의 수정, 삭제 문제 해결
					   => 반드시 테이블에는 한개의 PRIMARY를 사용
			=> 참조키 : FOREIGN KEY : 다른 테이블의 컬럼값을 참조
					=> 조인
			=> CHECK : 지정된 값만 저장
			=> DEFAULT : 사용자 입력이 없는 경우에 자동 값 주입
		3) 형식
		    ***Table : 데이터 저장 장소 
			=> DESC table_name => 컬럼 확인
			=> SELECT * FROM tab => 테이블명 확인 
			=> 테이블에 대한 자세한 정보
			     SELECT * FROM user_tables
			     FROM table_name='테이블명 대문자'
			생성)
				CREATE TABLE table_name(
					컬럼명 데이터형 [제약조건], => NOT NULL, DEFAULT
					컬럼명 데이터형 [제약조건],
					컬럼명 데이터형 [제약조건],
					[제약조건], => PK, FK, CK, UK
					[제약조건]
				)
				제약조건 : 수정 / 삭제 => 반드시 제약조건 이름 부여
								    -------------------------------
								    권장
				CONSTRAINT 테이블명_컬럼명_pk PRIMARY KEY(컬럼명)
				CONSTRAINT 테이블명_컬럼명_uk UNIQUE(컬럼명)
				CONSTRAINT 테이블명_컬럼명_fk FOREIGN KEY(컬럼명)
				REFERENCES 참조테이블(참조컬럼)
				CONSTRAINT 테이블명_컬럼명_ck CHECK(컬럼명 IN(","..))
				-------------------------------------------------------
				CONSTRAINT 테이블명_컬럼명_nn NOT NULL
				컬럼명 데이터형 DEFAULT 값
				----------------------------- 컬럼명 뒤에 설정
		    ***View : 한개이상의 테이블을 참조해서
				새로운 가상테이블을 생성
				=> 참조할 테이블이 존재할 때만 가능
				=> 보안 / SQL문장을 간결하게 만드는 경우
				=> 기존의 테이블을 재사용
			CREATE [OR REPLACE] VIEW view_name
			AS
				SELECT ~
				FROM table_name,table_name --- 복합뷰
				WITH READ ONLY		  ------------
									   1. 조인 2. 서브쿼리
			=> 뷰에는 SQL(SELECT문장이 저장)
			=> SELECT text FROM user_views
				FROM view_name='대문자'
			** 제약조건
				SELECT * FROM user_constraints
				FROM table_name='대문자'

			=> SELECT ~~
				FROM (SELECT ~~) ---인라인뷰 : 페이지, ROWNUM
				*** 가장 많이 등장
		    ***Sequnce : 자동 증가 번호
			CREATE SEQUENCE seq명
				START WITH 시작번호 => 초기화 => int i=1
				INCREMENT BY 증가값 => i++
				NOCACHE : 기본으로 20개 메모리에 저장 => 저장없이
				NOCYCLE => 다시 돌아오지 않게 
						   1~10 => 10까지 발생 => 1로 다시 돌아온다
				MAXVALUE를 지정하지 않는 경우 => 무한대
		    ***Index : 검색 속도 향상 
			=> PK / UK => 자동으로 생성
			=> 사용자 정의
				CREATE INDEX index명 ON table_name(컬럼)
					=> table_name(컬럼) => ASC는 생략이 가능
					=> table_name(컬럼 DESC)
					=> table_name(컬럼 ASC,컬럼 DESC)
			=> 데이터가 많은 경우	
			=> 검색어로 사용하는 컬럼이 있는 경우
			=> NULL값이 많은 경우 
			=> 수정 / 삭제 / 추가가 많은 경우 rebuild => 속도가 저하
			=> 크롤링된 데이터는 인덱스를 이용하면 좋다 
			
			=> 정렬
				힌트 => /*+ INDEX_ASC(테이블명, pk)
					    /*+ INDEX_DESC(테이블명, pk)
					    /*+ INDEX(테이블명 인덱스명)
		    Function
		    Procedure
		    Trigger

	    4. TCL => 일괄처리
		정상 저장 : COMMIT
		비정상 : ROLLBACK => 모든 SQL문장 취소
	    5. DCL
		GRANT : 권한 부여
		  GRANT CREATE TABLE TO 계정
			    ------------------
			    CREATE VIEW
			    CREATE SEQUENCE
			    CREATE FUNCTION
			    CREATE PROCEDURE 
		REVOKE : 권한 해제
		 REVOKE CREATE TABLE FROM 계정
		---------- 오후 : input => servlet : 게시판
	    ** 조인 / 서브쿼리
	   => 5장 : 프로그램
			데이터베이스 프로그램 : PL/SQL => FUNCTION, Procedure,Trigger
			자바 연동 프로그램 : JDBC
			웹 연동 프로그램 : JSP/SERVLET
	   => 자바에서 오라클 제어 => 5장
		------------------------ JDBC => ojdbc8.jar
		1. 드라이버 등록
		   Class.forName("oracle.jdbc.driver.OracleDriver")
				 	-----------------------------------
					com.mysql.jdbc.cj.Driver => MYSQL/MARIADB
					=> mvnrepository.com => 공유 라이브러리
		2. 연결
		   Connection conn=DriverManager.getConnection(
			오라클 주소, 계정명, 비밀번호
		   )
		   오라클 주소 : jdbc: 업체명:드라이버종류:@IP:PORT:데이터베이스명
				jdbc:oracle:thin:@ip:1521:xe
				jdbc:mysql:@ip:3306:mydb
		3. SQL문장을 전송
		   PreparedStatement / CallableStatement : 프로시저 호출
		   ps=conn.preparedStatement(sql문장)
		   결과값
		    ResultSet rs=ps.executeQuery() => SELECT만 사용
		    ps.excuteUpdate() => 데이터만 변경
						   INSERT / UPDATE / DELETE
						   => commit 수행
		4. 닫기 
		   ResultSet 닫기
		   PreparedStatement 닫기
		   Connection 닫기

		=> JDBC => DBCP(웹에서 주로 사용 기술) => ORM (데이터베이스 연결 라이브러리) => MyBatis / JPA / Hibernate
																	| XML, Annotation
		=> DAO / VO
		     ------ 라이브러리 사용 여부 

		=> 입사 요구사항 : 사용해 본 경험
			Spring / JSP / ORM ... Oracle/MySql
			Vue, React, Next
			AWS
*/