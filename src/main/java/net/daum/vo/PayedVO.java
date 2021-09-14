package net.daum.vo;

import lombok.Data;

@Data
public class PayedVO {
	
	private String payed_id;
	private int payed_total;
	private int payed_balance;
	
	private int payed_purchase;
}
