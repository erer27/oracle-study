-- 오라클 중간 점검
/*
	3장 / 4장
	-----------
	 3장 : DQL 관련
	 -----------------
		SQL : 구조화된 질의 언어 => SELECT (검색) => 
			형식/사용처/응용/자바에서 처리
					  ---------------- JDBC => DBCP => MyBatis => JPA
									   ----------------------     ----- React+Boot
									    JSP	  --------- Spring
			*** JSP / Spring
				    --------- BOOT
			    ---- MVC구조가 없다
			*** MSA / DevOps
				      ----------- 도커 / 젠킨스 => CI/CD
			*** Front : React (React-Query)
						-------------- TanStack-Query
					NextJS => TypeScript => NodeJS
			*** Flutter / Dart
			--------------------------------- Spring / MyBatis 
		 | 
		DQL : SELECT : 데이터를 검색 => 오라클 저장값을 읽기
			형식) 
				SELECT * | column_list
				FROM table_name | (SELECT ~) | view_name 
				[
					WHERE 조건절 (컬럼명|함수 연산자 값)
					GROUP BY 그룹컬럼|함수
					HAVING 그룹조건 (집계함수)
					ORDER BY 컬럼 | 함수 ASC|DESC
				]
				=> 웹 사이트 : 70%
				목록 출력 / 상세보기 / 검색 ...
				마이페이지 => 찜목록 / 장바구니 / 예약 ...
			= 주의점
			   1. 오라클에서 사용시에는 명령문이 종료 ;을 사용한다
				=> 자바에서는 ;을 사용하면 오류 발생
			   2. 크롤링에서 ||, &가 나오면 replace() 이용한다
			   3. 자바에서는 문자를 사용 => 공백사용
			   4. 문자 / 날짜 => ''
			   5. 저장된 데이터는 대소문자 구분 
			   6. 사용 기술
			   문자열 결합 : ||
			    중복제거 : 자바(Set) => DISTINCT
			= WHERE 문장 사용
				연산자
				  산술연산자 ( +, -, *, / )
					=> 순수하게 산술만 처리가 가능
					=> / => 정수/정수=실수
					=> '10'+1 => 11
					      ----- TO_NUMBER => 자동으로 정수형 변경
					=> ROW단위 통계
					=> SELECT뒤에서 주로 사용
				비교연산자
				   = 같다, <> (!=,^=) 같지 않다
				   >, <, >=, <= => 왼쪽기준
				논리연산자
				 AND : 포함 (기간, 범위), OR : 미포함
				   &&(Scanner:입력) || (문자열 결합)
				오라클에서 지원하는 연산자
				 IN => OR여러개인 경우에 사용 / 다중 검색
				 WHERE 컬럼 IN(값, 값...)
				 BETWEEN ~ AND =>	>= AND <=
				 범위포함 => 페이징 기법
				 NOT : 부정
				  NOT IN, NOT BETWEEN , NOT LIKE
				 NULL : null은 값이 없는 상태
					   연산처리가 안된다
					     IS NULL : null값인 경우
					     IS NOT NULL : null아닌 경우
				 LIKE : 검색
					시작문자 : '문자%'
					포함문자 : '%문자%'
					끝문자 : '%문자' ===> %는 문자개수를 모르는 상태
						_는 한 글자를 나타낸다
				 => 음식 맛표현
					짜, 짜니, 짜고
					---------------- 중국집 : 짜장
					 => 정규식 : REGEXP_LIKE
					 	짜+, 짜* ....
					 => 음악 => Youtube에서 동영상 
			= SELECT 문장 사용
				내장함수
					ROW단위 => 한줄씩 처리 => 단일행함수
					  문자함수
						SUBSTR(문자열|컬럼, 시작위치, 몇 개)
											   ------ 개수
						=> 오라클은 시작 인덱스 => 1번부터 시작
						LENGTH(문자열|컬럼) => 문자 개수
						RPAD(문자열|컬럼, 출력글자수, 대체할 문자)
						INSTR(문자열 | 컬럼, 찾는 문자, 시작, 몇번째)
					  숫자함수
						***ROUND(실수, 소수점) : 반올림
						***CEIL(실수) : 올림
						TRUNC(실수, 소수점) : 버림
					  날짜함수
						SYSDATE : 시스템 날짜, 시간
						 => 산술
					  변환함수
						TO_CHAR
							=> 숫자 TO_CHAR(숫자, '999,999')
							=> YYYY(RRRR) / MM / DD / HH(HH24) / MI / SS
					  기타함수
						NVL(컬럼, 대체값)
						       ----- null일 경우 대체값
					COLUMN단위 => 한개의 컬럼 전체에 대한 통계
							    => 집계함수 
						COUNT() : row개수
						MAX() : 자동증가번호
					----------------------------------------- 단일 테이블
					= 테이블 연결 : JOIN
						** INNER JOIN => 같은 값을 가지고 있거나 값이 포함
									=> 단점 : null값은 처리 할 수 없다	
						* 같은 값일 경우 : EQUI_JOIN
							연산자 : =
						* 포함된 값일 경우 : NON_EQUI_JOIN
							연산자 : AND, BETWEEN ~ AND
						* 사용 방법
							= 오라클 조인
								SELECT A.col, B.col	
								FROM A,B
								WHERE A.col=B.col	
								*** 컬럼명이 동일 반드시 식별
									----------------------------
									테이블.컬럼명, 별칭명.컬럼명
							= ANSI JOIN (표준)
								SELECT A.col, B.col	
								FROM A JOIN B
								ON A.col=B.col
							OUTER JOIN : INNER JOIN+NULL값 처리가 가능
								LEFT OUTER JOIN
									SELECT A.col, B.col	
									FROM A JOIN B
									ON A.col=B.col(+)
									
									SELECT A.col, B.col	
									FROM A JOIN B
									ON A.col(+)=B.col	
								RIGHT OUTER JOIN
							=> 정규화 : 중복을 최대 제거 => 테이블 분리
									관련 테이블 여러개가 된다
									-------------- 데이터를 모아서 => 조인
						= SQL문장 연결 : SubQuery
									-------------
									먼저 실행 => 결과값 MainQuery로 전송
							=> 네트워크 속도를 높인다 (SQL문장 여러번 수행하면 속도가 느려진다)
							종류
							 1) 단일행 서브쿼리
								-> 서브쿼리의 결과값 컬럼 1개 결과값 1
								WHERE 절 뒤에 사용
								-> 연산자 (비교연산자, 논리연산자 주로 사용)
							 2) 다중행 서브쿼리
								-> 서브쿼리의 결과값 컬럼 1개 결과값 여러개
								WHERE절 뒤에 사용
								-> IN, ANY, ALL
									 ----------- MAX, MIN	
							-------------------------- 조건의 값을 가지고 올 때 사용
							 3) 스칼라 서브쿼리
							-> 조인 대신 사용이 가능
							-> SELECT 뒤에 컬럼 대신 사용
							SELECT 컬럼, (SELECT~)
							 -> 장점 : JOIN보다 속도가 빠르다
							 -> 단점 : SQL문장이 길어진다 
							 -> 소프트웨어 품질
							      | 최적화, 복잡성(가독성)
							 4) 인라인뷰 
							      -> 테이블 대신 사용
							      -> 보안이 뛰어나다
							      -> 페이징 기법
								  --------------
								   rownum : 오라클 지원에서 지원하는 가상 컬럼
								   --> ROW마다 번호를 지정
								   --> TOP~N : 인기순위, 공지 10개 
								   --> rownum의 순서변경 => 인라인뷰
								* SELECT 
								FROM (SELECT ~)
										  ------- 지정된 컬럼만 사용이 가능
						
		DML : INSERT, UPDATE, DELETE
			  추가	수정	   삭제
			 INSERT INTO table_name VALUES(값, 값...)
			 => 전체 컬럼값 설정 => DEFAULT 적용이 안됨
			 => 순서확인 DESC table_name
			 INSERT INTO table_name(컬럼, 컬럼...) VALUES(값...)
			 => 지정된 컬럼값만 설정 => DEFAULT 적용
			 UPDATE : 수정
			 UPDATE table_name SET
			컬럼=값, 컬럼=값...
			[WHERE 조건]
			DELETE : 삭제
			DELETE FROM table_name
			[WHERE 조건]
		DDL : 정의언어
			
			사이트 / 프로젝트 => VO / DAO
						       ------------ 웹사이트는 X
				JSP => 프로젝트 / Spring => 자동화처리
							 SQL문장 없이 처리 => 메소드로 처리
								=> DataSet => JPA
				SELECT * FROM table_name
				WHERE no=10;
				
				=> findByNo(int no) => findByNameLike()
			1) 데이터형 => 오라클 (자바 매칭) ==> VO, DTO
			    문자형 ====> String
				CHAR(1~2000byte) : 고정 바이트 => 같은 크기의 데이터
				*** 한글은 3byte
				VARCHAR2(1~4000byte) : 가변 바이트 => 저장하는 글자 크기만큼만 저장
				*** 문자 저장은 default 
				CLOB : 4기가 => 가변 바이트 
				*** 문제점 : CSV로 변환시에 변환이 안됨
				*** Oracle => MySQL => CSV로 변환
				
			    숫자형 ====> 데이터 확인후 double/int
				NUMBER => NUMBER(8,2) => 가장 많이 사용
				NUMBER(38,128)
				NUMBER(2) => 1자리 ~ 2자리 사용이 가능
					*** 3자리 정수가 들어가면 오류 발생
				NUMBER(2,1) => 평점 => double 
			    날짜형 ====> java.sql.Date (java.sql.Date(X))
						  --------------
			      DATE : 시간 / 분 / 초, 년도/월/일
			=> 프로젝트, 프로그램에서 필요한 데이터 저장
			     --------------------------------------------------
				제약조건 (정형화된 데이터)
				1) NOT NULL : NULL값을 허용하지 않는다
							무조건 데이터 저장
							=> 필수 입력 /* / 입력 팝업
				   ** 오라클 : 공유 데이터 => 모든 사용자 => 오라클 1개
					=> 한명이 실수 => 오라클은 내린다
					     --------------------------------------
					=> 유효성 검사
				권장사항
				
				2) UNIQUE : 중복없는 데이터 (null허용)
						  => 대체키 / 후보키 (email,phone)
				3) NOT NULL + UNIQUE => 기본키
				    PRIMARY KEY => 테이블에 반드시 한 개 이상 존재
				4) 다른 테이블에서 참조 : FOREIGN KEY
					=> JOIN
				5) 지정된 데이터만 저장 : CHECK
				6) 사용자가 입력이 없는 경우 => DEFAULT => 등록일
				= 컬럼명 데이터형 DEFAULT 값
			=> 테이블 제작
				식별자 (테이블명, 컬럼명 적용)
				1. XE (데이터베이스) : 테이블저장 공간, hr(접근 유저명)
					---------------- 폴더 파일
				   => jdbc:oracle:thin:@localhost:1521:XE
				   => 같은 이름 사용할 수 없다 (같은 데이터베이스에 유일값을 가지고 있다)
				   => CREATE DATABASE my => MySQL (mydb), MSSQL(pubs)
				2. 알파벳, 한글 => 문자로 시작 (알파벳을 권장)
					     ------ 운영체제에 따라 깨질 수 있다
						     ---------- 서버에 호스팅 (서버=>리눅스)
				   => 알파벳은 대소문자 구분을 하지 않는다
					실제 오라클 저장 대문자로 저장된다
				   => 1) 컬럼 확인
						DESC table 명
					2) 테이블 확인
						SELECT * FROM user_tables
						WHERE table_name='대문자 테이블명'
					3) 전체 테이블명 확인
						SELECT * FROM tab
				3. 숫자 사용이 가능 (앞에 사용금지)
				4. 특수문자 사용이 가능 ( _ ) => 두개이상 단어
				5. 키워드는 사용할 수 없다 (SELECT, INSERT...)
				6. 글자수는 30byte (7~15자)
				7. 테이블명에 공백이 있으면 안된다 
			=> 형식
				=> 재사용 (테이블 복사)
			      CREATE TABLE table_name
				AS
				   SELECT ~~
				---------------------------- 테이블 생성 + 데이터 추가
				  CREATE TABLE table_name
				  AS
					SELECT ~
					FROM 이전테이블
					WHERE 1=2
						   ----- false인 조건 사용 100=200 / 'A'='B'
				  ---------------------------------- 테이블 구조만 생성

				   사용자 정의
				   CREATE TABLE table_name
				   (
					   컬럼명 데이터형 [제약조건] => 제약조건은 한 개만 사용하는 것은 아니다
					    예) name VARCHAR2(10) NOT NULL, UNIQUE
						=> DEFAULT를 사용하려면 가장 앞에 설정
					    => 컬럼뒤에 설정 제약조건 : NOT NULL, default
					   컬럼명 데이터형 [제약조건]
						컬럼명 데이터형 [제약조건]
						[제약조건], => PK, CK, UK, FK
						[제약조건]
				   )
				  *** PRIMARY KEY => 한개만 설정
				  PRIMARY KEY(no,id) => 두 개 설정
				   1, aaa
				   2, bbb
				   1, bbb
				   2, aaa	
		----------------------------------------------------------------------------------
				자동 증가번호 : SEQUENCE
				1) 생성
					=> 회원가입제외 (id) => 나머지는 숫자 중복제거
					CREATE SEQUENCE seq명
						START WITH 1=> 1부터 시작
						INCREMENT BY 1 => 1씩 증가
						NOCACHE => 저장하지 않는다
						NOCYCLE => 다시 처음부터 시작하지 않는다
					** PRIMARY KEY 존재하는 모든 테이블에 따로 생성 
					    ***테이블당 시퀀스 한 개
					    ***SELECT NVL(MAX(컬럼)+1,1) FROM 테이블명
						---------------------------------------------------- 서브쿼리 사용					
				2) 초기화 / 삭제
					DROP SEQUENCE seq명
								 ------- user_sequences => 중복없이 저장
								 table명_컬럼명_seq
				3) 값을 가지고 오는 경우	
					현재값 : 시퀀스명.currval
					다음값 : 시퀀스명.nextval => 데이터 추가시에 
					* 단점 : 계속 증가만 된다 (데이터 삭제시에 번호 복구가 불가능)
				= 동의어 (테이블) SYNONYM 
				    ------------------------------- 이전 테이블명과 동의어와 동시에 사용
				    = 사용자계정(hr)에서 생성할 권한이 없다
					1. system계정으로 접근
					   conn system/happy
					2. 권한 부여
					    grant create synonym to hr => revoke create synonym
					3. 다시 사용자 계정으로 접근
					   conn hr/happy
				= 생성 : CREATE PUBLIC SYNONYM 별칭 FOR 실제 테이블명
				= 삭제 : DROP SYNONYM 시노님명
				--------------------------------------------------------------------------
				VIEW 생성
				   = 보안, 한개이상의 테이블 참조해서 가상으로 테이블 생성
				      ------ 실제 데이터를 저장하지 않는다 (SELECT문장) 
				   = view의 저장된 값 확인
					SELECT text FROM user_views
					WHERE view_name='VIEW명(대문자)'
				   = 사용처 => 보안필요한 부분 (세션에 저장)
						     ------------------------------------ 자동 로그인
						=> SQL문장이 긴 경우 => 간결하게 제작
				   = 종류
					단순뷰 => 테이블 한개 참조 => DML적용 (DML을 사용시에는 테이블에 영향을 미친다)
						  => 읽기 전용으로 사용하게 만든다
							WITH READ ONLY / WITH CHECK OPTIOn
						  => 사용빈도가 거의 없다
					CREATE VIEW view_name
					AS
						SELECT * FROM emp;
					복합뷰 => 테이블 두개이상 참조
							조인 / 서브쿼리 => 가끔 사용
					CREATE VIEW view_name
					AS
						SELECT * FROM emp, dept
						WHERE emp.deptno=dept.deptno
					=> 재사용 (테이블)
					
					***인라인뷰 => 페이징기법 등장 => 사이트 제작시 매번 사용
		DCL : 권한부여, 권한해제 => 사용자계정(hr)은 권한이 없는 것이 많다
			 --------------------- 관리자 계정 (system/sysdba)
			권한부여 : GRANT
			   GRANT CREATE VIEW TO hr
		TCL : 트랜잭션 => 일괄처리
*/
/*
CREATE TABLE test(
	no NUMBER,
	id VARCHAR2(20),
	CONSTRAINT test_noid_pk PRIMARY KEY(no,id)
);
*/
--drop table test;