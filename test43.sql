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
		DDL
		DCL
		TCL
*/