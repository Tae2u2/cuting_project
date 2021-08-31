package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.EventVO;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SqlSession sqlsession;

	
	@Override
	public int getTotalCount(EventVO e) {
		return this.sqlsession.selectOne("sel_one", e);
	}

	@Override
	public List<EventVO> getEventList(EventVO e) {
		return this.sqlsession.selectList("sel_li", e);
	}

	@Override
	public void insertEvent(EventVO e) {
		this.sqlsession.insert("in_e", e);
	}
	
	



	
}
