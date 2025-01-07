-- 159page GROUP BY/JOIN
/*
	GROUP : 그룹별 통계
		   ----------------
		   음식종류 / 부서별 / 직위별 / 입사년도
		=> SELECT 소속
		=> 단일행 함수는 사용이 불가능
		=> 집계함수를 주로 이용한다
		=> 같은 속성(컬럼)값끼리 그룹을 만들어서 통계
	=>
	[
		WHERE => 집계함수는 사용할 수 없다 (단일행 함수는 사용 가능)
		GROUP BY => 컬럼에 같은 값이 있다, 단일행 함수
		HAVING => 집계함수 이용
		ORDER BY => 함수 | 컬럼 
	]
	=> 159page
		COUNT : row 개수 => 로그인 / 아이디중복, 검색결과, 장바구니
		MAX : 자동 증가 번호 
		MIN
		SUM : => 통계
		AVG : => 평균
		RANK / DENSE_RANK
	=> 관리자페이지 => 회원분리 	
	=> 실행 순서
		SELECT	---> 5
		FROM 	---> 1
		WHERE	---> 2
		GROUP 	---> 3
		HAVING	---> 4
		ORDER	---> 6

*/
-- 직위별로 사원수, 평균급여, 급여의 총합
--SELECT job, COUNT(*), AVG(sal), SUM(sal) FROM emp GROUP BY job;'
-- 함수 이용방법 => 입사년도 => 인원수, 평균, 총합
--SELECT TO_CHAR(hiredate,'YYYY'), COUNT(*), AVG(sal),SUM(sal) FROM emp GROUP BY TO_CHAR(hiredate, 'YYYY');
--입사 요일별, 급여총합, 평균, 최대값, 최소값, 인원수
--SELECT TO_CHAR(hiredate,'DY'),SUM(sal),AVG(sal),MAX(sal),MIN(sal),COUNT(*) FROM emp GROUP BY TO_CHAR(hiredate,'DY');
--구매 : 어떤 요일에 구매를 가장 많이 하는지
--DESC Orders;
--DESC book;
--DESC customer;


/*
Orders : 구매현황
 ORDERID                                   NOT NULL NUMBER(2)
 CUSTID                                             NUMBER(2)
 BOOKID                                             NUMBER(2)
 SALEPRICE                                          NUMBER(8)
 ORDERDATE                                          DATE

BOOK : 책정보
 BOOKID                                    NOT NULL NUMBER(2)
 BOOKNAME                                           VARCHAR2(40)
 PUBLISHER                                          VARCHAR2(40)
 PRICE                                              NUMBER(8)

Customer : 고객 정보
 CUSTID                                    NOT NULL NUMBER(2)
 NAME                                               VARCHAR2(40)
 ADDRESS                                            VARCHAR2(50)
 PHONE                                              VARCHAR2(20)

	고객			  책
		--------------
			|
		    매핑테이블 => 3정규화 => 구매

*/
-- 고객이 주문한 도서의 총판매액 
--SELECT TO_CHAR(SUM(saleprice),'L999,999,999') as 총매출 FROM orders;

-- 2고객의 주문 도서의 총판매액
--SELECT TO_CHAR(SUM(saleprice),'L999,999,999') as 총매출 FROM orders WHERE custid=2;
--총판매액, 평균, 최소, 대대, 구매인원
--SELECT SUM(saleprice), AVG(saleprice),MIN(saleprice), MAX(saleprice), COUNT(*) FROM orders;

--고객별 총판매액, 평균, 최소, 최대
--SELECT custid, SUM(saleprice), AVG(saleprice), MIN(saleprice), MAX(saleprice) FROM orders GROUP BY custid ORDER BY custid;
/*
	HAVING을 이용하는 경우에는 반드시 GROUP BY를 사용해야 된다
	=> HAVING은 단독으로 사용할 수 없다
	WHERE문장에서는 집합함수를 이용할 수 없다
				  ------------------- 서브쿼리
	GROUP BY => 그룹별 =>  집계 (관리자 모드)
	----------------------------------------------------
	조인 : 테이블 연결 => 필요한 데이터 추출
	서브쿼리 : SQL문장 연결 => 한개문장으로 통합
	---------- 많이 사용되는 이유 : 1. 조인보다 빠르다
						  2. 자바에서 전송 => 최대한 작은양의 SQL문장
*/
-- 사원의 평균급여보다 많이 받는 사원의 이름, 급여출력
--SELECT ROUND(AVG(sal)) FROM emp;
-- 2073
--SELECT ename, sal FROM emp where sal>2073;

--SELECT ename, sal FROM emp where sal>(SELECT ROUND(AVG(sal)) FROM emp);
-- HAVING 사용 => GROUP BY에서만 사용이 가능
-- 부서별로 전체 급여보다 많이 받는 부서만 출력
--		2073
--SELECT deptno, COUNT(*), SUM(sal),AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal)>2073 ORDER BY deptno

--부서별로 인원이 3명 이상인 부서의 인원, 총합, 평균
--SELECT deptno, COUNT(*), SUM(sal), AVG(sal) FROM emp GROUP BY deptno HAVING COUNT(*)>3;

--가격이 8천 이상이고 2권 이상을 구매한 고객을 출력
--SELECT custid, count(*) FROM orders WHERE saleprice>=8000 GROUP BY custid HAVING COUNT(*)>=2;

