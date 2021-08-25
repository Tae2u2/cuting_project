CREATE TABLE notice (
	no_postnb	number(20)		primary key, --일련번호
	no_filename	varchar(100)		, 		--파일명,경로
	no_update	date		,	  				--게시날짜
	no_exdate	date		,    				 --만료날짜
	no_mddate	date		,		  			--수정날짜
	no_delflag	number(5)	DEFAULT 0	NULL,  --삭제플래그
	no_viewcnt	number(20)	DEFAULT 0	NOT NULL, --조회수
	no_title	varchar(50)		, 			  --글제목
	no_content	varchar(2000)		 		  --글내용
);

drop table notice;
select * from notice order by no_postnb;

--no_postnb 시퀀스 생성, 시퀀스는 번호 발생기
create sequence no_postnb_seq
start with 1			--1부터 시작
increment by 1			--1씩 증가
nocache;				--임시 메모리 사용안함

-- 생성된 시퀸스로 부터 다음번호 값 확인
select no_postnb_seq.nextval from dual;

select * from notice;

