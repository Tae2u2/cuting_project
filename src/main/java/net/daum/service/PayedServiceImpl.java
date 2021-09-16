package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.PayedDAO;
import net.daum.vo.BuyedVO;
import net.daum.vo.PayedVO;

@Service
public class PayedServiceImpl implements PayedService {
	
	@Inject
	private PayedDAO payedDao;

	@Override
	public List<PayedVO> getPayed(PayedVO pd) {
		// TODO Auto-generated method stub
		return this.payedDao.getPayed(pd);
	}

	@Override
	public void insertPayed(String id) {
		// TODO Auto-generated method stub
		this.payedDao.insertPayed(id);
	}

	@Override
	public void updatePayed(PayedVO pd) {
		// TODO Auto-generated method stub
		this.payedDao.updatePayed(pd);
	}

	@Override
	public int getBalance(String id) {
		// TODO Auto-generated method stub
		return this.payedDao.getBalance(id);
	}

	@Override
	public void mupdatePayed(String id) {
		// TODO Auto-generated method stub
		this.payedDao.mupdatePayed(id);
	}

	@Override
	public List<BuyedVO> getBuyed(String by_id) {
		// TODO Auto-generated method stub
		return this.payedDao.getBuyed(by_id);
	}

}
