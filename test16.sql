-- 기타 함수 (***NVL(null을 다른 값으로 대체), DECODE(다중 조건문), CASE(switch))
/*
	NVL(컬럼명, 대체값)
	       -------
		컬럼이 null경우에만 대체
		** 컬럼의 데이터형, 대체하는 값이 동일
	NVL(100,'no comm') => 오류 발생
	      ----  ------------
		NUMBER / VARCHAR2
	NVL(TO_CHAR(100), 'NO COMM')
	=> 연산처리 : null 값이 있는 경우에는 연산처리 결과 => null (출력이 안된다)
	null : 값이 없는 상태 
	----- IS NULL / IS NOT NULL
*/
--SELECT ename, sal, comm, sal+NVL(comm,0) FROM emp;
SELECT ename, sal, NVL(TO_CHAR(comm), 'NO COMM') FROM emp;

/*
	오라클 데이터형
	문자형
	 CHAR(1~2000byte) => 고정 바이트
	 CHAR(10) => 'A' => 10byte
	 => 글자수가 동일한 경우 : 남자/여자, y/n
	 VARCHAR2(1~4000byte) => 가변 바이트 ********** 문자열 저장시 가장 많이 사용
	 VARCHAR2(100) => 'A' => 1byte 
	 CLOB => 4기가 (줄거리, 자소서...) => 가변
	--------------------------------------------------------- String 매칭
	숫자형
	 NUMBER => NUMBER(8) => int
	 NUMBER(7,2) => 숫자 7개 사용이 가능 => 2자리는 소수점으로 사용이 가능
			    => int / double
	날짜형
	 DATE
	 TIMESTAMP : 기록경주 => DATE를 확장
	 ----------------------------------------------- java.util
	기타형 : 동영상 / 사진 / 이미지
	 BFILE :  파일 형태 
	 BLOB : 바이너리 형태
		=> 증명사진
	------------------------------------------------ java.io.InputStream
	=> DESC table명 

*/
CREATE TABLE test(
	no NUMBER PRIMARY KEY,
	name VARCHAR2(100)
);
INSERT INTO test VALUES((SELECT NVL(MAX(no)+1,1) FROM test),'홍길동');
null인 경우에는 => 브라우저에서 null 출력 =>  우편번호
*/
-- 통계 (관리자 페이지, 마이페이지) 
/*
	DECODE : 다중 조건문
	DECODE(deptno, 10, '영업부', 20, '개발부', 30, '기획부',  40, '자재부')
	=> DECODE(star,1,'★',2,'★★',5,'★★★★★');

*/
-- switch ~ case
--SELECT ename, job, deptno, DECODE(deptno, 10, '개발부', 20, '기획부', 30, '총무부') dname FROM emp;

--case 다중조건문
SELECT ename, job, deptno, CASE WHEN deptno=10 THEN '개발부' WHEN deptno=20 THEN '영업부' WHEN deptno=30 THEN '기획부' END "dname" FROM emp;

