create table EVENT(
	ev_postnb	number(20)	NOT NULL
	,ev_filename varchar2(100)
	,ev_update	date	NOT NULL
	,ev_exdate	date	
	,ev_mddate	date
	,ev_delflag	number(5)	DEFAULT 0
	
	,ev_title	varchar2(1000)	
	,ev_content	varchar2(2000)
); 

drop table EVENT;

COMMENT ON COLUMN EVENT.ev_postnb IS '게시글번호';

COMMENT ON COLUMN EVENT.ev_filename IS '사진';

COMMENT ON COLUMN EVENT.ev_update IS '게시날짜';

COMMENT ON COLUMN EVENT.ev_exdate IS '만료날짜';

COMMENT ON COLUMN EVENT.ev_mddate IS '수정날짜';

COMMENT ON COLUMN EVENT.ev_delflag IS '삭제플래그';

COMMENT ON COLUMN EVENT.ev_viewcnt IS '조회수';

COMMENT ON COLUMN EVENT.ev_title IS '제목';

COMMENT ON COLUMN EVENT.ev_content IS '내용';

ALTER TABLE EVENT ADD CONSTRAINT PK_EVENT PRIMARY KEY (
	ev_postnb
);

create sequence postnb_seq
start with 1 
increment by 1 
nocache; 

drop table EVENT;

select * from EVENT;

delete from EVENT where ev_postnb=4;




