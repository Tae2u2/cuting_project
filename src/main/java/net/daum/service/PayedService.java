package net.daum.service;

import java.util.List;

import net.daum.vo.PayedVO;


public interface PayedService {
	
	List<PayedVO> getPayed(PayedVO pd);
	void insertPayed(String ui);
	void updatePayed(PayedVO pd);
}
