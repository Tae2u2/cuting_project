package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.PayVO;
import net.daum.vo.PaymentVO;

@Repository
public class PayDAOImpl implements PayDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertPay(PayVO pa) {
		// TODO Auto-generated method stub
		this.sqlSession.insert("pa_insert",pa);
	}

	@Override
	public List<PayVO> getPay(String info_id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("pa_getPay", info_id);
	}

	@Override
	public void insertPayment(PaymentVO pm) {
		// TODO Auto-generated method stub
		this.sqlSession.insert("pm_insert", pm);
	}
}
