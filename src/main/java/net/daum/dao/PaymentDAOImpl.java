package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.PaymentVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PaymentVO> getPayment(PaymentVO pa) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("pa_getPay",pa);
	}

	@Override
	public void insertPayment(String info_id) {
		// TODO Auto-generated method stub
		this.sqlSession.insert("pa_insert", info_id);
	}

}
