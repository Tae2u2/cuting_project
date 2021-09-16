create table checklist(
	clno number(38) primary key  --찜목록 번호
	,gb_postnb number(38) not null -- 참조할 게시물 번호값
	,cl_id varchar2(20) not null --게시물 찜목록한사람 (구매자 나 자신)
	,amount number(38)
	,cldate date -- 찜한 날짜 기록
);

create sequence clno_seq
start with 1 -- 1부터 시작
increment by 1 -- 1씩 증가
nocache;

alter table checklist add constraint FK_checklist_cl_id foreign key (cl_id) references user_info(info_id) on delete cascade;
alter table checklist add constraint FK_checklist_gb_postnb foreign key (gb_postnb) references gamble(gb_postnb) on delete cascade;

