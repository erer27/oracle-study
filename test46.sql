-- INDEX제작 => 검색어로 많이 사용하는 컬럼을 인덱스로 등록
-- INDEX 생성
/*
CREATE INDEX idx_emp_ename ON emp(ename DESC);
SELECT + INDEX(emp idx_emp_ename)  empno, ename, hiredate
FROM emp
WHERE ename>='A';
*/

/*
--DROP INDEX idx_emp_ename;

CREATE INDEX idx_emp_sal ON emp(sal);
SELECT + INDEX(emp idx_emp_sal)  empno,ename,sal
FROM emp
WHERE sal>0;
*/

/*
SELECT --+ INDEX(emp idx_emp_sal) 
empno, ename,sal 
FROM emp
WHERE sal>0;
*/

--DROP INDEX idx_emp_sal;
-- ORDER BY sal ASC,ename DESC
--CREATE INDEX idx_emp_salname ON emp(sal,ename DESC);
/*
SELECT + INDEX(emp idx_emp_salname)  empno, ename, sal
FROM emp
WHERE sal>0 AND ename >='A';
*/

--DROP INDEX idx_emp_salname;
-- INDEX_ASC() / INDEX_DESC() => PK

/*
SELECT /*+ INDEX_ASC(emp emp_empno_pk) */ empno, ename, sal
FROM emp; 

SELECT /*+ INDEX_DESC(emp emp_empno_pk) */ empno, ename, sal
FROM emp; 
*/

/*
	=> 게시판 / 댓글 / 상품 / 맛집 ....
	인덱스 정리 => 100%
	-------------
		=> 검색 속도를 빠르게 하기 위한 기능
		=> 일부 SQL쿼리 성능 향상
		1. 장점 
		   데이터 많은 경우 => 주로 사용 (검색이 빠르기 때문에)
		2. 단점
		    메모리 할당이 많아진다 => 오라클 서버 부하가 심하다
		     => 한테이블안에 4~5개 정도가 적당하다
			=> 검색어를 중심으로 제작 => title / name
			테이블 변경시에는 인덱스를 최신화
			=> INSERT / UPDATE / DELTE
				=> ALTER INDEX index명 REBUILD 
		3. 인덱스 사용
			= 테이블에 ROW가 많은 경우 (100000이상인 경우) => 레시피
			= WHERE문장에서 검색이 많은 컬럼이 있는 경우
				=> 영화명 / 맛집명 / 레시피명
			= 검색 결과가 전체 데이터의 2~5%정도인 경우
			= JOIN에서 자주 사용되는 컬럼
			= NULL 값을 포함하고 있는 검색어가 있는 경우 
			
		4. 생성
			자동 생성 : PRIMARY KEY, UNIQUE
			직접 생성 : 주로 검색어를 중심으로 만든다
				CREATE INDEX index명 ON 테이블(컬럼 ASC|DESC) => 생략 ASC
				CREATE INDEX index명 ON 테이블(컬럼, 컬럼)
			=> 리빌드(인덱스 갱신) => 데이터 추가 / 수정 / 삭제
				ALTER INDEX index명 REBUILD
		5. 삭제
			DROP INDEX index명
					   --------- 가급적이면 중복없이
					   idx_테이블명_컬럼명 
		6. 정렬
			힌트 => 주석
					/*+ INDEX_ASC(테이블 PK) */ 컬럼....
					/*+ INDEX_DESC(테이블 PK) */ 컬럼....
					/*+ INDEX(테이블 INDEX명) */ 컬럼....
	
		4장
		----
			SELECT / INSERT / UPDATE / DELETE
			테이블 / 인덱스 / 뷰 / 시퀀스 / 시노님 => 객체
	
			=> 재사용
			     -------- 함수 / 프로시저 / 트리거
			=> 데이터베이스 설계
			=> 트랜잭션
			
*/