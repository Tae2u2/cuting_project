package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.BuyedVO;
import net.daum.vo.PayedVO;

@Repository
public class PayedDAOImpl implements PayedDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PayedVO> getPayed(PayedVO pd) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("pd_getPay",pd);
	}

	@Override
	public void insertPayed(String ui) {
		// TODO Auto-generated method stub
		this.sqlSession.insert("pd_insert", ui);
	}

	@Override
	public void updatePayed(PayedVO pd) {
		// TODO Auto-generated method stub
		this.sqlSession.update("pd_update", pd);
	}

	@Override
	public int getBalance(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("pd_getBalance", id);
	}

	@Override
	public void mupdatePayed(String id) {
		// TODO Auto-generated method stub
		this.sqlSession.update("pd_mupdate",id);
	}

	@Override
	public List<BuyedVO> getBuyed(String by_id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("by_getlist", by_id);
	}

}
