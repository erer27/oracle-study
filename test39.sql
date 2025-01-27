-- 데이터베이스
/*
	데이터 추출
	--------------
	=> 벤치마킹 : 상세보기
			   ------------ 3개 이상 (있는 데이터 / 없는 데이터)
							------------------------------ NULL값 허용
	=> 영화 : 출연 : 애니메이션
	
	=> 전체를 읽는 것이 아니라 => 출력에 필요한 내용만 설정
	
	=> 레시피
	      --------
		레시피 번호 => NUMBER (PRIMARY KEY)
		레시피 포스터 => VARCHAR2
		쉐프명	=> VARCHAR2
		레시피명	=> VARCHAR2
		레시피 설명	=> CLOB	
		info1, info2, info3 => VARCHAR2
		---------------------------------
		재료 => CLOB
		조리순서 => CLOB
		--------------------------------- 정규화
		쉐프 포스터 => VARCHAR2
		쉐프정보	=> VARCHAR2
		------------------------------------------------------
		스토어
		--------
		상품번호 
		상품명
		상품 소개
		상품 포스터
		할인
		가격
		평점
		배송
		적립
		----------------------------


	=> 화장품
	     ---------
		상품번호 
		상품명
		상품 소개
		상품 포스터
		
		할인
		가격
		평점
		배송
		적립


	상품 테이블
	상품 카테고리 테이블
	스토어 테이블
		
*/