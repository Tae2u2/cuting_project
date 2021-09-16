create table heart(
	hno number(38) primary key
	,gb_postnb number(38) not null
	,gb_id varchar2(100) not null
	,likeflag int default 0
);

alter table heart add constraint heart_gb_postnb_fk foreign key (gb_postnb) references gamble(gb_postnb) on delete cascade;
alter table heart add constraint heart_gb_id_fk foreign key (gb_id) references user_info(info_id) on delete cascade;


create sequence hno_seq
start with 1 -- 1부터 시작
increment by 1 -- 1씩 증가
nocache; --임시 메모리를 사용안함.
