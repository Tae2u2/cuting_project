create table payment(
	by_id varchar2(20) not null,
	by_filename varchar2(1000) not null,
	by_post_nb number(20) not null,
	by_purchase number(20) not null,
	by_sid varchar2(20) not null,
	by_title varchar2(50) not null,
	by_date date not null
)

ALTER TABLE payment ADD CONSTRAINT FK_payment_by_id FOREIGN KEY (
	by_id
)
REFERENCES USER_INFO (
	info_id
);

drop table payment;

select * from payment;

delete from payment;

