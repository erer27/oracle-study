/*
	판매전표

	전표상세

	제품

*/
DROP TABLE 전표상세;
DROP TABLE 제품;
DROP TABLE 판매전표;

CREATE TABLE 판매전표(
	전표번호 VARCHAR2(13) ,  
	판매일자 DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL,	
	고객명 VARCHAR2(51)	CONSTRAINT 판매전표_고객명_nn NOT NULL,	
	총액 NUMBER,
	CONSTRAINT 판매전표_전표번호_pk PRIMARY KEY(전표번호),
	CONSTRAINT 판매전표_총액_ck CHECK(총액>0)
);


CREATE TABLE 전표상세(
	전표번호 VARCHAR2(13),
	제품번호 VARCHAR2(100),
	수량 NUMBER CONSTRAINT 전표상세_수량_nn NOT NULL,
	단가 NUMBER CONSTRAINT 전표상세_단가_nn NOT NULL,
	금액 NUMBER,
	CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호),
	CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호),
	REFERENCES 판매전표(전표번호),
	CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(제품번호),
	REFERENCES 제품(제품번호),
	CONSTRAINT 전표상세_금액_ck CHECK(금액>0)
);

CREATE TABLE 제품(
	제품번호 VARCHAR2(13), 
	제품명 VARCHAR2(100),
	제품단가 NUMBER,
	CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호),
	CONSTRAINT 제품_제품명_uk UNIQUE(제품명),
	CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0)
);

-- 생성 => 참조 테이블 생성, 삭제 => 참조하고 있는 테이블 삭제

