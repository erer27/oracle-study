/*
	SQL : 오라클 실행 언어
	===
		DQL : SELECT =>데이터 검색 : 사이트 제작 => 60%
			형식)	 
				SELECT * | column_list
				FROM (table_name|view_name|SELECT~)
				[
					WHERE 컬럼명|함수명 연산자 값
					GROUP BY 컬럼명 | 함수 => 그룹별 처리	
					HAVING 집계함수 = 값
					ORDER BY 컬럼명|함수 ASC|DESC
									----- 생략
				]
			=> 테이블 연결 (조인)
				조인 : 2개이상의 테이블에서 출력에 필요한 데이터 추출해서 새로운 테이블 생성 => 중복제거 (정규화) => 테이블이 여러개로 나눠진다 
				종류
					INNER JOIN => 교집합, null값은 처리 할 수 없다
						=> 컬럼의 값이 같은 경우 (=)
						=> 컬럼의 값이 구간에 포함 (AND, BETWEEN) : NON_EQUI_JOIN
						1) 오라클 조인
							SELECT A.col,B.col
							FROM A,B
							WHERE A.col=B.col
							*** 테이블간의 같은 컬럼이 있는 경우
									     ------------
									    테이블명. 컬럼명 / 별칭.컬럼
							*** 테이블 별칭
								FROM 테이블명 별칭
								예) FROM emp e => 테이블명이 긴 경우
						2) 표준 조인
							SELECT A.col,B.col
							FROM A JOIN B
							ON A.col=B.col
							=> , (JOIN) WHERE (ON)
					OUTER JOIN => 교집합 + null 값일 때 처리
						A(1,2,3,4,6), B(1,2,3,4,5)
						   ---------	  --------
								   5 출력 => RIGHT
						=> LEFT OUTER JOIN
							SELECT A.col,B.col
							FROM A JOIN B
							ON A.col=B.col(+)
							** ANSI 조인
							SELECT A.col, B.col
							FROM A RIGHT OUTER JOIN B
							ON A.col=B.col
						=> RIGHT OUTER JOIN
							
						OUTER JOIN => 교집합 + null 값일 때 처리
			=> SQL문장 연결 (서브쿼리)
			     ---------- SQL문장 여러개를 묶어서 한 개의 SQL문장 제작
					네트워크는 최대한으로 전송하는 내용이 적을 수록 빠르다
				(MainQuery) = (SubQuery)
						      ------------
							SubQuery의 결과값을 받아서 MainQuery가 동작
				** subquery는 반드시 ()안에 설정
				   ----------- 사용처 (조인 : select에서만 사용이 가능)
						DML/DDL/DQL에서 사용이 가능
				= WHERE 뒤에
					=> 조건값을 대체
					WHERE 컬럼 연산자 (SELECT~)
								| 결과값 1개 (단일행 서브쿼리)
									=> 일반 비교연산자를 사용
								[결과값 여러개 (다중행 서브쿼리)
									=> IN, ANY, ALL
										 ------------ 한 개 선택
										 ------------ MAX/MIN
									> ANY (`1,2,3) => 최소값 => 1
									< ANY (1,2,3,) => 최대값 => 3
									> ALL (1,2,3) => 최대값 => 3
									< ALL (1,2,3) => 최소값 => 1
									| 전체 (IN), MAX/MIN
							  | 비교연산자
				= SELECT 뒤에 =====> JOIN대신 ==> 스칼라 서브쿼리
					=> 컬럼 대체
					SELECT 컬럼명, (SELECT ~~) 수정
							     --------------
								반드시 => 컬럼 1개, 결과값이 11개 수행
				= FROM 뒤에 ====> 보안 (메모리에 저장이 안된 상태) 인라인뷰 => 페이지 나누기
					=> 테이블 대체
				*** rownum : 오라클에서 각 row마다 번호를 부여 => 고정
				    ---------- 가상 컬럼 => 필요시마다 사용이 가능
				*** 오라클의 데이터는 정렬된 상태가 아니다
		DDL => 179page (DBA가 주로 사용한다) => 간단한 테이블 제작
			*** COMMIT이 필요없다 (자동 저장)
			*** DQL/DML => 단위 ROW
			*** DDL => 단위 column => 컬럼 추가
			*** 복구가 불가능
			CREATE : 생성
				TABLE : 데이터 저장 공간 => 파일
				VIEW : 가상테이블 => 보안 
				SEQUENCE : 자동 증가 번호 
				INDEX : 검색의 속도 최적화 => ORDER BY 대체
				FUNCTION : 함수
				PROCEDURE : 기능 처리
				TRIGGER : 자동 이벤트 처리
			ALTER : 수정
				ADD : 추가 (컬럼, 제약조건)
				MODIFY : 수정 => 데이터 크기
				DROP : 컬럼 삭제
			DROP : 삭제
				table삭제 => 완전삭제
			TRUNCATE : 데이터만 잘라내기
				table은 유지하고 데이터만 삭제 => 크롤링시 
			RENAME : 이름 변경
				table명 변경
		DML : 데이터 조작 => row단위 
			INSERT : 데이터 추가
			UPDATE : 데이터 수정
			DELETE : 데이터 삭제
		DCL 
		TCL : 저장 / 취소
			COMMIT / ROLLBACK
		
*/