package net.daum.service;

import java.util.List;

import net.daum.vo.PayVO;

public interface PayService {

	void insertPay(PayVO pa);

	List<PayVO> getPay(String info_id);

}
