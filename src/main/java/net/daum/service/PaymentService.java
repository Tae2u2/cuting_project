package net.daum.service;

import java.util.List;

import net.daum.vo.PaymentVO;


public interface PaymentService {
	
	List<PaymentVO> getPayment(PaymentVO pa);

	void insertPayment(String info_id);
}
