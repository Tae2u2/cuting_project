create table payment(
	by_id varchar2(20) not null,
	by_filename varchar2(1000) not null,
	by_post_nb number(20) not null,
	by_purchase number(20) not null,
	by_sid varchar2(20) not null,
	by_date date not null
)

drop table payment;

select * from payment;