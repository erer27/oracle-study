-- 트리거
/*
	1.자동화 처리(이벤트)
	2.입고 테이블 => INSERT / UPDATE / DELETE => 재고 테이블 자동화
		출고 테이블 => INSERT / UPDATE / DELETE => 재고 테이블 자동화
										  ------------------------
										오라클 자체 처치
							------------------- 자바에서는 호출이 안된다
							 프로그램 분석 / 가독성 => 낮아진다
	3. SELECT 문장을 사용이 불가능 => INSERT / UPDATE / DELETE할 때만
							  사용이 가능
	4. :NEW, : OLD
		     ------- 기존의 값을 읽는 경우
	  -------- INSERT / UPDATE => 새로운 데이터를 읽는 사용
	  INSERT INTO 입고(a,b,c) VALUES(값1, 값2, 값3...)
						   ----------------- 다른 테이블에 값을 추가
	 :NEW.a, :NEW.b, :NEW.c => 재고에 INSERT

	테이블 2개를 동시에 처리
	입고 => INSERT
	재고 => INSERT/UPDATE
	5. DBA가 주로 사용 => 메뉴얼
	6. 형식)
		  CREATE [OR REPLACE] TRIGGER tri_name
		  BEFORE|AFTER (INSERT/UPDATE/DELETE) ON table_name
			     --------
			     먼저 INSERT => 자동화 처리
		 => 입고에서 INSERT가 되면 재고를 자동화 처리
		FOR EACH ROW -- 전체 ROW에 대한 처리
		DECLARE
		   변수 선언
		BEGIN
		   자동화 처리 => 재고
		END;
		  / 
	7. 삭제
	   DROP TRIGGER tri_name
	
	8. 수정
	   ALTER TRIGGER tri_name => OR REPLACE
	9. 프로젝트에서 트리거
	   => 맛집 : 좋아요 / 찜하기 / 댓글
		----- COUNT증가
	10. 프로시저 : => 모든 테이블의 댓글을 한번에 처리 => 반복
	     ----------- 페이징 기법
	     
*/
/*
CREATE TABLE 상품(
	품번 NUMBER,
	상품명 VARCHAR2(30),
	단가 NUMBER
);
CREATE TABLE 입고(
	품번 NUMBER,
	수량 NUMBER,
	금액 NUMBER
);
CREATE TABLE 출고(
	품번 NUMBER,
	수량 NUMBER,
	금액 NUMBER
);
-- 자동화
CREATE TABLE 재고(
	품번 NUMBER,
	수량 NUMBER,
	금액 NUMBER
);
INSERT INTO 상품 VALUES(100,'새우깡',1500);
INSERT INTO 상품 VALUES(200,'감자깡',1000);
INSERT INTO 상품 VALUES(300,'맛동산',2500);
INSERT INTO 상품 VALUES(400,'짱구',1200);
INSERT INTO 상품 VALUES(500,'고구마깡',2000);
COMMIT;
SELECT * FROM 상품;
*/
/*
	입고 => 재고 (자동화)
		   1. 상품이 존재여부 확인
			존재 => UPDATE(수량만 증가) 
		    미존재 => INSERT
	출고 => 재고 (자동화) 
		   1. 상품이 남아있는지 확인
			남아 있는 경우 : UPDATE (수량 변경)
			없는 경우 : DELETE
*/
-- 입고 => 트리거 => AFTER : 입고완료후에 재고 처리를 한다
-- 트리거는 COMMIT을 사용하면 오류가 발생 => AutoCommit
/*
CREATE OR REPLACE TRIGGER input_trigger
AFTER INSERT ON 입고
FOR EACH ROW
DECLARE
 -- 변수 선언
 vcnt NUMBER:=0; --초기화
BEGIN
 SELECT COUNT(*) INTO vcnt
 FROM 재고
 WHERE 품번=:NEW.품번; -- 입고 => INSERT에서 보낸 품번
 -- 재고에 등록된 상품인지 여부 확인
 IF vcnt=0 THEN
   -- 새로운 상품이 들어온다 (INSERT)
   -- INSERT INTO 입고 VALUES(100,10,1500)
   INSERT INTO 재고 VALUES(:NEW.품번,:NEW.수량,:NEW.수량*:NEW.금액);
 ELSE
   -- 등록된 상품이 존재 (수량만 변경 => UPDATE)
   UPDATE 재고 SET
   수량 = 수량 +:NEW.수량,
   금액=금액+(:NEW.수량*:NEW.금액)
   WHERE 품번=:NEW.품번;
 END IF;
END;
/
*/
--280page => 카드결제 / 포인트 자동화
/*
	같은 테이블에서 처리 할 수 없다 => 다른 테이블에 적용
	INSERT / UPDATE / DELETE에서 저장된 값 => 가지고 올 때 : NEW.컬럼명
*/
-- 출고
/*
	출고 => INSERT 
	----- 1. 수량이 남아 있는 지 확인
		남아 있는 경우 : UPDATE
		수량이 없는 경우 : DELETE
*/
/*
CREATE OR REPLACE TRIGGER output_trigger
AFTER INSERT ON 출고
FOR EACH ROW
DECLARE
 vcnt NUMBER:=0;
BEGIN
 SELECT 수량 INTO vcnt
 FROM 재고
 WHERE 품번=:NEW.품번;
 -- 출고하는 수량과 남아 있는 수량이 같은 경우
 IF :NEW.수량=vcnt THEN
    DELETE FROM 재고
    WHERE 품번=:NEW.품번;
 ELSE
  UPDATE 재고 SET
  수량=수량-:NEW.수량,
  금액=금액-(:NEW.수량*:NEW.금액)
  WHERE 품번=:NEW.품번;
 END IF;
END;
/
*/

DROP TRIGGER input_trigger;
DROP TRIGGER output_trigger;