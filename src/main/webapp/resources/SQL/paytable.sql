CREATE TABLE PAYED (
	payed_id	varchar2(20)		NOT NULL,
	payed_total	number(20)	DEFAULT 0	NOT NULL,
	payed_balance	number(20)	DEFAULT 0	NOT NULL
);

ALTER TABLE PAYed ADD CONSTRAINT FK_payed_payed_id FOREIGN KEY (payed_id)
references user_info(info_id) on delete cascade;

alter table gamble add constraint FK_gamble_gb_id foreign key (gb_id) references user_info(info_id) on delete cascade;

select * from payed;

delete from pay;

update payed set payed_balance=10000 where payed_id='asdf'

create table PAY (
	pay_id varchar2(20) NOT NULL,
	pay_purchase number(20) DEFAULT NULL,
	pay_way varchar2(20) NULL,
	pay_way2 varchar2(20) DEFAULT NULL,
	pay_name varchar2(20) NULL,
	pay_date	date		NULL
);

select * from pay;

COMMENT ON COLUMN PAYMENT.pay_id IS 아이디_FK;

COMMENT ON COLUMN PAYMENT.pay_total IS 총액;

COMMENT ON COLUMN PAYMENT.pay_balance IS 잔액;

COMMENT ON COLUMN PAYMENT.pay_date IS 결제일;

COMMENT ON COLUMN PAYMENT.pay_cost IS 결제내역;

ALTER TABLE PAYMENT ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	pay_id
);

ALTER TABLE PAY ADD CONSTRAINT FK_pay_pay_id FOREIGN KEY (
	pay_id
)
REFERENCES USER_INFO (
	info_id
);

insert into PAYMENT (pay_id,pay_total,pay_balance,pay_date) values ('123',10,10,sysdate);

select * from PAYMENT;

 select * from payment where pay_id = '123';
 
 drop table payment;
 drop table pay;