package net.daum.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.PaymentDAO;
import net.daum.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Inject
	private PaymentDAO paymentDao;

	@Override
	public List<PaymentVO> getPayment(PaymentVO pa) {
		// TODO Auto-generated method stub
		return this.paymentDao.getPayment(pa);
	}

}
