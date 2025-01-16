-- 2025-01-15 INDEX (4장) = 응용
/*
	5장
	----- JDBC / WEB 개발 (JSP) / PL-SQL
		------------------------------------ 프로그램 개발
	6장 / 7장 => 데이터베이스 설계 (정규화)
	8장 => 트랜잭션 =============== admin(DBA) : 복구, 보안, 백업
	
	인덱스
		1) 검색 속도 향상
		2) 인덱스를 저장하기 위해 메모리가 많이 소요된다 (단점)
		3) 생성 => 사용자 정의, UNIQUE / PRIMARY KEY는 자동 생성이 된다
		4) 인덱스 생성 시기
		    1. 구별되는 값을 가지고 있는 경우 (PRIMARY KEY)	
		    2. WHERE절에서 자주 사용되는 컬럼 (검색)
			--------------------------------------------- title / name ...
		    3. JOIN에서 주로 사용되는 컬럼
		    4. NULL값을 포함하고 있는 컬럼이 많은 경우
			---------------- bunji ..	
		     5. 성능 저하 (사용하지 않는다)
			=> INSERT / UPDATE / DELETE가 많은 테이블 
			회원가입 / 게시판 / 댓글 / 리뷰
			=> 다시 인덱스번호를 다시 조정 => rebuild 
KING                 AAAStOAAHAAAAFeAAA
BLAKE                AAAStOAAHAAAAFeAAB
CLARK                AAAStOAAHAAAAFeAAC
JONES                AAAStOAAHAAAAFeAAD
MARTIN               AAAStOAAHAAAAFeAAE
ALLEN                AAAStOAAHAAAAFeAAF
TURNER               AAAStOAAHAAAAFeAAG
JAMES                AAAStOAAHAAAAFeAAH
WARD                 AAAStOAAHAAAAFeAAI
FORD                 AAAStOAAHAAAAFeAAJ
SMITH                AAAStOAAHAAAAFeAAK

		AAAStO AAH AAAAFe AAA
						데이터번호
				   블록번호
			    상대 파일번호 => 데이터별 유일값을 가지고 있다
		오브젝트번호 => 테이블(유일값)
		
		B-tree
				--- 루트 
				 |
			-------------- 내부루트
			|	|	|
			--------------- 리프루트
			
		예)
			1~7 => empno
				가운데 있는 숫자 => 루트
				
				4
			      -----
			     |	    |
			   (1~3) (5~7)
			      2		6
			    ----      ---
			    |    |     |   |
			   1    3    5   7
		=> 8,9 추가 => 1~9
		     =>	5
	=> rowid는 검색을 위한 구분자 => 오라클에서 생성해주는 가상 컬럼
		rownum / rowid 
	인덱스 제작
	-------------
	장점 : 검색 속도가 빠르다
		 시스템 부하를 줄여서 전체 성능 향상
	단점 : 메모리 (인덱스를 추가하는 메모리 공간)
		 인덱스 번호를 계속 추가하면 속도 저하 

	1) 인덱스 생성
		1.PK / UK => 자동 생성
		2. 직접생성 => 검색어로 많이 사용
			CREATE INDEX index명 ON 테이블명(검색이 많은 컬럼명)
						=> user_indexs
						=> idx_테이블명_컬럼명
			=> ON 테이블명(컬럼명) ==> ASC
			=> ON 테이블명(컬럼명 DESC) ==> DESC

	3) => ORDER BY 대체
		INDEX_ASC(테이블명 PK)
		INDEX_DESC(테이블명 PK)
		INDEX(테이블명 인덱스명)
		SELECT "/*+INDEX_ASC(테이블명 PK) */" 컬럼명
		FROM 테이블명
		SELECT "/*+INDEX_DESC(테이블명 PK) */" 컬럼명
		FROM 테이블명
		SELECT --+INDEX_ASC(테이블명 PK)  컬럼명
		FROM 테이블명
		=> 힌트
*/
