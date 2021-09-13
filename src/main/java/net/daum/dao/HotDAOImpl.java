package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.Enter_nrVO;

@Repository
public class HotDAOImpl implements HotDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<Enter_nrVO> getHotList(Enter_nrVO h) {
		
		return this.sqlsession.selectList("hot_li", h);
	}

	@Override
	public List<Enter_nrVO> getHot2List(Enter_nrVO h) {
		
		return this.sqlsession.selectList("hot_li2", h);
	}

	@Override
	public List<Enter_nrVO> getHot1List(Enter_nrVO h) {
		
		return this.sqlsession.selectList("hot_li1", h);
	}
	
}
