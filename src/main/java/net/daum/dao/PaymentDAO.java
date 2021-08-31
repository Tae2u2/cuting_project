package net.daum.dao;

import java.util.List;

import net.daum.vo.PaymentVO;

public interface PaymentDAO {

	List<PaymentVO> getPayment(PaymentVO pa); 
}
