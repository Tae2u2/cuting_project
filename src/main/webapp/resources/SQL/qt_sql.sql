--유저인포테이블
CREATE TABLE USER_INFO (
	info_id		varchar2(20)		NOT NULL primary key,
	info_pw		varchar2(20)		NOT NULL,
	info_name	varchar2(20)		NOT NULL,
	info_bday	varchar2(20)		NOT NULL,
	info_phonenumber	number(20)		NOT NULL,
	info_email	varchar2(20)		NOT NULL,
	info_nickname	varchar2(20)		NOT NULL,
	info_joindate	date		NOT NULL,
	info_modifydate	date		NULL,
	info_deldate	date		NULL,
	info_delflag	number(5)	DEFAULT 0	NOT NULL
);

delete from USER_INFO;

insert into user_info (info_id, info_pw, info_name, info_bday, info_phonenumber, info_email, info_nickname, info_joindate)
values('asdf','asdf','asdf','970213',123123,'khb2870@naver.com','asdf',sysdate)

update user_info set info_id='zxc', info_name='zxc', info_bday='980817', info_nickname='asdf' where info_id='qwer';

select * from user_info;

COMMENT ON COLUMN "USER_INFO"."info_id" IS '�븘�씠�뵒_PK';

COMMENT ON COLUMN "USER_INFO"."info_pw" IS '鍮꾨�踰덊샇';

COMMENT ON COLUMN "USER_INFO"."info_name" IS '�쉶�썝 �씠由�';

COMMENT ON COLUMN "USER_INFO"."info_bday" IS '�깮�뀈�썡�씪';

COMMENT ON COLUMN "USER_INFO"."info_phonenumber" IS '�쟾�솕踰덊샇';

COMMENT ON COLUMN "USER_INFO"."info_email" IS '�씠硫붿씪';

COMMENT ON COLUMN "USER_INFO"."info_nickname" IS '�땳�꽕�엫';

COMMENT ON COLUMN "USER_INFO"."info_joindate" IS '媛��엯�궇吏�';

COMMENT ON COLUMN "USER_INFO"."info_modifydate" IS '�닔�젙�궇吏�';

COMMENT ON COLUMN "USER_INFO"."info_deldate" IS '�궘�젣�궇吏�';

COMMENT ON COLUMN "USER_INFO"."info_delflag" IS '�궘�젣�뿬遺��솗�씤';

ALTER TABLE USER_INFO ADD CONSTRAINT PK_USER_INFO PRIMARY KEY (
	info_id
);

insert into user_info (info_id,info_pw,info_name,info_nickname,info_phonenumber,info_email,info_joindate,info_bday,info_delflag) values ('123','123','123','123',123,'123',sysdate,'1234',1)

insert into user_info values ("123","123","123","123",123,"123",sysdate,sysdate,sysdate,"1234",0)

select * from user_info;

drop table user_info;

select count(*) from user_info where info_id = 'asdf' and info_pw = 'asdff';
