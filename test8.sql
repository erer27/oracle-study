--오라클 2일차
/*
	연산자 정리
	내장함수
	Order By
	
	오라클 실행 언어
	-------- 데이터베이스 시스템
		   ---------------	관련된 데이터를 모아서 관리 =>  XE(데이터베이스명)
					----------------- 공유
		   개발자	
		       | ===========> 오라클 : SQL
		   오라클
		       | ===========> read/write/update/delete
		   운영체제(win,mac..)
		       |
		   하드 디스크 : 데이터 저장
		   => 데이터베이스 : 저장 / 수정 / 삭제 / 추가 / 읽기 => CRUD
			 예약하기 : 정보 저장 / 수정 / 삭제 / 예약보여주기
		   => Web의 핵심 : 자바 / 오라클 => HTML출력
					   ---------------- 수료
			
		   프로그램 언어 사용
		   브라우저 ======== 오라클 (X)
		   ---------- 화면 UI
			
		   브라우저 ====== 자바 ===== 오라클
					      ------
					      오라클 연결 / 브라우저 데이터 전송
		   SQL문장은 로직이 없다(제어문이 없다 => 함수, 연산자)
		   ---------- 형식 => 컬럼/테이블 
		   ---------- SQL문장 / HTML / CSS => 암기
					      --------------- 사용자 정의가 없다 => 자바스크립트
		   SQL => 구조화된 질의 언어 => 검색과 관련
							       ------
							      | 루씬(구글) => ElasticSearch
		   SQL의 종류
		     DQL : 데이터 검색 = SELECT
		     DML : INSERT : 데이터 추가 (회원가입, 글쓰기, 댓글올리기...)
			      UPDATE : 데이터 수정 (회원수정, 댓글 수정, 예약 수정...)
			      DELETE : 데이터 삭제 (회원 탈퇴, 예약 취소, 결제 취소...)
			      MERGE : 데이터 통합 
					    통계 => 분기별 => 부서별 통계
		     DDL : 데이터 정의언어
				CREATE : 생성 => 저장소(테이블), 가상테이블(View)
							 자동증가번호(SEQUENCE),
							 속도의 최적화 (INDEX)
							 중복제거 => 함수(FUNCTION)
							 기능을 수행 => 프로시저(PROCEDURE)
							 자동화 처리 => 트리거 (TRIGGER)
			     ALTER : 수정
					ADD => 컬럼추가, 제약조건
					MODIFY => 수정
					DROP => 컬럼제거
			    DROP : 삭제
			    TRUNCATE : 데이터만 잘라내기
			    RENAME : 테이블명 변경 
		     DCL : 데이터 제어언어
			    => 개발자가 사용하지 않는다 => DBA
			    GRRANT : 권한 부여
			    REVOKE : 권한 해제
			    => hr => 사용자 계정 => view, 시노님, 함수, 트리거 생성이 불가능
			
		     TCL : 트랜잭션 : 일괄처리 => 비절차적언어
			    정상 저장 : COMMIT 
			    오류발생 => 취소 : ROLLBACK
		     데이터베이스 사용 
		     --------------------- 대기업 : 오라클, 중소기업 : MySQL, MariaDB
										    --------------------
		     ==> SQL의 장점 => 표준화 => 데이터형 / 함수만 틀리다
		     예) 
			  문자열 : CHAR, VARCHAR2 =======> text
						-------------
						오라클에서만 사용
			  숫자(정수/실수) : NUMBER =======> int/double

			  날짜 : DATE ================> DateTime
		   => 중복을 최소화 => 정규화 => 테이블이 많이 생성
								  => JOIN
		   예)
			회원정보
			  id / pwd / name / sex / birthday / email / address / phone
			결재
			  결재번호 / 상품명 / 금액 / name / email / address / phone
			
	    *** SQL문장 사용시 주의점
		1) SQL문장의 순서, 문법
		2) SQL문장이 종료하면 ;을 사용 => 자바에서 사용하면 안된다
		3) 문자열 / 날짜 => ''을 사용한다 ""는 인용부호 / 별칭
		4) SQL문장의 기본은 대소문자를 구분하지 않는다
		    => 저장된 데이터는 대소문자 구분
		    => 실제 오라클에 저장이 될 때 테이블명, 컬럼명은 대문자로 저장
								------------------- 테이블 정보
		    => 테이블 : 한글을 사용할 수 있다 (리눅스 => 한글이 깨진다)
		5) 파일 => 구분을 직접 만들어서 처리 => | \n
		    데이터베이스 구분 => 컬럼
		6) 처리단위 => ROW => RECORD 
		7) 가급적이면 키워드는 대문자를 사용한다
		    => SELECT FROM WHERE .... 
	
		*** SELECT : 데이터 검색
		     1) 컬럼 대신 사용 ====> 스칼라 서브쿼리
			 SELECT no,(SELECT~)
		     2) 조건 ===> 서브쿼리
			 WHERE deptno =(SELECT~~)
		     3) 테이블 대신 사용이 가능 ==> 인라인뷰
		    	 SELECT
			 FROM (SELECT ~)
		*** SELECT 형식
		     => table명 / 컬럼명 ==> DESC table명
		     SELECT * | column_list
				   -- 출력에 필요한 데이터 선택
				-- 전체정보
		     FROM table_name
		     [
			     WHERE 조건문 => if => 연산자
			     GROUP BY 그룹컬럼 => 그룹별로 나눠서 따로 처리
			     HAVING 조건 => GROUP BY가 있는 경우에만 사용이 가능
			     ORDER BY 컬럼 (ASC|DESC)=> 정렬
						   ------ ASC는 생략이 가능
		     ]
		145page ~ 149page
		*** 1) 형식 / 순서
		     2) 연산자 => 조건
			  산술연산자 : SELECT뒤에서 주로 사용
			      +, -, *, /
			      + => 산술처리
			      *** '10' + 1 ==> 11
				  -----자동으로 정수로 처리
			      *** / 
				  0으로 나눌 수 없다
				  정수/정수=실수
			      *** %
				  함수로 만들어져 있다 MOD(10,2) = 0 10%2
			      *** 연습용 테이블 => DUAL
		
			  비교연산자 : 숫자, 문자열, 날짜 => WHERE뒤에 사용 => true/false
				같다 : = ==> 상세보기
				같지 않다 : !=, <>(권장), ^=
				작다 : <
				크다 : >
				작거나 같다 : <=
				크거나 같다 : >=
			  논리연산자 : 조건 2개를 연결
			       AND : 범위 포함 => 페이지 나누기
			       OR : 범위 미포함
			  IN : OR가 여러개 있는 경우
				WHERE empno IN(7788,7600...)
					   --------- 컬럼명
			  NOT : 부정 연산자
				    NOT IN(), NOT LIKE, NOT BETWEEN~
			  NULL : 값이 없는 상태
				    NULL을 연산하면 결과는 NULL
				    => NULL인 경우
					 IS NULL => 장바구니에 상품이 없다
				    => NULL이 아닌 경우
					 IS NOT NULL => 장바구니에 상품이 있다면
			  BETWEEN : 범위에 포함된 경우	>= AND <=
				    => WHERE deptno BETWEEN 10 AND 20
				    => WHERE deptno>=10 AND deptno <=20
			  --------------------------- 문자열 / 날짜 사용이 가능 
			  LIKE : 검색을 할 때
				  % : 문자의 개수가 제한이 없다
				  _ : 한글자
				  시작문자열 => WHERE ename LIKE 'A%'
				  끝나는 문자열 => WHERE ename LIKE '%A'
				  포함된 문자열 => WHERE ename LIKE '%A%'
				  ----------------------------------------------------- 모든 검색
				  문자열 개수 => WHERE ename LIKE '____' 
							WHERE ename LIKE '__O__'
		     3) 내장함수 => 제어
			 문자열 관련
			 숫자 관련
			 날짜 관련
			 변환
			 기타
		     4) 컬럼명이 길거나 알아보기 어려운 경우 => 별칭
			 컬럼명 "별칭" 컬럼명 as 별칭
			 ---------------
		     5) 필요시에 문자열 결합 ||
		     6) 문자열 / 날짜 ==> ''
		     7) 오라클안에서는 문장이 종료 => ; 
*/
--SELECT '10'+1, 10-3, 10*2, 10/3 FROM DUAL;
-- 1. emp에서 A로 시작하는 이름을 가진 사원의 이름, 입사일 출력
/*SELECT ename, hiredate
FROM emp
WHERE ename LIKE 'A%';*/
-- 2. emp에서 T로 끝나는 이름을 가진 사원의 이름 출력
/*SELECT ename
FROM emp
WHERE ename LIKE '%T';*/
--3. emp에서 IN,EN이 표함된 사원의 이름 출력
--SELECT ename, hiredate FROM emp WHERE ename LIKE '%IN%' OR ename LIKE '%EN%';
--SELECT ename, hiredate FROM emp WHERE REGEXP_LIKE(ename, 'IN|EN');
 --4. 사원의 이름중에 M과 T를 포함하고 있는 사원의 이름과 입사일
--SELECT ename, hiredate FROM emp WHERE ename LIKE '%M%T%';

 --5. 사원의 이름중에 5글자인 사원의 이름 출력 => 마지막 글자가 S
--SELECT ename FROM emp WHERE ename Like('_____S');

SELECT ename, hiredate FROM emp WHERE hiredate Like '81%';

/*


*/