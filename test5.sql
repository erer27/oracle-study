-- DQL : 데이터 검색 => SELECT
/*
	1. DESC table명 => 컬럼 확인
	2. 데이터형에 대한 확인
	3. 테이블명 확인
	---------------------------------
	오라클에서 사용하는 데이터형
	# 문자열, 날짜 => ''을 사용한다
	   예) 'KING', '25/01/02' => 'YY/MM/DD' => 날짜도 문자열 형식으로 저장
	문자열
		CHAR, VARCHAR2, CLOB
	숫자
		NUMBER (8), NUMBER(2,1)
		--------------
	날짜
		DATE, TIMESTAMP
	기타 => 사진, 동영상 저장
		BLOB, BFILE 
	SELECT
	형식)
			SELECT *(ALL) column_list => column1, column2....
					    --------------- 출력에 필요한 컬럼만 선택
			FROM table명 => view명 / SELECT~(인라인뷰)
			---------------------------------------------------------- 필수 사항
			[
				WHERE 조건문 => if
					   -------- 연산자
				GROUP BY 그룹컬럼 
				HAVING 그룹조건 ==========> 반드시 GROUP BY가 있는 경우에
				ORDER BY 컬럼명 ==========> 정렬
							ASC (생략이 가능), DESC
			]
			***** 오라클 데이터는 정렬되어 있지 않다
			***** 검색 속도가 빠르게 한다 (Order by => 속도가 느리다)
			       ---------------------------- INDEX
			1. 교재
			  테이블명 : book
			  컬럼명 : bookid / bookname / publisher / price
				     ---------  교재명	    출판사	    가격
					책의 고유번호 => ISBN => 중복이 없다
*/
-- 모든 도서의 이름과 가격을 검색 => 사용자 입장 
/*SELECT bookname, price
FROM book;*/
/*SELECT price, bookname
FROM book;*/
-- 컬럼의 순서가 지정된 것은 아니다
-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 출력
SELECT bookid, bookname, publisher,price
FROM book;
-- SELECT bookid,bookname,publisher,price, SELECT *
/*
	*을 사용하면 순서가 테이블 생성할 때 지정된 순서
	CREATE TABLE Book (
	bookid NUMBER(2) PRIMARY KEY, getInt(1)
	bookname VARCHAR2(40),		getString(2)
	publisher VARCHAR2(40),		getString(3)
	price NUMBER(8)				getInt(4)
	);
	DESC book => 테이블에 저장된 순서를 보여준다
	*는 거의 사용 빈도가 없다 => null (대체)
*/
-- 도서 테이블에 있는 모든 출판사를 출력
/*SELECT publisher
FROM book;*/
-- Set
-- 중복 제거후 출력
SELECT DISTINCT publisher
FROM book;
-- 146page ~ 148page 


