/*
	INSERT INTO tabla명 VALUES(값)
						----- 문자, 날짜 => ' '
	=> 데이터 첨부 : 제약조건
				PRIMARY KEY가 있는 경우에는 중복데이터나 NULL값을 첨부하면 안된다
				CHECK는 지정된 데이터만 첨부해야 된다
				UNIQUE는 NULL값은 허용 => 중복된 데이터는 첨부할 수 없다
				중복된 데이터는 첨부할 수 없다
	=> DEFAULT를 적용할 때는 반드시 첨부할 컬럼을 지정한다
							 --------------
							  PRIMARY KEY
							  FOREIGN KEY
							  CHECK
							  UNIQUE가 있는 경우에는 반드시 첨부
		=> NULL을 허용한 컬럼은 지정하지 않을 수도 있다

		create table a
		(
			id varchar2(10) primary key,
			name varchar2(10) not null,
			sex varchar2(10) check(sex IN(",")),
			address varchar2(100),
			phone varchar2(20),
			regdate date default sysdate
		)

		INSERT INTO a(id,name,sex) => 가능
		INSERT INTO a(id,name,sex,address)
		INSERT INTO a(id,name,sex,phone)
		INSERT INTO a(id,name,sex,address,phone,regdate)
		INSERT INTO a => 전체 데이터를 첨부
		
		=> 종료하면 COMMIT;
*/