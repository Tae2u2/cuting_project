package net.daum.vo;

import lombok.Data;

@Data
public class PayVO {
	
	private String pay_id;
	private String pay_date;
	private int pay_purchase;
	private String pay_way;
	private String pay_way2;
	private String pay_name;
}
