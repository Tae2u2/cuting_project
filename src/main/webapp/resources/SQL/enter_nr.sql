create table gamble(
	gb_postnb number(38) primary key --게시물 번호
	,gb_id varchar2(20) not null
	,gb_filename varchar2(200) not null --첨부한 이진파일명과 경로
	,gb_update date --등록 날짜
	,gb_exdate date --만료 날짜
	,gb_likecnt number(38) default 0 --좋아요 수
	,gb_viewcnt number(38) default 0 --조회수
	,gb_content varchar2(4000) not null --글내용
	,gb_title varchar2(50) not null--글제목
	,gb_delflag int default 0 --삭제플래그 활성화 0 , 비활성화 1
	,gb_category varchar2(50) not null	
);

alter table gamble add constraint FK_gamble_gb_id foreign key (gb_id) references user_info(info_id) on delete cascade;

select * from gamble order by gb_postnb desc;

update gamble set gb_likecnt=0 where gb_postnb = 21 or gb_postnb = 20 or gb_postnb = 19;
update gamble set gb_likecnt=1 where gb_postnb = 21;

--nr_no_seq 시퀀스 생성, 시퀀스는 번호 발생기
create sequence gb_postnb_seq
start with 1 -- 1부터 시작
increment by 1 -- 1씩 증가
nocache; --임시 메모리를 사용안함.

--생성된 시퀀스로 부터 다음번호 값 확인
select gb_postnb_seq.nextval from dual;

select constraint_name, constraint_type, table_name from user_constraints where table_name='gameble';

select * from gamble where gb_postnb= '1';
 
delete from gamble;

drop table gamble;
drop sequence gb_postnb_seq;
drop table user_info;
select *from GAMBLE;
select * from USER_INFO;
select * from gamble where gb_category='1';
select * from gamble where gb_category='2';
select * from gamble where gb_category='3';

select * from gamble where gb_delflag='1';



select * from gamble where gb_id='qwer';
select * from gamble where gb_id='aaa';