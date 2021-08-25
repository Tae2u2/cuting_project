	create table EVENT(
	ev_postnb	number(20)	NOT NULL
	,ev_filename varchar2(100)
	,ev_update	date	NOT NULL
	,ev_exdate	date	NOT NULL
	,ev_mddate	date
	,ev_delflag	number(5)	DEFAULT 0
	
	,ev_title	varchar2(1000)	
	,ev_content	varchar2(2000)
);

COMMENT ON COLUMN EVENT.ev_postnb IS '�씪�젴 踰덊샇';

COMMENT ON COLUMN EVENT.ev_filename IS '�뙆�씪紐�, 寃쎈줈';

COMMENT ON COLUMN EVENT.ev_update IS '寃뚯떆 �궇吏�';

COMMENT ON COLUMN EVENT.ev_exdate IS '留뚮즺�궇吏�';

COMMENT ON COLUMN EVENT.ev_mddate IS '�닔�젙 �궇吏�';

COMMENT ON COLUMN EVENT.ev_delflag IS '�궘�젣 �뵆�옒洹�';

COMMENT ON COLUMN EVENT.ev_viewcnt IS '議고쉶�닔';

COMMENT ON COLUMN EVENT.ev_title IS '湲� �젣紐�';

COMMENT ON COLUMN EVENT.ev_content IS '湲� �궡�슜';

ALTER TABLE EVENT ADD CONSTRAINT PK_EVENT PRIMARY KEY (
	ev_postnb
);

create sequence postnb_seq
start with 1 
increment by 1 
nocache; 

drop table EVENT;

select * from EVENT;




