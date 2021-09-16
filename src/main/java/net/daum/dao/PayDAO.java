package net.daum.dao;

import java.util.List;

import net.daum.vo.PayVO;
import net.daum.vo.PaymentVO;

public interface PayDAO {

	void insertPay(PayVO pa);

	List<PayVO> getPay(String info_id);

	void insertPayment(PaymentVO pm);
}
