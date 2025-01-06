--오라클 3일차 => 내장 함수
/*
	내장 함수 (오라클 라이브러리)
	함수(function) : 리턴형을 가지고 있다
	=> 사용처 : SELECT 뒤에 / WHERE 뒤에 / ORDER BY, GROUP BY
	=> 단일행 함수 : ROW 단위(한줄식 처리)
		문자함수 : CHAR / VARCHAR2 / CLOB => 제어할 때 주로 사용
				=> String 관련
			1) LENGTH(문자열) => 문자의 개수 => 비밀번호...
				LENGTHB(문자열) => byte (*** 한글은 한글자당 3byte)
			2) UPPER(문자열) : 대문자 변환 => 오라클 명령문은 대소문자 구분이 없다(실제 저장된 데이터는 대소문자 구분)
				LOWER(문자열) => 소문자 변환
				INITCAP(문자열) => 첫자만 대문자 변환
				*** 오라클 처리 / 자바 처리 => 프로그램에 따라
							----------- 80%
			3) REPLACE(문자열(old), 문자열(new))
				=> 데이터 수집 => 오라클 저장(&, |)
					----------- 이미지 => http:// ~~ => URL주소
					a.jsp?name=aaa&id=bbb
						----------------------- 구분자
			4) LTRIM / RTRIM / TRIM => 공백, 좌우의 문자열을 제거
							좌우제거
					오른쪽 제거
			5) LPAD / RPAD => 모자라는 위치에 원하는 문자 추가
			*** RPAD(문자열, 문자개수, 대체문자)
					----- -----------
					3글자 7
				예) RPAD('Oracle',9,'*') Oracle***
							--
			=> ID찾기 / 비밀번호 찾기
					  --------- JavaMail (mail전송이 가능)
		6) CONCAT() => 문자열 결합
			CONCAT(문자열, 문자열) =>
			CONCAT('Hello','Oracle') => HelloOracle => || ==> MySQL에서 LIKE문장 처리할 때 ==> LIKE '%'||?||'%' => 오라클 ==> LIKE CONCAT('%',?,'%')
		7) SUBSTR() => 문자열을 자르는 경우
			SUBSTR(문자열,문자위치,문자개수)
							  ----------
			SUBSTR('81/01/02',4,2) => 01
			ABCDEFG
			1234567
		8) INSTR(문자열,문자,시작위치,몇번째)
			=> indexOf : 문자 찾기
		숫자함수 : NUMBER => Math
			=> MOD => %(나머지)
				MOD(10,2) => 10%2
			--------------------------------
			=> ***ROUND => 반올림
			=> TRUNC => 버림
			-------------------------------- 날짜 (시간/분/초) => long => 퇴직금
			=> ***CEIL => 올림 : 총페이지
		날짜 함수 : DATE 관련
			=> SYSDATE : 현재 시스템의 시간 / 날짜
				--------- 등록일을 저장
			=> MONTHS_BETWEEN => 기간사이의 개월수
			=> ADD_MONTHS: 개월 추가
			=> ADD_MONTHS('24/11/18',7) => 적금 / 보험만기 ...
			=> NEXT_DAY / LAST_DAY
		변환함수 : Format => 날짜변환 / 숫자변환 / 문자변환
			=> ***TO_CHAR : 문자열로 변환
			=> TO_NUMBER : 정수형 변환 => '10' + 1 => 11
									==== 자동변환
								TO_NUMBER('10') + 1 => 11
			=> ***TO_DATE : 날짜 변환
				=> 예약일 : DATE로 설정
				=> 자바에서는 문자열로 전송
					<input type=date> => 자바로 선택해서 전송(문자열)
			=> Date date=new Date()
			=> Date date="2025/01/06"; => 
		기타함수 : NULL값 처리 / 다중 조건
			=> NVL : null을 다른 값으로 대체
				NVL(데이터형,값)
				=> 데이터값이 null이면 지정된 값 변경
				=> null 값인 경우에는 연산처리가 안된다
			=> DECODE : 다중 조건문
			=> ***CASE : switch
			------------------------------- PL/SQL
			출고 / 입고 => 재고(자동화)
			----	 -----
				UPDATE / INSERT
			 UPDATE / DELETE
	=> 집합 함수 :  Column단위로 처리 => 통계
		=> COUNT : ROW의 개수
			=> 검색 결과 / 로그인 처리 / 아이디중복 / 장바구니
		=> SUM (합) / AVG (평균) / MIN(최소값) / MAX(최대값)
		=> RANK 순위 / DENSE_RANK 1 2 2 3
			1
			2
			2
			4
		-------------------
		=> CUBE
		=> ROLLUP
		------------------ GROUP BY
	=> GROUP BY 그룹별 처리
	=> ***테이블 두개 이상 연결 데이터 추출 => JOIN
	=> ***서브쿼리 
	------------------------------------------------------------- SELECT 문장
	DDL : 테이블 제작 => DML(INSERT/UPDATE/DELETE)
		VIEW / SEQUENCE / INDEX / PL~SQL
	=> 정규화 / 제약조건 
	-------------------------------------------------------------
*/