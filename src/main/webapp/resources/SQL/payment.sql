CREATE TABLE PAYMENT (
	pay_id	varchar2(20)		NOT NULL,
	pay_total	number(20)	DEFAULT 0	NOT NULL,
	pay_balance	number(20)	DEFAULT 0	NOT NULL,
	pay_purchase number(20) NULL,
	pay_date	date		NULL
);

COMMENT ON COLUMN PAYMENT.pay_id IS 아이디_FK;

COMMENT ON COLUMN PAYMENT.pay_total IS 총액;

COMMENT ON COLUMN PAYMENT.pay_balance IS 잔액;

COMMENT ON COLUMN PAYMENT.pay_date IS 결제일;

COMMENT ON COLUMN PAYMENT.pay_cost IS 결제내역;

ALTER TABLE PAYMENT ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	pay_id
);

ALTER TABLE PAYMENT ADD CONSTRAINT FK_USER_INFO_TO_PAYMENT_1 FOREIGN KEY (
	pay_id
)
REFERENCES USER_INFO (
	info_id
);

insert into PAYMENT (pay_id,pay_total,pay_balance,pay_date) values ('123',10,10,sysdate);

select * from PAYMENT;

 select * from payment where pay_id = '123';
 
 drop table payment;