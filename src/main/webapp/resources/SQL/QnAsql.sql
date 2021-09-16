CREATE TABLE QNA (
	qa_postnb	number(20)	NOT NULL,--QNA번호
	qa_id	varchar2(20)	NOT NULL,--idFK
	qa_pw	varchar2(20)	NOT NULL,--비밀번호
	qa_upload	date	NOT NULL,--업로드 날짜
	qa_mddate	date	NULL,--수정날짜
	qa_deldate	date	NULL,--ㅅ삭제날짜
	qa_delflag	number(5)	DEFAULT 0	NOT NULL,--삭제플래그
	qa_viewcnt	number(20)	DEFAULT 0	NOT NULL,--조회수
	qa_title	varchar2(50)		NOT NULL,--제목
	qa_content	varchar2(2000)		NULL--내용
);

delete from QNA;
create sequence qa_postnb_seq
start with 1
increment by 1
nocache;

ALTER TABLE QNA ADD CONSTRAINT PK_QNA PRIMARY KEY (
	qa_postnb,
	qa_id
);

drop table QNA;

ALTER TABLE QNA ADD CONSTRAINT FK_USER_INFO_TO_QNA_1 FOREIGN KEY (
	qa_id
)
REFERENCES USER_INFO (
	info_id
);

select * from QNA

select * from QNA where qa_delflag = 0;

select * from
    (select rowNum rNum,qa_postnb,qa_title,qa_viewcnt,qa_upload from (select * from QNA order by qa_postnb desc) where qa_delflag = 0);


select QA_POSTNB from QNA where to_char(QA_UPLOAD,'MM') = to_char(sysdate,'MM');

delete QNA where qa_category is null;

insert into QNA values (qa_postnb_seq.nextval,'1234','1234',sysdate,sysdate,sysdate,0,0,'제목','내용','99');

insert into QNA(qa_postnb,qa_id,qa_pw,qa_upload,qa_title,qa_content)
      values(qa_postnb_seq.nextval,'1234','1234',sysdate,'질문입니다','내용입니다');

alter table QNA add qa_category number(10);
alter table QNA modify (qa_category varchar2(10));


CREATE TABLE QNA_test (
	qa_postnb	number(20)	primary key,--QNA번호
	qa_id	varchar(20),--idFK
	qa_pw	varchar(20),--비밀번호
	qa_upload	date,--업로드 날짜
	qa_mddate	date,--수정날짜
	qa_deldate	date,--ㅅ삭제날짜
	qa_delflag	number(5)	DEFAULT 0	NOT NULL,--삭제플래그
	qa_viewcnt	number(20)	DEFAULT 0	NOT NULL,--조회수
	qa_title	varchar(50),--제목
	qa_content	varchar(2000)--내용
);

create sequence qa_postnb_testseq
start with 1
increment by 1
nocache;

drop sequence qa_postnb_seq;

select * from QNA;

select * from 
    (select rowNum rNum,qa_postnb,qa_title,qa_viewcnt,qa_upload from (select * from QNA where qa_id='1234' AND qa_category='88' or qa_category='99' 
   order by qa_postnb desc) where qa_delflag = 0);



















CREATE TABLE POSTING (
	pt_postnb	number(20)		NOT NULL,
	pt_id	varchar2(20)		NOT NULL,
	pt_pw	varchar2(20)		NOT NULL,
	pt_update	date		NOT NULL,
	pt_mddate	date		NULL,
	pt_deldate	date		NULL,
	pt_delflag	number(5)	DEFAULT 0	NOT NULL,
	pt_viewcnt	number(20)	DEFAULT 0	NOT NULL,
	pt_reportcnt	number(5)	DEFAULT 0	NOT NULL,
	pt_title	varchar2(50)		NOT NULL,
	pt_content	varchar2(2000)		NOT NULL,
	pt_category	varchar2(50)		NOT NULL
);

ALTER TABLE POSTING ADD CONSTRAINT PK_POSTING PRIMARY KEY (
	pt_postnb,
	pt_id
);

ALTER TABLE POSTING ADD CONSTRAINT FK_USER_INFO_TO_POSTING_1 FOREIGN KEY (
	pt_id
)
REFERENCES USER_INFO (
	info_id
);

create sequence pt_postnb_seq
start with 1
increment by 1
nocache;

alter table POSTING add(pt_filename varchar2(100));

insert into POSTING (pt_postnb,pt_id,pt_pw,pt_category,pt_title,pt_content,pt_update)
    values(pt_postnb_seq.nextval,'1234','1234','freeCm','1234','자유게시판',sysdate);

select * from POSTING;



