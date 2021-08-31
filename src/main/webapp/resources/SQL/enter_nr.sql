CREATE TABLE user_info(
	info_id	varchar2(20) primary key -- �쉶�썝 �븘�씠�뵒
	,info_pw varchar2(20) NOT NULL --�쉶�썝 鍮꾨�踰덊샇	
	,info_name varchar2(20) NOT NULL --�쉶�썝 �씠由�
	,info_bday varchar2(20)	NOT NULL --�깮�뀈�썡�씪
	,info_phonenumber varchar2(40) NOT NULL --�쟾�솕踰덊샇
	,info_email varchar2(20) NOT NULL --�씠硫붿씪
	,info_nickname varchar2(20) NOT NULL --�땳�꽕�엫
	,info_joindate date --媛��엯�궇吏�
	,info_modifydate date --�닔�젙�궇吏�
	,info_deldate date --�궘�젣�궇吏�
	,info_delflag int NOT NULL--�궘�젣�뿬遺� �솗�씤
);

create table gamble(
	gb_postnb number(38) primary key --寃뚯떆臾� 踰덊샇
	,gb_id varchar2(50) constraint gamble_gb_postnb_fk references USER_INFO(info_id) --�쉶�썝 �븘�씠�뵒 而щ읆 �깮�꽦諛� �쇅�옒�궎�꽕�젙
	,gb_filename varchar2(200) not null --泥⑤��븳 �씠吏꾪뙆�씪紐낃낵 寃쎈줈
	,gb_update date --�벑濡� �궇吏�
	,gb_exdate date --留뚮즺 �궇吏�
	,gb_likecnt number(38) default 0 --醫뗭븘�슂 �닔
	,gb_viewcnt number(38) default 0 --議고쉶�닔
	,gb_content varchar2(4000) not null --湲��궡�슜
	,gb_title varchar2(50) not null--湲��젣紐�
	,gb_delflag int default 0 --�궘�젣�뵆�옒洹� �솢�꽦�솕 0 , 鍮꾪솢�꽦�솕 1	
	,gb_category varchar2(50) not null
);

select * from gamble order by gb_postnb desc;

--nr_no_seq �떆���뒪 �깮�꽦, �떆���뒪�뒗 踰덊샇 諛쒖깮湲�
create sequence gb_postnb_seq
start with 1 -- 1遺��꽣 �떆�옉
increment by 1 -- 1�뵫 利앷�
nocache; --�엫�떆 硫붾え由щ�� �궗�슜�븞�븿.

--�깮�꽦�맂 �떆���뒪濡� 遺��꽣 �떎�쓬踰덊샇 媛� �솗�씤
select gb_postnb_seq.nextval from dual;

select constraint_name, constraint_type, table_name from user_constraints where table_name='gameble';

delete from gamble;
drop table gamble;
drop sequence gb_postnb_seq;
