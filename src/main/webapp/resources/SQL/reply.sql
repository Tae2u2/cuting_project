CREATE TABLE REPLY (
	rp_postnb	number(20)		NOT NULL,
	rp_id	varchar(20)		NOT NULL,
	rp_update	date		NOT NULL,
	rp_mddate	date		NULL,
	rp_deldate	date		NULL,
	rp_delflag	number(5)	DEFAULT 0	NOT NULL,
	rp_flag	number(5)	DEFAULT 0	NOT NULL,
	rp_content	varchar(2000)		NULL
);
create sequence rp_postnb_seq
start with 1
increment by 1
nocache;

select rp_postnb_seq.nextval from dual;

ALTER TABLE REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY (
	RP_POSTNB
);

ALTER TABLE REPLY ADD CONSTRAINT FK_qna_to_reply_1 FOREIGN KEY (
	rp_id
)
REFERENCES USER_INFO (
	info_id
);
select table_name,constraint_name,constraint_type,r_constraint_name 
from user_constraints where table_name='REPLY';

insert into reply (rp_postnb,rp_id,rp_update,rp_mddate,rp_deldate,rp_delflag, rp_flag,rp_content)
values(rp_postnb_seq.nextval, 'jjkod3',sysdate,sysdate,sysdate,0,0,'살아간다');

insert into reply
 (rp_id, rp_postnb,rp_update, rp_content)
 values
 ('jjkod3', rp_postnb_seq.nextval, sysdate,'1234');

select * from REPLY;

update reply set rp_mddate=sysdate where rp_postnb=38; 

delete from REPLY where RP_REF is NULL;

select * from reply where rp_delflag = 0;

alter table reply add rp_ref number(38); --이름 바꿈 qa_postnb  
alter table reply add rp_step number(38);   

alter table reply rename column rp_ref to qa_postnb; 

alter table reply add constraint qna_reply_qapostnb_fk
foreign key(qa_postnb) references qna(qa_postnb);

--0914일 목록 (두테이블로 변경)
select * from qna;

--댓글의 수를 저장할 replycnt 컬럼을 추가
alter table qna add(replycnt number(38) default 0); --댓글이 추가되면 +1,댓글이 삭제되면 -1

--서브쿼리문으로 댓글수를 카운터 해서 replycnt컬럼 값을 변경
update qna set replycnt=(select count(rp_postnb) from reply where qa_postnb=qna.qa_postnb) where qa_postnb>0;
















COMMENT ON COLUMN REPLY.rp_postnb IS '댓글번호_PK';

COMMENT ON COLUMN REPLY.rp_id IS '아이디_FK';

COMMENT ON COLUMN REPLY.rp_update IS '게시날짜';

COMMENT ON COLUMN REPLY.rp_mddate IS '수정날짜';

COMMENT ON COLUMN REPLY.rp_deldate IS '삭제날짜';

COMMENT ON COLUMN REPLY.rp_delflag IS '삭제플래그';

COMMENT ON COLUMN REPLY.rp_flag IS '댓글 플래그';

COMMENT ON COLUMN REPLY.rp_content IS '댓글내용';