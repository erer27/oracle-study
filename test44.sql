CREATE TABLE genie_music(
	mno NUMBER,
	cno NUMBER,
	title VARCHAR2(1000) CONSTRAINT gm_title_nn NOT NULL,
	signer VARCHAR2(500) CONSTRAINT gm_singer_nn NOT NULL,
	album VARCHAR2(500) CONSTRAINT gm_album_nn NOT NULL,
	poster VARCHAR2(260),
	idcrement NUMBER,
	state VARCHAR2(30),
	key VARCHAR2(200),  
	hit NUMBER DEFAULT 0,
	CONSTRAINT gm_mno_pk PRIMARY KEY(mno),
	CONSTRAINT gm_state_ck CHECK(state IN('상승','하강','유지','NEW'))
);