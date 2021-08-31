package net.daum.vo;

import lombok.Data;

@Data
public class PaymentVO {
	
	private String pay_id;
	private int pay_total;
	private int pay_balance;
	private String pay_date;
}
