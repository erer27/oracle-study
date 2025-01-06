-- 오라클 1차 정리
/*
	1. SELECT 문장 : 데이터를 검색 명령어
		=순서 / 형식
			=> 출력에 필요한 데이터만 추출 / 전체 데이터 추출 (*)
				------------------------  column나열
			SELECT * | column_list
			FROM table명 => 파일
			[
				***WHERE 조건 => 연산자
				GROUP BY 그룹컬럼
				HAVING 그룹조건
				***ORDER BY 컬럼 (ASC|DESC)
			]

			* 컬럼명이 길거나 알 수 없는 경우 => 별칭
			  컬럼명 "별칭" , 컬럼명 as 별칭
			* 중복없는 데이터 : DISTINCT 컬럼명
			* 문자열 결합 => ||

			=> WHERE문장 처리 => 연산자
				산술연산자 : +, -, *, /
						 ===> 순수하게 산술만 처리(/=>정수/정수=실수)
				*** 오라클에서 지원하지 않는 부분 => row단위 통계(X)
					=> CUBE / ROLLUP => GROUP BY이용한다
				비교연산자 : =, <>(!=,^=), <,>,<=,>=
				논리연산자 : AND, OR
						------- ------ IN
						BETWEEN ~ AND
				OR가 여러개인 경우 : IN
				WHERE deptno=10 OR deptno=20 OR deptno=30
				=> WHERE deptno IN(10,20,30)
				기간, 범위 : BETWEEn ~ AND
				WHERE no>=1 AND no<=10
				=> WHERE page BETWEEN 1 AND 10
				null 연산자 => null은 값이 없는 상태 => 연산처리가 안된다
				----- 1. IS NULL, 2. IS NOT NULL, 3. NVL() => NULL 값을 변경해서 사용
				부정연산자 : NOT
				 => NOT IN, NOT LIKE, NOT BETWEEN
				LIKE => 검색
					% : 문자의 제한이 없다
					_ : 문자 1개
					=> startsWith => 'Java%'
					=> endsWith => '%Java'
					=> contains => '%Java%'
					=> '_K%'
					=> 오라클에 저장된 데이터는 대소문자를 구분한다
				----------------------------------------------------------------------
				 상세보기 : =
					맛집, 영화, 장바구니, 상품 ... 
				 검색 : LIKE '%검색어%'
					맛집 => 지역, 이름, 음식 ...
				 목록 : WHERE page BETWEEN 1 AND 10
				----------------------------------------------------------------------
				 내장 함수
				-------------
					단일행 함수 : row => 한줄씩 처리
					 문자 관련 함수
					   LENGTH(문자열|컬럼명) => 문자 개수
					   SUBSTR(문자열|컬럼명, 시작번호, 개수) => 문자를 자르는 경우
									   ---------- 1번부터
									   ---------- 뒤에서 -1
					   INSERT(문자열|컬럼명, 찾는문자, 시작번호, 몇번째)
											----------
											-1 : lastIndexOf
											 1 : IndexOf
					   RPAD(문자열, 출력개수, 문자지정) : 아이디 찾기 

					 숫자 관련 함수
					   CEIL(실수) : 올림함수 => CEIL(10.1) => 11
					   ROUND(실수, 자리수) => 반올림
										ROUND(10.2345,2) => 10.23
												   
					   TRUNC(실수, 자리수) => 버림
										TRUNC(10.45678,2) => 10.45
					 날짜 관련 함수
						SYSDATE : 시스템의 날짜, 시간
						MONTHS_BETWEEN : 기간 사이의 개월을 가지고 온다
					 변환 함수
						TO_CHAR : 문자열 변환
						 = 날짜
							yyyy / rrrr
							mm / MM
							DD / dd
							HH / HH24
							MI
							SS
							DY => 요일
						= 숫자
							'$999,999', 'L999,999'
						TO_DATE : 날짜 변환
							자바에서 문자열을 보내면 => DATE형으로 변경
					 기타 함수
						NVL : null값을 대체해서 사용 
					집계함수 : column => 컬럼 1개에 대한 통계
							AVG(sal) => 전체 급여에 대한 평균 
							SUM(sal) => 합
							***MAX(sal) => 최대값 => 자동증가번호
							MIN(sal) => 최소값
							***COUNT(*) => Row의 개수 => 저장된 개수
					
				  
*/