/*
	BETWEEN ~ AND : 범위 => 이상 / 이하
*/
-- 1. 책 가격중에 10000~20000 사이 책을 => 책이름/가격
/*
	book (테이블)
	bookid
	bookname
	publisher
	price
*/
/*
SELECT bookname, price
FROM book
WHERE price BETWEEN 10000 AND 20000;
*/
-- 2. 책제목중에 두번째 글자가 '구'인 책이름을 출력
SELECT bookname FROM book WHERE bookname LIKE '_구%';

--3. IN => 출판사 => 굿스포츠, 대한미디어 => 전체 정보 출력 (*)
--SELECT * FROM book WHERE publisher IN('굿스포츠','대한미디어');

--4. IN => 출판사 => 굿스포츠, 대한미디어가 아닌 => 전체 정보 출력 (*)
--SELECT * FROM book WHERE publisher NOT IN('굿스포츠','대한미디어');
/*
	156page => 정렬
	=> 명령어 : ORDER BY => SQL문장 마지막에 추가
			------------- 올림차순 / 내림차순
							DESC
					 ASC => 생략
*/
-- 1. emp => 급여가 낮은 순으로 이름 / 급여 출력
SELECT ename, sal FROM emp ORDER BY sal ASC;

SELECT ename, sal FROM emp ORDER BY sal DESC;

SELECT ename, sal FROM emp ORDER BY 2 DESC;

-- 2중 정렬
SELECT ename, sal FROM emp ORDER BY 2 DESC, 1 ASC;

SELECT ename, sal FROM emp ORDER BY sal DESC, 1 ASC;
-- 답변형 게시판, 대댓글 =>  주로 사용
-- 같은 값을 가지고 있는 경우 => 데이터 다시 SORT
