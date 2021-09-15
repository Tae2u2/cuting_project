create table nr_reply(
 rno number(38) primary key --댓글번호
 ,gb_postnb number(38) not null --게시물번호  enter_nr 게시물번호의 종속된값으로 받아줘야함
 ,rp_content varchar2(4000) not null-- 답변글 내용
 ,rp_id varchar2(50) not null--답변자 아이디
 ,rp_date date --등록날짜
 ,rp_mddate date -- 수정날짜
);

alter table nr_reply add constraint nr_reply_gb_postnb_fk foreign key (gb_postnb) references gamble(gb_postnb) on delete cascade;
alter table nr_reply add constraint nr_reply_rp_id_fk foreign key (rp_id) references user_info(info_id) on delete cascade;

-- 댓글번호 시퀀스설정 
create sequence rno_seq
start with 1
increment by 1
nocache;


drop table nr_reply;

select *from nr_reply order by rno desc;

delete from NR_REPLY;




drop sequence rno_seq;
select rno_seq.nextval from dual;