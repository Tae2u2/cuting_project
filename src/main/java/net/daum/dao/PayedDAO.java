package net.daum.dao;

import java.util.List;

import net.daum.vo.PayedVO;


public interface PayedDAO {

	List<PayedVO> getPayed(PayedVO pd);

	void insertPayed(String id);

	void updatePayed(PayedVO pd);

	int getBalance(String id);

	void mupdatePayed(String id); 
}
