CREATE TABLE QNA (
	qa_postnb	number(20)	NOT NULL,--QNA번호
	qa_id	varchar(20)	NOT NULL,--idFK
	qa_pw	varchar(20)	NOT NULL,--비밀번호
	qa_upload	date	NOT NULL,--업로드 날짜
	qa_mddate	date	NULL,--수정날짜
	qa_deldate	date	NULL,--ㅅ삭제날짜
	qa_delflag	number(5)	DEFAULT 0	NOT NULL,--삭제플래그
	qa_viewcnt	number(20)	DEFAULT 0	NOT NULL,--조회수
	qa_title	varchar(50)		NOT NULL,--제목
	qa_content	varchar(2000)		NULL--내용
);

create sequence qa_postnb_seq
start with 1
increment by 1
nocache;

ALTER TABLE QNA ADD CONSTRAINT PK_QNA PRIMARY KEY (
	qa_postnb,
	qa_id
);

select * from QNA

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