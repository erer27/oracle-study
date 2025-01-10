-- Table 제작 : 179page
/*
	Table : 데이터를 저장하는 공간
	-------
		1) 형식
		2) 데이터형
		3) 제약조건
		4) 수정
		5) 삭제
		=> 오라클 안에 테이블 정보 저장 : user_tables => 모든 테이블명은 대문자
								user_constaints / user_views / user_indexs
		=> 같은 이름으로 저장이 불가능
		=> 알파벳 / 한글 => 운영체제가 변경이 되면 깨진다
					      ------------ HOSTING 
		1. table명(column명) 주는 방법 => 식별자
		   -------   --------
		   | class    | 멤버변수
		   1) 문자로 시작한다 (알파벳, 한글)
		       = 알파벳 사용시에 대소문자 구분이 없다 ( 오라클에서는 대문자로 저장)
		       = 한글은 운영체제에서 문제가 발생할 수 있다
		    2) table명이나 column명은 30byte사용이 가능
			=> 기본 : 7~15자가 적당 (freeboard, goods, cart)
			=> table명과 column명은 같아도 된다
		     	     ---------------------------------------- 권장사항은 아니다
		    3) 같은 데이터베이스에서는 테이블명은 한개만 사용이 가능
			=> 공통 오라클 : => 211.238.142.124
		    4) 키워드는 사용할 수 없다
			SELECT / FROM / WHERE ... 
		    5) 숫자 사용이 가능 (앞에 사용 할 수 없다)
			board1, board2...
		    6) 테이블명이나 컬럼명은 공백을 사용할 수 없다
		    7) 특수문자 사용이 가능 ( _ )
			=> goods_info (goodsInfo)
		--------------------------------------------------------------
		 CREATE TABLE table_name(
			=> 컬럼
			=> 벤치마킹
		 )
		
		컬럼 설정 : 컬럼명 데이터형 
				------------------

		2. 컬럼 설정 : 데이터형 (183page)
			문장 저장
				CHAR(1~2000byte) => 고정바이트 (같은 글자수 저장)
					=> Y / N, 남자 / 여자
					=> 한글은 3byte차지 
					CHAR(100) ==> 'A' ==> 100byte가 생성 
				VARCHAR2(1~4000byte) => 가변바이트
					=> 'A' => 1byte 
					=> 문자열 저장은  VARCHAR2를 사용한다
				CLOB => 4기가 저장 => 가변형
					=> 줄거리 , 맛집소개 ...
			숫자 저장
				NUMBER => 기본 디폴트 NUMBER(8,2) => NUMBER(38,128)
								   ----------------
				NUMBER(4) => 0~9999
				NUMBER(2,1) => 숫자 두 개 사용이 가능
							 숫자 두 개중에 1자리는 소수점으로 사용
				---------------- 10, 20 ... 4.5
				=> 무조건 실수를 저장하는 것은 아니다 (정수)
				=> 실수 / 정수
					=> 자바에서 읽기 => 저장된 데이터 double / int 
			날짜 저장
				=> DATE / TIMESTAMP (기록)
				     -------
			기타 저장 => 동영상 / 증명사진
				=> BLOB => 4기가 (binary 형태로 저장)
				=> BFILE => 4기가(파일형태로 저장)
				
			=> VARCHAR2 / CLOB / NUMBER / DATE 
			
			=> 테이블 형식
			CREATE table table_name
			(
				컬럼명 데이터형 [제약조건], 
				컬럼명 데이터형 [제약조건],
				컬럼명 데이터형 [제약조건],
				컬럼명 데이터형 [제약조건],
				컬럼명 데이터형 [제약조건],
				[제약조건],
				[제약조건]
			)
			제약조건 : 필요한 데이터만 저장이 가능
			--------------------------------------------
			id		name		sex
			aaa		hong		man
			aaa		shim		woman
			aaa		park		man

			=> DELETE FROM table_name WHERE id='aaa';
			=> 원하지 않는 데이터가 수정, 삭제 => 이상현상
				=> 무결성 : 제약조건
				     -------- 기본키를 반드시 부여 (중복이 없는 값)
			
			=> 기본키 : 중복없는 데이터 설정(데이터 식별)
				PRIMARY KEY
			=> 반드시 입력값 = NOT NULL
			=> 중복없는 데이터 : null값을 허용 (후보키) : UNIQUE
			=> 다른 테이블 참조 : FOREIGN KEY
			=> 지정데이터만 설정 : CHECK('남자','여자')
			=> DEFAULT => 사용자 입력이 없는 경우 자동 지정
						SYSDATE, HIT
			------------------------------------------------------------------------- 
			
*/
/*
CREATE TABLE mybook(
	bookid NUMBER(2) PRIMARY KEY,
	bookname VARCHAR2(40),
	publisher VARCHAR2(40),
	price NUMBER(8)
);
CREATE TABLE mybook(
	bookid NUMBER(2) PRIMARY KEY,
	bookname VARCHAR2(40),
	publisher VARCHAR2(40),
	price NUMBER(8),
	PRIMARY KEY(bookid)
);
*/
-- 수정, 삭제가 쉽게 => CONSTAINT => 권장
/*
	제약조건 => user_constraints
			  ------------------- 중복이 있으면 안된다
	제약조건명 
		  table명_컬럼명_pk
					---
					PRIMARY KEY  => pk
					FOREIGN KEY  =>  fk
					CHECH	    => ck
					UNIQUE	    => uk
					NOT NULL	    => nn
		1. 컬럼뒤에 설정 => 컬럼레벨 => 컬럼과 동시에 생성
					NOT NULL / DEFAULT 
		2. 컬럼설정후에 => 테이블레벨 => 컬럼을 다 생성한 다음에 나중에 제약조건 저장
					PRIMARY / FOREIGN / CHEECK / UNIQUE
*/
/*
CREATE TABLE mybook(
	bookid NUMBER(2) PRIMARY KEY,
	bookname VARCHAR2(40) PRIMARY KEY,
	publisher VARCHAR2(40),
	price NUMBER(8),
	CONSTRAINT mybook_bookid_pk PRIMARY KEY(boodid, bookname)
);
*/
/*
	저장 데이터 추출 => 개념적 설계
	------------------- 
		  |
	어떤 데이터 (데이터형) => 논리적 설계 
		|
	메모리 크기 결정		=> 물리적 설계

	명세표
	-----------------------------------------------------
	 컬럼명		id		name		sex		
	-----------------------------------------------------
	 키종류		pk		nn		ck
	-----------------------------------------------------
	 참조테이블
	-----------------------------------------------------
	 참조컬럼
	-----------------------------------------------------
	 CHECK여부					check('남자','여자')
	-----------------------------------------------------
	 데이터형		VARCHAR2 VARCHAR2 CHAR
	-----------------------------------------------------
	 크기			   20			51	    6
	-----------------------------------------------------
	
*/
/*
CREATE TABLE member(
	id VARCHAR2(20),
	name VARCHAR2(51) CONSTRAINT member_name_nn NOT NULL,
	sex CHAR(6),
	regdate DATE DEFAULT SYSDATE,
	CONSTRAINT member_id_pk_PRIMARY KEY(id),
	CONSTRAINT member_sex_ck CHECK(sex,IN('남자','여자'))
);

-- 184 page => 컬럼 추가 / 컬럼 수정 => ALTER
ALTER TABLE member ADD email VARCHAR2(150);
ALTER TABLE member ADD addr VARCHAR2(10);

-- 수정
ALTER TABLE member MODIFY addr VARCHAR2(200);

-- email은 필요가 없다
ALTER TABLE member DROP COLUMN email;

-- addr => address
ALTER TABLE member RENAME COLUMN addr TO address;
*/
-- 데이터가 존재하는 상태

