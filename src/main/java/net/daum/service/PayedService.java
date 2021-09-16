package net.daum.service;

import java.util.List;

import net.daum.vo.BuyedVO;
import net.daum.vo.PayedVO;


public interface PayedService {
	
	List<PayedVO> getPayed(PayedVO pd);
	void insertPayed(String ui);
	void updatePayed(PayedVO pd);
	int getBalance(String id);
	void mupdatePayed(String id);
	List<BuyedVO> getBuyed(String by_id);
}
