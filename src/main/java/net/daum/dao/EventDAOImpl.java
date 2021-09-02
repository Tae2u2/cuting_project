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

	@Override
	public EventVO getEventCont(int no) {
		
		return this.sqlsession.selectOne("sel_cont", no);
	}

	@Override
	public void editEvent(EventVO e) {
		this.sqlsession.update("edit_ev", e);
		
	}

	@Override
	public void delEvent(int no) {
		this.sqlsession.update("del_ev", no);
		
	}

	@Override
	public void getEventDelLi(int no) {
			this.sqlsession.selectList("sel_de", no);
			
	}


	



	
}
