package net.daum.dao;

import java.util.List;

import net.daum.vo.PayVO;

public interface PayDAO {

	void insertPay(PayVO pa);

	List<PayVO> getPay(String info_id);

}