-- 게시판
/*
	게시물번호	==> 중복없는 데이터
	작성자 ==> 반드시 입력
	제목 ==> 반드시 입력
	내용 ==> 반드시 입력
	비밀번호 ==> 반드시 입력 (본인 여부 확인)
	작성일 ==> 작성일 등록
	조회수 ==> 0으로 초기화
	----------------------------------------- 데이터 추출
*/ 

/*
CREATE TABLE board(
	no NUMBER,
	name VARCHAR2(51) CONSTRAINT board_name_nn NOT NULL,
	subject VARCHAR2(2000) CONSTRAINT board_subject_nn NOT NULL,
	content CLOB CONSTRAINT board_content_nn NOT NULL,
	pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	CONSTRAINT board_no_pk PRIMARY KEY(no)
);
*/

/*
CREATE TABLE test_member(
	no NUMBER,
	id VARCHAR2(20) CONSTRAINT test_member_id_nn NOT NULL,
	pwd VARCHAR2(20) CONSTRAINT test_member_pwd_nn NOT NULL,
	name VARCHAR2(20) CONSTRAINT test_member_name_nn NOT NULL,
	sex VARCHAR2(6) CONSTRAINT test_member_sex_nn NOT NULL,
	birth DATE CONSTRAINT test_birth_id_nn NOT NULL,
	email VARCHAR2(20),
	zipcode VARCHAR2(60) CONSTRAINT test_member_zipcode_nn NOT NULL,
	address VARCHAR2(60) CONSTRAINT test_member_address_nn NOT NULL,
	detail_address VARCHAR2(60),
	phone VARCHAR2(15) CONSTRAINT test_member_phone_nn NOT NULL,
	intro VARCHAR2(200),
);
*/
--삭제 => 186page
DROP TABLE board;




