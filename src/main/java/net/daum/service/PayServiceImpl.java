package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.PayDAO;
import net.daum.vo.PayVO;

@Service
public class PayServiceImpl implements PayService {
	
	@Inject
	private PayDAO payDao;

	@Override
	public void insertPay(PayVO pa) {
		// TODO Auto-generated method stub
		this.payDao.insertPay(pa);
	}

	@Override
	public List<PayVO> getPay(String info_id) {
		// TODO Auto-generated method stub
		return this.payDao.getPay(info_id);
	}
}
